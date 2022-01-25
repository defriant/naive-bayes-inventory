<?php

namespace App\Http\Controllers;

use App\Models\Produk;
use App\Models\Stok;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Auth;
use Illuminate\Support\Facades\Session;

class WebController extends Controller
{
    function random($type, $length)
    {
        $result = "";
        if ($type == 'char') {
            $char = 'ABCDEFGHJKLMNPRTUVWXYZ';
            $max        = strlen($char) - 1;
            for ($i = 0; $i < $length; $i++) {
                $rand = mt_rand(0, $max);
                $result .= $char[$rand];
            }
            return $result;
        } elseif ($type == 'num') {
            $char = '01';
            $max        = strlen($char) - 1;
            for ($i = 0; $i < $length; $i++) {
                $rand = mt_rand(0, $max);
                $result .= $char[$rand];
            }
            return $result;
        } elseif ($type == 'mix') {
            $char = 'A1B2C3D4E5F6G7H8J9KLMNPRTUVWXYZ';
            $max = strlen($char) - 1;
            for ($i = 0; $i < $length; $i++) {
                $rand = mt_rand(0, $max);
                $result .= $char[$rand];
            }
            return $result;
        }
    }

    public function login_attempt(Request $request)
    {
        if (Auth::attempt(['username' => $request->username, 'password' => $request->password])) {
            return redirect('/dashboard');
        } else {
            Session::flash('failed');
            return redirect()->back()->withInput($request->all());
        }
    }

    public function logout()
    {
        Auth::logout();
        return redirect('/');
    }

    public function produk_terlaris()
    {
        $produk = Produk::all();
        $total_terjual = Stok::all()->sum('terjual');
        $produkSort = [];

        foreach ($produk as $p) {
            $produkSort[] = [
                "nama" => $p->nama,
                "terjual" => $p->stok->sum('terjual')
            ];
        }

        usort($produkSort, function ($a, $b) {
            return $a['terjual'] < $b['terjual'];
        });

        $produkTerlaris = array_slice($produkSort, 0, 5);

        $chart_data = [];
        foreach ($produkSort as $ps) {
            $chart_data["label"][] = $ps["nama"];
            $chart_data["value"][] = $ps["terjual"];
        }

        $response = [
            "response" => "success",
            "produk_terlaris" => $produkTerlaris,
            "total_terjual" => $total_terjual,
            "total_produk" => $produk->count(),
            "chart_data" => $chart_data
        ];
        return response()->json($response);
    }

    public function get_produk()
    {
        $produk = Produk::all();
        $response = [
            "response" => "success",
            "data" => $produk
        ];
        return response()->json($response);
    }

    public function input_produk(Request $request)
    {
        $cek = Produk::where('id', $request->kode)->first();
        if ($cek) {
            $response = [
                "response" => "failed",
                "message" => "Kode produk " . $request->kode . " telah terdaftar"
            ];
            return response()->json($response);
        } else {
            Produk::create([
                'id' => $request->kode,
                'nama' => $request->nama
            ]);
            $response = [
                "response" => "success",
                "message" => "Berhasil menambahkan produk"
            ];
            return response()->json($response);
        }
    }

    public function update_produk(Request $request)
    {
        Produk::where('id', $request->id)->update([
            "nama" => $request->nama
        ]);
        $response = [
            "response" => "success",
            "message" => "Produk " . $request->id . " berhasil di update"
        ];
        return response()->json($response);
    }

    public function delete_produk(Request $request)
    {
        Produk::where('id', $request->id)->delete();
        $response = [
            "response" => "success",
            "message" => "Berhasil menghapus produk " . $request->id
        ];
        return response()->json($response);
    }

    public function get_stok_produk(Request $request)
    {
        $data = Stok::where('periode', date('Y-m-d', strtotime($request->periode)))->get();
        foreach ($data as $d) {
            $d->periode = date('F Y', strtotime($d->periode));
        }

        $produkLeft = [];
        $produk = Produk::all();
        foreach ($produk as $p) {
            $cek = Stok::where('id_produk', $p->id)->where('periode', date('Y-m-d', strtotime($request->periode)))->first();
            if (!$cek) {
                $produkLeft[] = [
                    "kode" => $p->id,
                    "nama" => $p->nama
                ];
            }
        }

        $response = [
            "response" => "success",
            "data" => $data,
            "produkLeft" => $produkLeft
        ];
        return response()->json($response);
    }

    public function input_stok_produk(Request $request)
    {
        $restock = $this->naive_bayes($request->id_produk, $request->stok, $request->terjual);
        $restock = $restock["data"]["result"];

        Stok::create([
            'periode' => date('Y-m-d', strtotime($request->periode)),
            'id_produk' => $request->id_produk,
            'nama' => Produk::find($request->id_produk)->nama,
            'stok' => $request->stok,
            'terjual' => $request->terjual,
            'restock' => $restock
        ]);

        $response = [
            "response" => "success",
            "message" => "Berhasil input data stok produk"
        ];

        return response()->json($response);
    }

    public function classifier()
    {
        $produk = Produk::all();
        return view('classifier', compact('produk'));
    }

    public function naive_bayes($id_produk, $stok, $terjual)
    {
        // ===== Stok mean & deviance =====
        // restock yes
        $stokYesVal = Stok::where('restock', 'yes')->get();
        $stokYesArr = [];
        foreach ($stokYesVal as $yesVal) {
            $stokYesArr[] = $yesVal->stok;
        }

        $stokYesArr = array_unique($stokYesArr);
        $stokYesMean = array_sum($stokYesArr) / count($stokYesArr);
        $stokYesMean = number_format((float)$stokYesMean, 2, '.', '');

        $stokYesDevArr = [];
        foreach ($stokYesArr as $yesArr) {
            $stokYesDevArr[] = number_format((float)$yesArr - $stokYesMean, 2, '.', '');
        }

        $stokYesDev = [];
        foreach ($stokYesDevArr as $devArr) {
            $stokYesDev[] = number_format((float)pow($devArr, 2), 2, '.', '');
        }

        $stokYesDev = array_sum($stokYesDev);
        $stokYesDev = sqrt($stokYesDev / (count($stokYesArr) - 1));
        $stokYesDev = number_format((float)$stokYesDev, 2, '.', '');

        // restock no
        $stokNoVal = Stok::where('restock', 'no')->get();
        $stokNoArr = [];
        foreach ($stokNoVal as $noVal) {
            $stokNoArr[] = $noVal->stok;
        }

        $stokNoArr = array_unique($stokNoArr);
        $stokNoMean = array_sum($stokNoArr) / count($stokNoArr);
        $stokNoMean = number_format((float)$stokNoMean, 2, '.', '');

        $stokNoDevArr = [];
        foreach ($stokNoArr as $noArr) {
            $stokNoDevArr[] = number_format((float)$noArr - $stokNoMean, 2, '.', '');
        }

        $stokNoDev = [];
        foreach ($stokNoDevArr as $devArr) {
            $stokNoDev[] = number_format((float)pow($devArr, 2), 2, '.', '');
        }

        $stokNoDev = array_sum($stokNoDev);
        $stokNoDev = sqrt($stokNoDev / (count($stokNoArr) - 1));
        $stokNoDev = number_format((float)$stokNoDev, 2, '.', '');
        // ===== End stok mean & deviance =====

        // ===== Terjual mean & deviance =====
        // restok yes
        $terjualYesVal = Stok::where('restock', 'yes')->get();
        $terjualYesArr = [];
        foreach ($terjualYesVal as $yesVal) {
            $terjualYesArr[] = $yesVal->terjual;
        }

        $terjualYesArr = array_unique($terjualYesArr);
        $terjualYesMean = array_sum($terjualYesArr) / count($terjualYesArr);
        $terjualYesMean = number_format((float)$terjualYesMean, 2, '.', '');

        $terjualYesDevArr = [];
        foreach ($terjualYesArr as $yesArr) {
            $terjualYesDevArr[] = number_format((float)$yesArr - $terjualYesMean, 2, '.', '');
        }

        $terjualYesDev = [];
        foreach ($terjualYesDevArr as $devArr) {
            $terjualYesDev[] = number_format((float)pow($devArr, 2), 2, '.', '');
        }

        $terjualYesDev = array_sum($terjualYesDev);
        $terjualYesDev = sqrt($terjualYesDev / (count($terjualYesArr) - 1));
        $terjualYesDev = number_format((float)$terjualYesDev, 2, '.', '');

        // restok no
        $terjualNoVal = Stok::where('restock', 'no')->get();
        $terjualNoArr = [];
        foreach ($terjualNoVal as $yesVal) {
            $terjualNoArr[] = $yesVal->terjual;
        }

        $terjualNoArr = array_unique($terjualNoArr);
        $terjualNoMean = array_sum($terjualNoArr) / count($terjualNoArr);
        $terjualNoMean = number_format((float)$terjualNoMean, 2, '.', '');

        $terjualNoDevArr = [];
        foreach ($terjualNoArr as $noArr) {
            $terjualNoDevArr[] = number_format((float)$noArr - $terjualNoMean, 2, '.', '');
        }

        $terjualNoDev = [];
        foreach ($terjualNoDevArr as $devArr) {
            $terjualNoDev[] = number_format((float)pow($devArr, 2), 2, '.', '');
        }

        $terjualNoDev = array_sum($terjualNoDev);
        $terjualNoDev = sqrt($terjualNoDev / (count($terjualNoArr) - 1));
        $terjualNoDev = number_format((float)$terjualNoDev, 2, '.', '');
        // ===== End terjual mean & deviance =====

        $produkYes = Stok::where('id_produk', $id_produk)->where('restock', 'yes')->get()->count() / Stok::where('restock', 'yes')->get()->count();
        $produkYes = number_format((float)$produkYes, 9, '.', '');

        $produkNo = Stok::where('id_produk', $id_produk)->where('restock', 'no')->get()->count() / Stok::where('restock', 'no')->get()->count();
        $produkNo = number_format((float)$produkNo, 9, '.', '');

        $stokYes = 1 / sqrt(2 * 3.14 * $stokYesDev) * exp(- (pow($stok - $stokYesMean, 2) / pow($stokYesDev, 2)));
        $stokYes = number_format((float)$stokYes, 9, '.', '');

        $stokNo = 1 / sqrt(2 * 3.14 * $stokNoDev) * exp(- (pow($stok - $stokNoMean, 2) / pow($stokNoDev, 2)));
        $stokNo = number_format((float)$stokNo, 9, '.', '');

        $terjualYes = 1 / sqrt(2 * 3.14 * $terjualYesDev) * exp(- (pow($terjual - $terjualYesMean, 2) / pow($terjualYesDev, 2)));
        $terjualYes = number_format((float)$terjualYes, 9, '.', '');

        $terjualNo = 1 / sqrt(2 * 3.14 * $terjualNoDev) * exp(- (pow($terjual - $terjualNoMean, 2) / pow($terjualNoDev, 2)));
        $terjualNo = number_format((float)$terjualNo, 9, '.', '');

        $restockYes = Stok::where('restock', 'yes')->get()->count() / Stok::all()->count();
        $restockYes = number_format((float)$restockYes, 9, '.', '');

        $restockNo = Stok::where('restock', 'no')->get()->count() / Stok::all()->count();
        $restockNo = number_format((float)$restockNo, 9, '.', '');

        $yes = [
            "restock" => $restockYes,
            "produk" => $produkYes,
            "stok" => $stokYes,
            "terjual" => $terjualYes
        ];

        $no = [
            "restock" => $restockNo,
            "produk" => $produkNo,
            "stok" => $stokNo,
            "terjual" => $terjualNo
        ];

        $countYes = $yes["restock"] * $yes["produk"] * $yes["stok"] * $yes["terjual"];
        $countYes = number_format((float)$countYes, 10, '.', '');

        $countNo = $no["restock"] * $no["produk"] * $no["stok"] * $no["terjual"];
        $countNo = number_format((float)$countNo, 10, '.', '');

        if ($countYes > $countNo) {
            $result = "yes";
        } else if ($countYes < $countNo) {
            $result = "no";
        }

        $response = [
            "data" => [
                "yes" => $yes,
                "no" => $no,
                "result" => $result,
                "countYes" => $countYes,
                "countNo" => $countNo,
                "stokYesMean" => $stokYesMean,
                "stokNoMean" => $stokNoMean,
                "stokYesDev" => $stokYesDev,
                "stokNoDev" => $stokNoDev,
                "terjualYesMean" => $terjualYesMean,
                "terjualNoMean" => $terjualNoMean,
                "terjualYesDev" => $terjualYesDev,
                "terjualNoDev" => $terjualNoDev
            ]
        ];

        return $response;
    }

    public function classifier_start(Request $request)
    {
        $response = $this->naive_bayes($request->id_produk, $request->stok, $request->terjual);

        return response()->json($response);
    }

    // public function generate()
    // {
    //     $stok = Stok::all();
    //     foreach ($stok as $s) {
    //         $stokleft = $s->stok - $s->terjual;

    //         if ($stokleft < $s->stok / 2) {
    //             $restock = "yes";
    //         } else {
    //             $restock = "no";
    //         }

    //         if ($stokleft < 6) {
    //             $restock = "yes";
    //         } elseif ($stokleft >= 6 && $stokleft <= 10) {
    //             $a = $this->random('num', 1);
    //             if ($a == 0) {
    //                 $restock = "yes";
    //             } elseif ($a == 1) {
    //                 $restock = "no";
    //             }
    //         } elseif ($stokleft > 10) {
    //             $restock = "no";
    //         }

    //         $a = $this->random('num', 1);
    //         if ($a == 0) {
    //             $restock = "yes";
    //         } elseif ($a == 1) {
    //             $restock = "no";
    //         }

    //         Stok::where('id', $s->id)->update([
    //             "restock" => $restock
    //         ]);
    //     }

    //     return;
    // }
}

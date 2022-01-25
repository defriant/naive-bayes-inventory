@extends('layouts.master')
@section('content')
<div class="row">
    <div class="col-md-6">
        <div class="panel panel-headline">
            <div class="panel-heading">
                <h3 class="panel-title">Classifier</h3>
                <p class="panel-subtitle">Klasifikasi restok produk (Yes/No)</p>
            </div>
            <div class="panel-body">
                <p>Produk</p>
                <select id="produk" class="form-control" style="width: 70%">
                    <option value="">--- Pilih Produk ---</option>
                    @foreach ($produk as $p)
                        <option value="{{ $p->id }}">{{ $p->nama }}</option>
                    @endforeach
                </select>
                <br>
                <p>Stok</p>
                <input type="number" id="stok" class="form-control" style="width: 70%">
                <br>
                <p>Terjual</p>
                <input type="number" id="terjual" class="form-control" style="width: 70%">
                <br>
            </div>
            <div class="panel-footer">
                <div class="row">
                    <div class="text-right"><button id="btn-klasifikasi-data" class="btn btn-primary">Mulai Klasifikasi</button></div>
                </div>
            </div>
        </div>
    </div>
</div>

<div id="hasil-klasifikasi">
    
</div>

{{-- <table>
    <tbody>
        <tr>
            <td>Stok Mean (restock Yes)</td>
            <td>: stokYesArrSum / stokYesArrCount = stokYesMean</td>
        </tr>
        <tr>
            <td>Stok Deviansi (restock Yes)</td>
            <td>: &#8730; stokYesDevArrSum / (stokYesArr - 1) = stokYesDev</td>
        </tr>
        <tr>
            <td>Stok (restock Yes)</td>
            <td>: 1 / &#8730; (2 x 3.14 x stokYesDev) x EXP( - (stokMinStokYesMean<sup>2</sup>) / stokYesDev<sup>2</sup> = stokYes</td>
        </tr>
        <td>
            <td></td>
            <td></td>
        </td>
        <tr>
            <td>Stok Mean (restock No)</td>
            <td>: stokNoArrSum / stokNoArrCount = stokNoMean</td>
        </tr>
        <tr>
            <td>Stok Deviansi (restock No)</td>
            <td>: &#8730; stokNoDevArrSum / (stokNoArr - 1) = stokNoDev</td>
        </tr>
        <tr>
            <td>Stok (restock No)</td>
            <td>: 1 / &#8730; (2 x 3.14 x stokYesDev) x EXP( - (stokMinStokNoMean<sup>2</sup>) / stokNoDev<sup>2</sup> = stokNo</td>
        </tr>
        <td>
            <td></td>
            <td></td>
        </td>
        <tr>
            <td>Terjual Mean (restock Yes)</td>
            <td>: terjualYesArrSum / terjualYesArrCount = terjualYesMean</td>
        </tr>
        <tr>
            <td>Terjual Deviansi (restock Yes)</td>
            <td>: &#8730; terjualYesDevArrSum / (terjualYesArr - 1) = terjualYesDev</td>
        </tr>
        <tr>
            <td>Terjual (restock Yes)</td>
            <td>: 1 / &#8730; (2 x 3.14 x terjualYesDev) x EXP( - (terjualMinTerjualYesMean<sup>2</sup>) / terjualYesDev<sup>2</sup> = terjualYes</td>
        </tr>
        <td>
            <td></td>
            <td></td>
        </td>
        <tr>
            <td>Terjual Mean (restock No)</td>
            <td>: terjualNoArrSum / terjualNoArrCount = terjualNoMean</td>
        </tr>
        <tr>
            <td>Terjual Deviansi (restock No)</td>
            <td>: &#8730; terjualNoDevArrSum / (terjualNoArr - 1) = terjualNoDev</td>
        </tr>
        <tr>
            <td>Terjual (restock No)</td>
            <td>: 1 / &#8730; (2 x 3.14 x terjualNoDev) x EXP( - (terjualMinTerjualNoMean<sup>2</sup>) / terjualNoDev<sup>2</sup> = terjualNo</td>
        </tr>
    </tbody>
</table> --}}
@endsection

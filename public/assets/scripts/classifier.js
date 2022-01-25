$('#btn-klasifikasi-data').on('click', function(){
    if ($('#produk').val().length == 0) {
        alert('Pilih produk')
    }else if ($('#stok').val().length == 0) {
        alert('Masukkan stok')
    }else if ($('#terjual').val().length == 0) {
        alert('Masukkan jumlah terjual')
    }else{
        $('#hasil-klasifikasi').html(`<div class="row">
                                            <div class="col-md-12">
                                                <div class="panel panel-headline">
                                                    <div class="panel-heading">

                                                    </div>
                                                    <div class="panel-body" id="hasil-klasifikasi-body">
                                                        
                                                    </div>
                                                </div>
                                            </div>
                                        </div>`)

        $('#btn-klasifikasi-data').attr('disabled', true)
        $('#hasil-klasifikasi-body').html(`<div class="loader">
                                                <div class="loader4"></div>
                                                <h5 style="margin-top: 2.5rem">Loading data</h5>
                                            </div>`)

        ajaxRequest.post({
            "url": "/classifier/start",
            "data": {
                "id_produk": $('#produk').val(),
                "stok": $('#stok').val(),
                "terjual": $('#terjual').val()
            }
        }).then(function(result){
            $('#btn-klasifikasi-data').removeAttr('disabled')
            $('#hasil-klasifikasi-body').html(`<div class="row">
                                                    <div class="col-md-5" style="border-right: 1px solid #dbdbdb">
                                                        <h3 class="text-center" style="font-size: 22px; margin-bottom: 4rem; margin-top: 0">Probabilitas</h3>
                                                        <table class="custom-table">
                                                            <tbody>
                                                                <tr>
                                                                    <td>Produk (Yes)</td>
                                                                    <td>: ${result.data.yes.produk}</td>
                                                                </tr>
                                                                <tr>
                                                                    <td>Produk (No)</td>
                                                                    <td>: ${result.data.no.produk}</td>
                                                                </tr>
                                                                <tr>
                                                                    <td></td>
                                                                    <td></td>
                                                                </tr>
                                                                <tr>
                                                                    <td>Stok Mean (Yes)</td>
                                                                    <td>: ${result.data.stokYesMean}</td>
                                                                </tr>
                                                                <tr>
                                                                    <td>Stok Deviasi (Yes)</td>
                                                                    <td>: ${result.data.stokYesDev}</td>
                                                                </tr>
                                                                <tr>
                                                                    <td>Stok (Yes)</td>
                                                                    <td>: ${result.data.yes.stok}</td>
                                                                </tr>
                                                                <td>
                                                                    <td></td>
                                                                    <td></td>
                                                                </td>
                                                                <tr>
                                                                    <td>Stok Mean (No)</td>
                                                                    <td>: ${result.data.stokNoMean}</td>
                                                                </tr>
                                                                <tr>
                                                                    <td>Stok Deviasi (No)</td>
                                                                    <td>: ${result.data.stokNoDev}</td>
                                                                </tr>
                                                                <tr>
                                                                    <td>Stok (No)</td>
                                                                    <td>: ${result.data.no.stok}</td>
                                                                </tr>
                                                                <td>
                                                                    <td></td>
                                                                    <td></td>
                                                                </td>
                                                                <tr>
                                                                    <td>Terjual Mean (Yes)</td>
                                                                    <td>: ${result.data.yes.terjual}</td>
                                                                </tr>
                                                                <tr>
                                                                    <td>Terjual Deviasi (Yes)</td>
                                                                    <td>: ${result.data.terjualYesDev}</td>
                                                                </tr>
                                                                <tr>
                                                                    <td>Terjual (Yes)</td>
                                                                    <td>: ${result.data.yes.terjual}</td>
                                                                </tr>
                                                                <td>
                                                                    <td></td>
                                                                    <td></td>
                                                                </td>
                                                                <tr>
                                                                    <td>Terjual Mean (No)</td>
                                                                    <td>: ${result.data.terjualNoMean}</td>
                                                                </tr>
                                                                <tr>
                                                                    <td>Terjual Deviasi (No)</td>
                                                                    <td>: ${result.data.terjualNoDev}</td>
                                                                </tr>
                                                                <tr>
                                                                    <td>Terjual (No)</td>
                                                                    <td>: ${result.data.no.terjual}</td>
                                                                </tr>
                                                                <tr>
                                                                    <td></td>
                                                                    <td></td>
                                                                </tr>
                                                                <tr>
                                                                    <td>Restock (Yes)</td>
                                                                    <td>: ${result.data.yes.restock}</td>
                                                                </tr>
                                                                <tr>
                                                                    <td>Restock (No)</td>
                                                                    <td>: ${result.data.no.restock}</td>
                                                                </tr>
                                                            </tbody>
                                                        </table>
                                                    </div>
                                                    <div class="col-md-7">
                                                        <h3 class="text-center" style="font-size: 22px; margin-bottom: 4rem; margin-top: 0;">Hasil</h3>
                                                        <table class="custom-table">
                                                            <tbody>
                                                                <tr>
                                                                    <td>Yes</td>
                                                                    <td>: ${result.data.yes.produk} x ${result.data.yes.stok} x ${result.data.yes.terjual} x ${result.data.yes.restock} = ${result.data.countYes}</td>
                                                                </tr>
                                                                <tr>
                                                                    <td>No</td>
                                                                    <td>: ${result.data.no.produk} x ${result.data.no.stok} x ${result.data.no.terjual} x ${result.data.no.restock} = ${result.data.countNo} </td>
                                                                </tr>
                                                            </tbody>
                                                        </table>
                                                        <br>
                                                        <table class="table table-bordered">
                                                            <thead>
                                                                <tr>
                                                                    <th>#</th>
                                                                    <th>restock Yes (${result.data.yes.restock})</th>
                                                                    <th>restock No (${result.data.no.restock})</th>
                                                                </tr>
                                                            </thead>
                                                            <tbody>
                                                                <tr>
                                                                    <td>Produk</td>
                                                                    <td>${result.data.yes.produk}</td>
                                                                    <td>${result.data.no.produk}</td>
                                                                </tr>
                                                                <tr>
                                                                    <td>Stok</td>
                                                                    <td>${result.data.yes.stok}</td>
                                                                    <td>${result.data.no.stok}</td>
                                                                </tr>
                                                                <tr>
                                                                    <td>Terjual</td>
                                                                    <td>${result.data.yes.terjual}</td>
                                                                    <td>${result.data.no.terjual}</td>
                                                                </tr>
                                                                <tr>
                                                                    <td><b>Hasil</b></td>
                                                                    <td><b>${result.data.countYes}</b></td>
                                                                    <td><b>${result.data.countNo}</td>
                                                                </tr>
                                                            </tbody>
                                                        </table>
                                                        <br>
                                                        <h4 style="padding-left: 2rem">Hasil Klasifikasi &nbsp;&nbsp; <i class="fas fa-chevron-right"></i> &nbsp;&nbsp; ${ result.data.result }</h4>
                                                    </div>
                                                </div>
                                                <br><br>`)
        })
    }
})
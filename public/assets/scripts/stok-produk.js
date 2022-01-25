function searchStockProduk(periode) {
    ajaxRequest.post({
        "url": '/stok-produk/get',
        "data": {
            "periode": periode
        }
    }).then(function(result){
        if (result.data.length > 0) {
            $('#data-stok').html(`<table class="table">
                                    <thead>
                                        <tr>
                                            <th>No</th>
                                            <th>Periode</th>
                                            <th>Kode Produk</th>
                                            <th>Nama Produk</th>
                                            <th>Stok</th>
                                            <th>Terjual</th>
                                            <th>Restock</th>
                                        </tr>
                                    </thead>
                                    <tbody id="tbody-stok">
                                        
                                    </tbody>
                                </table>`)

            let tbody = ``
            let no = 1
            $.each(result.data, function(i, v){
                tbody = tbody + `<tr>
                                    <td>${no}</td>
                                    <td>${v.periode}</td>
                                    <td>${v.id_produk}</td>
                                    <td>${v.nama}</td>
                                    <td>${v.stok}</td>
                                    <td>${v.terjual}</td>
                                    <td>${v.restock}</td>
                                </tr>`
                no = no + 1
            })

            $('#tbody-stok').html(tbody)
            $('#data-stok').prepend(`<button type="button" class="btn btn-primary" data-toggle="modal" data-target="#modalInput"><i class="far fa-plus"></i>&nbsp; Tambah data produk</button>
                                    <br><br>`)
        }else{
            $('#data-stok').html(`<div class="loader">
                                    <i class="fas fa-ban" style="font-size: 5rem; opacity: .5"></i>
                                    <h5 style="margin-top: 2.5rem; opacity: .75">Belum ada data produk untuk periode ini</h5>
                                </div>`)

            $('#data-stok').prepend(`<button type="button" class="btn btn-primary" data-toggle="modal" data-target="#modalInput"><i class="far fa-plus"></i>&nbsp; Tambah data produk</button>
                                    <br><br>`)
        }

        $('#input-periode').val(periode)

        if (result.produkLeft.length > 0) {
            let options = `<option value="">--- Pilih Produk ---</option>`
            $.each(result.produkLeft, function(i, v){
                options = options + `<option value="${v.kode}">${v.nama}</option>`
            })
            $('#input-produk').html(options)
        }else{
            let options = `<option value="">Semua produk sudah ditambahkan</option>`
            $('#input-produk').html(options)
        }
    })
}

$('#search-stok-produk').on('click', function(){
    if ($('#periode').val().length == 0) {
        alert('Pilih periode')
    }else{
        $('#data-stok').html(`<div class="loader">
                                <div class="loader4"></div>
                                <h5 style="margin-top: 2.5rem">Loading data</h5>
                            </div>`)
        
        searchStockProduk($('#periode').val())
    }
})

$('#btn-input-data').on('click', function(){
    if ($('#input-produk').val().length == 0) {
        alert('Pilih produk')
    }else if ($('#input-stok').val().length == 0) {
        alert('Masukkan stok')
    }else if ($('#input-terjual').val().length == 0) {
        alert('Masukkan jumlah produk terjual')
    }else{
        $('#btn-input-data').attr('disabled', true)
        let params = {
            "periode": $('#input-periode').val(),
            "id_produk": $('#input-produk').val(),
            "stok": $('#input-stok').val(),
            "terjual": $('#input-terjual').val()
        }

        ajaxRequest.post({
            "url": "/stok-produk/input",
            "data": params
        }).then(function(result){
            $('#btn-input-data').removeAttr('disabled')
            if (result.response == "success") {
                $('#modalInput').modal('hide')
                $('#input-produk').val('')
                $('#input-stok').val('')
                $('#input-terjual').val('')
                toastr.option = {
                    "timeout": "5000"
                }
                toastr["success"](result.message)
                searchStockProduk(params.periode)
            }
        })
    }
})
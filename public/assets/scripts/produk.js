let tableProduk = $('#table-produk').DataTable({
    'ajax' : '/produk/get',
    'columns' : [
        {'data' : 'id'},
        {'data' : 'nama'},
        {
            data:null,
            render:function(data, type, row) {
                return `<button id="editData" class="btn-table-action edit" data-toggle="modal" data-target="#modalEditData"><i class="fas fa-cog"></i></button> &nbsp;
                        <button id="deleteData" class="btn-table-action delete" data-toggle="modal" data-target="#modalDeleteData"><i class="fas fa-trash-alt"></i></button>`
            }
        }
    ]
})

$('#table-produk tbody').on('click', '[id*=editData]', function(){
    let data = tableProduk.row($(this).parents('tr')).data()
    
    $('#edit-id').val(data['id'])
    $('#edit-nama').val(data['nama'])
})

$('#table-produk tbody').on('click', '[id*=deleteData]', function(){
    let data = tableProduk.row($(this).parents('tr')).data()
    
    $('#delete-warning-message').html(`Hapus data produk ${data['nama']}`)
    $('#delete-id').val(data['id'])
})

$('#btn-input-data').on('click', function(){
    if ($('#input-kode').val().length == 0) {
        alert('Masukkan kode produk')
    }else if ($('#input-nama').val().length == 0) {
        alert('Masukkan nama produk')
    }else{
        let params = {
            "kode": $('#input-kode').val(),
            "nama": $('#input-nama').val()
        }
    
        ajaxRequest.post({
            "url": "/produk/input",
            "data": params
        }).then(function(result){
            if (result.response == "success") {
                $('#modalInput').modal('hide')
                $('#input-kode').val('')
                $('#input-nama').val('')
                toastr.option = {
                    "timeout": "5000"
                }
                toastr["success"](result.message)
                $('#table-produk').DataTable().ajax.reload()
            }else if (result.response == "failed") {
                toastr.option = {
                    "timeout": "5000"
                }
                toastr["error"](result.message)
            }
        })
    }
})

$('#btn-edit-data').on('click', function(){
    if ($('#edit-nama').val().length == 0) {
        alert('Masukkan nama produk')
    }else{
        let params = {
            "id": $('#edit-id').val(),
            "nama": $('#edit-nama').val()
        }
    
        ajaxRequest.post({
            "url": "/produk/update",
            "data": params
        }).then(function(result){
            if (result.response == "success") {
                $('#modalEditData').modal('hide')
                toastr.option = {
                    "timeout": "5000"
                }
                toastr["success"](result.message)
                $('#table-produk').DataTable().ajax.reload()
            }
        })
    }
})

$('#btn-delete-data').on('click', function(){
    let params = {
        "id": $('#delete-id').val()
    }

    ajaxRequest.post({
        "url": "/produk/delete",
        "data": params
    }).then(function(result){
        if (result.response == "success") {
            $('#modalDeleteData').modal('hide')
            toastr.option = {
                "timeout": "5000"
            }
            toastr["success"](result.message)
            $('#table-produk').DataTable().ajax.reload()
        }
    })
})
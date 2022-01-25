@extends('layouts.master')
@section('content')
<div class="row">
    <div class="col-md-12">
        <div class="panel panel-headline">
            <div class="panel-heading">
                <h3 class="panel-title">Stok Produk</h3>
            </div>
            <div class="panel-body">
                <div class="row">
                    <div class="col-md-4">
                        <p>Periode</p>
                        <div class="input-group">
                            <input class="form-control month-picker" id="periode" type="text" value="{{date('F Y')}}" readonly>
                            <span class="input-group-btn"><button class="btn btn-primary" type="button" id="search-stok-produk"><i class="fas fa-search"></i></button></span>
                        </div>
                    </div>
                </div>
                <br><br>
                <div id="data-stok">
                    <div class="loader">
                        <i class="fas fa-ban" style="font-size: 5rem; opacity: .5"></i>
                        <h5 style="margin-top: 2.5rem; opacity: .75">Belum ada data yang dipilih</h5>
                    </div>
                    {{-- <table class="table">
                        <thead>
                            <tr>
                                <th>No</th>
                                <th>Periode</th>
                                <th>Kode Produk</th>
                                <th>Nama Produk</th>
                                <th>Stok</th>
                                <th>Terjual</th>
                            </tr>
                        </thead>
                        <tbody id="tbody-stok">
                            
                        </tbody>
                    </table> --}}
                </div>
            </div>
        </div>
    </div>
</div>

<div class="modal fade" id="modalInput" tabindex="-1" role="dialog" aria-labelledby="myModalLabel">
    <div class="modal-dialog" role="document">
        <div class="modal-content">
            <div class="modal-header">
                <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span
                        aria-hidden="true">&times;</span></button>
                <h4 class="modal-title" id="myModalLabel">Tambah produk</h4>
            </div>
            <div class="modal-body">
                <p>Periode</p>
                <input type="text" id="input-periode" class="form-control" readonly>
                <br>
                <p>Produk</p>
                <select id="input-produk" class="form-control">
                    <option value="">--- Pilih Produk ---</option>
                </select>
                <br>
                <p>Stok</p>
                <input type="number" id="input-stok" class="form-control">
                <br>
                <p>Terjual</p>
                <input type="number" id="input-terjual" class="form-control">
            </div>
            <div class="modal-footer">
                <button type="button" class="btn btn-primary" id="btn-input-data">Tambahkan</button>
            </div>
        </div>
    </div>
</div>

<div class="modal fade" id="modalEditData" tabindex="-1" role="dialog" aria-labelledby="myModalLabel">
    <div class="modal-dialog" role="document">
        <div class="modal-content">
            <div class="modal-header">
                <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span
                        aria-hidden="true">&times;</span></button>
                <h4 class="modal-title" id="myModalLabel">Edit Produk</h4>
            </div>
            <div class="modal-body">
                <p>Kode Produk</p>
                <input type="text" id="edit-id" class="form-control" disabled>
                <br>
                <p>Nama Produk</p>
                <input type="text" id="edit-nama" class="form-control">
            </div>
            <div class="modal-footer">
                <button type="button" class="btn btn-primary" id="btn-edit-data">Simpan</button>
            </div>
        </div>
    </div>
</div>

<div class="modal fade" id="modalDeleteData" tabindex="-1" role="dialog" aria-labelledby="myModalLabel">
    <div class="modal-dialog modal-sm" role="document">
        <div class="modal-content">
            <div class="modal-body">
                <h4 class="text-center" style="margin-top: 3rem" id="delete-warning-message"></h4>
                <input type="hidden" id="delete-id">
                <div style="margin-top: 5rem; text-align: center">
                    <button type="button" class="btn btn-danger" id="btn-delete-data">Hapus</button>
                    <button type="button" class="btn btn-default" data-dismiss="modal">Batal</button>
                </div>
            </div>
        </div>
    </div>
</div>
@endsection
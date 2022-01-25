<!DOCTYPE html>
<html>

<head>
    <!-- <script src="https://code.jquery.com/jquery-3.2.1.min.js" integrity="sha384-KJ3o2DKtIkvYIK3UENzmM7KCkRr/rE9/Qpg6aAZGJwFDMVNA/GpGFF93hXpG5KkN" crossorigin="anonymous"></script> -->
    <script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.6.0/jquery.min.js" integrity="sha512-894YE6QWD5I59HgZOGReFYm4dnWc1Qt5NtvYSaNcOP+u1T9qYdvdihz0PPSiiqn/+/3e7Jo4EaG7TubfWGUrMQ==" crossorigin="anonymous" referrerpolicy="no-referrer"></script>
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css" integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm" crossorigin="anonymous">


    <script type="text/javascript" src="https://cdnjs.cloudflare.com/ajax/libs/Chart.js/3.7.0/chart.min.js"></script>
</head>

<body>
    <nav class="navbar navbar-expand-lg navbar-light bg-light" style="background-color: #0069d9 !important;">


        <div class="collapse navbar-collapse" id="navbarSupportedContent">
            <ul class="navbar-nav mr-auto">
                <li class="nav-item active">
                    <a class="nav-link" style="color : white" href="{{url('show')}}">Dashboard </a>
                </li>
                <li class="nav-item">
                    <a class="nav-link" style="color :white" href="{{url('list')}}">List Penjualan</a>
                </li>

            </ul>

        </div>
    </nav>

    <div class="container mt-5">

        <div class="row">

            <div class="col-md-12 p-5" style="text-align: center;">
                <h3>List Penjualan</h3>
                <table class="table table-bordered">
                    <tr>
                        <td>No</td>
                        <td>Nama Customer</td>
                        <td>Alamat</td>
                        <td>Tanggal Penjualan</td>
                        <td>Total Penjualan</td>
                        <td>Detail</td>
                    </tr>

                    @foreach ($data as $k => $data)
                    <tr>
                        <td>{{$k+1}}</td>
                        <td>{{$data->NamaKonsumen}}</td>
                        <td>{{$data->Alamat}}</td>
                        <td>{{$data->TglPenjualan}}</td>
                        <td align="right">Rp.{{number_format($data->Total)}}</td>
                        <td><button class="btn-primary" onclick="modal('{{$data->IdPenjualan}}')">Detail</button></td>
                    </tr>
                    @endforeach
                </table>
                <div class="container">


            </div>
        </div>
    </div>
    <div class="modal " id="modaldetail" tabindex="-1">
        <div class="modal-dialog modal-lg">
            <div class="modal-content">
                <div class="modal-header">
                    <h5 class="modal-title">Detail Transaksi</h5>
                    <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                        <span aria-hidden="true">&times;</span>
                    </button>
                </div>
                <div class="modal-body">
                    <div class="row">
                        <div class="col-md-3">Nama Pembeli</div>
                        <div class="col-md-9">: <span id="span_nama"></span></div>
                        <div class="col-md-3">Nama ALamat</div>
                        <div class="col-md-9">: <span id="span_alamat"></span></div>
                        <div class="col-md-3">Nama Waktu Beli</div>
                        <div class="col-md-9">: <span id="span_waktu"></span></div>
                    </div>

                    <table class="table table-bordered mt-3">
                        <tr>
                            <td>No</td>
                            <td>Nama Barang</td>
                            <td>Jumlah</td>
                            <td>Harga Satuan</td>
                            <td>Harga Total</td>
                        </tr>
                        <tbody id="tbody_tabel"></tbody>
                    </table>
                </div>
            </div>
        </div>
    </div>

    <script>
        function fnumber(x) {
            return x.toString().replace(/\B(?=(\d{3})+(?!\d))/g, ",");
        }

        function modal(v) {

            $.ajax({
                url: "{{url('detail_trans')}}/" + v,
            }).done(function(data) {
                // data = JSON.parse(data)
                console.log(data)
                var str = '';
                var no = 1;
                var jml = 0;
                data.forEach(element => {
                    str += '<tr><td>' + no + '</td><td>' + element.NamaBarang + '</td><td>' + element.Jumlah + '</td><td align="right">' + 'Rp.'+fnumber(element.HargaSatuan) + '</td><td align="right">' + 'Rp.'+fnumber(element.HargaTotal) + '</td></tr>'
                    no = no + 1;
                    jml = parseInt(jml) + parseInt(element.HargaTotal);
                });
                str += '<tr><td colspan="4" align="center"><b>Jumlah</b></td><td align="right">Rp.' + fnumber(jml) + '</td></tr>'

                $('#span_nama').html(data[0].NamaKonsumen);
                $('#span_alamat').html(data[0].Alamat);
                $('#span_waktu').html(data[0].TglPenjualan);
                $('#tbody_tabel').html(str);
                $('#modaldetail').modal('show');
            });
        }
        $(document).ready(function() {



        });
    </script>

    <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.12.9/umd/popper.min.js" integrity="sha384-ApNbgh9B+Y1QKtv3Rn7W3mgPxhU9K/ScQsAP7hUibX39j7fakFPskvXusvfa0b4Q" crossorigin="anonymous"></script>
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/js/bootstrap.min.js" integrity="sha384-JZR6Spejh4U02d8jOt6vLEHfe/JQGiRRSQQxSfFWpi1MquVdAyjUar5+76PVCmYl" crossorigin="anonymous"></script>
</body>

</html>

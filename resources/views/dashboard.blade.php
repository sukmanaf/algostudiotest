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
                    <a class="nav-link" style="color : white"  href="{{url('show')}}">Dashboard </a>
                </li>
                <li class="nav-item">
                    <a class="nav-link" style="color : white"  href="{{url('list')}}">List Penjualan</a>
                </li>

            </ul>

        </div>
    </nav>

    <div class="container mt-5" >

        <div class="row">
            <div class="col-md-8" style="text-align: center;">
                <h4>Grafik Penjualan</h4>
                <canvas id="idbar"></canvas>

            </div>
            <div class="col-md-4" style="text-align: center;">
                <h4>Grafik Persentase Kategori</h4>
                <canvas id="idpie"></canvas>
            </div>
            <div class="col-md-12 p-5" style="">
                <table class="table table-bordered">
                    <tr>
                        <td>No</td>
                        <td>Nama Customer</td>
                        <td>Alamat</td>
                        <td>Tanggal Penjualan</td>
                        <td>Total Penjualan</td>
                    </tr>

                    @foreach ($data as $k => $data)
                    <tr>
                        <td>{{$k+1}}</td>
                        <td>{{$data->NamaKonsumen}}</td>
                        <td>{{$data->Alamat}}</td>
                        <td>{{$data->TglPenjualan}}</td>
                        <td align="right">Rp.{{number_format($data->Total)}}</td>
                    </tr>
                    @endforeach
                </table>
            </div>
        </div>
    </div>


    <script>
        $(document).ready(function() {


            $.ajax({
                url: "{{route('bar')}}",
            }).done(function(data) {

                var coloR = [];
                var dynamicColors = function() {
                    var r = Math.floor(Math.random() * 255);
                    var g = Math.floor(Math.random() * 255);
                    var b = Math.floor(Math.random() * 255);
                    return "rgb(" + r + "," + g + "," + b + ")";
                };

                var jml = data.harga.length;
                for (var i = 0; i < jml; i++) {
                    coloR.push(dynamicColors());
                }

                var ctx = document.getElementById("idbar").getContext('2d');
                var myChart = new Chart(ctx, {
                    type: 'bar',
                    data: {
                        labels: data.tanggal,
                        datasets: [{
                            label: '',
                            data: data.harga,
                            backgroundColor: coloR,
                            borderColor: [],
                            borderWidth: 1
                        }]
                    },
                    options: {
                        scales: {
                            yAxes: [{
                                ticks: {
                                    beginAtZero: true
                                }
                            }]
                        }
                    }
                });
            });

            $.ajax({
                url: "{{route('pie')}}",
            }).done(function(data) {
                var coloR = [];

                var dynamicColors = function() {
                    var r = Math.floor(Math.random() * 255);
                    var g = Math.floor(Math.random() * 255);
                    var b = Math.floor(Math.random() * 255);
                    return "rgb(" + r + "," + g + "," + b + ")";
                };

                var jml = data.jumlah.length;
                for (var i = 0; i < jml; i++) {
                    coloR.push(dynamicColors());
                }
                console.log(data)
                var ctx = document.getElementById("idpie").getContext('2d');
                var myChart = new Chart(ctx, {
                    type: 'pie',
                    data: {
                        labels: data.kategori,
                        datasets: [{
                            label: '',
                            data: data.jumlah,
                            backgroundColor: coloR,
                            borderColor: [],
                            borderWidth: 1
                        }]
                    },
                    options: {
                        scales: {
                            yAxes: [{
                                ticks: {
                                    beginAtZero: true
                                }
                            }]
                        }
                    }
                });
            });
        });
    </script>

    <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.12.9/umd/popper.min.js" integrity="sha384-ApNbgh9B+Y1QKtv3Rn7W3mgPxhU9K/ScQsAP7hUibX39j7fakFPskvXusvfa0b4Q" crossorigin="anonymous"></script>
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/js/bootstrap.min.js" integrity="sha384-JZR6Spejh4U02d8jOt6vLEHfe/JQGiRRSQQxSfFWpi1MquVdAyjUar5+76PVCmYl" crossorigin="anonymous"></script>
</body>

</html>

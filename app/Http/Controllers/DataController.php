<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use App\DataModel;
use Illuminate\Support\Facades\DB;

class DataController extends Controller
{
    //
    public function Insert_barang()
    {
        $data = [];

        for ($i = 10; $i < 20; $i++) {
            $a = [
                'KodeBarang' => 'B' . $i,
                'NamaBarang' => 'Mouse ' . $i,
                'HargaJual' => '2' . $i . '00',
                'HargaBeli' => '1' . $i . '00',
                'Stok'  => '1',
                'Kategori' => 'K1'
            ];
            array_push($data, $a);
        }

        DB::table('barang')->insert($data);
    }
    public function Insert_det_penjualan()
    {
        $data = [];

        for ($i = 10; $i < 20; $i++) {
            $i2 = $i + 1;
            $a = [
                'IdPenjualan' => 'P' . $i,
                'KodeBarang' => 'B' . $i2,
                'Jumlah' => '1',
                'HargaSatuan' => '2' . $i2 . '00',
                'HargaTotal'  => '2' . $i2 . '00',
            ];
            array_push($data, $a);
        }

        DB::table('detail_penjualan')->insert($data);
    }

    public function Insert_kategori()
    {
        $data = [];

        for ($i = 0; $i < 10; $i++) {
            $a = [
                'Kategori' => 'K' . $i,
            ];
            array_push($data, $a);
        }

        DB::table('kategori')->insert($data);
    }


    public function Insert_penjualan()
    {
        $data = [];

        for ($i = 10; $i < 20; $i++) {
            $a = [
                'TglPenjualan' => date('Y-m-d'),
                'NamaKonsumen' => 'Nama' . $i,
                'Alamat' => 'Malang  kota gang ' . $i,
                'IdPenjualan' => 'P' . $i,

            ];
            array_push($data, $a);
        }

        DB::table('penjualan')->insert($data);
    }

    public function show()
    {
        $data['data'] = DB::select('SELECT SUM(dp.HargaTotal) as Total,dp.IdPenjualan,p.`NamaKonsumen`,p.`Alamat`,p.`TglPenjualan`
        FROM detail_penjualan dp
        JOIN penjualan p ON p.`IdPenjualan`=dp.`IdPenjualan`
        GROUP BY dp.IdPenjualan,p.`IdPenjualan` limit 10');

        return view('dashboard', $data);
    }
    public function list()
    {
            $data['dataq'] = DB::select('SELECT SUM(dp.HargaTotal) as Total,dp.IdPenjualan,p.`NamaKonsumen`,p.`Alamat`,p.`TglPenjualan`,p.IdPenjualan
            FROM detail_penjualan dp
            JOIN penjualan p ON p.`IdPenjualan`=dp.`IdPenjualan`
            GROUP BY dp.IdPenjualan,p.`IdPenjualan` ');

            $data['data']=DB::table('detail_penjualan')
            ->Join('penjualan','detail_penjualan.IdPenjualan','=','penjualan.IdPenjualan')
            ->select(DB::raw('SUM(detail_penjualan.HargaTotal) AS Total'),'detail_penjualan.IdPenjualan','penjualan.NamaKonsumen','penjualan.Alamat','penjualan.TglPenjualan')
            ->groupBy('detail_penjualan.IdPenjualan')
            ->Paginate(10);

            return view('list', $data);
    }

    public function get_bar()
    {
        $datas = DB::select('SELECT SUM(HargaTotal) Total,DATE(created_at) Tgl
                            FROM detail_penjualan
                            WHERE MONTH(created_at) = MONTH(CURRENT_DATE())
                            GROUP BY DATE(created_at)');
        $data['harga'] = [];
        $data['tanggal'] = [];
        foreach ($datas as $key => $value) {
            array_push($data['harga'], $value->Total);
            array_push($data['tanggal'], $value->Tgl);
        }
        return response()->json($data);
    }


    public function get_pie()
    {
        $datas = DB::select('SELECT COUNT(dp.id) jml,k.`Kategori`
                            FROM detail_penjualan dp
                            JOIN barang b ON b.`KodeBarang`=dp.`KodeBarang`
                            JOIN kategori k ON k.`IdKategori`=b.`Kategori`
                            GROUP BY b.`Kategori`');
        $datas2 = DB::select('SELECT COUNT(b.id) jml,k.kategori
                            FROM barang b
                            JOIN Kategori k ON k.`IdKategori`=b.`Kategori`
                            GROUP BY b.`Kategori`');
        $data['jumlah'] = [];
        $data['kategori'] = [];
        $count = 0;

        foreach ($datas2 as $key => $v) {
            $count= $count+$v->jml;
        }
        foreach ($datas2 as $key => $value) {
            $percent = round($value->jml*100 / $count);
            array_push($data['jumlah'], $percent);
            array_push($data['kategori'], $value->kategori);
            // let percentage = ($value->jml*100 / $count);
        }
        return response()->json($data);
    }


    public function detail_trans($id)
    {
        $datas = DB::select('SELECT dp.IdPenjualan,p.`NamaKonsumen`,p.`Alamat`,p.`TglPenjualan`,b.NamaBarang,dp.`HargaTotal`,dp.`Jumlah`,dp.HargaSatuan
        FROM detail_penjualan dp
        JOIN penjualan p ON p.`IdPenjualan`=dp.`IdPenjualan`
	JOIN barang b ON b.`KodeBarang`=dp.`KodeBarang`
        WHERE p.`IdPenjualan`= "'.$id.'" ');
        return response()->json($datas);
    }


}

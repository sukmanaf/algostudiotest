<?php

use Illuminate\Database\Seeder;
use League\CommonMark\Extension\Table\Table;

class barang extends Seeder
{
    /**
     * Run the database seeds.
     *
     * @return void
     */
    public function run()
    {
        for ($i=0; $i < 10; $i++) {

            DB::table('barang')->insert(
                [
                    'KodeBarang'=> 'B001',
                    'NamaBarang'=> 'Mouse LG M120',
                    'HargaJual'=> '100000',
                    'HargaBeli'=> '80000',
                    'Stok'=> '66',
                    'Kategori'=> 'K1',
                ]
            )
        }
    }
}

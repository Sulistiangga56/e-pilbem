<?php

namespace App\Controllers;

use App\Models\MahasiswaModel;
use App\Models\DosenModel;
use CodeIgniter\Controller;

class Home extends Controller
{
    public function index()
    {
        // session_start();

        // if (empty($_SESSION['log_status'])) {
        //     return redirect()->to('index');
        // }

        // $username = $_SESSION['username'];
        $mahasiswaModel = new MahasiswaModel();
        // $dosenModel = new DosenModel();
        $data['data'] = $mahasiswaModel->getMahasiswaByUsername($username)->getRowArray();
        $data['data'] = array_merge($data['data'], $dosenModel->getDosenByUsername($username)->getRowArray());

        // // ambil logo
        // $identitas_kampusModel = new IdentitasKampusModel();
        $data['get_data'] = $identitas_kampusModel->getIdentitasKampus()->getRowArray();
        // // echo view('user', $data);
    
        return view('user/index', $data); // Mengirimkan variabel $data ke tampilan 'dashboard'
    }
}

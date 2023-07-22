<?php
  date_default_timezone_set('Asia/Jakarta');

  // koneksi ke database local
  $SERVER = 'localhost';
  $USERNAME = 'root';
  $PASSWORD = '';
  $DB = 'u-choice';

  $koneksi = mysqli_connect($SERVER,$USERNAME,$PASSWORD,$DB);
?>
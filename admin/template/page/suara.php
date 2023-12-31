<div class="pcoded-content">
  <div class="page-header card">
    <div class="row align-items-end">
      <div class="col-md-12 col-xl-12">
        <h5>Hasil Suara</h5>
        <div class="mt-4"></div>
        <?php
        $dat = mysqli_query($koneksi, "SELECT * FROM view_pemilihan");
        $view = mysqli_fetch_assoc($dat);

        if (empty($view)) {
        ?>
          <div class="alert alert-warn"><em class="fas fa-info"></em> Tombol Download Akan Muncul Ketika Pemilihan Sedang Berjalan</div>

          <h4>Data Kandidat Kosong !</h4>
        <?php
        } else {
        ?>
          <a target="_blank" href="../proses/cetak/suara.php"><button class="tmb tmb-success tmb-sm">
              <em class="fas fa-download"></em> Download Hasil Suara</button>
          </a>
        <?php
        }
        ?>
        <div class="mt-3"></div>
        <div class="row">
          <?php
          $data_kandidat = mysqli_query($koneksi, "SELECT * FROM tb_kandidat ORDER BY nomor_kandidat ASC");

          $data_chart = [];
          while ($data = mysqli_fetch_assoc($data_kandidat)) :
          ?>
            <?php
            if (empty($data)) {
            ?>
              <h3>Data Kosong </h3>
            <?php
            } else {
              $data_chart['nomor_kandidat'][] = $data['nomor_kandidat'] . " " . $data['nama_ketua'] . " Dan " . $data['nama_wakil'];
            ?>
              <div class="col-md-4 col-sm-4">
                <div class="card">
                  <div class="card-header bg-header">
                    <b class="text-bold text-small text-center" style="font-size: 12px;"><?= $data['nomor_kandidat'] ?> <?= $data['nama_ketua'] ?> Dan <?= $data['nama_wakil'] ?></b>
                  </div>
                  <div class="card-body">
                    <img src="../assets/upload/<?= $data['foto_kandidat'] ?>" class="card-img" width="270" height="180">
                    <div class="mt-3"></div>
                    <div class="row justify-content-center">
                      <?php
                      $no_kandidat = $data['nomor_kandidat'];
                      $database = mysqli_query($koneksi, "SELECT * FROM view_pemilihan WHERE no_kandidat='$no_kandidat'");
                      $jum = mysqli_num_rows($database);
                      $data_chart['jumlah_suara'][] = $jum;
                      ?>
                      <p class="badge badge-info" style="font-size: 17px;">Jumlah Suara <b class="badge badge-warning"><?= $jum; ?></b></p>
                    </div>
                    <p class="text-bold">Visi</p>
                    <p><?= $data['visi'] ?></p>
                    <p class="text-bold">Misi</p>
                    <p><?= $data['misi'] ?></p>
                  </div>
                </div>
              </div>
            <?php
            }
            ?>
          <?php endwhile; ?>
        </div>
        <div class="canvas-container" style="position: relative; height:40vh; width:80vw">
          <canvas id="hasilSuaraChart"></canvas>
        </div>
      </div>
    </div>
  </div>
</div>

<!-- chart js -->

<script src="https://cdn.jsdelivr.net/npm/chart.js"></script>

<script>
  const ctx = document.getElementById('hasilSuaraChart');

  new Chart(ctx, {
    type: 'bar',
    data: {
      labels: <?= json_encode($data_chart['nomor_kandidat']) ?>,
      datasets: [{
        label: 'Jumlah Suara',
        data: <?= json_encode($data_chart['jumlah_suara']) ?>,
      }]
    },
    options: {
      responsive: true,
      maintainAspectRatio: false,
      plugins: {
        title: {
          display: true,
          text: 'Hasil Suara'
        }
      }
    }
  })
</script>
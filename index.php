<?php
// Nama: Ahmad Dwi Yanuara Nugroho
// NIM: 19106050025
// SKEMA LSP: Pemrograman Web Junior

require "./connection.php"
?>
<!doctype html>
<html lang="en">

<head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <title>Bootstrap demo</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.1/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-iYQeCzEYFbKjA/T2uDLTpkwGzCiq6soy8tYaI1GyVh/UjpbCx/TYkiZhlZB6+fzT" crossorigin="anonymous">
</head>

<body>
    <div class="container">
        <div class="row">
            <div class="border rounded col m-3">
                <?php
                // get data diri mahasiswa
                $mhs_sql = "SELECT nim, nama FROM mahasiswa";
                $mhs_query = mysqli_query($conn, $mhs_sql);
                $mhs_result = [];
                while ($row = mysqli_fetch_assoc($mhs_query)) {
                    $mhs_result[] = $row;
                }
                // echo "<pre>";
                // print_r($mhs_result);
                // echo "</pre>";
                ?>
                <div class="border rounded mx-5 mt-5 py-5 text-center">foto</div>
                <p class="text-center my-2">
                    <?php echo $mhs_result[0]["nama"] . "<br>" . $mhs_result[0]["nim"] ?>
                </p>
                <p class="mx-4 mt-2 mb-1"><a href="#">Isi KRS</a></p>
                <p class="mx-4 mt-2 mb-4"><a href="#">Logout</a></p>
            </div>
            <div class="border rounded col-8 m-3 py-5 px-5">
                <?php
                $matkul_terambil_sql = "
                    SELECT matkul.nama AS matkul, waktu.waktu, ruang.ruang, dosen.nama AS dosen
                    FROM mhs_mk
                    INNER JOIN mahasiswa ON mhs_mk.mahasiswa = mahasiswa.nim
                    INNER JOIN matkul ON mhs_mk.matkul = matkul.id
                    INNER JOIN waktu ON matkul.waktu = waktu.id
                    INNER JOIN ruang ON waktu.ruang = ruang.id
                    INNER JOIN dosen ON matkul.dosen = dosen.nip
                ";
                $matkul_terambil_query = mysqli_query($conn, $matkul_terambil_sql);
                $matkul_terambil_result = [];
                while ($row = mysqli_fetch_assoc($matkul_terambil_query)) {
                    $matkul_terambil_result[] = $row;
                }
                // echo "<pre>";
                // print_r($matkul_terambil_result);
                // echo "</pre>";
                ?>
                <h1>KRS Terambil</h1>
                <table class="table mb-5">
                    <thead>
                        <tr>
                            <th class="col">#</th>
                            <th class="col">Mata Kuliah</th>
                            <th class="col">Ruangan</th>
                            <th class="col">Waktu</th>
                            <th class="col">Aksi</th>
                        </tr>
                    </thead>
                    <tbody>
                        <?php
                        for ($i = 0; $i < count($matkul_terambil_result); $i++) {
                            $data = $matkul_terambil_result[$i];
                        ?>
                            <tr>
                                <th scope="row"><?php echo $i + 1 ?></th>
                                <td><?php echo $data["matkul"] ?></td>
                                <td><?php echo $data["ruang"] ?></td>
                                <td><?php echo $data["waktu"] ?></td>
                                <td><a name="hapus-krs" id="hapus-krs" class="btn btn-link border rounded" href="#" role="button">Hapus</a></td>
                            </tr>
                        <?php
                        }
                        ?>
                    </tbody>
                </table>

                <?php
                $matkul_sql = "
                    SELECT matkul.nama AS matkul, waktu.waktu, ruang.ruang, dosen.nama AS dosen
                    FROM matkul
                    INNER JOIN waktu ON matkul.waktu = waktu.id
                    INNER JOIN ruang ON waktu.ruang = ruang.id
                    INNER JOIN dosen ON matkul.dosen = dosen.nip
                ";
                $matkul_query = mysqli_query($conn, $matkul_sql);
                $matkul_result = [];
                while ($row = mysqli_fetch_assoc($matkul_query)) {
                    $matkul_result[] = $row;
                }
                // echo "<pre>";
                // print_r($matkul_result);
                // echo "</pre>";
                ?>
                <h1>KRS Tersedia</h1>
                <table class="table">
                    <thead>
                        <tr>
                            <th class="col">#</th>
                            <th class="col">Mata Kuliah</th>
                            <th class="col">Ruangan</th>
                            <th class="col">Waktu</th>
                            <th class="col">Aksi</th>
                        </tr>
                    </thead>
                    <tbody>
                        <?php
                        for ($i = 0; $i < count($matkul_result); $i++) {
                            $data = $matkul_result[$i];
                            $terambil = false;
                            // echo "<pre>";
                            // print_r($data);
                            // echo "</pre>";
                            for ($j = 0; $j < count($matkul_terambil_result); $j++) {
                                $data_matkul_terambil = $matkul_terambil_result[$j];
                                if ($data["matkul"] == $data_matkul_terambil["matkul"]) {
                                    $terambil = true;
                                }
                                // echo "<pre>";
                                // print_r($data_matkul_terambil);
                                // echo "</pre>";
                            }
                            if ($terambil) continue;
                        ?>
                            <tr>
                                <th scope="row"><?php echo $i + 1 ?></th>
                                <td><?php echo $data["matkul"] ?></td>
                                <td><?php echo $data["ruang"] ?></td>
                                <td><?php echo $data["waktu"] ?></td>
                                <td><a name="hapus-krs" id="hapus-krs" class="btn btn-link border rounded" href="#" role="button">Ambil</a></td>
                            </tr>
                        <?php
                        }
                        ?>
                    </tbody>
                </table>
            </div>
        </div>
    </div>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.1/dist/js/bootstrap.bundle.min.js" integrity="sha384-u1OknCvxWvY5kfmNBILK2hRnQC3Pr17a+RTT6rIHI7NnikvbZlHgTPOOmMi466C8" crossorigin="anonymous"></script>
</body>

</html>

<?php
// 1. login
// 2. page krs

// table
// mk
// dosen
// mhs
// ruang
// waktu
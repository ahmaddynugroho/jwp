<?php
$servername = "localhost";
$username = "root";
$password = "";
$dbname = "lsp_krs_ahmad";

// Create connection
$conn = mysqli_connect($servername, $username, $password, $dbname);

// Check connection
if (!$conn) {
    die("Connection failed: " . mysqli_connect_error());
}
// echo "Connected successfully <br>";

// $sql = "SELECT nama FROM mahasiswa";
// $result = mysqli_query($conn, $sql);

// if (mysqli_num_rows($result) > 0) {
//     while ($row = mysqli_fetch_assoc($result)) {
//         echo "name: " . $row["nama"] . "<br>";
//     }
// } else {
//     echo "0 results";
// }

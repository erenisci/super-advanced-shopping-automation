<?php
// urunleri_getir.php

// Veritabanı bağlantısını yap
$servername = "localhost";
$username = "kullanici_adi"; // Veritabanı kullanıcı adınız
$password = "parola"; // Veritabanı parolanız
$dbname = "projectdb";

$conn = new mysqli($servername, $username, $password, $dbname);

// Bağlantıyı kontrol et
if ($conn->connect_error) {
    die("Bağlantı hatası: " . $conn->connect_error);
}

// Kategori ID'sini al
$kategoriId = isset($_GET['kategori_id']) ? $_GET['kategori_id'] : null;

// Kategori ID'sine göre sorgu yap
if ($kategoriId !== null) {
    $sql = "SELECT * FROM urunler WHERE urunKategori_id = $kategoriId";
} else {
    $sql = "SELECT * FROM urunler";
}

$result = $conn->query($sql);

if ($result->num_rows > 0) {
    $urunListesi = array();

    // Verileri döngü ile al
    while($row = $result->fetch_assoc()) {
        $urunListesi[] = array(
            'urunIsim' => $row['urunIsim'],
            'urunFiyat' => $row['urunFiyat']
        );
    }

    // JSON formatında çıktı döndür
    echo json_encode($urunListesi);
} else {
    echo "Ürün bulunamadı";
}

$conn->close();
?>

<?php
include 'koneksi.php';
// new filename
$filenamesignature = 'pic_' . date('YmdHis') . '.png';
$filenameqr = 'qr_' . date('YmdHis') . '.png';
$url1 = '';
$url2 = '';
if (move_uploaded_file($_FILES['signature']['tmp_name'], 'pernyataan_ttd/' . $filenamesignature) and move_uploaded_file($_FILES['qrcode']['tmp_name'], 'pernyataan_qr/' . $filenameqr)) {
    $url1 = $filenamesignature;
    $url2 = $filenameqr;
}

// menyimpan data kedalam variabel
$created_at = date("Y-m-d H:i:s");
$updated_at = date("Y-m-d H:i:s");

// query SQL untuk insert data
$id_kegiatan = $_POST['id_pernyataan_kegiatan'];
$query = "INSERT INTO pernyataan_dokumen (id_pernyataan_kegiatan, signature_pad, qr_code, created_at, updated_at) VALUES ('$id_kegiatan', '$url1', '$url2', '$created_at', '$updated_at')";
if (!mysqli_query($conn, $query)) {
    $data = [
        'id' => null,
        'message' => mysqli_error($conn),
        'query' => $query
    ];
    echo json_encode($data);
} else {
    $query_update = "UPDATE pernyataan_kegiatan SET status='2' WHERE id_pernyataan_kegiatan=" . $id_kegiatan;
    mysqli_query($conn, $query_update);
    $data = [
        'id' => $conn->insert_id,
        'message' => "Data Berhasil Ditambahkan!"
    ];
    echo json_encode($data);
}

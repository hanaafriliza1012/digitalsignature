<?php
include('koneksi.php');
$id = $_GET['id'];
session_start();
require('FPDF/fpdf.php');


$pdf = new FPDF('P', 'mm', 'A4');
$pdf->AddPage();

//Image( file name , x position , y position , width [optional] , height [optional] )
// $pdf->Image('frame.png', 5, 5, 287, 200);
// $pdf->Image('unila.png', 40, 12, 28, 28);
$pdf->Cell(25, 8, '', 0, 1);
$pdf->SetFont('Times', 'B', '14');
$pdf->Cell(0, 5, "KEMENTRIAN RISET TEKNOLOGI DAN PENDIDIKAN TINGGI", 0, 1, 'C');
$pdf->Cell(25, 0, '', 0, 1);
$pdf->Cell(0, 5, "FAKULTAS MATEMATIKA DAN ILMU PENGETAHUAN ALAM", 0, 1, 'C');
$pdf->Cell(25, 0, '', 0, 1);
$pdf->SetFont('Times', 'B', '17');
$pdf->Cell(0, 5, "UNIVERSITAS LAMPUNG", 0, 1, 'C');
$pdf->Cell(25, 0, '', 0, 1);
$pdf->SetFont('Times', 'I', '10');
$pdf->Cell(0, 5, "Sekretariat Gedung E Lantai 1", 0, 1, 'C');
$pdf->Cell(25, 0, '', 0, 1);
$pdf->Cell(0, 2, "Jl. Prof. Dr. Ir. Sumantri Brojonegoro No.1, Gedong Meneng, Kec. Rajabasa, Kota Bandar Lampung, Lampung, 35141", 0, 1, 'C');
$pdf->Line(5, 42, 205, 42);

//set font to arial, bold, 14pt
$pdf->SetFont('Times', 'B', 20);
//make a dummy empty cell as a vertical spacer
$pdf->Cell(189, 13, '', 0, 1); //end of line
$pdf->Cell(8, 5, '', 0, 0);
$pdf->Cell(0, 5, 'SURAT PERNYATAAN', 0, 0, 'C');
$pdf->Cell(0, 5, '', 0, 1);

//set font to arial, bold, 14pt
$pdf->SetFont('Times', '', 17);
//Cell(width , height , text , border , end line , [align] )
//make a dummy empty cell as a vertical spacer
$pdf->Cell(189, 4, '', 0, 1); //end of line
$pdf->Cell(8, 5, '', 0, 0);
$pdf->Cell(0, 5, 'Nomor Registrasi: AB-01-1789', 0, 0, 'C');
$pdf->Cell(0, 5, '', 0, 1);

//set font to arial, regular, 12pt
$pdf->SetFont('Times', '', 17);
//make a dummy empty cell as a vertical spacer
$pdf->Cell(15, 5, '', 0, 0);
$pdf->Cell(0, 25, "Saya yang bertanda tangan di bawah ini:", 0, 0, 'L');
$pdf->Cell(8, 5, '', 0, 1);

$query = mysqli_query($conn, "SELECT * FROM pernyataan_kegiatan_peserta JOIN pernyataan_kegiatan ON pernyataan_kegiatan_peserta.id_pernyataan_kegiatan = pernyataan_kegiatan.id_pernyataan_kegiatan JOIN pernyataan_peserta ON pernyataan_kegiatan_peserta.id_pernyataan_peserta = pernyataan_peserta.id_pernyataan_peserta JOIN pernyataan_dokumen ON pernyataan_kegiatan.id_pernyataan_kegiatan = pernyataan_dokumen.id_pernyataan_kegiatan where id_pernyataan_kegiatan_peserta = " . $id);
$row = mysqli_fetch_array($query);
// var_dump($row);
$pdf->SetFont('Times', '', 15);
$pdf->Cell(110, 14, '', 0, 1); //end of line
$pdf->Cell(15, 5, '', 0, 0);
$pdf->MultiCell(0, 5, "Nama :" . $row['nama_penandatangan'], 0, 'L', 0, 0);
$pdf->Cell(110, 3, '', 0, 1);

$pdf->SetFont('Times', '', 15);
$pdf->Cell(110, 0, '', 0, 1); //end of line
$pdf->Cell(15, 5, '', 0, 0);
$pdf->MultiCell(0, 5, "Jabatan: " . $row['jabatan_penandatangan'], 0, 'L', 0, 0);
$pdf->Cell(110, 10, '', 0, 1);

$pdf->SetFont('Times', '', 17);
$pdf->Cell(15, 5, '', 0, 0);
$pdf->Cell(0, 8, "Menerangkan dengan sebenarnya bahwa:", 0, 0, 'L');
$pdf->Cell(8, 5, '', 0, 1);

$pdf->SetFont('Times', '', 17);
$pdf->Cell(15, 8, '', 0, 0);
$pdf->Cell(0, 15, "Nama :" . $row['nama'], 0, 0, 'L');
$pdf->Cell(8, 8, '', 0, 1);

$pdf->SetFont('Times', '', 17);
$pdf->Cell(15, 8, '', 0, 0);
$pdf->Cell(0, 15, "NPM :" . $row['npm'], 0, 0, 'L');
$pdf->Cell(8, 8, '', 0, 1);

$pdf->SetFont('Times', '', 17);
$pdf->Cell(15, 8, '', 0, 0);
$pdf->Cell(0, 15, "Jenis Kelamin :" . $row['jenis_kelamin'], 0, 0, 'L');
$pdf->Cell(8, 8, '', 0, 1);

$pdf->SetFont('Times', '', 17);
$pdf->Cell(15, 8, '', 0, 0);
$pdf->Cell(0, 15, "Alamat :" . $row['alamat'], 0, 0, 'L');
$pdf->Cell(8, 8, '', 0, 1);

//make a dummy empty cell as a vertical spacer
$pdf->Cell(189, 15, '', 0, 1); //end of line
//billing address
$pdf->SetFont('Times', '', 17);
$pdf->Cell(15, 5, '', 0, 0); //end of line
$pdf->MultiCell(0, 6, "Nama tersebut adalah benar mahasiswa unila, dan tidak pernah melakukan perbuatan yang meresahkan serta yang berhubungan dengan proses hukum pidana ataupun perdata", 0, 'L', 0, 1); //end of line

//make a dummy empty cell as a vertical spacer
$pdf->Cell(189, 24, '', 0, 1); //end of line
$pdf->SetFont('Times', '', 17);
$pdf->Cell(8, 5, '', 0, 0);
$pdf->Cell(0, 38, "Bandar Lampung, " . $row['tanggal'], 0, 0, 'R');

$pdf->Cell(189, 10, '', 0, 1); //end of line
$pdf->SetFont('Times', 'B', 10);
$path1 = '/Signature/signatureContoh/pernyataan/pernyataan_qr/';
$image1 = $row['qr_code'];
$fullPath1 = $path1 . $image1;
$pdf->Image($fullPath1, 30, 220, 45, 45);

$pdf->Cell(189, 2, '', 0, 1); //end of line
$pdf->SetFont('Times', '', 17);
$pdf->Cell(8, 4, '', 0, 0);
$pdf->Cell(0, 28, 'Ketua Pelaksana', 0, 1, 'R'); //end of line
$pdf->Cell(189, 10, '', 0, 1); //end of line

$pdf->SetFont('Times', 'B', 10);
$pdf->Cell(110, 4, '', 0, 0);
$path = '/Signature/signatureContoh/pernyataan/pernyataan_ttd/';
$image = $row['signature_pad'];
$fullPath = $path . $image;
// var_dump($fullPath);
$pdf->Image($fullPath, 120, 220, 90, 0, 'PNG');

$pdf->Cell(189, 10, '', 0, 1); //end of line
$pdf->SetFont('Times', '', 17);
$pdf->Cell(8, 4, '', 0, 0);
$pdf->Cell(0, 10, $row['nama_penandatangan'], 0, 1, 'R'); //end of line


$pdf->Output("Letter.pdf", "I");

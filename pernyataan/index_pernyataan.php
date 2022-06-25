<?php
include('koneksi.php');
?>
<!doctype html>
<html lang="en">

<head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <title>Bootstrap demo</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.0-beta1/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-0evHe/X+R7YkIZDRvuzKMRqM+OrBnVFBL6DOitfPri4tjfHxaWutUpFmBp4vmVor" crossorigin="anonymous">
</head>

<body>
    <div class="container">
        <nav class="navbar navbar-expand-lg navbar-dark bg-dark">
            <div class="container-fluid">
                <a class="navbar-brand" href="#">DigSign</a>
                <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarNav" aria-controls="navbarNav" aria-expanded="false" aria-label="Toggle navigation">
                    <span class="navbar-toggler-icon"></span>
                </button>
                <div class="collapse navbar-collapse" id="navbarNav">
                    <ul class="navbar-nav">
                        <li class="nav-item dropdown">
                            <a class="nav-link active dropdown-toggle" href="#" id="navbarDropdown" role="button" data-bs-toggle="dropdown" aria-expanded="false">
                                Home
                            </a>
                            <ul class="dropdown-menu" aria-labelledby="navbarDropdown">
                                <li><a class="dropdown-item" href="/">Activity</a></li>
                                <li>
                                    <hr class="dropdown-divider">
                                </li>
                                <li><a class="dropdown-item" href="pernyataan/index_pernyataan.php">Letter</a></li>
                            </ul>
                        </li>
                        <!-- <li class="nav-item">
                            <a class="nav-link active" aria-current="page" href="index.php">Home</a>
                        </li> -->
                        <li class="nav-item">
                            <a class="nav-link active" href="letter_pernyataan.php">Print</a>
                        </li>
                        <li class="nav-item">
                            <a class="nav-link active" href="check_pernyataan.php">Check</a>
                        </li>
                    </ul>
                </div>
            </div>
        </nav>
        <?php $query = mysqli_query($conn, "SELECT * FROM pernyataan_kegiatan");
        ?>
        <div class="row">
            <?php while ($row = mysqli_fetch_array($query)) { ?>
                <div class="col-sm-4">
                    <div class="card mt-4">
                        <img src="background.jpg" style="width: 15rem;" class="card-img-top" alt="...">
                        <div class="card-body">
                            <h6 class="card-text text-end"><?php if ($row['status'] == 1) {
                                                                echo "Waiting";
                                                            } else {
                                                                echo "Verfied";
                                                            } ?></h6>
                            <h5 class="card-title"><?php echo ($row['keterangan']); ?></h5>
                            <a href="form_pernyataan.php?id_pernyataan_kegiatan=<?= ($row['id_pernyataan_kegiatan']); ?>" class="btn btn-primary">Authentication</a>
                        </div>
                    </div>
                </div>
            <?php } ?>
        </div>
    </div>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.0-beta1/dist/js/bootstrap.bundle.min.js" integrity="sha384-pprn3073KE6tl6bjs2QrFaJGz5/SUsLqktiwsUTF55Jfv3qYSDhgCecCxMW52nD2" crossorigin="anonymous"></script>
</body>

</html>
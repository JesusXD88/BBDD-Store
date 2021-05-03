<?php
    include('Conexion.php');
    $arr = array("0","1","2","3","4");
    $total = array();
    for ($i = 0; $i < 5; $i++) {
        $query = mysqli_query($mysqli, "select Secciones.Nombre from Secciones where Secciones.idSeccion='$arr[$i]'");
        $result = mysqli_fetch_row($query);
        $total [$i] = $result;
    }
?>
<html>
<!doctype html>
<head>
	<title> Catalogo </title>
	<link rel="stylesheet" type="text/css" href="../css/designcatalogo.css">
</head>
<body>
<div class="header">
    <h1> Cat&aacute;logo </h1>
</div>
<div class="row">
  <div class="col-3 col-s-3 menu">
    <p class ="cat"> Secciones </p>
    <ul>
        <li>
            <?php
                echo $total[0][0];
            ?>
            <div class="subnav-content">
                <br>
                <a href="catalogo.php" class="lnk">
                    <?php
                            echo $total[0][0];
                    ?>
                </a>
                <br>
                <br>
            </div>
        </li>
        <li>
            <?php
                echo $total[1][0];
            ?>
        </li>
        <li>
            <?php
                echo $total[2][0];
            ?>
        </li>
        <li>
            <?php
                echo $total[3][0];
            ?>
        </li>
        <li>
            <?php
                echo $total[4][0];
            ?>
        </li>
    </ul>
  </div>

  <div class="col-6 col-s-9">
    <h1>The City</h1>
    <p>Chania is the capital of the Chania region on the island of Crete. The city can be divided in two parts, the old town and the modern city.</p>
  </div>
</body>
</html>

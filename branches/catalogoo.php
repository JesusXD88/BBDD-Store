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
	<h1> Catalogo </h1>
	<br>
	<br>
	<br>
</head>
<body>
	<div class="flex-container">
        <div class="Cajitas">
            <p> Categor&iacute;as </p>
        </div>
        <div class="Cajitas">
            <?php
                    echo $total[0][0];
                ?>
        </div>
        <div class="Cajitas">
            <?php
                    echo $total[1][0];
                ?>  
        </div>
        <div class="Cajitas">
            <?php
                    echo $total[2][0];
                ?>
        </div>
        <div class="Cajitas">
            <?php
                    echo $total[3][0];
                ?>
        </div>
        <div class="Cajitas">
            <?php
                    echo $total[4][0];
                ?>
        </div>
    </div>
</body>
</html>

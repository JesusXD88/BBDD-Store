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
<!doctype html>
<html>
<head>
    <title> BBDD Store </title>
	<link rel="stylesheet" type="text/css" href="../css/designdashboard.css"/>
	<h1> BBDD Store </h1>
</head>
<body>
    <nav>
		<ul class="menubar">
			<li class="menu">
                <a class="links"> Cat&aacute;logo </a>
                <div class="subnav-content">
                    <br>
                    <a href="#company" class="lnk">
                        <?php
                            echo $total[0][0];
                        ?>
                    </a>
                    <br>
                    <br>
                    <a href="#team">
                    <?php
                            echo $total[1][0];
                        ?>
                    </a>
                    <br>
                    <br>
                    <a href="#careers">
                    <?php
                            echo $total[2][0];
                        ?>
                    </a>
                    <br>
                    <br>
                     <a href="#careers">
                    <?php
                            echo $total[3][0];
                        ?>
                    </a>
                    <br>
                    <br>
                     <a href="#careers">
                    <?php
                            echo $total[4][0];
                        ?>
                    </a>
                    <br>
                    <br>
                </div>
			</li>
            <li class="menu">
				<a href="Rock.html" target="new" class="links"> Mi Carrito </a>
			</li>
			<li class="menu">
				<a href="musica_electronica.html" target="new" class="links"> Favoritos </a>
			</li>
			<li class="menu">
				<a href="logout.php" class="links" id="id3"> Cerrar Sesi&oacute;n </a>
            </li>
		</ul>
	</nav>
    <br>
        <br>
        <br>
        <br>
        <br>
	<div class="fondo">
		<p id="id1"> Selecciona una entrada para acceder a ella. <br><br>
		En cat&aacute;logo podras examinar las secciones de los art&iacute;culos de la tienda, as&iacute; como las subcategorias en las que se dividen. 
		En cada categoria podr&aacute; encontrar una lista con los productos adquiridos. Además podrás gestionar los productos que añadiste al carrito o a favoritos.<br><br> Una vez que tengas claro lo que quieres comprar, procede a comprarlos dentro del carrito.
		</p>
	</div>
</body>

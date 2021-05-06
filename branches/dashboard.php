<!--
	BBDD-Store
    Copyright (C) 2021  JesusXD88
    This program is free software: you can redistribute it and/or modify
    it under the terms of the GNU General Public License as published by
    the Free Software Foundation, either version 3 of the License, or
    (at your option) any later version.
    This program is distributed in the hope that it will be useful,
    but WITHOUT ANY WARRANTY; without even the implied warranty of
    MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
    GNU General Public License for more details.
    You should have received a copy of the GNU General Public License
    along with this program.  If not, see <https://www.gnu.org/licenses/>.
-->

<?php
    include('conexion.php');
    $login = $_GET['login'];
    $arr = array("0","1","2","3","4");
    $total = array();
    /*for ($i = 0; $i < 5; $i++) {
        $query = mysqli_query($mysqli, "select Secciones.Nombre from Secciones where Secciones.idSeccion='$arr[$i]'");
        $result = mysqli_fetch_row($query);
        $total [$i] = $result;
    }*/
    $query = mysqli_query($mysqli, "select Secciones.Nombre from Secciones");
    $i = 0;
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
                <a href="catalogo.php?login=<?php echo $login?>" class="links"> Cat&aacute;logo </a>
                <div class="subnav-content">
                    <br>
                    <?php
                        while ($row = mysqli_fetch_object($query)) {
                            echo ' <a href="catalogo.php" class="lnk"> ';  printf("%s", $row->Nombre);
                            echo ' </a> ';
                            echo ' <br> <br> ';
                        }         
                    ?>
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

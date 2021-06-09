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
    $username = $_GET['username'];
    $total = array();
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
                <a href="catalogo.php?username=<?php echo $username?>&categoria=1" class="links" target="new"> Cat&aacute;logo </a>
			</li>
            <li class="menu">
				<a href="carrito.php?username=<?php echo $username?>" target="new" class="links"> Mi Carrito </a>
			</li>
			<li class="menu">
				<a href="favoritos.php?username=<?php echo $username?>" target="new" class="links"> Favoritos </a>
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

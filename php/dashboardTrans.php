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
    $staff = $_GET['staff'];
    $total = array();
    $query = mysqli_query($mysqli, "select Secciones.Nombre from Secciones");
    $i = 0;
?>
<!doctype html>
<html>
<head>
    <title> TransManager </title>
	<link rel="stylesheet" type="text/css" href="../css/designdashboardtrans.css"/>
	<h1> TransManager </h1>
</head>
<body>
    <nav>
		<ul class="menubar">
			<li class="menu">
                <a href="visualizarCompras.php?staff=<?php echo $staff?>" class="links" target="new"> Visualizar Compras </a>
			</li>
			<li class="menu">
				<a href="logoutTrans.php" class="links" id="id3"> Cerrar Sesi&oacute;n </a>
            </li>
		</ul>
	</nav>
    <br>
        <br>
        <br>
        <br>
        <br>
	<div class="fondo">
		<p id="id1"> Selecciona Visualizar Compras para ver las compras que te han sido asinadas. <br><br>
		All&aacute; podr&aacute;s ver su estado y darlas por enviadas o finalizadas seg&uacute;n corresponda.<br><br> Adem&aacute;s, tambi&eacute;n podr&aacute;s mandarle mensajes a dichas compras.
		</p>
	</div>
</body>

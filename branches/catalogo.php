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
    $arr = array("0","1","2","3","4");
    $total = array();
    $query = mysqli_query($mysqli, "select * from Secciones");
    /*for ($i = 0; $i < 5; $i++) {
        
        $result = mysqli_fetch_row($query);
        $total [$i] = $result;
    }*/
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
    <p class ="cat"> Secciones y <br> Categorias </p>
    <ul>
        <?php
            while ($row = mysqli_fetch_object($query)) {
                echo ' <li> ';
                printf("%s", $row->Nombre);
                echo ' <br> <br> ';
                $query2 = mysqli_query($mysqli, "select Categorias.Nombre from Categorias where Secciones_idSeccion = '$row->idSeccion'");
                echo ' <div class="subnav-content"> ';
                while ($row2 = mysqli_fetch_object($query2)) {
                    echo ' <a href="catalogo.php" class="lnk"> '; 
                    printf("%s", $row2->Nombre);
                    echo ' </a> ';
                }
                echo ' </div> ';
                echo ' </li> ';
            }         
        ?>
    </ul>
  </div>

  <div class="col-6 col-s-9">
    <h1>The City</h1>
    <p>Chania is the capital of the Chania region on the island of Crete. The city can be divided in two parts, the old town and the modern city.</p>
  </div>
</body>
</html>

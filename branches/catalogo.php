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
    $categoria = $_GET['categoria'];
    $total = array();
    $query = mysqli_query($mysqli, "select * from Secciones");
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
    <p class ="cat"> Secciones y <br> Categor&iacute;as </p>
    <ul>
        <?php
            while ($row = mysqli_fetch_object($query)) {
                echo ' <li> ';
                printf("%s", $row->Nombre);
                echo ' <br> <br> ';
                $query2 = mysqli_query($mysqli, "select * from Categorias where Secciones_idSeccion = '$row->idSeccion'");
                echo ' <div class="subnav-content"> ';
                while ($row2 = mysqli_fetch_object($query2)) {
                    echo ' <a href="catalogo.php?username=';
                    echo $username;
                    echo '&categoria=';
                    printf("%d", $row2->idCategoria);
                    echo '" class="lnk"> '; 
                    printf("%s", $row2->Nombre);
                    echo ' </a> ';
                }
                echo ' </div> ';
                echo ' </li> ';
            }         
        ?>
    </ul>
  </div>

  <div class="col-6 col-s-9 co">
    <h1 class="cate">Productos</h1>
    <p class="cate2"> 
     Selecciona una categoría y a continuación se mostrar&aacute;n sus productos </p>
     <br>
    <p class="cate">&emsp;&emsp;Categor&iacute;a: 
        <?php 
                $query4 = mysqli_query($mysqli, "select Nombre from Categorias where idCategoria = $categoria");
                $row4 = mysqli_fetch_object($query4);
                printf("%s", $row4->Nombre);
        ?> 
    </p>
    <table class="tabla">
        <tr>
            <th> Nombre </th>
            <th> Descripcion </th>
            <th> Precio </th>
            <th> Fabricante </th>
            <th> </th>
            <th> </th>
        </tr>
        <?php
            $query3 = mysqli_query($mysqli, "select * from Productos where Categorias_idCategoria=$categoria");
            while ($row3 = mysqli_fetch_object($query3)) {
                echo '<tr>';
                echo '<td>';
                printf("%s", $row3->Nombre);
                echo '</td>';
                echo '<td>';
                printf("%s", $row3->Descripcion);
                echo '</td>';
                echo '<td>';
                printf("%d€", $row3->Precio);
                echo '</td>';
                echo '<td>';
                printf("%s", $row3->Fabricante);
                echo '</td>';
                echo '<td>';
                echo '<form action="https://www.w3docs.com/" class="fo">
                        <button>
                            <img src="../media/images/cart-plus.png"/>
                        </button>
                     </form>';
                echo '&emsp;';
                echo '</td>';
                echo '<td>';
                 echo '<form action="https://www.w3docs.com/" class="fo2">
                        <button>
                            <img src="../media/images/star-circle.png"/>
                        </button>
                     </form>';
                echo '</td>';
                echo '</tr>';
            }
        ?>
    </table>
  </div>
</div>
</body>
</html>

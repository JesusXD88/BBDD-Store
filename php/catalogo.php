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
    <h1>
        <img src="../media/images/magnify.png" class="cata" /> 
        Cat&aacute;logo
    </h1>
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
     Selecciona una categoría y a continuación se mostrar&aacute;n sus productos. <br> Para a&ntilde;adir al carrito, introduce una cantidad y pulsa a a&ntilde;adir al carrito.</p>
     <br>
    <p class="cate3">&emsp;&emsp;Categor&iacute;a: 
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
            <th> Cantidad </th>
            <th> A&ntilde;adir al Carrito </th>
            <th> A&ntilde;adir a Favoritos </th>
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
                echo "<td>";
                echo "<form action='addCarrito.php'>
                        <input type='text' name='cantidad' class='in'>";
                echo "</td>";
                echo '<td class ="carr">';
                echo "<input type='hidden' name='username' value=$username>
                        <input type='hidden' name='producto' value=$row3->Codigo>
                        <button type='submit' class='fo'>
                            <img src='../media/images/cart-plus.png'/>
                        </button>
                     </form>";
                echo '</td>';
                echo '<td class ="carr">';
                echo "<form action='addFav.php' class='fo2'>";
                echo " 
                        <input type='hidden' name='username' value=$username>
                        <input type='hidden' name='producto' value=$row3->Codigo>
                        <button>
                            <img src='../media/images/star-circle.png'/>
                        </button>
                     </form>";
                echo '</td>';
                echo '</tr>';
            }
        ?>
    </table>
  </div>
</div>
<div>
    <br>
    <br>
    <footer>
        <ul class="ulu">
            <li class="uli">
                <form action='dashboard.php'>
                    <input type='hidden' name='username' value=<?php echo $username?>>
                    <button class="button button1">
                        <img src="../media/images/home-circle-outline.png" class="im" />
                        Volver al Dashboard
                    </button>
                </form>
            </li>
            <li class="uli">
                <form action='carrito.php'>
                    <input type='hidden' name='username' value=<?php echo $username?>>
                    <button class="button button2">
                        <img src="../media/images/cart.png" class="im" />
                        Ir al Carrito
                    </button>
                </form>
            </li>
            <li class="uli">
                <form action='favoritos.php'>
                    <input type='hidden' name='username' value=<?php echo $username?>>
                    <button class="button button3">
                        <img src="../media/images/star-circle-outline.png" class="im" />
                        Ir a Favoritos
                    </button>
                </form>
            </li>
        </ul>
    </footer> 
</div>
</body>
</html>

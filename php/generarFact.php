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
    $username = $_GET['username'];
    $confirmacionFact = $_GET['confirmacionFact'];
    $nombre = $_GET['prodNombre'];
    $descripcion = $_GET['descripcion'];
    $fabricante = $_GET['fabricante'];
    $precio = $_GET['precio'];
    $cantidad = $_GET['cantidad'];
    $transportista = $_GET['transportista'];
    $direccionCa = $_GET['direccionCa'];
    $direccionN = $_GET['direccionN'];
    $direccionCi = $_GET['direccionCi'];
    $totalPagado = $_GET['precioTotal'];
    
    
    if ($confirmacionFact == "true") {
        $cabezera = "-----------Factura tienda BBDD-Store-----------<br><br>";
        echo $cabezera;
        $tabla = "<table><tr><th></th><th></th></tr>";
        echo $tabla;
        $producto = "<tr><td>Producto:&emsp;&emsp;</td><td>$nombre</td></tr><tr><td>Descripcion:&emsp;&emsp;</td><td>$descripcion</td></tr><tr><td>Fabricante:&emsp;&emsp;</td><td>$fabricante</td></tr><tr><td>Precio:&emsp;&emsp;</td><td>$precio €</td></tr><tr><td>Cantidad:&emsp;&emsp;</td><td>$cantidad</td></tr><tr><td>Transportista:&emsp;&emsp;</td><td>$transportista</td></tr>";
        echo $producto;
        $userdata = "<tr><td>Cliente:&emsp;&emsp;</td><td>$username</td></tr><tr><td>Dirección de envío:&emsp;&emsp;</td><td>$direccionCa $direccionN, $direccionCi</td></tr>";
        echo $userdata;
        $tablac = "</table><br>";
        echo $tablac;
        $totalCompra = "------------------Total A Pagar------------------<br><br><table><tr><td>PvP:&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;</td><td>$totalPagado €</td></tr></table>";
        echo $totalCompra;
        echo "<script>
                window.open('carrito.php?username=$username', '_newtab')
                </script>
            ";
    } else {
        header("Location:carrito.php?username=$username");
    }
?>    
    
    
    

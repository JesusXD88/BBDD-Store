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
        $producto = "Producto:&emsp;&emsp;&emsp;&emsp;&emsp;$nombre<br>Descripcion:&emsp;&emsp;&emsp;&emsp;&emsp;$descripcion<br>Fabricante:&emsp;&emsp;&emsp;&emsp;&emsp;$fabricante<br>Precio:&emsp;&emsp;&emsp;&emsp;&emsp;$precio €<br>Cantidad:&emsp;&emsp;&emsp;&emsp;&emsp;$cantidad<br><br>Transportista:&emsp;&emsp;&emsp;&emsp;&emsp;$transportista<br><br>";
        echo $producto;
        $userdata = "Cliente:&emsp;&emsp;&emsp;&emsp;&emsp;$username<br><br>Dirección de envío:&emsp;&emsp;&emsp;&emsp;&emsp;$direccionCa $direccionN, $direccionCi<br><br>";
        echo $userdata;
        $totalCompra = "------------------Total A Pagar------------------<br><br>PvP:&emsp;&emsp;&emsp;&emsp;&emsp;$totalPagado €";
        echo $totalCompra;
        echo "<script>
                window.open('carrito.php?username=$username', '_newtab')
                </script>
            ";
    } else {
        header("Location:carrito.php?username=$username");
    }
?>    
    
    
    

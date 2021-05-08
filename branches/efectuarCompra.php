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
    $producto = $_GET['producto'];
    $cantidad = $_GET['cantidad'];
    $direccion = $_GET['direccion'];
    $transporte = $_GET['transporte'];
    $confirmacion = $_GET['confirmacion'];
    
    $query = mysqli_query($mysqli, "select * from Compras");
    $numCompras = mysqli_affected_rows($mysqli);
    $nextIdCompra = $numCompras + 1;
    if (is_null($confirmacion)) {
        echo "<form action='efectuarCompra.php'>
            <input type='hidden' name='confirmacion' id='conf'>
            <input type='hidden' name='username' value='$username'>
            <input type='hidden' name='producto' value=$producto>
            <input type='hidden' name='cantidad' value=$cantidad>
            <input type='hidden' name='direccion' value=$direccion>
            <input type='hidden' name='transporte' value='$transporte'>
            </input>
            </form>
            <script>
                var confirmar = confirm('¿Desea efectuar la compra?');
                document.getElementById('conf').value = confirmar;
                document.getElementsByTagName('form')[0].submit();
            </script>
            ";
    }
    if ($confirmacion == 'true') {
        $fechaRealizacion = date("Y-m-d");
        $fechaEnvio = date('Y-m-d', strtotime( '+'.mt_rand(0,60).' days'));
        $fechaRecepcion = date('Y-m-d', strtotime( '+'.mt_rand(0,60).' days'));
        $query2 = mysqli_query($mysqli, "select * from Productos where Codigo=$producto");
        $row = mysqli_fetch_object($query2);
        $prod_precio = $row->Precio;
        $totalCompra = $prod_precio * $cantidad;
        $estado = 'pendientes';
        $query3 = mysqli_query($mysqli, "insert into Compras values($nextIdCompra, '$fechaRealizacion', $totalCompra, '$fechaEnvio', '$fechaRecepcion', '$estado', '$username', '$transporte', $direccion)");
        $seHaInsertadoCompra = mysqli_affected_rows($mysqli);
        if($seHaInsertadoCompra == 1) {
            $estadoDevolucion = array('Sin devolver','Pendiente de devolver','Ya ha sido devuelto');
            shuffle($estadoDevolucion);
            $query4 = mysqli_query($mysqli, "insert into `Productos de la Compra` values ($cantidad, '$estadoDevolucion[0]', $nextIdCompra, $producto)");
            $seHaInsertadoProdCompra = mysqli_affected_rows($mysqli);
            if ($seHaInsertadoProdCompra == 1) {
                $query5 = mysqli_query($mysqli, "delete from `Productos del Carrito` where Cliente_Login='$username' and Productos_Codigo=$producto");
                echo "<form action='generarFact.php'>
                            <input type='hidden' name='confirmacionFact' id='conf'>
                            <input type='hidden' name='username' value='$username'>
                            <input type='hidden' name='prodNombre' value='$row->Nombre'>
                            <input type='hidden' name='descripcion' value=$row->Descripcion>
                            <input type='hidden' name='fabricante' value=$row->Fabricante>
                            <input type='hidden' name='precio' value=$row->Precio>
                            <input type='hidden' name='cantidad' value=$cantidad>
                            <input type='hidden' name='direccion' value=$direccion>
                            <input type='hidden' name='transportista' value='$transporte'>
                            <input type='hidden' name='precioTotal' value=$totalCompra>
                        </input>
                    </form>
                    <script>
                        var confirmar = confirm('¿Desea generar una factura?');
                        document.getElementById('conf').value = confirmar;
                        document.getElementsByTagName('form')[0].submit();
                    </script>
                ";
            } else {
                echo "
                <script>
                    alert('No se ha podido realizar la compra. Por favor, realiza algún cambio en tu compra e inténtalo de nuevo');
                    window.location.href='carrito.php?username=$username';
                </script>
                ";
            }
        } else {
             echo "
                <script>
                    alert('No se ha podido realizar la compra.Por favor, realiza algún cambio en tu compra e inténtalo de nuevo');
                    window.location.href='carrito.php?username=$username';
                </script>
                ";
        }
    } else {
        echo "<script> window.location.href='carrito.php?username=$username'; </script>";
    }
?>

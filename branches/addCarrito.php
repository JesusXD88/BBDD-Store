<?php
    include('conexion.php');
    //include('catalogo.php');
    $username = $_GET['username'];
    $producto = $_GET['producto'];
    $cantidad = $_GET['cantidad'];
    $query = mysqli_query($mysqli, "select * from Productos where Codigo=$producto");
    $row = mysqli_fetch_object($query);
    $queryI = mysqli_query($mysqli, "insert into `Productos del Carrito` values($cantidad,'$username',$producto)");
    if (mysqli_affected_rows($mysqli) == 1) {
        echo "
                <script>
                    alert('¡Se ha añadido correctamente!');
                    var url = 'catalogo.php?username=$username&categoria=$row->Categorias_idCategoria'
                    window.location.href=url;
                </script>
                ";
    } else {
        echo "
                <script>
                    alert('¡No se ha podido añadir, probablemente ya haya sido añadido!');
                    var url = 'catalogo.php?username=$username&categoria=$row->Categorias_idCategoria'
                    window.location.href=url;
                </script>
                ";
    }
?>

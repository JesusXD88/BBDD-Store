<?php
    include('Conexion.php');
    if (isset($_POST['login']) == TRUE) {
        $username = $_POST['username'];
        $password = $_POST['password'];
        $query = mysqli_query($mysqli, "SELECT * FROM Cliente WHERE Login='$username' and Password='$password'");
        $result = mysqli_fetch_array($query, MYSQLI_ASSOC);
        $num_rows = mysqli_num_rows($result);
        if ($num_rows != 1) {
            session_register("myusername");
            $_SESSION['login_user'] = $username;
            echo '<p class="error">El usuario o la contraseña introducida no es válida</p>';
        } else {
            echo '<p class="success">¡Se ha iniciado sesión correctamente!</p>';
            header("location:branches/jesussify.html");
        }
    }
?>

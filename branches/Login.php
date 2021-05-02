<?php
    include('Conexion.php');
    if (isset($_POST['login'])) {
        $username = $_POST['username'];
        $password = $_POST['password'];
        $query = mysqli_query($mysqli, "SELECT * FROM Cliente WHERE Login='$username' and Password='$password'");
        $result = mysqli_fetch_array($query);  
        $query_is_null = is_null($result);
        if (($result['Login'] != $username && $result['Password'] != $password) || $query_is_null == 1) {
            echo '
                <script>
                    alert("El usuario o la contraseña introducida no es válida");
                    window.location.href="../index.php";
                </script>
                ';
            die();
        } else {
            #session_register("myusername");
            $_SESSION['login_user'] = $username;
            echo '
                <script>
                    alert("¡Se ha iniciado sesión correctamente!");
                    window.location.href="dashboard.php";
                </script>
                ';
            die();
        }
    }
?>

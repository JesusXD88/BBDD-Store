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
                    var user = ' . json_encode($username) . ';
                    alert("¡" + user + ", has iniciado sesión correctamente!");
                    var url = "dashboard.php?login=" + user
                    window.location.href=url;
                </script>
                ';
            die();
        }
    }
?>

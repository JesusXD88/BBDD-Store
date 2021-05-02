<?php
    session_start();
    if(session_destroy()) {
        echo '
            <script>
            alert("¡Se acaba de cerrar la sesión!");
            window.location.href="../index.php";
            </script>
        ';
    }
?>

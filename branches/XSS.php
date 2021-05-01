<?php
if( $_GET["name"] || $_GET["age"] ) {
		echo "Welcome", $_GET['name'], "<br />";
		echo "You are ", $_GET['age'], " years old.";
		exit();
}
?>
<html>
	<head>
		<title> Prueba de XSS </title>
		<script type="text/javascript">
			alert("Esto esta todavia incompleto, ya que se necesita montar un PHP server")
		</script>
		<style type="text/css">
			h1 {
				font-family: Impact, sans-serif;
				color:Red;
				font-size: 32px;
			}
		</style>
	</head>
	<body style="font-family: Arial ">
		<h1> Vamos a probar un ataque XSS!!! </h1>
		<p> Para hacer esta prueba, seguiremos el video de LiveOverflow : <a href="https://www.youtube.com/watch?v=Q2mGcbkX550" target="new"> What is PHP and why is XSS so common there? - web 0x02 </a>
		</p>
		<form action="<?php $_PHP_SELF ?>" method="GET">
			Name: <input type="text" name="name"/>
			Age: <input type="text" name="age" />
			<input type="submit" />
		</form>
	</body>
</html>
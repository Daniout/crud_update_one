<?php

session_start();
$host = "localhost"; /* equipo */
$user = "id20628631_dani"; /* usuario */
$password = "Mamahuevo13-"; /* clave */
$dbname = "id20628631_test"; /* base de datos */

$con = mysqli_connect($host, $user, $password,$dbname);

if (!$con) {
  die("Connection failed: " . mysqli_connect_error());
}
//echo "Conexion Exitosa";

?>


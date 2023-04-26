<?php
header('Access-Control-Allow-Origin: *');
header("Access-Control-Allow-Methods: HEAD, GET, POST, PUT, PATCH, DELETE, OPTIONS");
header("Access-Control-Allow-Headers: X-API-KEY, Origin, X-Requested-With, Content-Type, Accept, Access-Control-Request-Method,Access-Control-Request-Headers, Authorization");
header('Content-Type: application/json');
$method = $_SERVER['REQUEST_METHOD'];
if ($method == "OPTIONS") {
header('Access-Control-Allow-Origin: *');
header("Access-Control-Allow-Headers: X-API-KEY, Origin, X-Requested-With, Content-Type, Accept, Access-Control-Request-Method,Access-Control-Request-Headers, Authorization");
header("HTTP/1.1 200 OK");
die();
}


    require "config.php";

    
     if( isset($_POST['foto']) and isset($_POST['nombre']) and isset
        ($_POST['apellido']) and isset($_POST['programa']) and isset($_POST['iduser']) ) {
         
         $foto=$_POST['foto'];
         $nombre=$_POST['nombre'];
         $apellido=$_POST['apellido'];
         $programa=$_POST['programa'];
         $iduser=$_POST['iduser'];
         
       $sql = "INSERT INTO Student (id,foto,nombre,apellido,programa,iduser) VALUES (default,'$foto', '$nombre', '$apellido', '$programa', '$iduser')";
    

    if (mysqli_query($con, $sql)) {
         $clientes[] = array('mensaje'=> "Estudiante Almacenado");
  } else {
       $clientes[] = array('mensaje'=> "Estudiante no Almacenado");
  }
     }else{
          $clientes[] = array('mensaje'=> "Estudiante no Almacenado");
     }
     

    
   
$json_string = json_encode($clientes);
echo $json_string;
?>
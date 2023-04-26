import 'package:crud_http/domain/controller/controllerStudent.dart';
import 'package:crud_http/domain/controller/controllerUser.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:http/http.dart';

class FormularioAgregarEstudiante extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    ControlUser conUser = Get.find();
    ControlStudent controlstu = Get.find();
    TextEditingController foto= TextEditingController();
    TextEditingController nombre = TextEditingController();
    TextEditingController apellido= TextEditingController();
    TextEditingController programa= TextEditingController();
    return Scaffold(
      appBar: AppBar(
        title: Text('Agregar Estudiante'),
        leading: IconButton(
        icon: Icon(Icons.arrow_back),
        onPressed: () {
          controlstu.getStudentGral().then((value) => Get.toNamed("/listaStudent"));
        },
      ),
      ),
      body: Padding(
        padding: EdgeInsets.all(16.0),
        child: Column(
          children: [
            TextFormField(
              controller: foto,
              decoration: InputDecoration(labelText: 'Foto'),
           
            ),
            TextFormField(
              controller: nombre,
              decoration: InputDecoration(labelText: 'Nombre'),
              
            ),
            TextFormField(
              controller: apellido,
              decoration: InputDecoration(labelText: 'Apellido'),
              
            ),
            TextFormField(
              controller: programa,
              decoration: InputDecoration(labelText: 'Programa'),
              
            ),
            SizedBox(height: 16.0),
            ElevatedButton(
              onPressed: () {
                          controlstu
                                .crearStudent(foto.text, nombre.text, apellido.text, programa.text, conUser.listaUserLogin![0].id)
                                .then((value) {
                              Get.snackbar(
                                  'Students', controlstu.listaMensajes![0].mensaje,
                                  duration: const Duration(seconds: 3),
                                  icon: const Icon(Icons.info),
                                  shouldIconPulse: true,
                                  backgroundColor: Colors.deepOrangeAccent);
                            });
              },
              child: Text('Agregar'),
            ),
          ],
        ),
      ),
    );
  }
}

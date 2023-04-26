import 'package:crud_http/domain/controller/controllerStudent.dart';
import 'package:crud_http/domain/controller/controllerUser.dart';
import 'package:crud_http/ui/content/students/ModifyStudent.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:http/http.dart';

import 'FormularioAgregarEstudiante.dart';

class ListStudent extends StatelessWidget {
  const ListStudent({super.key});

  

  void _agregarEstudiante(BuildContext context) {
  // Lógica para abrir el formulario de agregar estudiante
  Navigator.push(
    context,
    MaterialPageRoute(
      builder: (context) => FormularioAgregarEstudiante(),
    ),
  );
}

  @override
  Widget build(BuildContext context) {
    ControlStudent controle = Get.find();
    ControlUser controlu = Get.find();
    ControlStudent controlstu = Get.find();
    return Scaffold(
      appBar: AppBar(
        title: const Text("Lista de Estudiante"),
        actions: [
          IconButton(
            onPressed: () {
              _agregarEstudiante(context);
            },
            icon: Icon(Icons.add),
          ),
        ],
      ),
     body: ListView.builder(
      itemCount: controle.listaStudentGral!.length,
      itemBuilder: (BuildContext context, int index) {
        return GestureDetector(
          onLongPress: () {
            showDialog(
              context: context,
              builder: (BuildContext context) {
                return AlertDialog(
                  title: Text("Opciones"),
                  actions: [
                    TextButton(
                      child: Text("Modificar"),// Lógica para modificar el estudiante
                      onPressed: () {
                       Get.toNamed("/ModifyStudent");
                       
                      },
                    ),
                    TextButton(
                      child: Text("Eliminar"),// Lógica para eliminar el estudiante
                      onPressed: () {
                        controle
                        .deleteStudent(
                          controle.listaStudentGral![index].id
                        ).then((value) {
                          Get.snackbar(
                                'Estudiantes', controle.listaMensajes![0].mensaje,
                                duration: const Duration(seconds: 3),
                                icon: const Icon(Icons.info),
                                shouldIconPulse: true,
                                backgroundColor:Colors.orange);
                        }); 
                        Navigator.pop(context);
                      },
                    ),
                  ],
                );
              },
            );
          },
          child: ListTile(
            leading: CircleAvatar(
              backgroundImage:
                  NetworkImage(controle.listaStudentGral![index].foto),
            ),
            title: Text(
                "${controle.listaStudentGral![index].nombre} ${controle.listaStudentGral![index].apellido}"),
            subtitle: Text(controle.listaStudentGral![index].programa),
            trailing: (controle.listaStudentGral![index].idUser ==
                    controlu.listaUserLogin![0].id)

                ? IconButton(
                    onPressed: () {
                       Get.toNamed("/actualizarStudent",
                );},
                    icon: const Icon(Icons.settings))
                : const Text(""),
          ),
        );
      },
    ),
  );
  }}
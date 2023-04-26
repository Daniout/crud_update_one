import 'package:crud_http/data/services/peticionesStudent.dart';
import 'package:crud_http/domain/models/student.dart';
import 'package:get/get.dart';

import '../models/utiles.dart';

class ControlStudent extends GetxController {
  final Rxn<List<Mensajes>> _listarMensajes = Rxn<List<Mensajes>>([]);
  final Rxn<List<Student>> listaStudent = Rxn<List<Student>>([]);



  Future<void> getStudentGral() async {
    listaStudent.value = await PeticionesStudent.getListStudent();
  }

   Future<void> crearStudent(String foto, String nombre,String apellido, String programa, int idUser) async {
    _listarMensajes.value = (await PeticionesStudent.registrarStudent(foto,nombre,apellido,programa,idUser));
  }

  Future<void> deleteStudent(int id) async {
    _listarMensajes.value = await PeticionesStudent.deleteStudent(id);
  }

Future<void> modifyStudent(
    int id, String foto, String nombre, String apellido, String programa) async {
    _listarMensajes.value = await PeticionesStudent.modifyStudent(id, foto, nombre, apellido, programa);
}

  List<Mensajes>? get listaMensajes => _listarMensajes.value;
  List<Student>? get listaStudentGral => listaStudent.value;

}

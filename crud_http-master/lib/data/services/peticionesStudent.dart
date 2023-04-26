import 'dart:convert';

import 'package:crud_http/domain/models/student.dart';
import 'package:flutter/foundation.dart';

import 'package:http/http.dart' as http;

import '../../domain/models/utiles.dart';

class PeticionesStudent {
  static Future<List<Student>> getListStudent() async {
    var url = Uri.parse(
        "https://moviekaiser.000webhostapp.com/APItest/listaStudent.php");

    final response = await http.get(url);
    print(response.statusCode);
    print(response.body);
    return compute(convertirAlista, response.body);
  }

  static Future<List<Mensajes>> modifyStudent(
      int id, String foto, String nombre, String apellido, String programa) async {
    var url = Uri.parse(
        "https://moviekaiser.000webhostapp.com/APItest/ModifyStudent.php");

    final response = await http
        .post(url, body: {
          'id': id.toString(),
          'foto': foto, 
          'nombre': nombre, 
          'apellido': apellido, 
          'programa': programa});

    print(response.statusCode);
    print(response.body);
    return compute(convertirAlista2, response.body);
  }

  static List<Student> convertirAlista(String responsebody) {
    final pasar = json.decode(responsebody).cast<Map<String, dynamic>>();
    print(pasar);
    //print(pasar[0]['mensaje']);
    return pasar.map<Student>((json) => Student.desdeJson(json)).toList();
  }

  static Future<List<Mensajes>>deleteStudent(int id) async {
    var url = Uri.parse(
        "https://moviekaiser.000webhostapp.com/APItest/DeleteUser.php");

     final response = await http
        .post(url, body: {'id': id.toString()});

    return compute(convertirAlista2, response.body);
  }

  

   static List<Mensajes> convertirAlista2(String responsebody) {
    final pasar = json.decode(responsebody).cast<Map<String, dynamic>>();
    return pasar.map<Mensajes>((json) => Mensajes.desdeJson(json)).toList();
  }

  static Future<List<Mensajes>> registrarStudent(
      String foto, String nombre, String apellido, String programa, int idUser ) async {
    var url = Uri.parse(
        "https://moviekaiser.000webhostapp.com/APItest/agregarStudents.php");

    final response = await http
        .post(url, body: {'foto': foto, 'nombre': nombre, 'apellido': apellido, 'programa': programa, 
        'iduser': idUser.toString()});

    return compute(convertirAlista2, response.body);
  }
}

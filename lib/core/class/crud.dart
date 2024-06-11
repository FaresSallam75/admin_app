import 'dart:convert';
import 'dart:io';
import 'package:admin_app/core/function/checkinternet.dart';
import 'package:dartz/dartz.dart';
import 'package:http/http.dart' as http;
import 'package:path/path.dart';
import 'statusrequest.dart';

// ignore: prefer_interpolation_to_compose_strings
String _basicAuth = 'Basic ' + base64Encode(utf8.encode('fares:fares102030'));
Map<String, String> myheaders = {'authorization': _basicAuth};

class Crud {
  Future<Either<StatusRequest, Map>> postData(String linkurl, Map data) async {
    if (await checkInternet()) {
      try {
        var response = await http.post(Uri.parse(linkurl), body: data);
        if (response.statusCode == 200 || response.statusCode == 201) {
          Map responseBody = jsonDecode(response.body);
          print("From Crud ==========  $responseBody");
          return Right(responseBody);
        } else {
          return const Left(StatusRequest.serverfailure);
        }
      } catch (e) {
        print("Exception From Crud ========== $e");
        return const Left(StatusRequest.failure);
      }
    } else {
      return const Left(StatusRequest.offlinefailure);
    }
  }

  //using to send file
  postRequestWithFile(String url, Map data, File file) async {
    var request = http.MultipartRequest("post", Uri.parse(url));
    var length = await file.length();
    var stream = http.ByteStream(file.openRead());
    var multiPartFile = http.MultipartFile("file", stream, length,
        filename: basename(file.path));
    request.headers.addAll(myheaders);
    request.files.add(multiPartFile);
    data.forEach((key, value) {
      request.fields[key] = value;
    });
    var myRequest = await request.send();
    var response = await http.Response.fromStream(myRequest);
    if (response.statusCode == 200 || response.statusCode == 201) {
      print(response.body);
      Map responsebody = jsonDecode(response.body);
      return Right(responsebody);
    } else {
      return const Left(StatusRequest.serverfailure);
    }
  }

  //using to send file
  /* Future<Either<StatusRequest, Map>> addRequestWithImageOne(
      url, data, File? image,
      [String? namerequest]) async {
    if (namerequest == null) {
      namerequest = "files";
    }

    var uri = Uri.parse(url);
    var request = http.MultipartRequest("POST", uri);
    request.headers.addAll(myheaders);

    if (image != null) {
      var length = await image.length();
      var stream = http.ByteStream(image.openRead());
      stream.cast();
      var multipartFile = http.MultipartFile(namerequest, stream, length,
          filename: basename(image.path));
      request.files.add(multipartFile);
    }

    // add Data to request
    data.forEach((key, value) {
      request.fields[key] = value;
    });
    // add Data to request
    // Send Request
    var myrequest = await request.send();
    // For get Response Body
    var response = await http.Response.fromStream(myrequest);
    if (response.statusCode == 200 || response.statusCode == 201) {
      print(response.body);
      Map responsebody = jsonDecode(response.body);
      return Right(responsebody);
    } else {
      return const Left(StatusRequest.serverfailure);
    }
  }  */
}

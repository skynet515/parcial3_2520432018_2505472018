import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class Home extends StatefulWidget {
  Home({Key? key}) : super(key: key);

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  var employeeAppi = "https://reqres.in/api/users?page=2";
  List lstEmployee = [];

  @override
  Widget build(BuildContext context) {
    var ancho = MediaQuery.of(context).size.width;
    var alto = MediaQuery.of(context).size.height;

    return Scaffold(
      appBar: barra(),
      backgroundColor: Colors.white,
      body: Stack(
        children: [
          Positioned(
            top: 10,
            bottom: 0,
            width: ancho,
            child: Column(
              children: [
                lstEmployee.length != null
                    ? Expanded(
                        child: GridView.builder(
                            gridDelegate:
                                SliverGridDelegateWithFixedCrossAxisCount(
                                    crossAxisCount: 2, childAspectRatio: 1.4),
                            itemCount: lstEmployee.length,
                            itemBuilder: (context, index) {
                              return InkWell(
                                  child: Padding(
                                      padding: const EdgeInsets.symmetric(
                                          vertical: 4.0, horizontal: 8),
                                      child: Container(
                                        decoration: BoxDecoration(
                                            color:
                                                lstEmployee[index]['id'] % 2 ==
                                                        0
                                                    ? Colors.amber
                                                    : Colors.cyanAccent,
                                            borderRadius: BorderRadius.all(
                                                Radius.circular(20))),
                                        child: Stack(
                                          children: [
                                            Positioned(
                                                top: 10,
                                                left: 20,
                                                child: Text(
                                                  lstEmployee[index]
                                                      ['first_name'],
                                                  style: TextStyle(
                                                      fontWeight:
                                                          FontWeight.bold,
                                                      fontSize: 18,
                                                      color: lstEmployee[index]
                                                                      ['id'] %
                                                                  2 ==
                                                              0
                                                          ? Colors.white
                                                          : Colors.black),
                                                )),
                                            Positioned(
                                                top: 30,
                                                left: 20,
                                                child: Text(
                                                  lstEmployee[index]
                                                      ['last_name'],
                                                  style: TextStyle(
                                                      fontWeight:
                                                          FontWeight.bold,
                                                      fontSize: 18,
                                                      color: lstEmployee[index]
                                                                      ['id'] %
                                                                  2 ==
                                                              0
                                                          ? Colors.white
                                                          : Colors.black),
                                                )),
                                            Positioned(
                                                top: 100,
                                                left: 10,
                                                child: Text(
                                                  lstEmployee[index]['email'],
                                                  style: TextStyle(
                                                      fontWeight:
                                                          FontWeight.bold,
                                                      fontSize: 12,
                                                      color: lstEmployee[index]
                                                                      ['id'] %
                                                                  2 ==
                                                              0
                                                          ? Colors.white
                                                          : Colors.black),
                                                )),
                                            Positioned(
                                              right: 0,
                                              child: CachedNetworkImage(
                                                imageUrl: lstEmployee[index]
                                                    ['avatar'],
                                                height: 100,
                                                fit: BoxFit.fitHeight,
                                              ),
                                            ),
                                          ],
                                        ),
                                      )));
                            }))
                    : Center(
                        child: CircularProgressIndicator(),
                      )
              ],
            ),
          )
        ],
      ),
    );
  }

  barra() {
    return AppBar(
      backgroundColor: Colors.cyanAccent,
      elevation: 25,
      title: Row(
        children: [
          Column(
            children: [
              Container(
                child: Padding(
                  padding: const EdgeInsets.only(left: 10, right: 10),
                  child: Column(children: [
                    
                    Text(
                      "Rudy Ricardo Colocho Rodriguez 2520432018",
                      style: TextStyle(
                          fontSize: 15,
                          fontWeight: FontWeight.bold,
                          color: Colors.black),
                    ),
                    Text(
                      "Elizabeth Estefany Vasquez Ramirez 2505472018",
                      style: TextStyle(
                          fontSize: 15,
                          fontWeight: FontWeight.bold,
                          color: Colors.black),
                    ),
                    //Icon(Icons.list_outlined, color: negro,)
                  ]),
                ),
              ),
            ],
          ),
          SizedBox(
            width: 15,
          ),
          Column(
            children: [
              Container(
                  child: SizedBox(
                      height: 50, child: Image.asset('img/kesi.jpg')))
            ],
          )
        ],
      ),
    );
  }

  @override
  void initState() {
    super.initState();
    if (mounted) {
      dataEmployee();
    }
  }

  void dataEmployee() {
    Map<String, String> qParams = {'page': '1'};
    String dominio = 'reqres.in';
    String path = '/api/users';

    var url = Uri.https(dominio, path, qParams);

    http.get(url).then((value) {
      //print(value.statusCode);
      if (value.statusCode == 200) {
        var decodeJson = jsonDecode(value.body);
        lstEmployee = decodeJson['data'];
        print(url);
        setState(() {});
      }
    });
  }
}

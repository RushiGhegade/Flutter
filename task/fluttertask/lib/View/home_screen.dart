import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:fluttertask/View/show_information.dart';
import 'package:fluttertask/main.dart';
import 'package:fluttertask/model/ModelClass.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

import '../Apis/Api_operation.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  List<Modelclass> list = [];
  TextEditingController searchController = TextEditingController();
  bool dataget = false;

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    getList().then((v) {
      log("get data 1");
      dataget = true;
    });
  }

  Future<void> getList() async {
    list = Provider.of<MyData>(context).list;
  }

  Future<void> getData(String search) async {
    dataget = false;
    setState(() {});
    log("$search");
    List<Modelclass> data = await ApiOperation.getData(search);
    Provider.of<MyData>(context, listen: false).changeData(data);
    Future.delayed(Duration(seconds: 1), () {});
    await getList().then((v) {
      dataget = true;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromRGBO(237, 234, 234, 1),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "Home",
                style: GoogleFonts.montserrat(
                  // fontSize: 25,
                  fontSize: MediaQuery.of(context).size.width * 0.072,
                  fontWeight: FontWeight.bold,
                ),
              ),
              SizedBox(
                height: 15,
              ),
              SizedBox(
                height: 50,
                child: TextFormField(
                  controller: searchController,
                  onChanged: (search) {
                    getData(search);
                  },
                  decoration: InputDecoration(
                    hintText: "Search",
                    hintStyle: TextStyle(
                      fontSize: MediaQuery.of(context).size.width * 0.048,
                      color: const Color.fromARGB(255, 53, 51, 51),
                      fontWeight: FontWeight.w500,
                    ),
                    suffixIcon: (searchController.text.isEmpty)
                        ? Icon(
                            Icons.search,
                            size: MediaQuery.of(context).size.width * 0.058,
                            color: const Color.fromARGB(255, 53, 51, 51),
                          )
                        : GestureDetector(
                            onTap: () {
                              getData("action");
                              searchController.clear();
                            },
                            child: Icon(
                              Icons.close,
                              size: MediaQuery.of(context).size.width * 0.06,
                              color: const Color.fromARGB(255, 53, 51, 51),
                            ),
                          ),
                    enabledBorder: OutlineInputBorder(
                      borderSide: BorderSide(
                        width: 2,
                        color: const Color.fromARGB(255, 112, 109, 109),
                      ),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderSide: BorderSide(width: 2, color: Colors.grey),
                    ),
                  ),
                ),
              ),
              SizedBox(
                height: 20,
              ),
              (list.isNotEmpty)
                  ? Expanded(
                      child: ListView.builder(
                        itemCount: list.length,
                        itemBuilder: (context, index) {
                          return GestureDetector(
                            onTap: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) {
                                    return ShowInformation(
                                        selectMovie: list[index]);
                                  },
                                ),
                              );
                            },
                            child: Container(
                              margin: EdgeInsets.only(top: 8),
                              // height: 230,
                              height: MediaQuery.of(context).size.width * 0.5,
                              width: MediaQuery.of(context).size.width,
                              // color: Colors.white,
                              child: Stack(
                                children: [
                                  Positioned(
                                    top: 70,
                                    child: Container(
                                      // height: 150,
                                      height:
                                          MediaQuery.of(context).size.width *
                                              0.32,
                                      width: MediaQuery.of(context).size.width -
                                          18,
                                      decoration: BoxDecoration(
                                          color: Colors.white,
                                          borderRadius:
                                              BorderRadius.circular(10)),
                                      child: Row(
                                        children: [
                                          SizedBox(
                                            // width: 170,
                                            width: MediaQuery.of(context).size.width*0.41,
                                          ),
                                          Column(
                                            mainAxisAlignment:
                                                MainAxisAlignment.center,
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            children: [
                                              Text(
                                                (list[index].title.length < 18)
                                                    ? list[index].title
                                                    : list[index]
                                                        .title
                                                        .substring(0, 16),
                                                style: GoogleFonts.montserrat(
                                                  // fontSize: 21,
                                                  fontSize:MediaQuery.of(context).size.width * 0.053,
                                                  fontWeight: FontWeight.bold,
                                                ),
                                              ),
                                              SizedBox(
                                                height: 5,
                                              ),
                                              Text(
                                                list[index].type,
                                                style: GoogleFonts.montserrat(
                                                  // fontSize: 18,
                                                   fontSize:MediaQuery.of(context).size.width * 0.044,
                                                  fontWeight: FontWeight.w500,
                                                ),
                                              ),
                                              SizedBox(
                                                height: 8,
                                              ),
                                              Container(
                                                // height: 25,
                                                padding: EdgeInsets.all(1),
                                                height: MediaQuery.of(context).size.width * 0.057,
                                                width: 70,
                                                alignment: Alignment.center,
                                                decoration: BoxDecoration(
                                                  color: const Color.fromARGB(
                                                      255, 50, 240, 82),
                                                  borderRadius:
                                                      BorderRadius.circular(20),
                                                ),
                                                child: Text(
                                                  "7.5 IMDB",
                                                  style: TextStyle(
                                                    color: Colors.white,
                                                    fontSize: 15,
                                                    fontWeight: FontWeight.bold,
                                                  ),
                                                ),
                                              ),
                                            ],
                                          ),
                                          Spacer(),
                                        ],
                                      ),
                                    ),
                                  ),
                                  Positioned(
                                    left: 10,
                                    child: Container(
                                      // height: 190,
                                      height: MediaQuery.of(context).size.width * 0.45,
                                      // width: 150,
                                      width:  MediaQuery.of(context).size.width * 0.35,
                                      clipBehavior: Clip.antiAlias,
                                      decoration: BoxDecoration(
                                          color: Colors.grey,
                                          borderRadius:
                                              BorderRadius.circular(10)),
                                      child: Image.network(
                                        list[index].poster,
                                        fit: BoxFit.cover,
                                      ),
                                    ),
                                  )
                                ],
                              ),
                            ),
                          );
                        },
                      ),
                    )
                  : Expanded(
                      child: Center(
                        child: CircularProgressIndicator(),
                      ),
                    ),
            ],
          ),
        ),
      ),
    );
  }
}

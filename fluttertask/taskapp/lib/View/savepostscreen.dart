import 'dart:developer';

import 'package:share/share.dart';
import 'package:taskapp/Packages/packages.dart';
import 'package:taskapp/View/bottombar.dart';
import 'package:taskapp/modelclass/newsmodelclass.dart';

import '../main.dart';

class SaveScreen extends StatefulWidget {
  @override
  const SaveScreen({super.key});

  @override
  State createState() {
    return _SaveScreenState();
  }
}

List<Map<String, dynamic>> favorite = [];

List<Map<String, dynamic>> list = [];

class _SaveScreenState extends State {
  String firstHalf = "";
  String secondHalf = "";

  bool flag = true;

  late Future<List<Event>> events;

  String text = "";

  @override
  void initState() {
    super.initState();

    events = Api.news();
  }

  void _showPopupMenu(Offset offset, Event data, int index) async {
    double left = offset.dx;
    double top = offset.dy;
    return await showMenu(
      context: context,
      position: RelativeRect.fromLTRB(left, top, 0, 0),
      items: [
        const PopupMenuItem(
          value: 1,
          child: Text("save"),
        ),
        const PopupMenuItem(
          value: 2,
          child: Text("Unsave"),
        ),
        // const PopupMenuItem(
        //   value: 3,
        //   child: Text("Delete"),
        // ),
      ],
      elevation: 8.0,
    ).then((value) {
      // NOTE: even you didnt select item this method will be called with null of value so you should call your call back with checking if value is not null , value is the value given in PopupMenuItem
      if (value != null) {
        if (value == 1 || value == 2) {
          if (value == 1) {
            Snacks.mySnackBar(context, "Save Post", true);
            Provider.of<news>(context, listen: false).save.add(data);
            log("true");
          } else {
            log("false");
            Snacks.mySnackBar(context, "Unsave post", true);
            Provider.of<news>(context, listen: false)
                .save
                .removeWhere((element) => element.hashCode == data.hashCode);
          }
          // if (!Provider.of<news>(context, listen: false).save.contains(data)) {
          //   Provider.of<news>(context, listen: false).save.add(data);
          //   log("true");
          // } else {
          //   log("false");
          //   Provider.of<news>(context, listen: false)
          //       .save
          //       .removeWhere((element) => element.hashCode == data.hashCode);
          // }
          // log("${set}");
          log("${Provider.of<news>(context, listen: false).save}");
          setState(() {});
        }
        ;
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text(
          "DEMO APP",
          style: GoogleFonts.poppins(
            fontSize: 26,
            fontWeight: FontWeight.w500,
          ),
        ),
        leading: const Icon(
          Icons.menu,
          size: 28,
        ),
        actions: const [
          Icon(
            Icons.notifications_none,
            size: 29,
          ),
          SizedBox(
            width: 10,
          ),
        ],
      ),
      backgroundColor: const Color.fromRGBO(
          198, 196, 196, 1), //background: rgba(198, 196, 196, 1);
      body: (Provider.of<news>(context, listen: false).save.isNotEmpty)
          ? Column(
              children: [
                const SizedBox(
                  height: 5,
                ),
                Container(
                  height: 70,
                  width: MediaQuery.of(context).size.width,
                  color: Colors.white,
                  child: Row(
                    children: [
                      const SizedBox(
                        width: 10,
                      ),
                      SizedBox(
                        height: 55,
                        width: MediaQuery.of(context).size.width - 90,
                        child: TextFormField(
                          // controller: userNameController,
                          // key: userNamekey,
                          validator: (value) {
                            log("$value");
                            if (value!.isEmpty) {
                              return "Enter the Email";
                            } else {
                              return null;
                            }
                          },
                          decoration: InputDecoration(
                            hintText: "Search Messages",
                            hintStyle: const TextStyle(
                              fontSize: 19,
                              color: Color.fromRGBO(153, 162, 173, 1),
                            ),
                            contentPadding: const EdgeInsets.all(8),
                            prefixIcon: const Icon(
                              Icons.search,
                              size: 28,
                              color: Color.fromRGBO(153, 162, 173,
                                  1), //background: rgba(153, 162, 173, 1);
                            ),
                            filled: true,
                            fillColor: const Color.fromARGB(255, 206, 214,
                                221), //background: rgba(235, 242, 250, 1);
                            border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(15),
                                borderSide: BorderSide.none),
                          ),
                        ),
                      ),
                      const Spacer(),
                      Container(
                        height: 30,
                        width: 50,
                        decoration: const BoxDecoration(
                            image: DecorationImage(
                                fit: BoxFit.contain,
                                image:
                                    AssetImage("lib/Images/↳ Icon Color.png"))),
                      ),
                      const SizedBox(
                        width: 10,
                      ),
                      // Icon(Icons.ver)
                    ],
                  ),
                ),
                const SizedBox(
                  height: 8,
                ),
                Expanded(
                  child: ListView.builder(
                    shrinkWrap: true,
                    itemCount: Provider.of<news>(context)
                        .save
                        .length, //newsdata[0].data!.events.length,
                    itemBuilder: (context, index) {
                      text = Provider.of<news>(context)
                          .save
                          .elementAt(index)
                          .description;
                      if (text.length > 80) {
                        firstHalf = text.substring(0, 80);
                        secondHalf = text.substring(80, text.length);
                      } else {
                        firstHalf = text;
                        secondHalf = "";
                      }

                      return Container(
                        margin: const EdgeInsets.only(bottom: 15),
                        padding: const EdgeInsets.only(top: 10, bottom: 10),
                        // height: 160,
                        width: MediaQuery.of(context).size.width,
                        color: Colors.white,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Row(
                              children: [
                                const SizedBox(
                                  width: 10,
                                ),
                                Container(
                                  height: 50,
                                  width: 50,
                                  decoration: const BoxDecoration(
                                    image: DecorationImage(
                                        image: AssetImage("lib/Images/o0.png")),
                                    shape: BoxShape.circle,
                                    color: Colors.red,
                                  ),
                                ),
                                const SizedBox(
                                  width: 15,
                                ),
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    SizedBox(
                                      width: 250,
                                      child: Text(
                                        Provider.of<news>(context)
                                            .save
                                            .elementAt(index)
                                            .title,
                                        style: GoogleFonts.poppins(
                                          fontSize: 18,
                                          fontWeight: FontWeight.w600,
                                        ),
                                      ),
                                    ),
                                    Text(
                                      "Arneo ",
                                      style: GoogleFonts.poppins(
                                        fontSize: 15,
                                        fontWeight: FontWeight.w400,
                                      ),
                                    ),
                                  ],
                                ),
                                const Spacer(),
                                GestureDetector(
                                  onTapDown: (TapDownDetails details) {
                                    _showPopupMenu(
                                        details.globalPosition,
                                        Provider.of<news>(context,
                                                listen: false)
                                            .save
                                            .elementAt(index),
                                        index); // Api.news();
                                  },
                                  child: const Icon(
                                    Icons.more_horiz_outlined,
                                    size: 28,
                                  ),
                                ),
                                const Spacer(),
                              ],
                            ),
                            const SizedBox(
                              height: 10,
                            ),
                            Container(
                              height: 336,
                              width: MediaQuery.of(context).size.width,
                              decoration: BoxDecoration(
                                color: const Color.fromRGBO(198, 196, 196,
                                    1), //background: rgba(198, 196, 196, 1);
                                image: DecorationImage(
                                  fit: BoxFit.fill,
                                  image: NetworkImage(
                                    Provider.of<news>(context)
                                        .save
                                        .elementAt(index)
                                        .images[0],
                                  ),
                                ),
                              ),
                            ),
                            (secondHalf.length == 0)
                                ? Text(firstHalf)
                                : Padding(
                                    padding: const EdgeInsets.all(10),
                                    child: Column(
                                      children: <Widget>[
                                        Text(flag
                                            ? (firstHalf + "...")
                                            : (firstHalf + secondHalf)),
                                        InkWell(
                                          child: Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.end,
                                            children: <Widget>[
                                              Text(
                                                flag
                                                    ? "show more"
                                                    : "show less",
                                                style: const TextStyle(
                                                    color: Colors.blue),
                                              ),
                                            ],
                                          ),
                                          onTap: () {
                                            setState(() {
                                              flag = !flag;
                                            });
                                          },
                                        ),
                                      ],
                                    ),
                                  ),
                            Container(
                              height: 2,
                              width: MediaQuery.of(context).size.width,
                              color: const Color.fromRGBO(198, 196, 196,
                                  1), //background: rgba(198, 196, 196, 1);
                            ),
                            Container(
                              width: MediaQuery.of(context).size.width,
                              child: Column(
                                children: [
                                  const SizedBox(
                                    height: 5,
                                  ),
                                  Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceEvenly,
                                    children: [
                                      const SizedBox(
                                        width: 5,
                                      ),
                                      // IconButton(onPressed: (){}, icon:Icons.lik),
                                      GestureDetector(
                                        onTap: () {
                                          if (Provider.of<news>(context,
                                                  listen: false)
                                              .set
                                              .contains(Provider.of<news>(
                                                      context,
                                                      listen: false)
                                                  .save
                                                  .elementAt(index))) {
                                            Snacks.mySnackBar(
                                                context, "Like Remove", true);
                                            Provider.of<news>(context,
                                                    listen: false)
                                                .set
                                                .remove(Provider.of<news>(
                                                        context,
                                                        listen: false)
                                                    .save
                                                    .elementAt(index));
                                          } else {
                                            Snacks.mySnackBar(
                                                context, "Like Added", true);
                                            Provider.of<news>(context,
                                                    listen: false)
                                                .set
                                                .add(Provider.of<news>(context,
                                                        listen: false)
                                                    .save
                                                    .elementAt(index));
                                          }
                                          setState(() {});
                                        },
                                        child: SizedBox(
                                          height: 30,
                                          width: 25,
                                          child: Icon(
                                            Icons.thumb_up_alt,
                                            size: 28,
                                            color: (Provider.of<news>(context,
                                                        listen: false)
                                                    .set
                                                    .contains(Provider.of<news>(
                                                            context,
                                                            listen: false)
                                                        .save
                                                        .elementAt(index)))
                                                ? Colors.blue
                                                : const Color.fromRGBO(
                                                    153, 162, 173, 1),
                                          ),
                                        ),
                                      ),
                                      Text(
                                        (Provider.of<news>(context,
                                                    listen: false)
                                                .set
                                                .contains(Provider.of<news>(
                                                        context,
                                                        listen: false)
                                                    .save
                                                    .elementAt(index)))
                                            ? " 1 Like"
                                            : " 0 Like",
                                        style: GoogleFonts.poppins(
                                          color: const Color.fromARGB(
                                              255,
                                              77,
                                              78,
                                              80), //background: rgba(153, 162, 173, 1);
                                          fontSize: 21,
                                          fontWeight: FontWeight.w500,
                                        ),
                                      ),
                                      const SizedBox(
                                        width: 18,
                                      ),
                                      SizedBox(
                                          height: 27,
                                          width: 25,
                                          child: Image.asset(
                                            "lib/Images/Icon (15).png",
                                            fit: BoxFit.contain,
                                            color: const Color.fromARGB(
                                                255, 77, 78, 80),
                                          )),
                                      Text(
                                        " 0 Comment",
                                        style: GoogleFonts.poppins(
                                          color: const Color.fromARGB(
                                              255, 77, 78, 80),
                                          fontSize: 19,
                                          fontWeight: FontWeight.w500,
                                        ),
                                      ),
                                      const SizedBox(
                                        width: 18,
                                      ),
                                      GestureDetector(
                                        onTap: () {
                                          Share.share(
                                              "https://play.google.com/store/apps/details?id=com.instructivetech.testapp");
                                        },
                                        child: SizedBox(
                                            height: 30,
                                            width: 25,
                                            child: Image.asset(
                                              "lib/Images/Icon (14).png",
                                              fit: BoxFit.contain,
                                              color: const Color.fromARGB(
                                                  255, 77, 78, 80),
                                            )),
                                      ),
                                      Text(
                                        " Share",
                                        style: GoogleFonts.poppins(
                                          color: const Color.fromARGB(
                                              255, 77, 78, 80),
                                          fontSize: 21,
                                          fontWeight: FontWeight.w500,
                                        ),
                                      ),
                                      const SizedBox(
                                        width: 10,
                                      ),
                                    ],
                                  ),
                                  // const Spacer(),
                                ],
                              ),
                            ),
                          ],
                        ),
                      );
                    },
                  ),
                )
              ],
            )
          : const Center(
              child: Text(
                "No Save Post",
                style: TextStyle(fontSize: 31, color: Colors.black),
              ),
            ),
      bottomNavigationBar: BottomBar.getbar(context),
    );
  }
}

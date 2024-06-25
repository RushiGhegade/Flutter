import 'package:flutter/material.dart';
import 'package:musicapp/view/Screen2.dart';
import 'package:musicapp/view/Screen3.dart';
import 'package:musicapp/view/main.dart';
import 'package:provider/provider.dart';

class Screen4 extends StatefulWidget {
  const Screen4({super.key});

  @override
  State<Screen4> createState() => _Screen4State();
}

class _Screen4State extends State<Screen4> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        leading: GestureDetector(
          onTap: () {
            Navigator.push(context, MaterialPageRoute(
              builder: (context) {
                return const Screen3();
              },
            ));
          },
          child: const Icon(
            Icons.arrow_back_ios_new,
          ),
        ),
        title: const Text(
          "Music",
          style: TextStyle(
            fontSize: 30,
            fontWeight: FontWeight.w700,
          ),
        ),
        backgroundColor: const Color.fromARGB(198, 209, 2, 245),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              height: MediaQuery.of(context).size.height,
              width: MediaQuery.of(context).size.width,
              decoration: const BoxDecoration(
                  // image: DecorationImage(
                  // image: AssetImage("lib/Images/pk1.png"),
                  // fit: BoxFit.cover,
                  // opacity: 0.6),
                  ),
              child: ListView.builder(
                // padding: EdgeInsets.all(5),
                shrinkWrap: true,
                itemCount: Provider.of<Playlist>(context, listen: false)
                    .getdata()
                    .length,
                itemBuilder: (context, index) {
                  return GestureDetector(
                    onTap: () {
                      indexs = index;
                      Navigator.push(context, MaterialPageRoute(
                        builder: (context) {
                          return const Screen3();
                        },
                      ));
                    },
                    child: Container(
                      margin: const EdgeInsets.only(top: 13),
                      child: ListTile(
                        leading: Container(
                          height: 60,
                          width: 60,
                          decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            image: DecorationImage(
                                image: AssetImage(
                                  Provider.of<Playlist>(context)
                                      .getdata()[index]['image'],
                                ),
                                fit: BoxFit.cover),
                          ),
                        ),
                        trailing: const Icon(Icons.more_horiz),
                        subtitle: Text(
                          "${Provider.of<Playlist>(context, listen: false).getdata()[index]['Name']}",
                          style: const TextStyle(
                            fontSize: 13,
                            fontWeight: FontWeight.w800,
                          ),
                        ),
                        title: Text(
                          "${Provider.of<Playlist>(context, listen: false).getdata()[index]['Music'].substring(
                                6,
                              )}",
                          style: const TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.w700,
                          ),
                        ),
                      ),
                    ),
                  );
                },
              ),
            )
          ],
        ),
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:inheriateddemo/main.dart';

class ShowInfoPlayer extends StatefulWidget {
  const ShowInfoPlayer({super.key});

  @override
  State createState() {
    return _ShowInfoPlayerState();
  }
}

class _ShowInfoPlayerState extends State {
  @override
  Widget build(BuildContext context) {
    PlayerInfo obj = PlayerInfo.of(context);
    return Scaffold(
        body: Padding(
      padding: EdgeInsets.all(30),
      child: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              alignment: Alignment.center,
              height: 50,
              width: 190,
              decoration: BoxDecoration(
                color: const Color.fromRGBO(255, 165, 0, 1),
                borderRadius: BorderRadius.circular(10),
              ),
              child: Text(
                obj.name!,
                style: const TextStyle(
                    color: Color.fromRGBO(118, 238, 255, 1),
                    fontSize: 20,
                    fontWeight: FontWeight.w700),
              ),
            ),
            const SizedBox(
              height: 30,
            ),
            GestureDetector(
              onTap: () {
                setState(() {
                  obj.city = "Pune";
                });
              },
              child: Container(
                alignment: Alignment.center,
                height: 50,
                width: 190,
                decoration: BoxDecoration(
                  color: const Color.fromRGBO(255, 165, 0, 1),
                  borderRadius: BorderRadius.circular(10),
                ),
                child: Text(
                  obj.city!,
                  style: const TextStyle(
                      color: Color.fromRGBO(118, 238, 255, 1),
                      fontSize: 20,
                      fontWeight: FontWeight.w700),
                ),
              ),
            ),
            const SizedBox(
              height: 30,
            ),
            GestureDetector(
              onTap: () {
                setState(() {
                  obj.team = "CSK";
                });
              },
              child: Container(
                alignment: Alignment.center,
                height: 50,
                width: 190,
                decoration: BoxDecoration(
                  color: const Color.fromRGBO(255, 165, 0, 1),
                  borderRadius: BorderRadius.circular(10),
                ),
                child: Text(
                  obj.team!,
                  style: const TextStyle(
                      color: Color.fromRGBO(118, 238, 255, 1),
                      fontSize: 20,
                      fontWeight: FontWeight.w700),
                ),
              ),
            )
          ],
        ),
      ),
    ));
  }
}

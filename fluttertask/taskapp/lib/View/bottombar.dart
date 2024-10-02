import 'package:taskapp/Packages/packages.dart';
import 'package:taskapp/View/likescreen.dart';
import 'package:taskapp/View/savepostscreen.dart';

class BottomBar {
  static BottomNavigationBar getbar(BuildContext context) {
    return BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        currentIndex: indx,
        unselectedLabelStyle: const TextStyle(color: Colors.white),
        selectedLabelStyle: const TextStyle(color: Colors.blue),
        showUnselectedLabels: true,
        showSelectedLabels: true,
        backgroundColor: const Color.fromRGBO(0, 0, 0, 0.8),
        items: [
          BottomNavigationBarItem(
              icon: Column(
                children: [
                  const SizedBox(
                    height: 10,
                  ),
                  GestureDetector(
                    onTap: () {
                      indx = 0;
                      Navigator.push(context, MaterialPageRoute(
                        builder: (context) {
                          return const HomeScreen();
                        },
                      ));
                    },
                    child: Icon(
                      Icons.home,
                      color: (indx == 0) ? Colors.blue : Colors.white,
                      size: 31,
                    ),
                  ),
                  const SizedBox(
                    height: 5,
                  ),
                  const Text(
                    "Home",
                    style: TextStyle(color: Colors.white),
                  )
                ],
              ),
              label: ""),
          BottomNavigationBarItem(
              icon: Column(
                children: [
                  const SizedBox(
                    height: 10,
                  ),
                  GestureDetector(
                    onTap: () {
                      indx = 1;
                      Navigator.push(context, MaterialPageRoute(
                        builder: (context) {
                          return const FavoriteScreen();
                        },
                      ));
                      // setState(() {});
                    },
                    child: Icon(
                        color: (indx == 1) ? Colors.blue : Colors.white,
                        Icons.favorite,
                        size: 31),
                  ),
                  const SizedBox(
                    height: 5,
                  ),
                  const Text(
                    "Like",
                    style: TextStyle(color: Colors.white),
                  )
                ],
              ),
              label: ""),
          BottomNavigationBarItem(
            icon: Column(
              children: [
                const SizedBox(
                  height: 10,
                ),
                GestureDetector(
                    onTap: () {
                      indx = 2;
                      // setState(() {});
                    },
                    child: Icon(
                        color: (indx == 2) ? Colors.blue : Colors.white,
                        Icons.people_alt,
                        size: 31)),
                const SizedBox(
                  height: 5,
                ),
                const Text(
                  "Community",
                  style: TextStyle(color: Colors.white),
                )
              ],
            ),
            label: "",
          ),
          BottomNavigationBarItem(
            icon: Column(
              children: [
                const SizedBox(
                  height: 10,
                ),
                GestureDetector(
                  onTap: () {
                    indx = 3;
                    Navigator.push(context, MaterialPageRoute(
                      builder: (context) {
                        return const SaveScreen();
                      },
                    ));
                    // setState(() {});
                  },
                  child: Icon(
                      color: (indx == 3) ? Colors.blue : Colors.white,
                      Icons.bookmark_border_outlined,
                      size: 31),
                ),
                const SizedBox(
                  height: 5,
                ),
                const Text(
                  "Saved",
                  style: TextStyle(color: Colors.white),
                )
              ],
            ),
            label: "",
          ),
        ]);
  }
}

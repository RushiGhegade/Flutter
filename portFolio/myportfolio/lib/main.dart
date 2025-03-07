import 'package:flutter/material.dart';

import 'home_screen.dart';

void main() {
  runApp(const MyApp());
}

List<Map<String, dynamic>> projectInfo = [
  {
    "name": "Chat App",
    "info":
        ''' The app features a user-friendly interface where users can view their chat history, making it easy to keep track of ongoing conversations. Each message is displayed with a timestamp, ensuring clear communication. Users can also update their profile information, including their display name and profile picture, to personalize their chat experience.

All messages and user data are stored in Firebase, a powerful and scalable backend service. This ensures that data is securely stored and synchronized across all devices in real-time. Firebase's cloud storage solution provides reliable access to chat history and user information, even when switching between devices.

The app also includes a notification system to alert users of new messages, ensuring they never miss an important conversation. The intuitive design and robust functionality of the Chat app make it an essential tool for staying connected with friends, family, and colleagues. Its real-time communication capabilities and secure''',
    "skil": [
      "Flutter",
      "Google Firebase",
      "Mobile App Development",
      "Firebase Authentication"
    ],
    "gitlink":
        "https://github.com/RushiGhegade/Flutter/tree/main/AssignmentTask/dummyapp",
    "linkdinlink": "https://www.linkedin.com/in/rushikesh-ghegade-894076295/",
    "images": [
      "Images/project1.png",
      "Images/project2.png",
      "Images/project3.png",
      "Images/project4.png",
      "Images/project5.png",
      "Images/project6.png",
      "Images/project7.png",
      "Images/project8.png",
    ],
  },
  {
    "name": "ToDo List",
    "info":
        '''The To-Do app offers a seamless user experience for managing daily tasks efficiently. Users can either log in using their existing account credentials or sign up for a new account if they don’t have one. Once logged in, users can add tasks to their daily to-do list, ensuring they stay organized and productive. Each task can be easily added by entering the task details and clicking the "Add" button.

The app also allows users to mark tasks as completed with a convenient checkmark button, providing a clear visual indication of their progress. If a task is no longer needed, users can delete it from the list with a simple delete option, keeping the task list clutter-free and up to date.

All user-added tasks are stored in SQLite, a reliable and efficient local database, ensuring that data is preserved even if the app is closed or the device is offline. This local storage solution provides quick access to tasks and guarantees that user data is secure and readily available. ''',
    "skil": ["Flutter", "Google Firebase", "Mobile App Development"],
    "gitlink":
        "https://github.com/RushiGhegade/Flutter/tree/main/NewsApp/newsapp",
    "linkdinlink":
        "https://www.linkedin.com/posts/rushikesh-ghegade-894076295_flutter-flutterapp-mobaildevlopment-activity-7198612089517551616-3yCN?utm_source=social_share_send&utm_medium=member_desktop_web&rcm=ACoAAEdg9HAB-lVTRT9sOlcwfXFUuMuuEPNIUGw",
    "images": [
      "image1/project11.jpg",
      "image1/project12.png",
      "image1/project13.png",
      "image1/project14.png",
      "image1/project15.png",
      "image1/project16.png",
      "image1/project17.png",
      "image1/project18.png",
      "image1/project19.png",
    ],
  },
  {
    "name": "Music App",
    "info":
        ''' The Music App, built using Flutter, offers an intuitive and seamless experience for music lovers. Upon opening the app, users are greeted with an engaging splash screen, followed by a sleek and user-friendly home screen. From here, users can easily browse and choose songs to play, with a simple tap to start enjoying their favorite tracks.

One of the standout features of the app is the ability to mark songs as favorites. Any song that users love can be added to their personal "Favorites" page, providing quick access to their top tunes. The Favorites page acts as a personalized playlist, allowing users to enjoy their selected tracks anytime.

In addition to the Favorites feature, the app supports playlist creation. Users can create custom playlists to organize their music collection, and if needed, they can also delete playlists with a few simple taps. This flexibility ensures that users can curate their listening experience to suit their preferences.
''',
    "skil": ["Flutter", "Google Firebase", "Mobile App Development", "Android"],
    "gitlink":
        "https://github.com/RushiGhegade/Flutter/tree/main/FlutterUiApp/musicapp",
    "linkdinlink":
        "https://www.linkedin.com/posts/rushikesh-ghegade-894076295_flutter-flutterdeveloper-fluttercommunity-activity-7214463301399769088-6TKH?utm_source=social_share_send&utm_medium=member_desktop_web&rcm=ACoAAEdg9HAB-lVTRT9sOlcwfXFUuMuuEPNIUGw",
    "images": [
      "image2/project21.png",
      "image2/project22.png",
      "image2/project23.png",
      "image2/project24.png",
      "image2/project25.png",
      "image2/project26.png",
      "image2/project27.png",
      "image2/project28.png",
      "image2/project29.png",
    ],
  },
  {
    "name": "Car Service App",
    "info":
        '''The Car Service App is the ultimate solution for all your automotive needs, designed to provide a seamless, efficient, and stress-free experience. With a focus on user security, the app features a robust authentication system, allowing for quick and secure logins to access a full range of services.

Upon logging in, users are greeted with an intuitive home screen that offers easy navigation to all key features. This user-friendly dashboard ensures a smooth and hassle-free experience. Additionally, our advanced integrated chatbot is available 24/7 to assist with queries, guide users through app features, and provide local assistance whenever needed.

The app includes real-time GPS navigation, helping users get from their current location to any destination with ease. Whether you need the quickest route or a scenic drive, our navigation system has you covered. Moreover, the app locates nearby petrol stations, parking spots, and mechanical services, providing real-time updates on their lo ''',
    "skil": [
      "Flutter",
      "Google Firebase",
      "Mobile App Development",
      "Google Cloud Storage",
      "Firebase Authentication"
    ],
    "gitlink": "https://github.com/Rushikesh-Ghegade/CarService",
    "linkdinlink": "https://www.linkedin.com/in/rushikesh-ghegade-894076295/",
    "images": [
      "image3/project31.png",
      "image3/project32.png",
      "image3/project33.png",
      "image3/project34.png",
      "image3/project35.png",
      "image3/project36.png",
      "image3/project37.png",
      "image3/project38.png",
      "image3/project39.png",
    ],
  },
];

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: HomeScreen(),
    );
  }
}

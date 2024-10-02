import 'dart:convert';
import 'dart:developer';

import 'package:http/http.dart' as https;
import 'package:taskapp/modelclass/newsmodelclass.dart';

// List<NewsModelClass> newsdata = [];

class Api {
  // for login
  static Future<https.Response> login(String name, String pass) async {
    log("Call start in api");
    Uri url = Uri.parse("https://evika.onrender.com/api/auth/signin");

    https.Response response = await https.post(
      url,
      body: {
        "email": name,
        "password": pass,
      },
    );
    log("Call start in api");
    // log(" this is response : $response");
    return response;
  }

  // for ShowNews
  static Future<List<Event>> news() async {
    log("api call Sucessfully to news api");
    Uri url = Uri.parse("https://evika.onrender.com/api/event");
    https.Response response = await https.get(url);
    if (response.statusCode == 200) {
      var jsonResponse = json.decode(response.body);
      List<dynamic> eventList = jsonResponse['data']['events'];
      return eventList.map((event) => Event.fromJson(event)).toList();
    } else {
      throw Exception('Failed to load events');
    }

    // https.Response response = await https.get(url);

    // // log("${response.body}");

    // var res = await jsonDecode(response.body);

    // NewsModelClass obj =
    //     NewsModelClass(message: res['message'], data: res['data']);

    // log("$obj");
    // newsdata.add(obj);
    // for (int i = 0; i < newsdata[0].data!.events.length; i++) {
    //   // if (newsdata[0].data != null) {
    //   var ans = obj.data?.events[i].title;
    //   if (ans != null) {
    //     log("${ans}");
    //   }
    //   // }
    // }
    // log("api call end Sucessfully to news api");

    // // res;
  }
}





















/*

 for (int i = 0; i < res['data']['events'].length; i++) {
      log("good");
      newsinfo.add(Event(
          eventLocation: EventLocation(
              coordinates: res['data']['events'][i]['eventLocation']
                  ['coordinates']),
          id: res['data']['events'][i]['_id'],
          user: User(
              id: res['data']['events'][i]['user']['_id'],
              firstName: res['data']['events'][i]['user']['firstName'],
              lastName: res['data']['events'][i]['user']['lastName'],
              isVerified: res['data']['events'][i]['user']['isVerified']),
          description: res['data']['events'][i]['description'],
          title: res['data']['events'][i]['title'],
          images: res['data']['events'][i]['images'],
          likedUsers: res['data']['events'][i]['likedUsers'],
          comments: res['data']['events'][i]['comments'],
          eventCategory: res['data']['events'][i]['eventCategory'],
          eventStartAt: res['data']['events'][i]['eventStartAt'],
          eventEndAt: res['data']['events'][i]['eventEndAt'],
          registrationRequired: res['data']['events'][i]
              ['registrationRequired'],
          keywords: res['data']['events'][i]['keywords'],
          hashTags: res['data']['events'][i]['hashTags'],
          registration: res['data']['events'][i]['registration'],
          likes: res['data']['events'][i]['likes'],
          createdAt: res['data']['events'][i]['createdAt'],
          updatedAt: res['data']['events'][i]['updatedAt'],
          v: res['data']['events'][i]['v']));
    }
*/
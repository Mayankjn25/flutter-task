import 'package:flutter/material.dart';
import 'package:flutter_task/models/people_model.dart';
import 'package:flutter_task/resources/people_repository.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  bool isLiked = true;
  int count = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('People'),
        actions: [
          Text("likes: $count"),
        ],
      ),
      body: FutureBuilder(
          future: PeopleRepository().getPeople(),
          builder: (context, AsyncSnapshot snapshot) {
            if (snapshot.data == null) {
              return const Center(
                child: CircularProgressIndicator(),
              );
            }
            return ListView.builder(
                itemCount: snapshot.data.length,
                itemBuilder: (context, index) {
                  People people = snapshot.data[index];
                  return ListTile(
                    title: Text(people.name),
                    subtitle: Text(
                      people.email + "\n" + people.phoneNo,
                      maxLines: 2,
                    ),
                    isThreeLine: true,
                    trailing: IconButton(
                      icon: const Icon(Icons.favorite),
                      color: isLiked ? Colors.red : Colors.grey,
                      onPressed: () {
                        setState(() {
                          !isLiked;
                          count++;
                        });
                      },
                    ),
                  );
                });
          }),
    );
  }
}

// class HomeScreen extends StatelessWidget {
//   const HomeScreen({Key? key}) : super(key: key);

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: const Text('Users Data'),
//       ),
//       body: FutureBuilder(
//           future: PeopleRepository().getPeople(),
//           builder: (context, AsyncSnapshot snapshot) {
//             if (snapshot.data == null) {
//               return const Center(
//                 child: CircularProgressIndicator(),
//               );
//             }
//             return ListView.builder(
//                 itemCount: snapshot.data.length,
//                 itemBuilder: (context, index) {
//                   People people = snapshot.data[index];
//                   return ListTile(
//                     title: Text(people.name),
//                     subtitle: Text(
//                       people.email + "\n" + people.phoneNo,
//                       maxLines: 2,
//                     ),
//                     isThreeLine: true,
//                     trailing: IconButton(color: ,
//                       icon: Icon(Icons.favorite),
//                       onPressed: () {},
//                     ),
//                   );
//                 });
//           }),
//     );
//   }
// }

import 'package:api_cat/pages/cat_details.dart';
import 'package:flutter/material.dart';
import 'package:api_cat/api/breeds.dart';

class CatList extends StatefulWidget {
  const CatList({Key? key}) : super(key: key);

  @override
  State<CatList> createState() => _CatListState();
}

class _CatListState extends State<CatList> {
  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
        future: getBreeds(),
        builder: (context, AsyncSnapshot<List<Breeds>> snapshot) => ListView.builder(
            itemCount: snapshot.data!.length,
            itemBuilder: (context, index) {
              return Container(
                height: 50,
                // color: Colors.amber[600],
                child: Center(
                    // onTap: () {
                    //   Navigator.push(
                    //       context,
                    //       MaterialPageRoute(
                    //           builder: (context) => CatDetails(
                    //                 catBreed: snapshot.data![index],
                    //               )));
                    // },
                    child: Text(
                      snapshot.data![index].name ?? "",
                      style: const TextStyle(color: Colors.deepOrange),
                    )),
              );
            }
            // ((context, snapshot) {
            //   if (snapshot.connectionState == ConnectionState.done) {
            //     return ListView.builder(
            //       // itemCount: controller.allpkmns.results.length,
            //       itemBuilder: (context, index) {
            //         return InkWell(
            //           splashColor: Colors.blue,
            //           child: ListTile(
            //             title: Padding(
            //               padding: const EdgeInsets.fromLTRB(0, 8, 36, 8),
            //               child: Text('$index index'),
            //             ),
            //             contentPadding: EdgeInsets.symmetric(horizontal: 48),
            //           ),
            //         );
            //       },
            //     );
            //   }
            //   if (snapshot.connectionState == ConnectionState.none) {
            //     showDialog(
            //         context: context,
            //         builder: (context) {
            //           return Dialog(
            //             backgroundColor: Colors.white,
            //             elevation: 8,
            //             shape: RoundedRectangleBorder(
            //                 borderRadius: BorderRadius.circular(16)),
            //             child: ElevatedButton(
            //               child: const Text("Try again"),
            //               onPressed: () {
            //                 setState(() {
            //                   // controller.start();
            //                 });
            //               },
            //             ),
            //           );
            //         });
            //   }
            //   return const Center(
            //     child: CircularProgressIndicator(
            //       color: Colors.purple,
            //       strokeWidth: 8.0,
            //     ),
            //   );
            // }),
            ));
  }
}

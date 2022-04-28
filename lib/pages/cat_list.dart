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
    return Scaffold(
      body: FutureBuilder<List<Breeds>>(
          future: getBreeds(),
          builder: (context, snapshot) {
            /// DEU RUIM
            if (snapshot.hasError) {
              const Text("Tente novamente...");
            }

            /// Carregando
            if (snapshot.connectionState == ConnectionState.waiting) {
              return const Center(
                child: CircularProgressIndicator(),
              );
            }

            /// CAMINHO FELIZ
            if (snapshot.hasData && !snapshot.hasError) {
              return ListView.builder(
                  itemCount: snapshot.data!.length,
                  itemBuilder: (context, index) {
                    return SizedBox(
                      height: 50,
                      // color: Colors.amber[600],
                      child: InkWell(
                        onTap: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => CatDetails(
                                        catBreed: snapshot.data![index],
                                      )));
                        },
                        child: Center(
                            child: Text(
                          snapshot.data![index].name ?? "",
                          style: const TextStyle(color: Colors.deepOrange),
                        )),
                      ),
                    );
                  });
            }
            return CircularProgressIndicator();
          }),
    );
  }
}

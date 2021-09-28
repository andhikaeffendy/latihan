import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:new_project/block/list_komponen.dart';
import 'package:new_project/UI/komponen.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  void dispose() {
    super.dispose();
  }

  @override
  void initState() {
    super.initState();
    context.read<ListKomponen>().add(ArticleEvent());
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("Cart Card"),
          backgroundColor: Colors.red,
        ),
        body: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(child: BlocBuilder<ListKomponen, ArticleState>(
              builder: (context, data) {
                if (data is ArticleUnitialized) {
                  return Center(
                    child: CircularProgressIndicator(),
                  );
                } else {
                  ArticleLoaded artikelLoaded = data as ArticleLoaded;
                  return Expanded(
                    child: ListView.builder(
                        itemCount: artikelLoaded.artikel.length,
                        itemBuilder: (context, index) {
                          return Komponen(artikelLoaded.artikel[index]);
                        }),
                  );
                }
              },
            )),
          ],
        ));
  }

  Widget _customProgressBar(double width, int value, int totalValue) {
    double? ratio = value / totalValue;
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Icon(Icons.timer),
        SizedBox(
          width: 16,
        ),
        Stack(
          children: [
            Container(
              width: width,
              height: 10,
              decoration: BoxDecoration(
                  color: Colors.grey[300],
                  borderRadius: BorderRadius.circular(8)),
            ),
            Material(
              borderRadius: BorderRadius.circular(8),
              elevation: 3,
              child: AnimatedContainer(
                height: 10,
                width: width * ratio,
                duration: Duration(milliseconds: 500),
                decoration: BoxDecoration(
                    color: (ratio < 0.3)
                        ? Colors.red
                        : (ratio < 0.6)
                            ? Colors.yellow
                            : Colors.green,
                    borderRadius: BorderRadius.circular(8)),
              ),
            )
          ],
        )
      ],
    );
  }
}

import 'package:flutter/material.dart';
import 'package:new_project/model/article.dart';

class Komponen extends StatelessWidget {
  final Article article;
  Komponen(this.article);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 200,
      margin: EdgeInsets.only(bottom: 8),
      decoration: BoxDecoration(
        image: DecorationImage(
            image: NetworkImage(article.urlToImage == null
                ? "https://i.pinimg.com/736x/b4/d9/aa/b4d9aac7374566dc1a55bcbaae02fa0d--backgrounds-free-wallpaper-backgrounds.jpg"
                : article.urlToImage.toString()),
            fit: BoxFit.cover,
            repeat: ImageRepeat.repeat),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          Text(
            "${article.title}",
            style: TextStyle(
                fontSize: 16, color: Colors.white, fontWeight: FontWeight.bold),
          ),
          Row(
            children: [
              Flexible(
                flex: 1,
                child: Text(
                  "${article.author}",
                  overflow: TextOverflow.ellipsis,
                  style: TextStyle(
                      fontSize: 16,
                      color: Colors.white,
                      fontWeight: FontWeight.bold),
                ),
              ),
              Flexible(
                flex: 1,
                child: Text(
                  "${article.description}",
                  overflow: TextOverflow.ellipsis,
                  style: TextStyle(
                      fontSize: 16,
                      color: Colors.white,
                      fontWeight: FontWeight.bold),
                ),
              ),
            ],
          )
        ],
      ),
    );
  }
}

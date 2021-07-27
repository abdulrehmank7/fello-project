import 'package:fello_project/data/models/articles.dart';
import 'package:fello_project/utility/colors.dart';
import 'package:fello_project/utility/common.dart';
import 'package:flutter/material.dart';

class NewsCardWidget extends StatelessWidget {
  final Articles articles;

  const NewsCardWidget({Key? key, required this.articles}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 300,
      margin: const EdgeInsets.fromLTRB(16, 8, 16, 16),
      decoration: BoxDecoration(
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.5),
            spreadRadius: 1,
            blurRadius: 6,
            offset: const Offset(0, 3), // changes position of shadow
          ),
        ],
        borderRadius: const BorderRadius.all(Radius.circular(22)),
        image: DecorationImage(
          image: NetworkImage(articles.urlToImage!),
          fit: BoxFit.cover,
        ),
      ),
      child: Stack(
        children: [
          Align(
            alignment: Alignment.bottomLeft,
            child: Container(
              width: context.getWidth - 32,
              padding: const EdgeInsets.fromLTRB(16, 16, 16, 16),
              decoration: const BoxDecoration(
                color: c2,
                borderRadius: BorderRadius.only(
                    bottomLeft: Radius.circular(22), bottomRight: Radius.circular(22)),
              ),
              child: Text(
                articles.title!,
                style: const TextStyle(fontSize: 18, fontWeight: FontWeight.w600, color: white),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

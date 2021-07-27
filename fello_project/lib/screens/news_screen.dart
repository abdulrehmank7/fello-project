import 'package:fello_project/bloc/news_bloc.dart';
import 'package:fello_project/data/models/articles.dart';
import 'package:fello_project/utility/colors.dart';
import 'package:fello_project/utility/common.dart';
import 'package:fello_project/utility/widget/news_card_widget.dart';
import 'package:fello_project/utility/widget/progress_bar_widget.dart';
import 'package:flutter/material.dart';

class NewsScreen extends StatefulWidget {
  static const id = "NEWS_SCREEN";

  const NewsScreen({Key? key}) : super(key: key);

  @override
  _NewsScreenState createState() => _NewsScreenState();
}

class _NewsScreenState extends State<NewsScreen> {
  final bloc = NewsBloc();

  @override
  void initState() {
    super.initState();
    bloc.context = context;
  }

  @override
  Widget build(BuildContext context) {
    final newsList = StreamBuilder<List<Articles>>(
      stream: bloc.newsStream,
      initialData: [],
      builder: (context, snapshot) {
        return ListView.builder(
          controller: bloc.scrollController,
          itemCount: snapshot.data!.length,
          itemBuilder: (BuildContext context, int index) {
            return NewsCardWidget(articles: snapshot.data![index]);
          },
        );
      },
    );

    final progressBar = StreamBuilder<bool>(
        stream: bloc.loadingStream,
        initialData: false,
        builder: (context, snapshot) {
          if (snapshot.data!) {
            return const Align(alignment: Alignment.center, child: ProgressBarWidget());
          } else {
            return Container();
          }
        });

    return Scaffold(
      bottomNavigationBar: getBottomNav(context),
      backgroundColor: c7,
      body: SafeArea(
        child: Stack(
          children: [
            newsList,
            progressBar,
          ],
        ),
      ),
    );
  }

  @override
  void dispose() {
    super.dispose();
    bloc.dispose();
  }
}

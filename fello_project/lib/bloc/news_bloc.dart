import 'dart:async';

import 'package:fello_project/data/apis/news_apis.dart';
import 'package:fello_project/data/models/articles.dart';
import 'package:flutter/material.dart';

class NewsBloc {
  final _newsStreamController = StreamController<List<Articles>>.broadcast();

  StreamSink<List<Articles>> get _newsSink => _newsStreamController.sink;

  Stream<List<Articles>> get newsStream => _newsStreamController.stream;

  final _loadingStreamController = StreamController<bool>.broadcast();

  StreamSink<bool> get _loadingSink => _loadingStreamController.sink;

  Stream<bool> get loadingStream => _loadingStreamController.stream;

  var currentPagination = 1;
  final _allNews = <Articles>[];
  final scrollController = ScrollController();
  late BuildContext context;
  var isLoading = false;

  NewsBloc() {
    _fetchNews();

    scrollController.addListener(() {
      double maxScroll = scrollController.position.maxScrollExtent;
      double currentScroll = scrollController.position.pixels;
      double delta = MediaQuery.of(context).size.height * 0.25;

      if (maxScroll - currentScroll <= delta) {
        _fetchNews();
      }
    });
  }

  _fetchNews() {
    if (isLoading) return;

    isLoading = true;
    _loadingSink.add(true);

    getNews(currentPagination.toString()).then((response) {
      isLoading = false;
      _loadingSink.add(false);

      if (response == null) return;
      currentPagination++;
      _allNews.addAll(response.articles!);
      _newsSink.add(_allNews);
    });
  }

  dispose() {
    _newsStreamController.close();
    _loadingStreamController.close();
  }
}

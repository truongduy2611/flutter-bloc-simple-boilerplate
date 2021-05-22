import 'package:flutter/material.dart';
import 'package:flutter_bloc_simple_boilerplate/localization/keys.dart';
import 'package:flutter_bloc_simple_boilerplate/router/routes.dart';
import 'package:flutter_bloc_simple_boilerplate/screens/popular_movie_list/popular_movie_list.dart';
import 'package:flutter_translate/flutter_translate.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> with TickerProviderStateMixin {
  int _currentTab = 0;
  late TabController _tabController;

  @override
  void initState() {
    _tabController = TabController(length: 2, vsync: this);
    super.initState();
  }

  void _onTapBottomNavigationBar(int index) {
    _tabController.animateTo(index);
    setState(() {
      _currentTab = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(translate(Keys.home)),
        brightness: ThemeData.estimateBrightnessForColor(
            Theme.of(context).primaryColor),
        actions: [
          IconButton(
            icon: const Icon(Icons.settings),
            onPressed: () {
              Navigator.pushNamed(context, Routes.settings);
            },
          )
        ],
      ),
      body: TabBarView(
        physics: const NeverScrollableScrollPhysics(),
        controller: _tabController,
        children: const [
          PopularMovieListPage(),
          PopularMovieListPage(),
        ],
      ),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _currentTab,
        onTap: _onTapBottomNavigationBar,
        items: [
          BottomNavigationBarItem(
              icon: const Icon(Icons.movie_filter),
              label: translate(Keys.popular_movie_list)),
          BottomNavigationBarItem(
            icon: const Icon(Icons.favorite),
            label: translate(Keys.favorite_movie_list),
          )
        ],
      ),
    );
  }
}

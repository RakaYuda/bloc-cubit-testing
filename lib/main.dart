import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:persistent_bottom_nav_bar/persistent-tab-view.dart';
import 'package:test_bloc/api/repository/api_article_repository.dart';
import 'package:test_bloc/assets/app_theme.dart';
import 'package:test_bloc/bloc/article_bloc.dart';
import 'package:test_bloc/cubit/theme_cubit.dart';
// import 'package:test_bloc/cubit/article_cubit.dart';
import 'package:test_bloc/models/articles.dart';
import 'package:test_bloc/pages.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider<ThemeCubit>(
      create: (context) => ThemeCubit(),
      child: BlocBuilder<ThemeCubit, ThemeState>(
        builder: (context, state) {
          return MaterialApp(
            theme: state.themeData,
            title: 'CubitTest',
            initialRoute: '/theme',
            routes: {
              // When navigating to the "/" route, build the FirstScreen widget.
              '/': (context) => MainApp(),
              // When navigating to the "/second" route, build the SecondScreen widget.
              '/blank': (context) => SecondScreen(),
              '/theme': (context) => ChangeThemePage(),
            },
          );
        },
      ),
    );
  }
}

class MainApp extends StatefulWidget {
  @override
  _MainAppState createState() => _MainAppState();
}

class _MainAppState extends State<MainApp> {
  final ArticleBloc articleBloc = ArticleBloc(ApiArticleRepository());

  @override
  void initState() {
    // TODO: implement initState
    articleBloc.add(GetArticles());
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        // backgroundColor: Colors.white,
        title: Text('Cubit Test'),
        actions: <Widget>[
          PopupMenuButton<String>(
            // onSelected: (value) => Navigator.pushNamed(context, '/$value');,
            itemBuilder: (context) => [
              PopupMenuItem(
                value: 'blank',
                child: FlatButton(
                  onPressed: () => Navigator.pushNamed(context, '/blank'),
                  child: Text(
                    "Blank Screen",
                    style: TextStyle(
                        color: Colors.black, fontWeight: FontWeight.w700),
                  ),
                ),
              ),
              PopupMenuItem(
                value: 'theme',
                child: FlatButton(
                  onPressed: () => Navigator.pushNamed(context, '/theme'),
                  child: Text(
                    "Change Theme",
                    style: TextStyle(
                        color: Colors.black, fontWeight: FontWeight.w700),
                  ),
                ),
              ),
            ],
            icon: Icon(Icons.table_rows_rounded),
            offset: Offset(0, 100),
          )
          // IconButton( 
          //   icon: Icon(
          //     Icons.arrow_right,
          //     color: Colors.white,
          //   ),
          //   onPressed: () {
          //     // do something
          //     Navigator.pushNamed(context, '/second');
          //   },
          // )
        ],
      ),
      body:
          // BlocProvider(
          //     create: (context) => ArticleCubit(ApiArticleRepository()),
          //     child: Container(
          //       padding: EdgeInsets.symmetric(vertical: 16),
          //       alignment: Alignment.center,
          //       child: BlocBuilder<ArticleCubit, ArticleState>(
          //         builder: (context, state) {
          //           if (state is ArticleLoading) {
          //             return buildLoading();
          //           } else if (state is ArticleLoaded) {
          //             return buildColumnWithData(state.articles.listArticle);
          //           } else {
          //             // (state is WeatherError)
          //             return defaultWidget(context);
          //           }
          //         },
          //       ),
          //     )),
          MultiBlocProvider(
              providers: [
            BlocProvider<ArticleBloc>(
              create: (context) => articleBloc,
            ),
          ],
              child: Container(
                padding: EdgeInsets.symmetric(vertical: 16),
                alignment: Alignment.center,
                child: BlocBuilder<ArticleBloc, ArticleState>(
                  builder: (context, state) {
                    if (state is ArticleLoading) {
                      return buildLoading();
                    } else if (state is ArticleLoaded) {
                      return buildColumnWithData(state.articles.listArticle);
                    } else {
                      // (state is WeatherError)
                      return defaultWidget(context);
                    }
                  },
                ),
              )),
    );
  }
}

Widget buildColumnWithData(List<Article> articles) {
  return ListView.separated(
    itemBuilder: (context, index) {
      return ListTile(
        title: Text('${articles[index].titleArticle}'),
      );
    },
    itemCount: articles.length,
    separatorBuilder: (BuildContext context, int index) => Divider(),
  );
}

// void fetchArticles(BuildContext context) {
//   final articleCubit = context.read<ArticleCubit>();
//   articleCubit.getArticles();
// }

void fetchArticles(BuildContext context) {
  // final articleBloc = context.read<ArticleBloc>();
  // articleBloc.add(GetArticles());
}

Widget defaultWidget(BuildContext context) {
  return FlatButton(
      onPressed: () {
        fetchArticles(context);
      },
      child: Text('Fetch Articles'));
}

Widget buildLoading() {
  return CircularProgressIndicator();
}

class SecondScreen extends StatefulWidget {
  @override
  _SecondScreenState createState() => _SecondScreenState();
}

class _SecondScreenState extends State<SecondScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('2nd Cubit Test'),
        actions: <Widget>[
          IconButton(
            icon: Icon(
              Icons.arrow_right,
              color: Colors.white,
            ),
            onPressed: () {
              // do something
              Navigator.pop(context);
            },
          )
        ],
      ),
      body: Container(
          padding: EdgeInsets.symmetric(vertical: 16),
          alignment: Alignment.center,
          child: Center(
            child: Text('Second Screen'),
          )),
    );
  }
}

class ChangeThemePage extends StatefulWidget {
  @override
  _ChangeThemePageState createState() => _ChangeThemePageState();
}

class _ChangeThemePageState extends State<ChangeThemePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).primaryColor,
        title: Text('Theme'),
        actions: <Widget>[
          // IconButton(
          //   icon: Icon(
          //     Icons.arrow_right,
          //     color: Colors.white,
          //   ),
          //   onPressed: () {
          //     // do something
          //     Navigator.pop(context);
          //   },
          // )
        ],
      ),
      body: Container(
          padding: EdgeInsets.symmetric(vertical: 16),
          alignment: Alignment.center,
          child: Center(
              child: ListView.builder(
                  padding: EdgeInsets.symmetric(horizontal: 12),
                  itemCount: AppTheme.values.length,
                  itemBuilder: (context, index) {
                    final itemAppTheme = AppTheme.values[index];
                    return Card(
                      color: appThemeData[itemAppTheme].primaryColor,
                      child: ListTile(
                        title: Text(
                          itemAppTheme.toString(),
                          style: appThemeData[itemAppTheme].textTheme.bodyText1,
                        ),
                        onTap: () {
                          print(index);
                          BlocProvider.of<ThemeCubit>(context)
                              .changeTheme(appThemeData[itemAppTheme]);
                        },
                      ),
                    );
                  }))),
    );
  }
}

class PageNav extends StatefulWidget {
  const PageNav({Key key}) : super(key: key);

  @override
  _PageNavState createState() => _PageNavState();
}

class _PageNavState extends State<PageNav> {
  PersistentTabController _controller;
  bool _hideNavBar;

  @override
  void initState() {
    super.initState();
    _controller = PersistentTabController(initialIndex: 0);
    _hideNavBar = false;
  }

  List<Widget> _buildScreens() {
    return [ChangeThemePage(), MainApp()];
  }

  List<PersistentBottomNavBarItem> _navBarsItems() {
    return [
      PersistentBottomNavBarItem(
        icon: Icon(CupertinoIcons.home),
        title: ("Home"),
        activeColor: CupertinoColors.activeBlue,
        inactiveColor: CupertinoColors.systemGrey,
      ),
      PersistentBottomNavBarItem(
        icon: Icon(CupertinoIcons.settings),
        title: ("Settings"),
        activeColor: CupertinoColors.activeBlue,
        inactiveColor: CupertinoColors.systemGrey,
      ),
    ];
  }

  @override
  Widget build(BuildContext context) {
    return PersistentTabView(
      controller: _controller,
      screens: _buildScreens(),
      items: _navBarsItems(),
      confineInSafeArea: true,
      backgroundColor: Colors.white,
      handleAndroidBackButtonPress: true,
      resizeToAvoidBottomInset:
          true, // This needs to be true if you want to move up the screen when keyboard appears.
      stateManagement: true,
      hideNavigationBarWhenKeyboardShows:
          true, // Recommended to set 'resizeToAvoidBottomInset' as true while using this argument.
      decoration: NavBarDecoration(
        borderRadius: BorderRadius.circular(10.0),
        colorBehindNavBar: Colors.white,
      ),
      popAllScreensOnTapOfSelectedTab: true,
      popActionScreens: PopActionScreensType.all,
      itemAnimationProperties: ItemAnimationProperties(
        // Navigation Bar's items animation properties.
        duration: Duration(milliseconds: 200),
        curve: Curves.ease,
      ),
      screenTransitionAnimation: ScreenTransitionAnimation(
        // Screen transition animation on change of selected tab.
        animateTabTransition: true,
        curve: Curves.ease,
        duration: Duration(milliseconds: 200),
      ),
      navBarStyle:
          NavBarStyle.style1, // Choose the nav bar style with this property.
    );
  }
}

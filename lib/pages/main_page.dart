import 'package:app_via_cep/pages/ceps_cadastrados_page.dart';
import 'package:app_via_cep/pages/home_page.dart';
import 'package:convex_bottom_bar/convex_bottom_bar.dart';
import 'package:flutter/material.dart';

class MainPage extends StatefulWidget {
  const MainPage({super.key});

  @override
  State<MainPage> createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> with TickerProviderStateMixin {
  late TabController tabController;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    tabController = TabController(initialIndex: 0, length: 2, vsync: this);
  }

  int posicaoPagina = 0;
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
          body: Column(
            children: [
              Expanded(
                child: TabBarView(
                  controller: tabController,
                  children: const [
                    MyHomePage(),
                    ListaCepCadastradoPage(),
                  ],
                ),
              ),
            ],
          ),
          // bottomNavigationBar: BottomNavigationBar(
          //     type: BottomNavigationBarType.fixed,
          //     onTap: (value) {
          //       tabController.jumpToPage(value);
          //     },
          //     currentIndex: posicaoPagina,
          //     items: const [
          //       BottomNavigationBarItem(label: "Home", icon: Icon(Icons.home)),
          //       BottomNavigationBarItem(
          //           label: "Ceps Cadastrados",
          //           icon: Icon(Icons.edit_note_sharp)),
          //     ])
          bottomNavigationBar: ConvexAppBar(
            items: [
              TabItem(icon: Icons.home, title: 'Home'),
              TabItem(icon: Icons.map, title: 'Ceps Cadastrados'),
            ],
            onTap: (int i) => tabController.index = i,
            controller: tabController,
          )),
    );
  }
}

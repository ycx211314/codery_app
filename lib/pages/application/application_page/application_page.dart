import 'package:flutter/material.dart';

class ApplicationPagePage extends StatefulWidget {
  const ApplicationPagePage({super.key});

  @override
  State<ApplicationPagePage> createState() => _ApplicationPagePageState();
}

class _ApplicationPagePageState extends State<ApplicationPagePage>
    with SingleTickerProviderStateMixin {
  late int _pageIndex = 0;
  final List<String> _tabTitle = ['首页', '分类', '购物车', '我的'];
  late PageController _pageController;
  final List<BottomNavigationBarItem> _bottomTabs = <BottomNavigationBarItem>[
    const BottomNavigationBarItem(
        icon: Icon(
          Icons.home,
        ),
        activeIcon: Icon(Icons.home_filled),
        label: 'main'),
    const BottomNavigationBarItem(
        icon: Icon(Icons.message),
        activeIcon: Icon(Icons.message_outlined),
        label: 'category'),
    const BottomNavigationBarItem(
        icon: Icon(Icons.tag),
        activeIcon: Icon(
          Icons.tag_outlined,
        ),
        label: 'tag'),
    const BottomNavigationBarItem(
        icon: Icon(Icons.person), activeIcon: Icon(Icons.person), label: 'my'),
  ];

  @override
  void initState() {
    super.initState();
    _pageController = PageController(initialPage: _pageIndex);
  }

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  //布局
  Widget _buildAppBar() {
    return AppBar(
        title: const Text('ApplicationPagePage'),
        centerTitle: true,
        // leading: const IconButton(
        //     icon: Icon(Icons.arrow_right_alt_outlined),
        //     onPressed: () {
        //       print('搜索');
        //     }),
        actions: [
          IconButton(
              icon: const Icon(Icons.search),
              onPressed: () {
                print('搜索');
              }),
        ]);
  }

  Widget _buildPageView() {
    return PageView(
      controller: _pageController,
      onPageChanged: _handlePageChanged,
      children: [
        Container(
          color: Colors.red,
        ),
        Container(
          color: Colors.green,
        ),
        Container(
          color: Colors.blue,
        ),
        Container(
          color: Colors.yellow,
        ),
      ],
    );
  }

  Widget _buildBottomNavigationBar() {
    return BottomNavigationBar(
      currentIndex: _pageIndex,
      onTap: _handleNavBarTap,
      type: BottomNavigationBarType.fixed,
      items: _bottomTabs,
    );
  }

  _handlePageChanged(int page) {
    setState(() {
      _pageIndex = page;
    });
  }

  // tab栏动画
  void _handleNavBarTap(int index) {
    _pageController.animateToPage(index,
        duration: const Duration(milliseconds: 200),
        curve: Curves.linearToEaseOut);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: _buildAppBar() as PreferredSizeWidget?,
      body: _buildPageView(),
      bottomNavigationBar: _buildBottomNavigationBar(),
    );
  }
}

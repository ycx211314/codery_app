import 'package:auto_route/annotations.dart';
import 'package:codery/common/icons/iconfont.dart';
import 'package:codery/data/provider/im_provider.dart';
import 'package:codery/pages/demo/demo_page.dart';
import 'package:codery/pages/im/contacts/contact_page.dart';
import 'package:codery/pages/im/conversations/conversation_page.dart';
import 'package:codery/pages/profile/profile_page.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

/* cSpell:disable */
@RoutePage()
class ApplicationPage extends StatefulWidget {
  const ApplicationPage({super.key});

  @override
  State<ApplicationPage> createState() => _ApplicationPageState();
}

class _ApplicationPageState extends State<ApplicationPage>
    with SingleTickerProviderStateMixin {
  late int _pageIndex = 0;
  late PageController _pageController;
  final List<BottomNavigationBarItem> _bottomTabs = <BottomNavigationBarItem>[
    const BottomNavigationBarItem(
        icon: Icon(Iconfont.gongzuotai),
        activeIcon: Icon(Iconfont.gongzuotai),
        label: 'HOME'),
    const BottomNavigationBarItem(
        icon: Icon(Iconfont.dianhuabu),
        activeIcon: Icon(Iconfont.rili),
        label: 'Contacts'),
    const BottomNavigationBarItem(
        icon: Icon(Iconfont.cart),
        activeIcon: Icon(Iconfont.cart),
        label: 'Cart'),
    const BottomNavigationBarItem(
        icon: Icon(Iconfont.comments),
        activeIcon: Icon(Iconfont.comments),
        label: 'Message'),
    const BottomNavigationBarItem(
        icon: Icon(Iconfont.account),
        activeIcon: Icon(
          Iconfont.geren,
        ),
        label: 'Account'),
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
    IMProvider imProvider = Provider.of<IMProvider>(context);
    imProvider.init();
    return AppBar(
        title: const Text('Codery'),
        centerTitle: true,
        // leading: const IconButton(
        //     icon: Icon(Icons.arrow_right_alt_outlined),
        //     onPressed: () {
        //       print('搜索');
        //     }),
        actions: [
          IconButton(icon: const Icon(Icons.search), onPressed: () {}),
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
        const ContactsPage(),
        const DemoPage(),
        const ConversationPage(),
        const ProfilePage(),
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
      body: _buildPageView(),
      bottomNavigationBar: _buildBottomNavigationBar(),
    );
  }
}

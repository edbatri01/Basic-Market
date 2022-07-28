import 'package:flutter/material.dart';
import 'package:basic_market/src/styles/colors_view.dart';
import 'package:flutter_svg/flutter_svg.dart';

class bottom_navigation extends StatefulWidget {
  const bottom_navigation({Key? key}) : super(key: key);

  @override
  State<bottom_navigation> createState() => _bottom_navigationState();
}

class _bottom_navigationState extends State<bottom_navigation> {
  int _selectedIndex = 1;
  // final pages =[
  //   home(),
  //   grocery()
  // ];
  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
      type: BottomNavigationBarType.fixed,
              elevation: 0,
              iconSize: 40,
              showSelectedLabels: false,
              showUnselectedLabels: false,
              items: <BottomNavigationBarItem>[
                    BottomNavigationBarItem(
                      icon: SvgPicture.asset('assets/icons/icon_home.svg',color: _selectedIndex == 0 ? ColorSelect.orange : ColorSelect.grey2,),
                      label: 'home',
                    ),
                    BottomNavigationBarItem(
                      icon: SvgPicture.asset('assets/icons/icon_grocery.svg',color: _selectedIndex == 1 ? ColorSelect.orange : ColorSelect.grey2,),
                      label: 'grocery',
                    ),
                    BottomNavigationBarItem(
                      icon: SvgPicture.asset('assets/icons/icon_wallet.svg', color: _selectedIndex == 2 ? ColorSelect.orange : ColorSelect.grey2,),
                      label: 'wallet',
                    ),
                    BottomNavigationBarItem(
                      icon: SvgPicture.asset('assets/icons/icon_user.svg',color: _selectedIndex == 3 ? ColorSelect.orange : ColorSelect.grey2,),
                      label: 'user',
                    ),
                  ],
                  currentIndex: _selectedIndex,
                selectedItemColor: ColorSelect.orange,
                onTap: _onItemTapped,
            );
  }
}

import 'package:flutter/material.dart';
import 'package:pentrar/screens/app/account/account.dart';
import 'package:pentrar/screens/app/history/history.dart';
import 'package:pentrar/screens/app/procedure/procedure.dart';
import 'package:pentrar/utils/colors.dart';
import 'package:pentrar/utils/images.dart';
import 'home/home.dart';





class AppBaseNavigation extends StatefulWidget {
  
  const AppBaseNavigation({
    super.key});

  @override
  State<AppBaseNavigation> createState() => _AppBaseNavigationState();
}

class _AppBaseNavigationState extends State<AppBaseNavigation> with WidgetsBindingObserver {



  List<Widget> _pages = [
    Container(),
    Container(),
    Container(),
    Container(),
  ];

  int _currentIndex = 0;
  Widget? _currentWidget;



  void getCurrentPage(index){
    _currentIndex = index;
    _currentWidget = _pages[_currentIndex];
    setState(() {
      
    });
  }

  final pageController = PageController();
  

  @override
  void initState() {
    _currentWidget = HomeScreen();
    _pages = [
      HomeScreen(),
      Procedure(),
      History(),
      AccountScreen()

  ];
    super.initState();
    WidgetsBinding.instance.addObserver(this);
  }
  @override
  Widget build(BuildContext context) {

    return Scaffold(

      body: _currentWidget,

      bottomNavigationBar: BottomNavigationBar(
        unselectedItemColor: Color.fromARGB(255, 39, 39, 39),
        selectedItemColor: primaryColor.shade600,
        showSelectedLabels: true,
        showUnselectedLabels: true,
        elevation: 0,
        type: BottomNavigationBarType.fixed,

        //backgroundColor: Color(0xffFAFAFF),
        currentIndex: _currentIndex,
        onTap: (index){
          getCurrentPage(index);
          setState(() {
            
          });
        },
      
        items:  [
          
          const BottomNavigationBarItem(
            icon: ImageIcon(
              AssetImage(homeUnselected)
            ),
      
            activeIcon: ImageIcon(
              AssetImage(homeSelected)
            ),
      
            label: 'Home'
          ),


          
          BottomNavigationBarItem(
            icon: ImageIcon(
              AssetImage(procedureUnselected)
            ),
      
            activeIcon: const ImageIcon(
              AssetImage(procedureSelected)
            ),
      
            label: 'Produce'
          ),


          BottomNavigationBarItem(
            icon: ImageIcon(
              AssetImage(historyUnselected)
            ),
      
            activeIcon: const ImageIcon(
              AssetImage(historySelected)
            ),
      
            label: 'History'
          ),

          BottomNavigationBarItem(
            icon: const ImageIcon(
              AssetImage(profileUnselected)
            ),
      
            activeIcon: const ImageIcon(
              AssetImage(profileSelected)
            ),
      
            label: 'Profile'
          ),
          
        ]
      ),
    );

  }
}
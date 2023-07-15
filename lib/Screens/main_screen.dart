import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:social_media_app_frontend_in_flutter/Resources/Colors/app_colors.dart';
import 'package:social_media_app_frontend_in_flutter/Screens/My_Profile/my_profile_screen.dart';
import 'package:social_media_app_frontend_in_flutter/Screens/Posts/post_screen.dart';
import 'package:social_media_app_frontend_in_flutter/Screens/home/Home_Screen.dart';
import 'package:social_media_app_frontend_in_flutter/logic/cubits/user_details/user_details_cubit.dart';

class MainScreen extends StatefulWidget {
  const MainScreen({Key? key}) : super(key: key);

  static const String routeName = "main";

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  int _currentIndex = 0;

  static List<Widget> _widgetOptions = <Widget>[
    //* <-- First Create ( List ) <-- iska kaam hai Pages ko display karta hai
    HomeScreen(),
    Text(""),
    PostScreen(),
    Text(""),
    BlocProvider(
      create: (context) => UserProfileDetelsCubit(),
      child: MyProfilScreen(),
    )
  ];

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;
    //  final userPreferences = Provider.of<UserSharedPreferences>(context);

    return Scaffold(
        bottomNavigationBar:NavigationBar(
        selectedIndex: _currentIndex,
        onDestinationSelected: (value){
            setState(() {
                _currentIndex = value;
              });
        },
        //* ignore: prefer_const_literals_to_create_immutables
        destinations: [
          NavigationDestination(
              icon: Icon(Icons.home_outlined),
              selectedIcon: Icon(Icons.home),
              label: "Home"),
          NavigationDestination(
              icon: Icon(Icons.search_outlined),
              selectedIcon: Icon(Icons.search),
              label: "Search"),
          NavigationDestination(
              icon: Icon(Icons.add_circle_outline),
              selectedIcon: Icon(Icons.add_circle),
              label: "Post"),
          NavigationDestination(
              icon: Icon(Icons.notifications_outlined),
              selectedIcon: Icon(Icons.notifications),
              label: "Notifications"),
          NavigationDestination(
              icon: Icon(Icons.account_circle_outlined),
              selectedIcon: Icon(Icons.account_circle),
              label: "Profile"),
        ]),
        
        
        
        
        
        //  BottomNavigationBar(
        //     //* <-- BottomNavigationBar Using Example
        //     type: BottomNavigationBarType.fixed,
        //     currentIndex: _currentIndex,
        //     backgroundColor: AppColor.cardColor,
        //     unselectedItemColor: Colors.white,
        //     selectedItemColor: Color(0xffFF0101),
        //     selectedLabelStyle: TextStyle(fontWeight: FontWeight.bold),
        //     onTap: (val) {
        //       setState(() {
        //         _currentIndex = val;
        //       });
        //     },
        //     items: const [
        //       BottomNavigationBarItem(
        //         label: "Home",
        //         activeIcon: Icon(Icons.home),
        //         icon: Icon(Icons.home_outlined),
        //       ),

        //       BottomNavigationBarItem(
        //         label: "Search",
        //         activeIcon: Icon(Icons.search),
        //         icon: Icon(Icons.search_outlined),
        //       ),

        //       BottomNavigationBarItem(
        //           icon: Icon(Icons.add), // <--Call customAdIcon class
        //           label: ""),

        //       // Spacer(),

        //       BottomNavigationBarItem(
        //         label: "Notifications",
        //         activeIcon: Icon(Icons.notifications),
        //         icon: Icon(Icons.notifications_outlined),
        //       ),

        //       BottomNavigationBarItem(
        //         label: "Profile",
        //         activeIcon: Icon(Icons.person),
        //         icon: Icon(Icons.person_outlined),
        //       ),

        //       // BottomNavigationBarItem(
        //       //   label: "Profile",
        //       //   activeIcon: Icon(Icons.person) ,
        //       //   icon: Icon(Icons.person_outlined)
        //       //   )
        //     ]),





        body: _widgetOptions.elementAt(
            _currentIndex) //* <-- Call List Widget  (Widget Name This --> _widgetOptions )
        // body: _widgetOptions.elementAt(_currentIndex)    //* <-- Call List Widget  (Widget Name This --> _widgetOptions )

        );
  }
}

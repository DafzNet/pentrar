import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get_it/get_it.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';
import 'package:pentrar/models/user.dart';
import 'package:pentrar/utils/colors.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  User user = GetIt.instance<User>();

  List _transactions = [];


  @override
  Widget build(BuildContext context) {
    return Scaffold(
  
      appBar: AppBar(
        title: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Hello, ${user.firstName}',
            
              style: Theme.of(context).textTheme.titleLarge!.copyWith(color: Colors.white, fontWeight: FontWeight.w700),
            ),

            SizedBox(height: 10,),

            Text(
              'Farm Produce Dashboard',
            
              style: Theme.of(context).textTheme.titleSmall!.copyWith(color: Colors.white, fontWeight: FontWeight.w400),
            ),
          
          ],
        ),
        automaticallyImplyLeading: false,
        backgroundColor: primaryColor,
        toolbarHeight: 100,

        systemOverlayStyle: SystemUiOverlayStyle(
          statusBarColor: Colors.transparent,
          statusBarIconBrightness: Brightness.dark
        )
      ),

      floatingActionButton: FloatingActionButton(
        onPressed: null,

        backgroundColor: primaryColor.shade400,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(50)),
        child: Icon(MdiIcons.plus, color: Colors.white,),
      ),
      
    );
  }
}
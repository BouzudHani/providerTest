import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:t2/homeViewModel.dart';

import 'HomeView.dart';

void main() {
  runApp(
    // pass the providers init
    MultiProvider(
      providers: [
        //create the view model and initialize it
        ChangeNotifierProvider(create: (_) => HomeViewModel()),
      ] ,
      child: MaterialApp(
          debugShowCheckedModeBanner: false,
          home: HomePage()
      ),
    ),

  );
}



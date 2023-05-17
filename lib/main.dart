import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:g10_task/item_class.dart';
import 'package:g10_task/item_list.dart';
import 'package:provider/provider.dart';
Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  //error handler screen
  ErrorWidget.builder = (FlutterErrorDetails details) => Container();

  runApp(MultiProvider(
      providers: [ 
     
        ChangeNotifierProvider(create: (_) => ItemClass()),
 
      ],
      child: Builder(builder: (context) {
     
        return MaterialApp(
            debugShowCheckedModeBanner: false,
            title: "MyMohalla",
            builder: EasyLoading.init(),
           
           home: const ItemList());
      })));
}

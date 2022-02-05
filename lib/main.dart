import 'package:flutter/material.dart';
import 'package:food_market/cubit/cubit.dart';
import 'package:get/get.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'ui/pages/pages.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
        providers: [
          BlocProvider(
            create: (_) => UserCubit(),
          ),
          BlocProvider(
            create: (_) => FoodCubit(),
          ),
          BlocProvider(
            create: (_) => TransactionCubit(),
          )
        ],
        child: GetMaterialApp(
            debugShowCheckedModeBanner: false, home: SignInPage()));
  }
}

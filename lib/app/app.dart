import 'dart:developer';

import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:kazakhi_auto_web/app/screens/home/bloc/home_bloc.dart';
import 'package:kazakhi_auto_web/app/screens/home/home_screen.dart';

class KazakhAutoWeb extends StatelessWidget {
  const KazakhAutoWeb({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
        providers: [
          BlocProvider(
            create: (context) => HomeBloc()..add(HomeLoad()),
          ),
        ],
        child: MaterialApp(
          debugShowCheckedModeBanner: false,
          title: 'WeGlobal',
          home: HomeScreen(),
        ));
  }
}

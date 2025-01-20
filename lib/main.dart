import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_news_app/business-logic-layer/news/cubit/bloc_observer.dart';
import 'package:flutter_news_app/business-logic-layer/news/cubit/news_cubit.dart';
import 'package:flutter_news_app/business-logic-layer/theme/theme_cubit.dart';
import 'package:flutter_news_app/layout/news_layout.dart';
import 'package:flutter_news_app/network/remote/dio_helper.dart';
import 'package:flutter_news_app/theme/theme_data.dart';

void main() {
  DioHelper.init();
  Bloc.observer = MyBlocObserver();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  final bool? isDark;
  const MyApp({super.key, this.isDark});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (_) => NewsCubit()..getBusiness()),
        BlocProvider(create: (_) => ThemeCubit()),
      ],
      child: BlocBuilder<ThemeCubit, ThemeState>(
        builder: (context, state) {
          return MaterialApp(
            debugShowCheckedModeBanner: false,
            title: 'Flutter Demo',
            theme: themeDataLight(),
            darkTheme: themeDataDark(),
            themeMode: ThemeCubit.get(context).isDark
                ? ThemeMode.dark
                : ThemeMode.light,
            home: NewsLayout(),
          );
        },
      ),
    );
  }
}

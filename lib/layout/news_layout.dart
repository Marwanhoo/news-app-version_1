import 'package:flutter/material.dart';
import 'package:flutter_app_2/business-logic-layer/news/cubit/news_cubit.dart';
import 'package:flutter_app_2/business-logic-layer/theme/theme_cubit.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../network/remote/dio_helper.dart';

class NewsLayout extends StatelessWidget {

  const NewsLayout({super.key});

  @override
  Widget build(BuildContext context) {

    return BlocConsumer<NewsCubit, NewsStates>(
      listener: (context, state) {
        // TODO: implement listener
      },
      builder: (context, state) {
        NewsCubit cubit = NewsCubit.get(context);
        return Scaffold(
          appBar: AppBar(
            title: const Text(
              "News App",
            ),
            actions: [
              IconButton(
                onPressed: () {
                  ThemeCubit.get(context).changeAppMode();
                },
                icon: const Icon(Icons.brightness_4_outlined),
              ),
              IconButton(
                onPressed: () {},
                icon: const Icon(Icons.search),
              ),
            ],
          ),
          body: cubit.screen[cubit.currentIndex],
          floatingActionButton: FAB(),
          bottomNavigationBar: BottomNavigationBar(
            type: BottomNavigationBarType.fixed,
            onTap: (index) {
              cubit.changeBottomNavBar(index);
            },
            currentIndex: cubit.currentIndex,
            items: cubit.bottomItems,
          ),
        );
      },
    );
  }
  Widget FAB ()=> FloatingActionButton(
    onPressed: () {
      DioHelper.getData(
        url: "v2/top-headlines",
        query: {
          "country": "eg",
          "category": "business",
          "apiKey": "28c14728652245d9a2d58703234ab259",
        },
      ).then((value) {
        print(value.data.toString());
        //print(value.data["totalResults"];)
        //print(value.data["articles"][0]["source"]["name"]);
      }).catchError((onError) {
        print(onError.toString());
      });
    },
    child: const Icon(Icons.add),
  );

}

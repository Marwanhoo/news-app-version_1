import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_news_app/business-logic-layer/news/cubit/news_cubit.dart';
import 'package:flutter_news_app/business-logic-layer/theme/theme_cubit.dart';

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
    onPressed: ()  {
       DioHelper.getData(
        url: "v4/top-headlines?",
        query: {
          "category": "business",
          "lang": "ar",
          "country": "eg",
          "max": "10",
          "apikey": "4facf37bb8e3f48dc27ad3e7383baa70",
        },
      ).then((value) {
        print(value.data);
        print(value.data["totalArticles"]);
        //print(value.data["articles"][0]["source"]["name"]);
      }).catchError((onError) {
        print(onError.toString());
      });
    },
    child: const Icon(Icons.add),
  );

}

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_news_app/modules/business_screen/business_screen.dart';
import 'package:flutter_news_app/modules/health_screen/health_screen.dart';
import 'package:flutter_news_app/modules/technology_screen/technology_screen.dart';
import 'package:flutter_news_app/network/remote/dio_helper.dart';


part 'news_state.dart';

class NewsCubit extends Cubit<NewsStates> {
  NewsCubit() : super(NewsInitial());

  static NewsCubit get(context) => BlocProvider.of(context);

  int currentIndex = 0;
  List<BottomNavigationBarItem> bottomItems = const [
    BottomNavigationBarItem(icon: Icon(Icons.business), label: "Business"),
    BottomNavigationBarItem(icon: Icon(Icons.spa), label: "Health"),
    BottomNavigationBarItem(icon: Icon(Icons.window), label: "Technology"),
    // BottomNavigationBarItem(icon: Icon(Icons.apple), label: "Apple"),
  ];

  void changeBottomNavBar(int index) {
    currentIndex = index;
    if(index == 1) getHealth();
    if(index == 2) getTech();
    // if(index == 3) getApple();
    emit(NewsBottomNavState());
  }

  List<Widget> screen = const [
    BusinessScreen(),
    HealthScreen(),
    TechnologyScreen(),
    // AppleScreen(),
  ];


  List<dynamic> business = [];
  void getBusiness() {
    emit(NewsGetBusinessLoadingState());
    DioHelper.getData(
      url: "v4/top-headlines",
      query: {
        "category": "business",
        "lang": "ar",
        "country": "eg",
        "max": "10",
        "apikey": "4facf37bb8e3f48dc27ad3e7383baa70",
      },
    ).then((value) {
      business = value.data["articles"];
      emit(NewsGetBusinessSuccessState());
      //print(business.length);
      //print(business[0]["title"]);
    }).catchError((onError) {
      debugPrint(onError.toString());
      emit(NewsGetBusinessErrorState(error: onError.toString()));
    });
  }

  List<dynamic> health = [];
  void getHealth() {
    emit(NewsGetHealthLoadingState());
    DioHelper.getData(
      url: "v4/top-headlines",
      query: {
        "category": "health",
        "lang": "ar",
        "country": "eg",
        "max": "10",
        "apikey": "4facf37bb8e3f48dc27ad3e7383baa70",
      },
    ).then((value) {
      health = value.data["articles"];
      emit(NewsGetHealthSuccessState());
      //print(business.length);
      //print(business[0]["title"]);
    }).catchError((onError) {
      debugPrint(onError.toString());
      emit(NewsGetHealthErrorState(error: onError.toString()));
    });
  }

  List<dynamic> tech = [];
  void getTech() {
    emit(NewsGetTechLoadingState());
    DioHelper.getData(
      url: "v4/top-headlines",
      query: {
        "category": "technology",
        "lang": "ar",
        "country": "eg",
        "max": "10",
        "apikey": "4facf37bb8e3f48dc27ad3e7383baa70",
      },
    ).then((value) {
      tech = value.data["articles"];
      emit(NewsGetTechSuccessState());
      //print(business.length);
      //print(business[0]["title"]);
    }).catchError((onError) {
      debugPrint(onError.toString());
      emit(NewsGetTechErrorState(error: onError.toString()));
    });
  }

  List<dynamic> apple = [];
  void getApple() {
    emit(NewsGetAppleLoadingState());
    DioHelper.getData(
      url: "v4/everything",
      query: {
        "q": "apple",
        "sortBy": "popularity",
        "apiKey": "28c14728652245d9a2d58703234ab259",
      },
    ).then((value) {
      apple = value.data["articles"];
      emit(NewsGetAppleSuccessState());
      //print(business.length);
      //print(business[0]["title"]);
    }).catchError((onError) {
      debugPrint(onError.toString());
      emit(NewsGetAppleErrorState(error: onError.toString()));
    });
  }

}
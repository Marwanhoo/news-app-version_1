part of 'news_cubit.dart';

@immutable
abstract class NewsStates {}

class NewsInitial extends NewsStates {}

class NewsBottomNavState extends NewsStates{}

class NewsGetBusinessLoadingState extends NewsStates{}
class NewsGetBusinessSuccessState extends NewsStates{}
class NewsGetBusinessErrorState extends NewsStates{
  final String error;

  NewsGetBusinessErrorState({required this.error});
}

class NewsGetHealthLoadingState extends NewsStates{}
class NewsGetHealthSuccessState extends NewsStates{}
class NewsGetHealthErrorState extends NewsStates{
  final String error;

  NewsGetHealthErrorState({required this.error});
}

class NewsGetTechLoadingState extends NewsStates{}
class NewsGetTechSuccessState extends NewsStates{}
class NewsGetTechErrorState extends NewsStates{
  final String error;

  NewsGetTechErrorState({required this.error});
}



class NewsGetAppleLoadingState extends NewsStates{}
class NewsGetAppleSuccessState extends NewsStates{}
class NewsGetAppleErrorState extends NewsStates{
  final String error;

  NewsGetAppleErrorState({required this.error});
}

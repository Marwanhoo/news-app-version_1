import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_news_app/business-logic-layer/news/cubit/news_cubit.dart';
import 'package:flutter_news_app/components/components.dart';


class BusinessScreen extends StatelessWidget {
  const BusinessScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<NewsCubit, NewsStates>(
      builder: (context, state) {
        var list = NewsCubit.get(context).business;
        if(state is NewsGetBusinessLoadingState){
          return const Center(child: CircularProgressIndicator(),);
        }
        else if (state is NewsGetBusinessErrorState){
          return Container();
        }
        return ListView.separated(
          itemBuilder: (context,index) => buildArticleItem(list[index],context),
          itemCount: list.length,
          separatorBuilder: (context,index) => myDivider(),
        );
      },
    );
  }
  Widget mConditionalBuilder (state,list) => ConditionalBuilder(
    condition: state is! NewsGetBusinessLoadingState,
    builder: (context) => ListView.separated(
      itemBuilder: (context,index) => buildArticleItem(list[index],context),
      itemCount: list.length,
      separatorBuilder: (context,index) => myDivider(),
    ),
    fallback: (context) =>
    const Center(child: CircularProgressIndicator()),
  );
}

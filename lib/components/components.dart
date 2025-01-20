import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import '../modules/web_view_screen/web_view_screen.dart';

String formatDateTime(String dateTime) {
  final parsedDateTime = DateTime.parse(dateTime);
  final formatter = DateFormat('yyyy-MM-dd hh:mm a');
  return formatter.format(parsedDateTime);
}

Widget buildArticleItem(article, context) => InkWell(
      onTap: () {
        Navigator.of(context).push(
          MaterialPageRoute(
            builder: (context) => WebViewScreen(
              url: article['url'],
            ),
          ),
        );
      },
      child: Padding(
        padding: const EdgeInsets.all(20),
        child: Container(
          height: 125,
          padding: const EdgeInsets.all(10),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10),
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Expanded(
                child: Text(
                  "${article['title']}",
                  maxLines: 2,
                  overflow: TextOverflow.ellipsis,
                  style: Theme.of(context).textTheme.bodyLarge,
                ),
              ),
              Row(
                children: [
                  const Icon(size: 18, Icons.file_copy),
                  const SizedBox(width: 5),
                  Expanded(
                    child: Text(
                      "${article['author']}",
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                    ),
                  ),
                ],
              ),
              Row(
                children: [
                  const Icon(size: 18, Icons.access_time),
                  const SizedBox(width: 5),
                  Text(
                    formatDateTime(article['publishedAt']),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );

Widget buildArticleItemOldDesign() => Padding(
      padding: const EdgeInsets.all(20),
      child: Row(
        children: [
          Container(
            width: 120,
            height: 120,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
              image: const DecorationImage(
                image: NetworkImage(
                  "https://images.unsplash.com/photo-1661956602116-aa6865609028?ixlib=rb-4.0.3&ixid=M3wxMjA3fDF8MHxlZGl0b3JpYWwtZmVlZHw1MXx8fGVufDB8fHx8fA%3D%3D&auto=format&fit=crop&w=500&q=60",
                ),
                fit: BoxFit.cover,
              ),
            ),
          ),
          const SizedBox(width: 20),
          const Expanded(
            child: SizedBox(
              height: 120,
              child: Column(
                //mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Expanded(
                    child: Text(
                      "title",
                      maxLines: 3,
                      overflow: TextOverflow.ellipsis,
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                  Text(
                    //DateFormat.yMMMd().format(article['publishedAt']),
                    //article['publishedAt'],
                    "title",
                    style: TextStyle(
                      color: Colors.grey,
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );

Widget myDivider() => const Divider(
      color: Colors.purple,
      height: 1,
      thickness: 1,
      indent: 50,
      endIndent: 50,
    );

Widget articleBuilder(list) => ConditionalBuilder(
      condition: list.isNotEmpty,
      builder: (context) => ListView.separated(
        itemBuilder: (context, index) => buildArticleItem(list[index], context),
        itemCount: list.length,
        separatorBuilder: (context, index) => myDivider(),
      ),
      fallback: (context) => const Center(
        child: CircularProgressIndicator(),
      ),
    );

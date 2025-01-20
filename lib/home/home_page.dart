import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
     length: 3,
      child: Scaffold(
        appBar: AppBar(
          title: const Text(
            "News App",
          ),
          bottom: const TabBar(
            tabs: [
              Row(
                children: [
                  Tab(icon: Icon(Icons.business),),
                  Text("Business"),
                ],
              ),
              Row(
                children: [
                  Icon(Icons.business),
                  Text("Business"),
                ],
              ),
              Row(
                children: [
                  Icon(Icons.business),
                  Text("Business"),
                ],
              ),
            ],
          ),
        ),
        body: TabBarView(
          children: [
            Container(
              child: const Center(
                child: Text(
                  "Business",
                ),
              ),
            ),
            const Center(
              child: Text(
                "Sports",
              ),
            ),
            const Center(
              child: Text(
                "Science",
              ),
            ),
          ],
        ),
      ),
    );
  }
}

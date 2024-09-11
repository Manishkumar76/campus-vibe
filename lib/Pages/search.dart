import 'package:flutter/material.dart';

class SearchPage extends StatefulWidget {
  @override
  _SearchPageState createState() => _SearchPageState();
}

class _SearchPageState extends State<SearchPage> with SingleTickerProviderStateMixin {
  late TabController _tabController;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 3, vsync: this);
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Column(
          children: [
            // Search bar and tabs at the top
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 12.0),
              child: Column(
                children: [
                  // Search bar with decoration
                  Padding(
                    padding: const EdgeInsets.only(top: 12.0, bottom: 8.0),
                    child: Container(
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(25.0),
                        boxShadow: [
                          BoxShadow(
                            color: Colors.black.withOpacity(0.2),
                            blurRadius: 8.0,
                            offset: const Offset(0, 4), // Shadow position
                          ),
                        ],
                      ),
                      child: const TextField(
                        decoration: InputDecoration(
                          hintText: 'Search events...',
                          prefixIcon: Icon(Icons.search, color: Colors.grey),
                          border: InputBorder.none,
                          contentPadding: EdgeInsets.symmetric(vertical: 12.0, horizontal: 16.0),
                        ),
                      ),
                    ),
                  ),
                  // TabBar
                  TabBar(
                    controller: _tabController,
                    labelColor: Colors.black,
                    unselectedLabelColor: Colors.grey,
                    indicatorColor: Colors.indigo,
                    indicatorWeight: 3.0,
                    tabs: const [
                      Tab(text: 'Live'),
                      Tab(text: 'Upcoming'),
                      Tab(text: 'Closed'),
                    ],
                  ),
                ],
              ),
            ),
            // Content area
            Expanded(
              child: TabBarView(
                controller: _tabController,
                children: [
                  _buildListViewContent('Live Events'),
                  _buildListViewContent('Upcoming Events'),
                  _buildListViewContent('Closed Events'),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  // Helper method to create a ListView for content
  Widget _buildListViewContent(String title) {
    return ListView.builder(
      padding: const EdgeInsets.all(16.0),
      itemCount: 20, // Example: 20 items to display
      itemBuilder: (context, index) {
        return Padding(
          padding: const EdgeInsets.symmetric(vertical: 8.0),
          child: Card(
            elevation: 3,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(15),
            ),
            child: ListTile(
              leading: Icon(Icons.event, color: Colors.indigo),
              title: Text(
                '$title Item ${index + 1}',
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.w500),
              ),
              subtitle: Text('Details for $title Item ${index + 1}'),
            ),
          ),
        );
      },
    );
  }
}

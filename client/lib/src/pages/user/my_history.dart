import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';
import 'widgets/table_history.dart';

class UserHistory extends StatelessWidget {
  const UserHistory({super.key});

  // Function to launch a URL (to simulate redoing the prompt)
  void _launchUrl(String url) async {
    if (await canLaunch(url)) {
      await launch(url);
    } else {
      throw 'Could not launch $url';
    }
  }

  @override
  Widget build(BuildContext context) {
    // Sample data for the table rows
    final List<Map<String, String>> tableData = [
      {
        'type': 'Country: Romania',
        'dateCreated': '2023-10-05',
        'link': 'https://example.com/doc1'
      },
      {
        'type': 'Global',
        'dateCreated': '2023-09-15',
        'link': 'https://example.com/image1'
      },
      {
        'type': 'User: -',
        'dateCreated': '2023-08-20',
        'link': 'https://example.com/pdf1'
      },
      {
        'type': 'Global',
        'dateCreated': '2023-07-12',
        'link': 'https://example.com/spreadsheet1'
      },
      {
        'type': 'Country: Romania',
        'dateCreated': '2023-10-05',
        'link': 'https://example.com/doc1'
      },
      {
        'type': 'Global',
        'dateCreated': '2023-09-15',
        'link': 'https://example.com/image1'
      },
      {
        'type': 'User: -',
        'dateCreated': '2023-08-20',
        'link': 'https://example.com/pdf1'
      },
      {
        'type': 'Global',
        'dateCreated': '2023-07-12',
        'link': 'https://example.com/spreadsheet1'
      },
      {
        'type': 'Country: Romania',
        'dateCreated': '2023-10-05',
        'link': 'https://example.com/doc1'
      },
      {
        'type': 'Global',
        'dateCreated': '2023-09-15',
        'link': 'https://example.com/image1'
      },
      {
        'type': 'User: -',
        'dateCreated': '2023-08-20',
        'link': 'https://example.com/pdf1'
      },
      {
        'type': 'Global',
        'dateCreated': '2023-07-12',
        'link': 'https://example.com/spreadsheet1'
      },
      {
        'type': 'Country: Romania',
        'dateCreated': '2023-10-05',
        'link': 'https://example.com/doc1'
      },
      {
        'type': 'Global',
        'dateCreated': '2023-09-15',
        'link': 'https://example.com/image1'
      },
      {
        'type': 'User: -',
        'dateCreated': '2023-08-20',
        'link': 'https://example.com/pdf1'
      },
      {
        'type': 'Global',
        'dateCreated': '2023-07-12',
        'link': 'https://example.com/spreadsheet1'
      },
    ];

    return Scaffold(
      appBar: AppBar(
        title: const Text('My History', style: TextStyle(color: Colors.white)),
        backgroundColor: Colors.black,
      ),
      backgroundColor: const Color.fromRGBO(36, 36, 36, 1),
      body: PageView(
        scrollDirection: Axis.vertical,
        children: [
          // First page: Introductory message explaining the functionality
          const Center(
            child: Padding(
              padding: EdgeInsets.all(16.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Icon(
                    Icons.history,
                    size: 100,
                    color: Colors.green,
                  ),
                  SizedBox(height: 20),
                  Text(
                    'Here is the history of your prompts.',
                    style: TextStyle(
                      fontSize: 24,
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                    ),
                    textAlign: TextAlign.center,
                  ),
                  SizedBox(height: 10),
                  Text(
                    'By pressing the button on the table below, you will be redirected to redo the prompt.',
                    style: TextStyle(
                      fontSize: 16,
                      color: Colors.white,
                    ),
                    textAlign: TextAlign.center,
                  ),
                  SizedBox(height: 20),
                  Icon(
                    Icons.arrow_downward,
                    size: 50,
                    color: Colors.white,
                  ),
                ],
              ),
            ),
          ),
          
          // Second page: History table with the data and action button
          Center(
            child: Container(
              margin: const EdgeInsets.all(12),
                child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  
                  HistoryTable(
                    tableData: tableData,
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}

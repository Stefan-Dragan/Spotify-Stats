import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class HistoryTable extends StatelessWidget {
  // Modify the constructor to accept `tableData` as an input parameter
  final List<Map<String, String>> tableData;

  const HistoryTable({super.key, required this.tableData});

  // Function to launch the link
  void _launchURL(String url) async {
    if (await canLaunch(url)) {
      await launch(url);
    } else {
      throw 'Could not launch $url';
    }
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: MediaQuery.of(context).size.height * 0.85,
      color: const Color.fromARGB(255, 65, 65, 65),
      child: Column(
        children: [
          // Header row remains static
          Table(
            border: const TableBorder(
              horizontalInside: BorderSide(width: 3, color: Color.fromRGBO(36, 36, 36, 1)), // Horizontal lines between rows
              verticalInside: BorderSide(width: 15, color: Color.fromRGBO(36, 36, 36, 1)),   // Vertical lines between columns
            ),
            columnWidths: const {
              0: FlexColumnWidth(1),
              1: FlexColumnWidth(1),
              2: FlexColumnWidth(1),
            },
            children: const [
              // Header row
              TableRow(
                decoration: BoxDecoration(color: Color.fromARGB(255, 80, 80, 80)),
                children: [
                  Padding(
                    padding: EdgeInsets.all(8.0),
                    child: Text('Type', style: TextStyle(fontWeight: FontWeight.bold, color: Colors.white)),
                  ),
                  Padding(
                    padding: EdgeInsets.all(8.0),
                    child: Center(
                      child: Text('Date Created', style: TextStyle(fontWeight: FontWeight.bold, color: Colors.white)),
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.all(8.0),
                    child: Align(
                      alignment: Alignment.centerRight,
                      child: Text('Action', style: TextStyle(fontWeight: FontWeight.bold, color: Colors.white)),
                    ),
                  ),
                ],
              ),
            ],
          ),

          // Scrollable body section for data rows
          Expanded(
            child: Scrollbar(
              trackVisibility: true,
              thickness: 6.0,
      
              radius: const Radius.circular(10),
              child: SingleChildScrollView(
                scrollDirection: Axis.vertical,
                child: Table(
                  border: const TableBorder(
                    horizontalInside: BorderSide(width: 3, color: Color.fromRGBO(36, 36, 36, 1)), // Horizontal lines between rows
                    verticalInside: BorderSide(width: 15, color: Color.fromRGBO(36, 36, 36, 1)),   // Vertical lines between columns
                  ),
                  columnWidths: const {
                    0: FlexColumnWidth(1),
                    1: FlexColumnWidth(1),
                    2: FlexColumnWidth(1),
                  },
                  children: [
                    // Data rows
                    ...tableData.map((data) {
                      return TableRow(
                        decoration: const BoxDecoration(color: Color.fromARGB(255, 65, 65, 65)),
                        children: [
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Text(data['type']!, style: const TextStyle(color: Colors.white)),
                          ),
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Center(
                              child: Text(data['dateCreated']!, style: const TextStyle(color: Colors.white)),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Align(
                              alignment: Alignment.centerRight,
                              child: ElevatedButton(
                                onPressed: () => _launchURL(data['link']!),
                                style: ElevatedButton.styleFrom(
                                  backgroundColor: Colors.green, // Button color
                                ),
                                child: const Text('Open Link', style: TextStyle(color: Colors.white)),
                              ),
                            ),
                          ),
                        ],
                      );
                    }),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

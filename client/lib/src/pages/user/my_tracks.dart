import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

import 'widgets/music_card.dart';

class UserTracks extends StatelessWidget {
  UserTracks({super.key});

  // Example list of tracks with date information
  final List<Map<String, String>> trackData = [
    {
      'imageUrl':
          'https://i.scdn.co/image/ab67616d00001e02ff9ca10b55ce82ae553c8228',
      'title': 'Song Title 1',
      'author': 'Artist 1',
      'dateSaved': '2023-10-05',
      'spotifyId': '5Oca13ac6cZ0hwZAs1SXse'
    },
    {
      'imageUrl':
          'https://i.scdn.co/image/ab67616d00001e02ff9ca10b55ce82ae553c8228',
      'title': 'Song Title 2',
      'author': 'Artist 2',
      'dateSaved': '2023-09-15',
      'spotifyId': '6Oca13ac6cZ0hwZAs1SXse'
    },
    {
      'imageUrl':
          'https://i.scdn.co/image/ab67616d00001e02ff9ca10b55ce82ae553c8228',
      'title': 'Song Title 3',
      'author': 'Artist 3',
      'dateSaved': '2023-10-20',
      'spotifyId': '7Oca13ac6cZ0hwZAs1SXse'
    },
    {
      'imageUrl':
          'https://i.scdn.co/image/ab67616d00001e02ff9ca10b55ce82ae553c8228',
      'title': 'Song Title 4',
      'author': 'Artist 4',
      'dateSaved': '2023-09-22',
      'spotifyId': '8Oca13ac6cZ0hwZAs1SXse'
    },
  ];

  // Group the tracks by month (for simplicity, we assume the date is in "yyyy-MM-dd" format)
  Map<String, List<Map<String, String>>> getTracksByMonth() {
    Map<String, List<Map<String, String>>> groupedTracks = {};

    for (var track in trackData) {
      final String dateSaved = track['dateSaved']!;
      final String monthYear = dateSaved.substring(0, 7); // Extract "yyyy-MM"

      if (groupedTracks.containsKey(monthYear)) {
        groupedTracks[monthYear]!.add(track);
      } else {
        groupedTracks[monthYear] = [track];
      }
    }

    return groupedTracks;
  }

  // Function to launch Spotify URL
  void _launchSpotify(String spotifyId) async {
    final url = 'https://open.spotify.com/track/$spotifyId';
    if (await canLaunch(url)) {
      await launch(url);
    } else {
      throw 'Could not launch $url';
    }
  }

  @override
  Widget build(BuildContext context) {
    final tracksByMonth = getTracksByMonth();

    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        title: const Text(
          'My Tracks',
          style: TextStyle(color: Colors.white),
        ),
        backgroundColor: Colors.black,
      ),
      body: PageView(
        scrollDirection: Axis.vertical,
        children: [
          // Introductory Page
          const Center(
            child: Padding(
              padding: EdgeInsets.all(16.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Icon(
                    Icons.music_note,
                    size: 100,
                    color: Colors.green,
                  ),
                  SizedBox(height: 20),
                  Text(
                    'Here are your saved tracks!',
                    style: TextStyle(
                      fontSize: 32,
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                    ),
                    textAlign: TextAlign.center,
                  ),
                  SizedBox(height: 10),
                  Text(
                    'Scroll down to explore your saved tracks.',
                    style: TextStyle(
                      fontSize: 16,
                      color: Colors.white,
                    ),
                    textAlign: TextAlign.center,
                  ),
                  SizedBox(height: 4),
                  Text(
                    'Press the button on the card to go to the track on Spotify!',
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
          
          // Page for each month of saved tracks
          for (var monthYear in tracksByMonth.keys) 
            SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // Display month/year header with shadow
                  Padding(
                    padding: const EdgeInsets.symmetric(vertical: 12, horizontal: 8),
                    child: Container(
                      width: double.infinity,
                      height: 25,
                      decoration: BoxDecoration(
                        color: const Color.fromARGB(255, 30, 215, 96),
                        boxShadow: [
                          BoxShadow(
                            color: Colors.black.withOpacity(0.5),
                            offset: const Offset(0, 2),
                            blurRadius: 6,
                          ),
                        ],
                      ),
                      child: Center(
                        child: Text(
                          monthYear,
                          style: const TextStyle(
                            color: Colors.black,
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                    ),
                  ),
                  

                  // Horizontal scrollable track list
                  Container(
                    height: 300, 
                    padding: const EdgeInsets.only(left: 10),
                    child: Scrollbar(
                      trackVisibility: true, 
                      child: ListView.builder(
                        scrollDirection: Axis.horizontal,
                        itemCount: tracksByMonth[monthYear]!.length,
                        itemBuilder: (context, index) {
                          final track = tracksByMonth[monthYear]![index];
                          return Padding(
                            padding: const EdgeInsets.only(right: 4.0),
                            child: MusicCard(
                              imageUrl: track['imageUrl']!,
                              title: track['title']!,
                              author: track['author']!,
                              spotifyId: track['spotifyId']!,
                              width: 200.0,
                              height: 250.0,
                              dateSaved: track['dateSaved']!,
                            ),
                          );
                        },
                      ),
                    ),
                  ),
                ],
              ),
            ),
        ],
      ),
      backgroundColor: const Color.fromRGBO(36, 36, 36, 1), // Set background color to gray
    );
  }
}

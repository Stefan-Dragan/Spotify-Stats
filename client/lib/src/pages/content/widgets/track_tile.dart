import 'package:flutter/material.dart';

class TrackTile extends StatelessWidget {
  final String title;
  final String imageUrl;

  const TrackTile({
    super.key,
    required this.title,
    required this.imageUrl,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
        color: Color.fromARGB(255, 95, 95, 95),
      ),
      margin: const EdgeInsets.all(8.0),
      padding: const EdgeInsets.all(2.5),
      child: Row(
        children: [
          // Image with rounded corners
          ClipRRect(
            borderRadius: BorderRadius.circular(8),
            child: Image.network(
              imageUrl,
              width: 50,
              height: 50,
              fit: BoxFit.cover,
              errorBuilder: (context, error, stackTrace) {
                return Container(
                  width: 50,
                  height: 50,
                  color: Colors.grey,
                  child: const Icon(Icons.error, color: Colors.white),
                );
              },
            ),
          ),
          const SizedBox(width: 12),
          
          Expanded(
            child: Text(
              title,
              style: const TextStyle(
                color: Colors.white,
                fontSize: 16,
                fontWeight: FontWeight.bold,
              ),
              maxLines: 1,
              overflow: TextOverflow.ellipsis, 
            ),
          ),
          
          // Save button styled in Spotify's green color
          TextButton(
            onPressed: () {
              // Implement save functionality here
            },
            style: TextButton.styleFrom(
              foregroundColor: Colors.white,
              backgroundColor: const Color(0xFF1DB954), // Spotify green
              padding: const EdgeInsets.symmetric(horizontal: 12),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(20),
              ),
            ),
            child: const Text(
              'SAVE',
              style: TextStyle(color: Colors.white),
            ),
          ),
          const SizedBox(width: 10)
        ],
      ),
    );
  }
}
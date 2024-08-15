import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        body: Center(
          child: Column(
            children: [
              SizedBox(height: 20),
              buildCard(
                context,
                imageUrl: 'https://example.com/image1.jpg',
                power: 54,
                locked: false,
              ),
              SizedBox(height: 20),
              buildCard(
                context,
                imageUrl: 'https://example.com/image2.jpg',
                power: 0,
                locked: true,
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget buildCard(BuildContext context, {required String imageUrl, required int power, required bool locked}) {
    return Stack(
      children: [
        Container(
          width: MediaQuery.of(context).size.width * 0.8,
          height: 100,
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(20),
            boxShadow: [
              BoxShadow(
                color: Colors.black26,
                offset: Offset(0, 2),
                blurRadius: 6,
              ),
            ],
          ),
          child: Row(
            children: [
              ClipRRect(
                borderRadius: BorderRadius.circular(20),
                child: Image.network(
                  imageUrl,
                  width: 100,
                  height: 100,
                  fit: BoxFit.cover,
                ),
              ),
              Expanded(
                child: Padding(
                  padding: const EdgeInsets.all(12.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Power: $power/100',
                        style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      SizedBox(height: 8),
                      LinearProgressIndicator(
                        value: power / 100,
                        backgroundColor: Colors.grey[300],
                        valueColor: AlwaysStoppedAnimation<Color>(Colors.blue),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
        if (locked)
          Positioned.fill(
            child: Container(
              decoration: BoxDecoration(
                color: Colors.black.withOpacity(0.5),
                borderRadius: BorderRadius.circular(20),
              ),
              child: Center(
                child: Icon(
                  Icons.lock,
                  color: Colors.white,
                  size: 40,
                ),
              ),
            ),
          ),
      ],
    );
  }
}

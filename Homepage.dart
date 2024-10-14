import 'package:flutter/material.dart';



import 'package:saloon/Detailspage.dart';

import 'DetailsPage2.dart';
import 'DetailsPage3.dart';

class Homepage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: BarbershopHomePage(),
    );
  }
}

class BarbershopHomePage extends StatelessWidget {
  final List<String> carouselImages = [
    '../assets/cut1.jpg',
    '../assets/cut2.jpg',
    '../assets/cut3.jpg',
  ];

  final List<Map<String, String>> barbershopData = [
    {
      'name': 'MANO',
      'age': '25',
      'rating': '4.5',
      'image': '../assets/cut6.jpg',
    },
    {
      'name': 'KISHOR',
      'age': '30',
      'rating': '4.7',
      'image': '../assets/cut7.jpg',
    },
    {
      'name': 'JACHIN',
      'age': '28',
      'rating': '4.8',
      'image': '../assets/cut8.jpg',
    },
    {
      'name': 'RONALDO',
      'age': '35',
      'rating': '4.9',
      'image': '../assets/cut9.jpg',
    },
    {
      'name': 'MESSI',
      'age': '34',
      'rating': '4.9',
      'image': 'assets/cut23.jpg',
    },
    {
      'name': 'Neymar',
      'age': '32',
      'rating': '4.6',
      'image': 'assets/barber6.jpg',
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.black,
        elevation: 0,
        title: Row(
          children: [
            Icon(Icons.location_on, color: Colors.red),
            SizedBox(width: 5),
            Text(
              'Yogyakarta',
              style: TextStyle(color: Colors.white),
            ),
          ],
        ),
        actions: [
          CircleAvatar(
            backgroundImage: NetworkImage('https://example.com/user.jpg'),
          ),
          SizedBox(width: 10),
        ],
      ),
      backgroundColor: Colors.black,
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            CarouselSlider(
              options: CarouselOptions(
                height: 250,
                autoPlay: true,
                enlargeCenterPage: true,
                viewportFraction: 0.8,
                aspectRatio: 2.0,
                initialPage: 0,
              ),
              items: carouselImages.map((imageUrl) {
                return Builder(
                  builder: (BuildContext context) {
                    return Container(
                      width: double.infinity,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                      ),
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(10),
                        child: Image.asset(
                          imageUrl,
                          fit: BoxFit.fill, // Set fit to BoxFit.fill
                        ),
                      ),
                    );
                  },
                );
              }).toList(),
            ),
            SizedBox(height: 10),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  'Nearest Barbershop',
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold, color: Colors.white),
                ),
                SizedBox(width: 10), // Add spacing between text and button
                TextButton(
                  onPressed: () {},
                  child: Text(
                    'See All',
                    style: TextStyle(color: Colors.white70),
                  ),
                ),
              ],
            ),

            SizedBox(height: 10),
            Row(
              children: barbershopData.take(4).map((data) {
                final index = barbershopData.indexOf(data) + 1; // Get index
                return Expanded(
                  child: Stack(
                    children: [
                      Container(
                        height: 200,
                        margin: EdgeInsets.only(right: 10),
                        decoration: BoxDecoration(
                          color: Colors.orange,
                          borderRadius: BorderRadius.circular(10),
                        ),
                        child: Padding(
                          padding: EdgeInsets.all(8.0),
                          child: Column(
                            children: [
                              Container(
                                width: 100,
                                height: 100, // Fixed height to make it square
                                decoration: BoxDecoration(
                                  color: Colors.white,
                                  borderRadius: BorderRadius.circular(10),
                                  image: DecorationImage(
                                    image: AssetImage(data['image']!),
                                    fit: BoxFit.cover,
                                  ),
                                ),
                              ),
                              SizedBox(height: 10),
                              Text(
                                'Name: ${data['name']}',
                                style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 16,
                                  fontWeight: FontWeight.bold,
                                ),
                                overflow: TextOverflow.ellipsis,
                              ),
                              Text(
                                'Age: ${data['age']}',
                                style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 14,
                                ),
                                overflow: TextOverflow.ellipsis,
                              ),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Icon(
                                    Icons.star,
                                    color: Colors.amber,
                                    size: 16,
                                  ),
                                  SizedBox(width: 5),
                                  Text(
                                    data['rating']!,
                                    style: TextStyle(
                                      color: Colors.white,
                                      fontSize: 14,
                                    ),
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ),
                      ),
                      Positioned(
                        bottom: 8,
                        right: 20,
                        child: ElevatedButton(
                          onPressed: () {
                            // Navigate to a different page here
                            if (index == 1) {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => (DetailsPage()),
                                ),
                              );
                            }
                            if (index == 2) {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => (DetailsPage2()),
                                ),
                              );
                            }
                            if (index == 3) {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => (DetailsPage3()),
                                ),
                              );
                            }
                          },
                          child: Text('click$index'), // Dynamically set button text
                        ),
                      ),
                    ],
                  ),
                );
              }).toList(),
            ),
          ],
        ),
      ),
    );
  }
}







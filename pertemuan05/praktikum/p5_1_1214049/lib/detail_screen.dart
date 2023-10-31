import 'package:flutter/material.dart';
import 'package:p5_1_1214049/model/tourism_place.dart';

var iniFontCustom = const TextStyle(fontFamily: 'Oswald');

class DetailScreen extends StatelessWidget {
  final TourismPlace place;

  const DetailScreen({Key? key, required this.place}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            Stack(children: <Widget>[Image.asset(place.imageAsset),
            SafeArea(
              child: Padding(
                padding: const EdgeInsets.all(8),
                child: CircleAvatar(
                  backgroundColor: Colors.black26,
                  child: IconButton(icon: const Icon(Icons.arrow_back, color: Colors.amber,), onPressed: (){Navigator.pop(context);},)),
              ),
            )]),
            Container(
              margin: const EdgeInsets.only(top: 20),
              child: Text(
                place.name,
                textAlign: TextAlign.center,
                style: const TextStyle(
                  fontFamily: 'Oswald',
                  fontSize: 30,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            Container(
              margin: const EdgeInsets.symmetric(vertical: 16),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: <Widget>[
                  Column(
                    children: <Widget>[
                      const Icon(
                        Icons.calendar_today,
                        color: Colors.amber,
                      ),
                      const SizedBox(
                        height: 8,
                      ),
                      Text(
                        place.openDays,
                        style: iniFontCustom,
                      ),
                    ],
                  ),
                  Column(
                    children: <Widget>[
                      const Icon(Icons.access_time, color: Colors.amber),
                      const SizedBox(
                        height: 8,
                      ),
                      Text(
                        place.openTime,
                        style: iniFontCustom,
                      ),
                    ],
                  ),
                  Column(
                    children: <Widget>[
                      const Icon(Icons.monetization_on, color: Colors.amber),
                      const SizedBox(
                        height: 8,
                      ),
                      Text(
                        place.ticketPrice,
                        style: iniFontCustom,
                      ),
                    ],
                  ),
                ],
              ),
            ),
            Container(
              padding: const EdgeInsets.all(16),
              child: Text(
                place.description,
                textAlign: TextAlign.center,
                style: const TextStyle(fontSize: 16),
              ),
            ),
            SizedBox(
              height: 150,
              child: ListView(
                scrollDirection: Axis.horizontal,
                children: place.imageUrls.map((url) {
                  return Padding(
                    padding: const EdgeInsets.all(4),
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(10),
                      child: Image.network(url),
                    ),
                  );
                }).toList(),
              ),
            )
          ],
        ),
      ),
    );
  }
}


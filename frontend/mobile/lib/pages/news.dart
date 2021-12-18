import 'package:flutter/material.dart';

class NewsView extends StatefulWidget {
  const NewsView({Key? key}) : super(key: key);

  @override
  _NewsViewState createState() => _NewsViewState();
}

class _NewsViewState extends State<NewsView> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(2),
      child: Column(
        children: [
          const SizedBox(
            height: 10,
          ),
          const Center(
            child: Padding(
              padding: EdgeInsets.fromLTRB(
                4,
                0,
                4,
                0,
              ),
              child: Text(
                'Heavy Flood Sweeps Away Village In Nepal',
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 25,
                ),
              ),
            ),
          ),
          const SizedBox(
            height: 10,
          ),
          Image.asset(
            'assets/flood.jpeg',
          ),
          const SizedBox(
            height: 10,
          ),
          const Text(
            'Kathmandu: Nepal Prime Minister Sher Bahadur Deuba and his Cabinet colleagues today visited western Nepal - hit by floods and landslides - to take stock of the situation and ensure relief measures are being implemented. The death count from the floods triggered by heavy rains in the country climbed to 111 today, with at least 32 reportedly injured and 35 still missing, officials said. Mr Deuba, Finance Minister Janardan Sharma, Minister for Tourism and Civil Aviation Prem Ale Magar and others visited four rural municipality of the Kailali district in the western part of the country. As floods, landslides, and inundation have resulted in a huge loss of lives and properties, the government is carrying out immediate relief and rescue works, Mr Deuba said.',
            textAlign: TextAlign.justify,
          ),
        ],
      ),
    );
  }
}

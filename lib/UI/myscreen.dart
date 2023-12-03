// NameListScreen.dart
import 'package:flutter/material.dart';
import 'package:share_image/UI/editor_scrrrin.dart';



class NameListScreen extends StatelessWidget {
  final List<String> countryNames = [
    'United States',
    'Canada',
    'United Kingdom',
    'Germany',
    'France',
    'Australia',
    'India',
    'Japan',
    'Brazil',
    'South Africa',
  ];
  final List<String> images = [
    'https://upload.wikimedia.org/wikipedia/commons/thumb/f/ff/Assalamu-aleykum.svg/2560px-Assalamu-aleykum.svg.png',
    'https://upload.wikimedia.org/wikipedia/commons/thumb/f/ff/Assalamu-aleykum.svg/2560px-Assalamu-aleykum.svg.png',
    'https://upload.wikimedia.org/wikipedia/commons/thumb/f/ff/Assalamu-aleykum.svg/2560px-Assalamu-aleykum.svg.png',
    'https://upload.wikimedia.org/wikipedia/commons/thumb/f/ff/Assalamu-aleykum.svg/2560px-Assalamu-aleykum.svg.png',
    'https://upload.wikimedia.org/wikipedia/commons/thumb/f/ff/Assalamu-aleykum.svg/2560px-Assalamu-aleykum.svg.png',
    'https://upload.wikimedia.org/wikipedia/commons/thumb/f/ff/Assalamu-aleykum.svg/2560px-Assalamu-aleykum.svg.png',
    'https://upload.wikimedia.org/wikipedia/commons/thumb/f/ff/Assalamu-aleykum.svg/2560px-Assalamu-aleykum.svg.png',
    'https://upload.wikimedia.org/wikipedia/commons/thumb/f/ff/Assalamu-aleykum.svg/2560px-Assalamu-aleykum.svg.png',
    'https://upload.wikimedia.org/wikipedia/commons/thumb/f/ff/Assalamu-aleykum.svg/2560px-Assalamu-aleykum.svg.png',
    'https://upload.wikimedia.org/wikipedia/commons/thumb/f/ff/Assalamu-aleykum.svg/2560px-Assalamu-aleykum.svg.png',

  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Country List')),
      body: ListView.builder(
        itemCount: countryNames.length,
        itemBuilder: (context, index) {
          return ListTile(
            title: Text(countryNames[index]),
            trailing: Image.network(
                        images[index],
                        height: 50.0,
                        width: 50,
                        fit: BoxFit.contain,
                      ),
                   
                 
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => Editor_screen(name: countryNames[index], img:images[index]),
                ),
              );
            },
          );
        },
      ),
    );
  }
}

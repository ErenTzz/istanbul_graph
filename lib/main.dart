import 'package:flutter/material.dart';

void main() {
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    final districts = {
      '1': 'Esenyurt',
      '2': 'K.Cekmece',
      '3': 'Pendik',
      '4': 'Umraniye',
      '5': 'Bagcilar',
      '6': 'Bahcelie.',
      '7': 'Sultangazi',
      '8': 'Maltepe',
      '9': 'Uskudar',
      '10': 'Basaksehir',
      '11': 'SancakT.',
      '12': 'GOP',
      '13': 'Kartal',
      '14': 'Kadikoy',
      '15': 'K.Hane',
      '16': 'Avcilar',
      '17': 'Esenler',
      '18': 'EyupS.',
      '19': 'AtaS.',
      '20': 'Beylikduzu',
      '21': 'Sultanbeyli',
      '22': 'Fatih',
      '23': 'Sariyer',
      '24': 'Arnavutkoy',
      '25': 'Cekmekoy',
      '26': 'Tuzla',
      '27': 'Z.Burnu',
      '28': 'B.Cekmece',
      '29': 'Gung.',
      '30': 'B.pasa',
      '31': 'Sisli',
      '32': 'Beykoz',
      '33': 'Silivri',
      '34': 'Bakirkoy',
      '35': 'Beyoglu',
      '36': 'Besiktas',
      '37': 'Catalca',
      '38': 'Sile',
      '39': 'Adalar'
    };

    final positions = {
      '1': Offset(317, 275),
      '2': Offset(395, 268),
      '3': Offset(754, 190),
      '4': Offset(615, 205),
      '5': Offset(430, 250),
      '6': Offset(438, 282),
      '7': Offset(436, 175),
      '8': Offset(647, 270),
      '9': Offset(580, 225),
      '10': Offset(380, 210),
      '11': Offset(680, 210),
      '12': Offset(470, 215),
      '13': Offset(680, 295),
      '14': Offset(575, 255),
      '15': Offset(516, 196),
      '16': Offset(365, 290),
      '17': Offset(448, 228),
      '18': Offset(458, 125),
      '19': Offset(620, 245),
      '20': Offset(318, 338),
      '21': Offset(720, 235),
      '22': Offset(510, 260),
      '23': Offset(512, 87),
      '24': Offset(290, 120),
      '25': Offset(700, 120),
      '26': Offset(780, 270),
      '27': Offset(488, 285),
      '28': Offset(230, 290),
      '29': Offset(465, 265),
      '30': Offset(473, 238),
      '31': Offset(515, 155),
      '32': Offset(620, 100),
      '33': Offset(5, 220),
      '34': Offset(435, 314),
      '35': Offset(520, 235),
      '36': Offset(549, 207),
      '37': Offset(130, 110),
      '38': Offset(820, 55),
      '39': Offset(600, 360),
    };

    final sizes = {
      '1': Size(32, 32),
      '2': Size(32, 32),
      '3': Size(60, 60),
      '4': Size(36, 36),
      '5': Size(26, 26),
      '6': Size(26, 26),
      '7': Size(30, 30),
      '8': Size(36, 36),
      '9': Size(22, 22),
      '10': Size(40, 40),
      '11': Size(40, 40),
      '12': Size(20, 20),
      '13': Size(36, 36),
      '14': Size(40, 40),
      '15': Size(20, 20),
      '16': Size(30, 30),
      '17': Size(22, 22),
      '18': Size(50, 50),
      '19': Size(30, 30),
      '20': Size(40, 40),
      '21': Size(36, 36),
      '22': Size(28, 28),
      '23': Size(40, 40),
      '24': Size(70, 70),
      '25': Size(55, 55),
      '26': Size(60, 60),
      '27': Size(20, 20),
      '28': Size(50, 50),
      '29': Size(20, 20),
      '30': Size(23, 23),
      '31': Size(30, 30),
      '32': Size(50, 50),
      '33': Size(70, 70),
      '34': Size(35, 35),
      '35': Size(20, 20),
      '36': Size(30, 30),
      '37': Size(60, 60),
      '38': Size(70, 70),
      '39': Size(60, 60),
    };

    final colors = {
      '1': Colors.red,
      '2': Colors.green,
      '3': Colors.blue,
      '4': Colors.yellow,
      '5': Colors.orange,
      '6': Colors.purple,
      '7': Colors.pink,
      '8': Colors.cyan,
      '9': Colors.lime,
      '10': Colors.indigo,
      '11': Colors.teal,
      '12': Colors.amber,
      '13': Colors.brown,
      '14': Colors.grey,
      '15': Colors.redAccent,
      '16': Colors.greenAccent,
      '17': Colors.blueAccent,
      '18': Colors.yellowAccent,
      '19': Colors.orangeAccent,
      '20': Colors.purpleAccent,
      '21': Colors.pinkAccent,
      '22': Colors.cyanAccent,
      '23': Colors.limeAccent,
      '24': Colors.indigoAccent,
      '25': Colors.tealAccent,
      '26': Colors.amberAccent,
      '27': Colors.brown[300]!,
      '28': Colors.grey[300]!,
      '29': Colors.red[300]!,
      '30': Colors.green[300]!,
      '31': Colors.blue[300]!,
      '32': Colors.yellow[300]!,
      '33': Colors.orange[300]!,
      '34': Colors.purple[300]!,
      '35': Colors.pink[300]!,
      '36': Colors.cyan[300]!,
      '37': Colors.lime[300]!,
      '38': Colors.indigo[300]!,
      '39': Colors.teal[300]!,
    };

    return MaterialApp(
      home: Scaffold(
        body: Stack(
          children: [
            Container(
              color: Colors.grey[200], // Set the background color
            ),
            Positioned.fill(
              child: Transform.translate(
                offset: Offset(25, -90),
                child: Transform.scale(
                  scale: 1.35, // Slightly zoom in
                  child: Transform.rotate(
                    angle: -15 * 3.141592653589793 / 180,
                    child: FittedBox(
                      fit: BoxFit.cover,
                      child: Image.asset(
                        'assets/ist.png',
                      ),
                    ),
                  ),
                ),
              ),
            ),
            Align(
              alignment: Alignment.topCenter,
              child: Padding(
                padding: EdgeInsets.only(top: 1.0),
                child: Text(
                  'İstanbul İlçeleri Komşuluk Haritası',
                  style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
                ),
              ),
            ),
            ...districts.entries.map((entry) {
              final position = positions[entry.key]!;
              final size = sizes[entry.key]!;
              final color = colors[entry.key]!;
              return Positioned(
                left: position.dx,
                top: position.dy,
                child: SizedBox(
                  width: size.width,
                  height: size.height,
                  child: FloatingActionButton(
                    onPressed: null,
                    backgroundColor: color,
                    shape: CircleBorder(
                      side: BorderSide(color: Colors.black, width: 1.25),
                    ),
                    child: FittedBox(
                      fit: BoxFit.scaleDown,
                      child: Stack(
                        children: [
                          Text(
                            entry.value,
                            style: TextStyle(
                              fontSize: 12,
                              fontWeight: FontWeight.bold,
                              foreground: Paint()
                                ..style = PaintingStyle.stroke
                                ..strokeWidth = 2
                                ..color = Colors.black,
                            ),
                          ),
                          Text(
                            entry.value,
                            style: TextStyle(
                              fontSize: 12,
                              fontWeight: FontWeight.bold,
                              color: Colors.white,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              );
            }).toList(),
          ],
        ),
      ),
    );
  }
}

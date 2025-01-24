import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  SystemChrome.setEnabledSystemUIMode(
      SystemUiMode.immersiveSticky); // Hide status bar
  SystemChrome.setPreferredOrientations([
    DeviceOrientation.landscapeRight,
    DeviceOrientation.landscapeLeft
  ]); // Set landscape mode
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: OnboardingScreen(),
    );
  }
}

class OnboardingScreen extends StatefulWidget {
  @override
  _OnboardingScreenState createState() => _OnboardingScreenState();
}

class _OnboardingScreenState extends State<OnboardingScreen> {
  final PageController _pageController = PageController();
  int _currentPage = 0;

  final List<Color> _backgroundColors = [
    Color.fromRGBO(255, 48, 32, 1),
    const Color.fromARGB(255, 68, 223, 148),
    Colors.orangeAccent,
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          AnimatedContainer(
            duration: Duration(milliseconds: 300),
            color: _backgroundColors[_currentPage],
          ),
          PageView(
            controller: _pageController,
            onPageChanged: (int page) {
              setState(() {
                _currentPage = page;
              });
            },
            children: [
              OnboardingPage(
                title: "İstanbul'a Hoşgeldiniz",
                description:
                    'İstanbul ilçelerindeki mahalle ilişkilerini görselleştirin.',
                image: 'assets/istanbul_sticker_1.png',
                imageHeight: 240,
              ),
              OnboardingPage(
                title: 'Haritayı Keşfedin',
                description: 'Farklı ilçeleri görmek için haritayı kaydırın.',
                image: 'assets/istanbul_sticker_2.png',
                imageHeight: 200,
              ),
              OnboardingPage(
                title: 'Haydi Başlayalım',
                description: 'Keşfetmeye başlamak için butona tıklayın.',
                image: 'assets/istanbul_sticker_3.png',
                imageHeight: 200,
                isLastPage: true,
                onButtonPressed: () {
                  Navigator.pushReplacement(
                    context,
                    MaterialPageRoute(builder: (context) => MainScreen()),
                  );
                },
              ),
            ],
          ),
          Positioned(
            bottom: 20,
            left: 0,
            right: 0,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: List.generate(3, (index) {
                return Container(
                  margin: EdgeInsets.symmetric(horizontal: 4),
                  width: _currentPage == index ? 12 : 8,
                  height: _currentPage == index ? 12 : 8,
                  decoration: BoxDecoration(
                    color: _currentPage == index ? Colors.white : Colors.grey,
                    shape: BoxShape.circle,
                  ),
                );
              }),
            ),
          ),
        ],
      ),
    );
  }
}

class OnboardingPage extends StatelessWidget {
  final String title;
  final String description;
  final String image;
  final double imageHeight;
  final bool isLastPage;
  final VoidCallback? onButtonPressed;

  const OnboardingPage({
    required this.title,
    required this.description,
    required this.image,
    required this.imageHeight,
    this.isLastPage = false,
    this.onButtonPressed,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Image.asset(image, height: imageHeight),
        SizedBox(height: 20),
        Stack(
          children: [
            Text(
              title,
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
                foreground: Paint()
                  ..style = PaintingStyle.stroke
                  ..strokeWidth = 2
                  ..color = Colors.black,
              ),
            ),
            Text(
              title,
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
                color: Colors.white,
              ),
            ),
          ],
        ),
        SizedBox(height: 10),
        Stack(
          children: [
            Text(
              description,
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: 16,
                foreground: Paint()
                  ..style = PaintingStyle.stroke
                  ..strokeWidth = 2.5
                  ..color = Colors.grey[900]!,
              ),
            ),
            Text(
              description,
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: 16,
                color: Colors.white,
              ),
            ),
          ],
        ),
        if (isLastPage)
          Padding(
            padding: const EdgeInsets.only(top: 10),
            child: ElevatedButton(
              onPressed: onButtonPressed,
              child: Text('Keşfetmeye Başla'),
            ),
          ),
      ],
    );
  }
}

class MainScreen extends StatefulWidget {
  @override
  _MainScreenState createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  bool _showImage = true;
  Color _backgroundColor = Colors.grey[200]!;
  double _scale = 1.0;
  double _previousScale = 1.0;
  Offset _offset = Offset(-40, -40); // Offset to shift all buttons and lines

  @override
  Widget build(BuildContext context) {
    final districts = {
      '1': 'Esenyurt',
      '2': 'K.Cekmece',
      '3': 'Pendik',
      '4': 'Umraniye',
      '5': 'Bagcilar',
      '6': 'Bahcelie.',
      '7': 'SultanG.',
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
      '21': 'SultanB.',
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
      '5': Offset(425, 250),
      '6': Offset(438, 282),
      '7': Offset(439, 187),
      '8': Offset(647, 270),
      '9': Offset(580, 225),
      '10': Offset(375, 195),
      '11': Offset(680, 210),
      '12': Offset(465, 210),
      '13': Offset(680, 295),
      '14': Offset(575, 255),
      '15': Offset(515, 190),
      '16': Offset(365, 290),
      '17': Offset(448, 228),
      '18': Offset(467, 140),
      '19': Offset(620, 245),
      '20': Offset(318, 338),
      '21': Offset(720, 235),
      '22': Offset(510, 263),
      '23': Offset(512, 87),
      '24': Offset(290, 120),
      '25': Offset(700, 120),
      '26': Offset(780, 270),
      '27': Offset(495, 287),
      '28': Offset(230, 290),
      '29': Offset(465, 265),
      '30': Offset(473, 238),
      '31': Offset(520, 155),
      '32': Offset(620, 100),
      '33': Offset(50, 220),
      '34': Offset(435, 314),
      '35': Offset(520, 232),
      '36': Offset(542, 190),
      '37': Offset(120, 100),
      '38': Offset(810, 45),
      '39': Offset(590, 350),
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
      '18': Size(46, 46),
      '19': Size(30, 30),
      '20': Size(40, 40),
      '21': Size(36, 36),
      '22': Size(28, 28),
      '23': Size(40, 40),
      '24': Size(70, 70),
      '25': Size(55, 55),
      '26': Size(60, 60),
      '27': Size(20, 20),
      '28': Size(55, 55),
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
      '28': Colors.amber,
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

    final neighbors = {
      '1': ['16', '20', '28', '10', '24'],
      '2': ['16', '10', '34', '5', '6'],
      '3': ['26', '13', '21', '11', '25', '38'],
      '4': ['9', '19', '11', '25', '32'],
      '5': ['10', '2', '6', '29', '17'],
      '6': ['5', '34', '2', '29'],
      '7': ['10', '5', '12', '18'],
      '8': ['14', '19', '11', '13'],
      '9': ['14', '19', '4', '32', '36', '35', '22'],
      '10': ['24', '1', '16', '2', '5', '17', '7', '18'],
      '11': ['3', '21', '13', '8', '19', '4', '25'],
      '12': ['18', '7', '30', '17'],
      '13': ['3', '21', '11', '8', '39'],
      '14': ['9', '19', '8'],
      '15': ['18', '31', '36', '35'],
      '16': ['20', '1', '10', '2'],
      '17': ['10', '5', '29', '30', '12', '7', '27'],
      '18': ['24', '7', '10', '23', '31', '15', '35', '22', '30', '12', '27'],
      '19': ['14', '9', '4', '11', '8'],
      '20': ['1', '28', '16'],
      '21': ['11', '3', '13'],
      '22': ['9', '35', '18', '27'],
      '23': ['18', '31', '36', '32'],
      '24': ['37', '28', '1', '10', '18'],
      '25': ['32', '4', '11', '3', '38'],
      '26': ['3'],
      '27': ['34', '29', '17', '30', '18', '22'],
      '28': ['33', '37', '24', '1', '20'],
      '29': ['5', '6', '27', '17', '34'],
      '30': ['17', '12', '18', '27'],
      '31': ['18', '23', '36', '15', '35'],
      '32': ['38', '25', '4', '9', '23'],
      '33': ['37', '28', '24'],
      '34': ['29', '2', '6', '27'],
      '35': ['31', '15', '18', '22', '9', '36'],
      '36': ['35', '31', '15', '23', '9'],
      '37': ['33', '28', '24'],
      '38': ['32', '25', '3'],
      '39': ['13']
    };

    return Scaffold(
      body: GestureDetector(
        onScaleStart: (ScaleStartDetails details) {
          _previousScale = _scale;
          setState(() {});
        },
        onScaleUpdate: (ScaleUpdateDetails details) {
          _scale = _previousScale * details.scale;
          setState(() {});
        },
        onScaleEnd: (ScaleEndDetails details) {
          _previousScale = 1.0;
          setState(() {});
        },
        child: Stack(
          children: [
            _showImage
                ? Positioned.fill(
                    child: Transform.translate(
                      offset: Offset(25, -90),
                      child: Transform.scale(
                        scale: 1.35, // Slightly zoom in
                        child: Transform.rotate(
                          angle: -15 * 3.141592653589793 / 180,
                          child: FittedBox(
                            fit: BoxFit.cover,
                            child: Image.asset(
                              'assets/istanbulMap.jpg',
                            ),
                          ),
                        ),
                      ),
                    ),
                  )
                : Container(color: _backgroundColor),
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
            CustomPaint(
              size: Size.infinite,
              painter: LinePainter(positions, neighbors, sizes, _offset),
            ),
            ...districts.entries.map((entry) {
              final position = positions[entry.key]! + _offset;
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
                      side: BorderSide(color: Colors.black, width: 0.6),
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
                                ..strokeWidth = 1.5
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
            Positioned(
              bottom: 20,
              right: 20,
              child: FloatingActionButton(
                onPressed: () {
                  setState(() {
                    _showImage = !_showImage;
                    if (!_showImage) {
                      _backgroundColor =
                          Colors.blue; // Change this to any color you want
                    }
                  });
                },
                child: Icon(Icons.map),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class LinePainter extends CustomPainter {
  final Map<String, Offset> positions;
  final Map<String, List<String>> neighbors;
  final Map<String, Size> sizes;
  final Offset offset;
  final double lineWidth;
  final Color lineColor;

  LinePainter(this.positions, this.neighbors, this.sizes, this.offset,
      {this.lineWidth = 1.5, this.lineColor = Colors.black});

  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()
      ..color = lineColor
      ..strokeWidth = lineWidth
      ..style = PaintingStyle.stroke;

    neighbors.forEach((key, neighborList) {
      final start = positions[key]! +
          Offset(sizes[key]!.width / 2, sizes[key]!.height / 2) +
          offset;
      for (var neighbor in neighborList) {
        final end = positions[neighbor]! +
            Offset(sizes[neighbor]!.width / 2, sizes[neighbor]!.height / 2) +
            offset;
        canvas.drawLine(start, end, paint);
      }
    });
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return false;
  }
}

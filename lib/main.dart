import 'package:flutter/material.dart';
import 'next_page/next_page.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(debugShowCheckedModeBanner: false, home: MyAppExt());
  }
}

class MyAppExt extends StatefulWidget {
  const MyAppExt({super.key});

  @override
  State<MyAppExt> createState() => _MyAppExtState();
}

class _MyAppExtState extends State<MyAppExt> {
  String buttonContent = 'Click';
  int currentIndex = 0;
  bool _isClicked = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'App Title',
          style: TextStyle(
            color: Colors.white, // Change text color if needed
            fontSize: 20, // Change font size if needed
            fontWeight: FontWeight.bold, // Change font weight if needed
          ),
        ),
        backgroundColor:
            Colors.blue, // Ensure this is the correct shade of blue
      ),
      body: Center(
        child: currentIndex == 0
            ? Container(
                width: double.maxFinite,
                height: double.maxFinite,
                color: Colors.red,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    ElevatedButton(
                      onPressed: () {
                        setState(() {
                          buttonContent = 'Clicked';
                        });
                      },
                      child: Text(
                        buttonContent,
                        style: TextStyle(
                          color: Colors.white, // Text color
                          fontSize: 16, // Font size
                        ),
                      ),
                      style: ElevatedButton.styleFrom(
                        foregroundColor: Colors.white,
                        backgroundColor: Colors.blue,
                        shape: RoundedRectangleBorder(),
                      ),
                    ),
                    ElevatedButton(
                      onPressed: () {
                        Navigator.of(context).push(MaterialPageRoute(
                          builder: (context) => const NextPage(),
                        ));
                      },
                      child: const Text(
                        'Next Page',
                        style: TextStyle(
                          color: Colors.white, // Text color
                          fontSize: 16, // Font size
                        ),
                      ),
                      style: ElevatedButton.styleFrom(
                        foregroundColor: Colors.white,
                        backgroundColor: Colors.blue,
                        shape: RoundedRectangleBorder(),
                      ),
                    ),
                  ],
                ),
              )
            : GestureDetector(
                onTap: () {
                  setState(() {
                    _isClicked = !_isClicked;
                  });
                }, child: _isClicked ? Image.asset('images/Lotus_flower.jpg'): Image.network('https://images.all-free-download.com/images/graphiclarge/forest_513174.jpg')),
      ),
      bottomNavigationBar: BottomNavigationBar(
        // backgroundColor: Colors.blue, // Set the background color
        selectedItemColor: Colors.blue,
        // Set the color of the selected item
        unselectedItemColor: Colors.grey,
        // Set the
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.settings),
            label: 'Settings',
          ),
        ],
        currentIndex: currentIndex,
        onTap: (int index) {
          setState(() {
            currentIndex = index;
          });
        },
      ),
    );
  }
}


import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

// Root widget of the app
class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Row + Expanded Demo',
      debugShowCheckedModeBanner: false,
      home: RowExpandedExample(),
    );
  }
}

// Main screen with stateful navigation
class RowExpandedExample extends StatefulWidget {
  const RowExpandedExample({super.key});

  @override
  State<RowExpandedExample> createState() => _RowExpandedExampleState();
}

class _RowExpandedExampleState extends State<RowExpandedExample> {
  int selectedIndex = 0; // This helps us know which tab is active

  // Adding content to each tab
  final List<Widget> pages = [
    Center(
      child: Text(
        "🏠 Home Content\nHere you can show recent posts or updates.",
        textAlign: TextAlign.center,
        style: TextStyle(fontSize: 20),
      ),
    ),
    Center(
      child: Text(
        "🔍 Search Content\nThis could be a search bar and results area.",
        textAlign: TextAlign.center,
        style: TextStyle(fontSize: 20),
      ),
    ),
    Center(
      child: Text(
        "👤 Profile Content\nUser details and settings go here.",
        textAlign: TextAlign.center,
        style: TextStyle(fontSize: 20),
      ),
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Row + Expanded Example"), centerTitle: true),
      body: pages[selectedIndex], // To show active page content
      bottomNavigationBar: Container(
        height: 60,
        color: Colors.grey[200],
        child: Row(
          // Attribute 1
          children: [
            buildNavItem("Home", 0, Colors.red),
            buildNavItem("Search", 1, Colors.green),
            buildNavItem("Profile", 2, Colors.blue),
          ],
        ),
      ),
    );
  }

  Expanded buildNavItem(String label, int index, Color color) {
    return Expanded(
      // Attribute 2
      child: InkWell(
        onTap: () {
          setState(() {
            selectedIndex = index; // To update active tab
          });
        },
        child: Container(
          // Attribute 3
          color: selectedIndex == index
              // ignore: deprecated_member_use
              ? color.withOpacity(0.7)
              : color,
          child: Center(
            child: Text(
              label,
              style: TextStyle(color: Colors.white, fontSize: 16),
            ),
          ),
        ),
      ),
    );
  }
}

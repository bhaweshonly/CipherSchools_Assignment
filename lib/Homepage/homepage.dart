import 'package:cipherschools_flutter_assignment/Homepage/expense.dart';
import 'package:flutter/material.dart';
import 'home_content1.dart';
import 'package:cipherschools_flutter_assignment/profile/profile.dart';
import 'package:cipherschools_flutter_assignment/Homepage/Income.dart';
const MaterialColor customPurple = MaterialColor(
  0xFF5E3EE7,
  <int, Color>{
    50: Color(0xFFE9E4FB),
    100: Color(0xFFC9BFF3),
    200: Color(0xFFA498EA),
    300: Color(0xFF7E70E2),
    400: Color(0xFF654FE0),
    500: Color(0xFF5E3EE7),
    600: Color(0xFF4F35CD),
    700: Color(0xFF402DB2),
    800: Color(0xFF322498),
    900: Color(0xFF241C7D),
  },
);
class Homepage extends StatefulWidget {
  @override
  _HomepageState createState() => _HomepageState();
}

class _HomepageState extends State<Homepage> {
  int _selectedIndex = 0;

  // Move balance, income, and expenses to the state class
  int balance = 0;  // You can set initial values here
  int income = 0;
  int expenses = 0;
List<Widget>_pages=[];
  // List of pages
  void initState() {
    super.initState();

    // Initialize _pages in initState()
    _pages = [
      // Pass the state variables directly to HomeContent
    HomeContent(),
      Center(child: Text("Transaction Page")),
      ExpenseScreen(),
      ProfilePage(),
    ];
  }


  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  void _onFabPressed() {
    setState(() {
      // Example action: Increase balance, income, and expenses when FAB is pressed
      balance += 0;
      income += 0;
      expenses += 0;
    });

    // You can show a dialog or update something else as needed
    showDialog(
      context: context,
      builder: (_) => AlertDialog(
        actions: [
          TextButton(
            child: Text("OK"),
            onPressed: () {
              Navigator.of(context).pop(); // Close the dialog first
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => Income()),
              );
            },
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Container(
                    height: 40,
                    width: 40,
                    decoration: BoxDecoration(
                      color: Colors.white,
                      shape: BoxShape.circle,
                      border: Border.all(color: customPurple.shade200, width: 2),
                    ),
                    child: IconButton(
                      icon: Icon(Icons.person, color: customPurple.shade200),
                      onPressed: () {},
                      iconSize: 20,
                    ),
                  ),
                  Container(
                    padding: EdgeInsets.symmetric(horizontal: 16, vertical: 10),
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(30),
                      border: Border.all(color: Colors.grey.shade300),
                    ),
                    child: Row(
                      children: [
                        Text(
                          'October',
                          style: TextStyle(
                            fontSize: 16,
                            color: Colors.black,
                          ),
                        ),
                        SizedBox(width: 8),
                        Icon(Icons.keyboard_arrow_down_rounded, color: Colors.black),
                      ],
                    ),
                  ),
                  IconButton(
                    icon: Icon(Icons.notifications, color: customPurple.shade300),
                    onPressed: () {},
                  ),
                ],
              ),
            ),
            Expanded(child: _pages[_selectedIndex]),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _onFabPressed,
        backgroundColor: customPurple.shade300,
        shape: CircleBorder(),
        child: Icon(Icons.add, size: 32, color: Colors.white),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      bottomNavigationBar: BottomAppBar(
        shape: CircularNotchedRectangle(),
        notchMargin: 8.0,
        child: Container(
          height: 70,
          padding: EdgeInsets.symmetric(horizontal: 12),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                children: [
                  _buildTabIcon(Icons.home, "Home", 0),
                  SizedBox(width: 20),
                  _buildTabIcon(Icons.swap_horiz, "Transaction", 1),
                ],
              ),
              Row(
                children: [
                  _buildTabIcon(Icons.pie_chart, "Budget", 2),
                  SizedBox(width: 20),
                  _buildTabIcon(Icons.person, "Profile", 3),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildTabIcon(IconData icon, String label, int index) {
    final isSelected = _selectedIndex == index;
    return GestureDetector(
      onTap: () => _onItemTapped(index),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(
            icon,
            color: isSelected ? customPurple : Colors.grey,
            size: 26,
          ),
          SizedBox(height: 4),
          Text(
            label,
            style: TextStyle(
              color: isSelected ? customPurple : Colors.grey,
              fontSize: 12,
            ),
          )
        ],
      ),
    );
  }
}

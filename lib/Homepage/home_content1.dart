  import 'package:cipherschools_flutter_assignment/Homepage/expense.dart';
import 'package:flutter/material.dart';
import 'dart:developer';
  import 'package:cipherschools_flutter_assignment/Homepage/home_content1.dart';
  class Transaction {
    final String title;
    final String subtitle;
    final int amount;
    final IconData icon;
    final Color iconColor;
    final Color bgColor;
    final String time;

    Transaction({
      required this.title,
      required this.subtitle,
      required this.amount,
      required this.icon,
      required this.iconColor,
      required this.bgColor,
      required this.time,
    });
  }

  class HomeContent extends StatefulWidget {
    const HomeContent({super.key});

    @override
    State<HomeContent> createState() => _HomeContentState();
  }

  class _HomeContentState extends State<HomeContent> {
    int?receivedAmount;
    void _navigateAndGetAmount() async {
      final result = await Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => ExpenseScreen()),
      );

      if (result != null && result is int) {
        setState(() {
          receivedAmount = result; // Save the amount
        });
      }
    }


    String selectedTab = "Today";
    final List<String> tabs = ["Today", "Week", "Month", "Year"];
    int _selectedIndex=0;
    int _incomeAmount=0;
    void _openExpenseScreen() async {
      final result = await Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => ExpenseScreen()),
      );
    }

    void _onItemTapped(int index) {
      setState(() {
        _selectedIndex = index;
      });
    }
    int balance = 0;
    int income = 0;
    int expenses = 0;

    List<Transaction> transactions = [];

    @override
    void initState() {
      super.initState();

      // Optional: Preload with sample data
      addExpense(Transaction(
        title: 'Shopping',
        subtitle: 'Buy some grocery',
        amount: 120,
        icon: Icons.shopping_bag,
        iconColor: Colors.orange,
        bgColor: Colors.orange.shade100,
        time: '10:00 AM',
      ));

      addExpense(Transaction(
        title: 'Subscription',
        subtitle: 'Disney+ Annual..',
        amount: 499,
        icon: Icons.receipt_long,
        iconColor: Colors.purple,
        bgColor: Colors.purple.shade100,
        time: '03:30 PM',
      ));

      addExpense(Transaction(
        title: 'Travel',
        subtitle: 'Chandigarh to Del...',
        amount: 1000,
        icon: Icons.directions_car,
        iconColor: Colors.blue,
        bgColor: Colors.blue.shade100,
        time: '10:00 AM',
      ));
    }

    void addExpense(Transaction transaction) {
      setState(() {
        transactions.add(transaction);
        expenses += transaction.amount;
        balance -= transaction.amount;
      });
    }

    void addIncome(int amount) {
      setState(() {
        income += amount;
        balance += amount;
      });
    }

    @override
    Widget build(BuildContext context) {
      return SingleChildScrollView(
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            SizedBox(height: 20),
            Text("Account Balance",
                style: TextStyle(fontSize: 16, color: Colors.grey)),
            SizedBox(height: 8),
            Text( receivedAmount != null ? "₹$receivedAmount" : "0",
                style: TextStyle(
                    fontSize: 36,
                    fontWeight: FontWeight.bold,
                    color: Colors.black)),
            SizedBox(height: 24),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Expanded(
                  child: Container(
                    padding: EdgeInsets.symmetric(vertical: 16),
                    decoration: BoxDecoration(
                      color: Colors.green,
                      borderRadius: BorderRadius.circular(20),
                    ),
                    child: Column(
                      children: [
                        Icon(Icons.download, color: Colors.white, size: 28),
                        SizedBox(height: 8),
                        Text("Income",
                            style: TextStyle(color: Colors.white, fontSize: 14)),
                        SizedBox(height: 4),
                        Text("₹0",
                            style: TextStyle(
                                color: Colors.white,
                                fontSize: 16,
                                fontWeight: FontWeight.bold)),
                      ],
                    ),
                  ),
                ),
                SizedBox(width: 16),
                Expanded(
                  child: Container(
                    padding: EdgeInsets.symmetric(vertical: 16),
                    decoration: BoxDecoration(
                      color: Colors.red,
                      borderRadius: BorderRadius.circular(20),
                    ),
                    child: Column(
                      children: [
                        Icon(Icons.upload, color: Colors.white, size: 28),
                        SizedBox(height: 8),
                        Text("Expenses",
                            style: TextStyle(color: Colors.white, fontSize: 14)),
                        SizedBox(height: 4),
                        Text("₹$expenses",
                            style: TextStyle(
                                color: Colors.white,
                                fontSize: 16,
                                fontWeight: FontWeight.bold)),
                      ],
                    ),
                  ),
                ),
              ],
            ),
            SizedBox(height: 24),
            Container(
              height: 40,
              decoration: BoxDecoration(
                color: Colors.grey.shade100,
                borderRadius: BorderRadius.circular(30),
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: tabs.map((tab) {
                  final isSelected = selectedTab == tab;
                  return GestureDetector(
                    onTap: () {
                      setState(() {
                        selectedTab = tab;
                      });
                    },
                    child: Container(
                      padding: EdgeInsets.symmetric(horizontal: 16),
                      alignment: Alignment.center,
                      decoration: BoxDecoration(
                        color: isSelected
                            ? Colors.orange.shade100
                            : Colors.transparent,
                        borderRadius: BorderRadius.circular(20),
                      ),
                      child: Text(
                        tab,
                        style: TextStyle(
                          fontSize: 14,
                          color: isSelected ? Colors.orange : Colors.grey,
                          fontWeight:
                          isSelected ? FontWeight.bold : FontWeight.normal,
                        ),
                      ),
                    ),
                  );
                }).toList(),
              ),
            ),
            SizedBox(height: 24),

            // 🔁 Recent Transactions
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  'Recent Transaction',
                  style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                ),
                TextButton(
                  onPressed: () {
        final homepageState = context.findAncestorStateOfType<_HomeContentState>();
        if (homepageState != null) {
          homepageState._onItemTapped(1);  // This will select the "Transaction" tab
        }
      },
                  child: Text('See All', style: TextStyle(color: Colors.deepPurple)),
                ),
              ],
            ),
            ListView.builder(
              itemCount: transactions.length,
              shrinkWrap: true,
              physics: NeverScrollableScrollPhysics(),
              itemBuilder: (context, index) {
                final tx = transactions[index];
                return Container(
                  margin: EdgeInsets.symmetric(vertical: 6),
                  padding: EdgeInsets.all(12),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(20),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.black12,
                        blurRadius: 6,
                        offset: Offset(0, 2),
                      ),
                    ],
                  ),
                  child: Row(
                    children: [
                      Container(
                        padding: EdgeInsets.all(10),
                        decoration: BoxDecoration(
                          color: tx.bgColor,
                          borderRadius: BorderRadius.circular(16),
                        ),
                        child: Icon(tx.icon, color: tx.iconColor),
                      ),
                      SizedBox(width: 12),
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(tx.title,
                                style: TextStyle(
                                    fontSize: 14, fontWeight: FontWeight.w600)),
                            SizedBox(height: 4),
                            Text(tx.subtitle,
                                style:
                                TextStyle(fontSize: 12, color: Colors.grey)),
                          ],
                        ),
                      ),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.end,
                        children: [
                          Text("- ₹${tx.amount}",
                              style: TextStyle(
                                  fontSize: 14,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.red)),
                          SizedBox(height: 4),
                          Text(tx.time,
                              style:
                              TextStyle(fontSize: 12, color: Colors.black54)),
                        ],
                      ),
                    ],
                  ),
                );
              },
            ),
          ],
        ),
      );
    }
  }

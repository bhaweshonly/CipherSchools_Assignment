import 'package:cipherschools_flutter_assignment/Homepage/homepage.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
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
class Income extends StatefulWidget {
  @override
  _IncomeState createState() => _IncomeState();
}

class _IncomeState extends State<Income> {
  final TextEditingController _amountController = TextEditingController();
  final TextEditingController _descriptionController = TextEditingController();

  String? _selectedCategory;
  String? _selectedWallet;

  final List<String> _categories = ['Food', 'Transport', 'Entertainment', 'Shopping'];
  final List<String> _wallets = ['Cash', 'Bank', 'UPI'];

  @override
  void initState() {
    super.initState();
    _amountController.text = '0'; // Default value
  }

  @override
  void dispose() {
    _amountController.dispose();
    _descriptionController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: customPurple.shade300,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        leading: BackButton(color: Colors.white),
        title: Text('Expense', style: TextStyle(color: Colors.white)),
        centerTitle: true,
      ),
      body: Column(
        children: [
          const SizedBox(height: 38),
          Container(
            alignment: Alignment.centerLeft,
            margin: EdgeInsets.only(left:20),
            child: Text(
              'How much?',
              style: TextStyle(color: Colors.white70, fontSize: 16),
            ),
          ),
          SingleChildScrollView(
            child: Container(
              margin: EdgeInsets.only(left:20),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Text('₹',
                      style: TextStyle(color: Colors.white, fontSize: 40, fontWeight: FontWeight.bold)),
                  SizedBox(width: 5),
                  SizedBox(
                    width: 120,
                    child: TextField(
                      controller: _amountController,
                      keyboardType: TextInputType.number,
                      style: TextStyle(color: Colors.white, fontSize: 40, fontWeight: FontWeight.bold),
                      decoration: InputDecoration(border: InputBorder.none),
                      textAlign: TextAlign.start,
                    ),
                  ),
                ],
              ),
            ),
          ),
          const SizedBox(height: 40),
          Expanded(
            child: Container(
              padding: EdgeInsets.all(16),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.vertical(top: Radius.circular(30)),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  DropdownButtonFormField<String>(
                    value: _selectedCategory,
                    hint: Text('Category'),
                    items: _categories
                        .map((cat) => DropdownMenuItem(value: cat, child: Text(cat)))
                        .toList(),
                    onChanged: (value) => setState(() => _selectedCategory = value),
                    decoration: InputDecoration(
                      filled: true,
                      fillColor: Colors.grey.shade100,
                      border: OutlineInputBorder(borderRadius: BorderRadius.circular(12)),
                    ),
                  ),
                  const SizedBox(height: 10),
                  TextField(
                    controller: _descriptionController,
                    decoration: InputDecoration(
                      hintText: 'Description',
                      filled: true,
                      fillColor: Colors.grey.shade100,
                      border: OutlineInputBorder(borderRadius: BorderRadius.circular(12)),
                    ),
                  ),
                  const SizedBox(height: 10),
                  DropdownButtonFormField<String>(
                    value: _selectedWallet,
                    hint: Text('Wallet'),
                    items: _wallets
                        .map((wallet) => DropdownMenuItem(value: wallet, child: Text(wallet)))
                        .toList(),
                    onChanged: (value) => setState(() => _selectedWallet = value),
                    decoration: InputDecoration(
                      filled: true,
                      fillColor: Colors.grey.shade100,
                      border: OutlineInputBorder(borderRadius: BorderRadius.circular(12)),
                    ),
                  ),
                  Spacer(),
                  ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      backgroundColor: customPurple.shade300,
                      padding: EdgeInsets.symmetric(vertical: 16),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(12),
                      ),
                    ),
                    onPressed: () {
                      final amount = int.tryParse(_amountController.text.trim()) ?? 0;
                      if (amount > 0) {
                        Navigator.pop(context, amount);
                        Navigator.push(context,MaterialPageRoute(builder: (context)=>Homepage()));
                        // 👈 send income back
                      } else {
                        // Optional: show error
                        ScaffoldMessenger.of(context).showSnackBar(
                          SnackBar(content: Text("Please enter a valid amount")),
                        );
                      }
                    },
                    child: Text('Continue', style: TextStyle(fontSize: 16,color: Colors.white)),
                  )
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}


import 'package:flutter/material.dart';

class HomePagee extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePagee> {
  bool _isSelectionMode = false;
  List<bool> _isSelected = List.generate(20, (_) => false);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('GridView with Selection'),
        actions: [
          IconButton(
            icon: Icon(_isSelectionMode ? Icons.check : Icons.select_all),
            onPressed: () {
              setState(() {
                _isSelectionMode = !_isSelectionMode;
              });
            },
          ),
        ],
      ),
      body: GridView.builder(
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 3,
          crossAxisSpacing: 4.0,
          mainAxisSpacing: 4.0,
        ),
        itemCount: 20,
        itemBuilder: (BuildContext context, int index) {
          return GestureDetector(
            onTap: () {
              setState(() {
                if (_isSelectionMode) {
                  _isSelected[index] = !_isSelected[index];
                }
              });
            },
            child: Stack(
              children: [
                Container(
                  color: _isSelected[index] ? Colors.blue.withOpacity(0.5) : Colors.transparent,
                  child: Center(
                    child: Text('Item $index'),
                  ),
                ),
                if (_isSelectionMode && _isSelected[index])
                  Positioned(
                    bottom: 4,
                    right: 4,
                    child: IconButton(
                      icon: const Icon(Icons.check_circle),
                      onPressed: () {
                        setState(() {
                          _isSelected[index] = !_isSelected[index];
                        });
                      },
                    ),
                  ),
              ],
            ),
          );
        },
      ),
    );
  }
}
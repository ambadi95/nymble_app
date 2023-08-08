import 'package:flutter/material.dart';

class CircularCard extends StatelessWidget {
  final String label;
  final String? image;
  const CircularCard({
    super.key,
    required this.label,
    this.image = 'http',
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(12.0),
      child: Column(
        children: [
          Container(
              height: 100,
              width: 100,
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(100),
              ),
              child: Center(
                  child: Image.network(image!, errorBuilder:
                      (BuildContext context, Object exception,
                          StackTrace? stackTrace) {
                return const Center(
                    child: Icon(
                  Icons.close,
                  size: 40,
                ));
              }))),
          const SizedBox(
            height: 10,
          ),
          Center(
              child: Text(
            label,
            style: const TextStyle(fontSize: 14, fontWeight: FontWeight.bold),
          )),
        ],
      ),
    );
  }
}

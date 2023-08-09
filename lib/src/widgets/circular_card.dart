import 'package:flutter/material.dart';

class CircularCard extends StatelessWidget {
  final String label;
  final String? image;
  final double? padding;
  final double? borderRadius;
  const CircularCard(
      {super.key,
      required this.label,
      this.image = 'http',
      this.borderRadius,
      this.padding});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(padding!),
      child: Column(
        children: [
          Container(
              height: 120,
              width: 120,
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(borderRadius!),
              ),
              child: Center(
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(borderRadius!),
                    child: Image.network(image!,
                        errorBuilder:
                        (BuildContext context, Object exception,
                            StackTrace? stackTrace) {
                return const Center(
                      child: Icon(
                    Icons.close,
                    size: 40,
                ));
              }),
                  ))),
          const SizedBox(
            height: 10,
          ),
          Center(
              child: SizedBox(
            width: 100,
            child: Text(
              label,
              textAlign: TextAlign.center,
              style: const TextStyle(
                fontSize: 14,
                fontWeight: FontWeight.bold,
              ),
            ),
          )),
        ],
      ),
    );
  }
}

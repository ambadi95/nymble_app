import 'package:flutter/material.dart';

class SquareCard extends StatelessWidget {
  final String label;
  final String? image;
  final double? padding;
  final double? borderRadius;
  const SquareCard(
      {super.key,
      required this.label,
      this.image = 'http',
      this.borderRadius,
      this.padding});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(padding!),
      child: Container(
          width: 100,
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(borderRadius!),
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SizedBox(
                height: 75,
                child: Center(
                    child: Image.network(image!, errorBuilder:
                        (BuildContext context, Object exception,
                            StackTrace? stackTrace) {
                  return const Center(
                      child: Icon(
                    Icons.close,
                    size: 40,
                  ));
                })),
              ),
              const SizedBox(
                height: 20,
              ),
              Center(
                  child: Text(
                label,
                style: const TextStyle(
                    fontSize: 14,
                    fontWeight: FontWeight.bold,
                    color: Colors.black),
              )),
            ],
          )),
    );
  }
}

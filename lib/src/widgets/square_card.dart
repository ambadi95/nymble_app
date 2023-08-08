import 'package:flutter/material.dart';

class SquareCard extends StatelessWidget {
  final String label;
  final String? image;

  const SquareCard({
    super.key,
    required this.label,
    this.image = 'http',
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(12.0),
      child: Container(
          width: 100,
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(10),
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SizedBox(
                height: 75,
                child: Center(
                    child: Image.network(image!,
                        errorBuilder:
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

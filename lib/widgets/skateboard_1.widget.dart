import 'dart:math' as math;
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../provider/providers.dart';

class Skateboard1Widget extends StatelessWidget {
  const Skateboard1Widget({
    super.key,
    required this.image,
    required this.title,
    required this.description,
  });

  final String image;
  final String title;
  final String description;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        SizedBox(
          height: 500.0,
          child: Stack(
            alignment: Alignment.center,
            children: [
              Consumer<OffsetNotifier>(
                builder: (context, notifier, child) {
                  return Transform.scale(
                    scale: math.max(0, 1 - notifier.page), // multiplier
                    child: child,
                  );
                },
                child: Container(
                  height: 340.0,
                  width: 340.0,
                  decoration: const BoxDecoration(
                    color: Colors.white,
                    shape: BoxShape.circle,
                  ),
                ),
              ),
              Consumer<OffsetNotifier>(
                builder: (context, notifier, child) {
                  return Transform.rotate(
                    angle: math.max(0, (math.pi / 3) * 4 * notifier.page),
                    child: Opacity(
                      opacity: math.max(0, math.max(0, 1 - notifier.page)),
                      child: child,
                    ),
                  );
                },
                child: Image.asset(image),
              ),
            ],
          ),
        ),
        const SizedBox(height: 20.0),
        Consumer<OffsetNotifier>(
          builder: (context, notifier, child) {
            return Opacity(
              opacity: math.max(0, 1 - 4 * notifier.page),
              child: child,
            );
          },
          child: Column(
            children: [
              Text(
                title,
                style: const TextStyle(
                  fontSize: 24.0,
                  fontWeight: FontWeight.w500,
                ),
              ),
              const SizedBox(height: 16.0),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 28.0),
                child: Text(
                  description,
                  textAlign: TextAlign.center,
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}

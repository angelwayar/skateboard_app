import 'dart:math' as math;
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../provider/providers.dart';

class Skateboard2Widget extends StatelessWidget {
  const Skateboard2Widget({
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
                  late double multiplier;
                  if (notifier.page <= 1) {
                    multiplier = math.max(0, 4 * notifier.page - 3);
                  } else {
                    multiplier = math.max(0, 1 - (4 * notifier.page - 4));
                  }
                  return Transform.scale(
                    scale: multiplier, // multiplier
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
                  late double multiplier;
                  if (notifier.page <= 1) {
                    multiplier = math.max(0, 4 * notifier.page - 3);
                  } else {
                    multiplier = math.max(0, 1 - (4 * notifier.page - 4));
                  }
                  return Transform.translate(
                    offset: Offset(0, -50 * (1 - multiplier)),
                    child: Opacity(
                      opacity: multiplier,
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
            late double multiplier;
            if (notifier.page <= 1) {
              multiplier = math.max(0, 4 * notifier.page - 3);
            } else {
              multiplier = math.max(0, 1 - (4 * notifier.page - 4));
            }
            return Opacity(
              opacity: multiplier,
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

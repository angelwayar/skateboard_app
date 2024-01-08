import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../provider/providers.dart';

class _Indicator extends StatelessWidget {
  const _Indicator({super.key, required this.isActive});

  final bool isActive;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 10.0,
      width: 10.0,
      margin: const EdgeInsets.only(left: 12.0),
      decoration: BoxDecoration(
        color: isActive ? Colors.black : Colors.transparent,
        shape: BoxShape.circle,
        border: Border.all(color: Colors.black, width: 1),
      ),
    );
  }
}

class PageIndicator extends StatefulWidget {
  const PageIndicator({super.key, required this.quantity});

  final int quantity;

  @override
  State<PageIndicator> createState() => _PageIndicatorState();
}

class _PageIndicatorState extends State<PageIndicator> {
  @override
  void didUpdateWidget(covariant PageIndicator oldWidget) {
    super.didUpdateWidget(oldWidget);
  }

  @override
  Widget build(BuildContext context) {
    final currentIndex = context.read<IndexNotifier>().index;

    List<Widget> buildIndicator() {
      List<Widget> indicators = [];

      for (int i = 0; i < widget.quantity; i++) {
        indicators.add(
          _Indicator(isActive: i == currentIndex ? true : false),
        );
      }

      return indicators;
    }

    return Padding(
      padding: const EdgeInsets.only(left: 18.0),
      child: Row(
        children: buildIndicator(),
      ),
    );
  }
}

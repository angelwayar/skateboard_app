import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../provider/providers.dart';
import '../widgets/widgets.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  late final PageController pageController;

  @override
  void initState() {
    pageController = PageController();

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => OffsetNotifier(pageController),
      child: Scaffold(
        backgroundColor: const Color(0xFFF2F2F2),
        body: Column(
          children: [
            Padding(
              padding: const EdgeInsets.fromLTRB(20, 16, 20, 10),
              child: Row(
                children: [
                  const Text(
                    'Hops',
                    style: TextStyle(
                      fontSize: 22.0,
                      fontFamily: 'Graphik',
                      fontWeight: FontWeight.w800,
                    ),
                  ),
                  Stack(
                    children: [
                      IconButton(
                        onPressed: () {},
                        icon: const Icon(Icons.shopping_bag),
                      ),
                      Positioned(
                        right: 10.0,
                        bottom: 8.0,
                        child: Container(
                          height: 12.0,
                          width: 12.0,
                          decoration: const BoxDecoration(
                            color: Colors.white,
                            shape: BoxShape.circle,
                          ),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
            Expanded(
              child: PageView(
                controller: pageController,
                onPageChanged: (int index) {
                  context.read<IndexNotifier>().index = index;
                },
                children: const [
                  Skateboard1Widget(
                    image: 'assets/board1.png',
                    title: 'Skateboard 1',
                    description: 'Skateboard 1',
                  ),
                  Skateboard2Widget(
                    image: 'assets/board2.png',
                    title: 'Skateboard 2',
                    description: 'Skateboard 2',
                  ),
                  Skateboard3Widget(
                    image: 'assets/board3.png',
                    title: 'Skateboard 3',
                    description: 'Skateboard 3',
                  ),
                ],
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const PageIndicator(quantity: 3),
                const Text(
                  'View Board',
                  style: TextStyle(
                    fontWeight: FontWeight.w400,
                    letterSpacing: 3,
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(right: 45.0),
                  child: IconButton(
                    onPressed: () {},
                    icon: const Icon(
                      Icons.arrow_forward,
                      size: 11.0,
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

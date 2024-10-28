import 'package:flutter/material.dart';

class GridContainer extends StatefulWidget {
  final Size size;
  final List<String> images;
  final List<String> gifs;

  const GridContainer({Key? key, required this.size, required this.images, required this.gifs}) : super(key: key);

  @override
  GridContainerState createState() => GridContainerState();
}

class GridContainerState extends State<GridContainer> {
  List<bool> hoverStates = List.generate(16, (_) => false);
  late List<dynamic> mixedContent;

  @override
  void initState() {
    super.initState();
    // Mix gifs and images
    mixedContent = [...widget.gifs, ...widget.images];
    mixedContent.shuffle();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(right: 5),
      height: 550,
      width: widget.size.width * 0.45,
      decoration: BoxDecoration(
        color: Colors.red.withOpacity(0.22),
        borderRadius: BorderRadius.circular(8),
      ),
      child: GridView.builder(
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 4,
          childAspectRatio: 1,
        ),
        itemCount: mixedContent.length,
        itemBuilder: (context, index) {
          return MouseRegion(
            onEnter: (_) => setState(() {
              hoverStates[index] = true;
            }),
            onExit: (_) => setState(() {
              hoverStates[index] = false;
            }),
            child: AnimatedContainer(
              duration: const Duration(milliseconds: 200),
              decoration: BoxDecoration(
                border: Border.all(color: Colors.white, width: 1),
                borderRadius: BorderRadius.circular(hoverStates[index] ? 12 : 0),
                boxShadow: hoverStates[index]
                    ? [BoxShadow(color: Colors.black.withOpacity(0.3), blurRadius: 8, spreadRadius: 2)]
                    : [],
              ),
              child: ClipRRect(
                borderRadius: BorderRadius.circular(hoverStates[index] ? 12 : 0),
                child: Image.asset(
                  mixedContent[index],
                  fit: BoxFit.cover,
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
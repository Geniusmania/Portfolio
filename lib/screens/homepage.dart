import 'dart:async';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:portfolio/screens/contact.dart';
import 'package:portfolio/widgets-functions/animacontainer.dart';
import 'package:portfolio/widgets-functions/animate.dart';
import 'package:page_transition/page_transition.dart';

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  String dateText = "";
  String timeText = "";

  @override
  void initState() {
    super.initState();
    _updateDateTime();
    Timer.periodic(const Duration(seconds: 1), (_) => _updateDateTime());
  }

  void _updateDateTime() {
    if (mounted) {
      setState(() {
        timeText = DateFormat('hh:mm:ss a').format(DateTime.now());
        dateText = DateFormat('dd MMMM, yyyy').format(DateTime.now());
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Container(
          padding: const EdgeInsets.symmetric(
            horizontal: 20,
          ),
          width: MediaQuery.of(context).size.width,
          decoration: const BoxDecoration(
            color: Colors.white,
            image: DecorationImage(
              image: AssetImage('assets/images/me.jpg'),
              fit: BoxFit.cover,
            ),
          ),
          child: Column(
            children: [
              _buildHeader(context),
              SizedBox(height: MediaQuery.of(context).size.height * .05),
              _buildMainContent(context),
              const SizedBox(height: 40),
              _buildFooter(context),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildHeader(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(20),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          _buildWelcomeText(),
          Flexible(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                _buildNavButton('Services'),
                const SizedBox(width: 5),
                _buildNavButton('About'),
                const SizedBox(width: 5),
                _buildNavButton('Contact'),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildWelcomeText() {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 5),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20),
        color: Colors.black12,
      ),
      child: ShaderMask(
        shaderCallback: (bounds) => const LinearGradient(
          colors: [Colors.red, Colors.orange],
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
        ).createShader(bounds),
        child: Text(
          'Welcome'.toUpperCase(),
          style: const TextStyle(
            fontSize: 25,
            fontWeight: FontWeight.bold,
            color: Colors.white,
          ),
        ),
      ),
    );
  }

  Widget _buildNavButton(String text) {
    return InkWell(
      onTap: () => Navigator.of(context).push(PageTransition(
        childCurrent: widget,
          child: const ContactScreen(),
          type: PageTransitionType.rightToLeftJoined)),
      child: MouseRegion(
        cursor: SystemMouseCursors.click,
        child: Container(
          padding: const EdgeInsets.symmetric(vertical: 5, horizontal: 15),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(17),
            color: Colors.black12,
          ),
          child: Text(
            text,
            style: const TextStyle(
              color: Colors.white,
              fontSize: 18,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildMainContent(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        if (constraints.maxWidth > 800) {
          return _buildWideLayout(context);
        } else {
          return _buildWideLayout(context);
        }
      },
    );
  }

  Widget _buildWideLayout(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Expanded(
          flex: 40,
          child: _buildLeftContainer(context),
        ),
        const SizedBox(width: 15),
        Expanded(
          flex: 60,
          child: _buildRightContainer(context),
        ),
      ],
    );
  }

  // Widget _buildNarrowLayout(BuildContext context) {
  //   return Column(
  //     children: [
  //       _buildLeftContainer(context),
  //       const SizedBox(height: 15),
  //       _buildRightContainer(context),
  //     ],
  //   );
  // }

  Widget _buildLeftContainer(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Container(
      constraints: BoxConstraints(
          maxWidth: MediaQuery.of(context).size.width * 0.4, maxHeight: 450),
      margin: const EdgeInsets.symmetric(horizontal: 5),
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        color: Colors.black26,
        borderRadius: BorderRadius.circular(12),
        boxShadow: [
          BoxShadow(
            color: Colors.white.withOpacity(0.5),
            blurRadius: 10,
            spreadRadius: 2,
          )
        ],
      ),
      child: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            ShaderMask(
              shaderCallback: (bounds) => const LinearGradient(
                colors: [Colors.amber, Colors.cyan],
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
              ).createShader(bounds),
              child: SizedBox(
                width: size.width * 0.45,
                height: size.height * 0.25,
                child: const AnimatedSentence(
                  prefix: 'I ',
                  animatedWords: ['create', 'design', 'develop', 'build'],
                  suffix: ' experiences that\n make life better',
                  textStyle: TextStyle(
                      fontSize: 25,
                      fontWeight: FontWeight.w500,
                      color: Colors.white),
                  animatedTextStyle: TextStyle(
                      fontSize: 32,
                      fontWeight: FontWeight.bold,
                      color: Colors.blue),
                  animationSpeed: Duration(milliseconds: 80),
                  pauseDuration: Duration(seconds: 1),
                ),
              ),
            ),
            const SizedBox(height: 20),
            _buildDescriptionText(),
          ],
        ),
      ),
    );
  }

  Widget _buildDescriptionText() {
    const textStyle = TextStyle(
      color: Colors.white,
      fontSize: 18,
      fontWeight: FontWeight.w500,
    );
    return const Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text('Versatile Flutter Developer specializing in crafting',
            style: textStyle),
        Text('high-performance, cross-platform applications', style: textStyle),
        Text('for mobile, web, and desktop environments.', style: textStyle),
        SizedBox(height: 25),
        Text('Passionate about delivering exceptional user experiences',
            style: textStyle),
        Text('through efficient, scalable, and visually stunning solutions.',
            style: textStyle),
      ],
    );
  }

  Widget _buildRightContainer(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(right: 5),
      height: 450,
      width: MediaQuery.of(context).size.width * 0.6,
      decoration: BoxDecoration(
        color: Colors.transparent.withOpacity(0.22),
        borderRadius: BorderRadius.circular(8),
      ),
      child: GridContainer(
        size: Size(MediaQuery.of(context).size.width * 0.6, 450),
        images: const [
          'assets/images/1.png',
          'assets/images/2.png',
          'assets/images/3.png',
          'assets/images/4.png',
          'assets/images/5.jpg',
          'assets/images/6.jpg',
          'assets/images/7.jpg',
          'assets/images/8.jpg',
          'assets/images/9.jpg',
          'assets/images/10n.png',
          'assets/images/11.png',
          'assets/images/12.png',
          // Your image list...
        ],
        gifs: const [
          'assets/videos/vid.gif',
          'assets/videos/vid1.gif',
          'assets/videos/vid2.gif',
          'assets/videos/vid3.gif',
          // Your video list...
        ],
      ),
    );
  }

  Widget _buildFooter(BuildContext context) {
    // Implement your footer here
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          timeText,
          style: const TextStyle(fontSize: 18, color: Colors.cyan),
        ),
        Text(
          dateText,
          style: const TextStyle(fontSize: 18, color: Colors.cyan),
        )
      ],
    );
  }
}

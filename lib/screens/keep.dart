import 'dart:async';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class Home extends StatefulWidget {
  const Home({super.key});
  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  String dateText = "";
  String timeText = "";

  String formatCurrentLiveTime(DateTime time) {
    return DateFormat('hh:mm:ss a').format(time);
  }

  String formatCurrentDate(DateTime date) {
    return DateFormat('dd MMMM, yyyy').format(date);
  }

  getCurrentLiveTime() {
    final DateTime timeNow = DateTime.now();
    final liveTime = formatCurrentLiveTime(timeNow);
    final liveDate = formatCurrentDate(timeNow);

    if (mounted) {
      setState(() {
        dateText = liveTime;
        timeText = liveDate;
      });
    }
  }

  @override
  void initState() {
    super.initState();
    timeText = formatCurrentLiveTime(DateTime.now());
    dateText = formatCurrentDate(DateTime.now());

    Timer.periodic(const Duration(seconds: 1), (timer) {
      getCurrentLiveTime();
    });
  }

  // Individual hover state for each button
  List<bool> isHovering = [false, false, false, false];

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size; // Get screen size

    return Scaffold(
      backgroundColor: Colors.white,
      body: SingleChildScrollView( // Scroll to avoid vertical overflow
        child: Container(
          width: size.width, // Responsive width
          height: size.height,
          padding: EdgeInsets.symmetric(
            horizontal: size.width * 0.07, // Responsive padding
            vertical: size.height * 0.035,
          ),
          decoration: const BoxDecoration(
            color: Colors.white,
            image: DecorationImage(
              image: AssetImage('assets/images/img0.jpg'),
              //fit: BoxFit.cover,
            ),
            // gradient: LinearGradient(
            //   colors: [Colors.amber, Colors.cyan],
            // ),
          ),
          child: Column(
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      Container(
                        height: size.height * 0.15,
                        width: size.width * 0.09,
                        decoration: const BoxDecoration(
                          shape: BoxShape.circle,
                          image: DecorationImage(
                            image: AssetImage('assets/images/me.jpg'),
                            fit: BoxFit.cover,
                          ),
                        ),
                      ),
                      const Text(
                        'Portfolio',
                        style: TextStyle(
                          color: Color.fromARGB(255, 138, 253, 6),
                          fontSize: 25,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      const Spacer(),
                      _buildHoverButton('Home', 0),
                      SizedBox(width: size.width * 0.1),
                      _buildHoverButton('About', 1),
                      SizedBox(width: size.width * 0.1),
                      _buildHoverButton('Services', 2),
                      SizedBox(width: size.width * 0.1),
                      _buildHoverButton('Contact', 3),
                    ],
                  ),
                  SizedBox(height: size.height * 0.05),
                  
                  SizedBox(
                    width: size.width,
                    height: size.height*.7,
                   
                  ),
                    child: const Text('Mania'),),


                  SizedBox(height: size.height * 0.05),
                  Container(
                    padding: EdgeInsets.symmetric(horizontal: size.width * 0.05),
                    child: const Text(
                      "Welcome! I’m a passionate software developer with expertise in Flutter, backend development, and web technologies. Let's create something amazing together!",
                      style: TextStyle(
                        color: Colors.black,
                        fontSize: 20,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 40),
              Row(
                children: [
                  _buildSocialIcon('assets/images/linkedin.png'),
                  SizedBox(width: size.width * 0.02),
                  _buildSocialIcon('assets/images/twitter.jpeg'),
                  SizedBox(width: size.width * 0.02),
                  _buildSocialIcon('assets/images/fb.png'),
                  const Spacer(),
                  Text(
                    dateText,
                    style: const TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                  Text(
                    timeText,
                    style: const TextStyle(
                      color: Color.fromARGB(255, 138, 253, 6),
                      fontSize: 20,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ],
              ),
              SizedBox(height: size.height * 0.05),
              MouseRegion(
                cursor: SystemMouseCursors.click,
                child: Container(
                  padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                  decoration: const BoxDecoration(
                    borderRadius: BorderRadius.all(Radius.circular(20)),
                    shape: BoxShape.rectangle,
                    color: Colors.green,
                  ),
                  child: const Text('Download CV'),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildHoverButton(String title, int index) {
    return MouseRegion(
      onEnter: (_) => setState(() => isHovering[index] = true),
      onExit: (_) => setState(() => isHovering[index] = false),
      cursor: SystemMouseCursors.click,
      child: OutlinedButton(
        onPressed: () {},
        child: AnimatedContainer(
          duration: const Duration(milliseconds: 200),
          height: isHovering[index] ? 40 : 30,
          child: Text(
            title,
            style: const TextStyle(
              color: Color.fromARGB(255, 138, 253, 6),
              fontSize: 23,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildSocialIcon(String assetPath) {
    return MouseRegion(
      cursor: SystemMouseCursors.click,
      child: Container(
        height: 35,
        width: 35,
        decoration: BoxDecoration(
          color: Colors.white,
          shape: BoxShape.circle,
          image: DecorationImage(image: AssetImage(assetPath)),
        ),
      ),
    );
  }
}
\na software developer specializing in Flutter and web technologies. \nWith a focus on delivering high-quality, user-centered applications,\n Reach out!.',



Positioned(
                top: 50,
                right: 50,
                //bottom: 10,
                child: Container(
                  alignment: Alignment.centerRight,
                  width: 500,
                  height: 500,
                  decoration: const BoxDecoration(
                    borderRadius: BorderRadius.all(Radius.circular(15)),
                    // image: DecorationImage(
                    //     image: AssetImage('assets/images/newme1.png'),
                    //     fit: BoxFit.cover)r
                  ),
                ),
              ),
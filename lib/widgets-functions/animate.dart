import 'package:flutter/material.dart';
import 'package:animated_text_kit/animated_text_kit.dart';

class AnimatedSentence extends StatelessWidget {
  final String prefix;
  final List<String> animatedWords;
  final String suffix;
  final TextStyle? textStyle;
  final TextStyle? animatedTextStyle;
  final Duration animationSpeed;
  final Duration pauseDuration;

  const AnimatedSentence({
    Key? key,
    required this.prefix,
    required this.animatedWords,
    required this.suffix,
    this.textStyle,
    this.animatedTextStyle,
    this.animationSpeed = const Duration(milliseconds: 100),
    this.pauseDuration = const Duration(seconds: 2),
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final defaultTextStyle = Theme.of(context).textTheme.bodyLarge ?? const TextStyle();
    final effectiveTextStyle = textStyle ?? defaultTextStyle;
    final effectiveAnimatedTextStyle = animatedTextStyle ?? 
        effectiveTextStyle.copyWith(fontWeight: FontWeight.bold, color: Colors.white);

    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          if (prefix.isNotEmpty)
            Text(prefix, style: effectiveTextStyle),
          AnimatedTextKit(
            animatedTexts: animatedWords.map((word) => TypewriterAnimatedText(
              word,
              textStyle: effectiveAnimatedTextStyle,
              speed: animationSpeed,
            )).toList(),
            totalRepeatCount: -1,
            pause: pauseDuration,
            displayFullTextOnTap: false,
            stopPauseOnTap: false,
            repeatForever: true,
          ),
          if (suffix.isNotEmpty)
            Text(suffix, style: effectiveTextStyle),
        ],
      ),
    );
  }
}
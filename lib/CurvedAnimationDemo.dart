import 'package:flutter/material.dart';
import 'package:flutter/animation.dart';

void main() => runApp(LogoApp());

class LogoApp extends StatefulWidget {
	_LogoAppState createState() => _LogoAppState();
}

class _LogoAppState extends State<LogoApp> with SingleTickerProviderStateMixin {
	Animation<double> animation;
	AnimationController controller;

	@override
	void initState() {
		super.initState();
		controller = AnimationController(duration: const Duration(seconds: 2),
			vsync: this);

		animation = Tween<double>(begin: 0.0, end: 300.0).animate(controller);

		controller.forward();
	}

	@override
	Widget build(BuildContext context) => AnimatedLogo(animation: animation);

	@override
  void dispose() {
    controller.dispose();
    super.dispose();
  }
}

class AnimatedLogo extends AnimatedWidget {
	AnimatedLogo({Key key, Animation<double> animation})
		: super(key: key, listenable: animation);

	Widget build(BuildContext context) {
		final Animation<double> animation = listenable;
		return Center(
			child: Container(
				margin: EdgeInsets.symmetric(vertical: 10.0),
				height: animation.value,
				width: animation.value,
				child: FlutterLogo(),
			),
		);
	}
}

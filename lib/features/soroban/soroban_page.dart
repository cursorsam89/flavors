import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class SorobanPage extends StatefulWidget {
	const SorobanPage({super.key});

	@override
	State<SorobanPage> createState() => _SorobanPageState();
}

class _SorobanPageState extends State<SorobanPage> {
	@override
	void initState() {
		super.initState();
		SystemChrome.setPreferredOrientations(<DeviceOrientation>[
			DeviceOrientation.landscapeLeft,
			DeviceOrientation.landscapeRight,
		]);
	}

	@override
	void dispose() {
		SystemChrome.setPreferredOrientations(<DeviceOrientation>[
			DeviceOrientation.portraitUp,
			DeviceOrientation.portraitDown,
		]);
		super.dispose();
	}

	@override
	Widget build(BuildContext context) {
		return const Scaffold(
			body: Center(
				child: Text('Soroban Tool (Landscape)'),
			),
		);
	}
}
import 'package:depi_project/core/utils/widgets/custom_app_name.dart';
import 'package:depi_project/features/home/presentation/view/widgets/home_screen_body.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const CustomAppName(),
      ),
      body: const HomeScreenBody(),
    );
  }
}

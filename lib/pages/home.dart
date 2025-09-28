import 'package:clima/providers/data_provider.dart';
import 'package:clima/providers/theme_provider.dart';
import 'package:clima/widgets/custom_text.dart';
import 'package:clima/widgets/info_banner.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class Home extends StatelessWidget {
  const Home({super.key});

  @override
  Widget build(BuildContext context) {
    final background = context.watch<ThemeProvider>().background;
    final banner = context.watch<ThemeProvider>().banner;
    final textColor = context.watch<ThemeProvider>().textColors;
    final isLightMode = context.watch<ThemeProvider>().state;

    return Container(
      color: background,
      child: Column(
        children: [
          SizedBox(height: 35),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              IconButton(
                onPressed: () {
                  context.read<ThemeProvider>().changeTheme();
                },
                icon: Icon(
                  isLightMode ? Icons.light_mode : Icons.dark_mode,
                  color: textColor[0],
                ),
              ),
              SizedBox(width: 50),
              ElevatedButton.icon(
                onPressed: () {
                  context.read<DataProvider>().changeData();
                },
                icon: const Icon(Icons.restore_page),
                label: const Text("Cambiar datos"),
                style: ElevatedButton.styleFrom(
                  foregroundColor: textColor[0],
                  backgroundColor: banner,
                ),
              ),
            ],
          ),
          SizedBox(height: 30),
          CustomText(
            data: "Suchiapa, Chiapas, MX",
            fontSize: 30,
            color: textColor[0],
            fontWeight: FontWeight.bold,
          ),
          SizedBox(height: 30),
          InfoBanner()
        ],
      ),
    );
  }
}

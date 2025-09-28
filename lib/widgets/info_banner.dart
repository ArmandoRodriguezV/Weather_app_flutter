import 'dart:math';
import 'package:clima/providers/data_provider.dart';
import 'package:clima/providers/theme_provider.dart';
import 'package:clima/widgets/custom_text.dart';
import 'package:flutter/material.dart';
import 'package:parallax_rain/parallax_rain.dart';
import 'package:provider/provider.dart';

class InfoBanner extends StatelessWidget {
  const InfoBanner({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = context.watch<ThemeProvider>();
    final data = context.watch<DataProvider>();
    final dropSpeed = data.wind[1] / 25;

    final borderRadius = const BorderRadius.only(
      topLeft: Radius.circular(100),
      bottomRight: Radius.circular(100),
      topRight: Radius.circular(15),
      bottomLeft: Radius.circular(15),
    );

    return Container(
      width: double.infinity,
      margin: const EdgeInsets.symmetric(horizontal: 40),
      height: 600,
      decoration: BoxDecoration(
        color: theme.banner,
        borderRadius: borderRadius,
      ),
      child: ClipRRect(
        borderRadius: borderRadius,
        child: Stack(
          children: [
            Positioned.fill(
              child: ClipRRect(
                borderRadius: borderRadius,
                child: Transform.rotate(
                  angle: (-data.wind[0] + 90) * pi / 180,
                  child: ParallaxRain(
                    key: ValueKey(dropSpeed),
                    dropFallSpeed: dropSpeed,
                    dropColors: [theme.textColors[1], theme.textColors[2]],
                  ),
                ),
              ),
            ),
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    CustomText(
                      data: data.time,
                      color: theme.textColors[0],
                      fontWeight: FontWeight.bold,
                    ),
                    const SizedBox(width: 10),
                    Icon(data.weatherIcon, color: theme.textColors[0]),
                  ],
                ),
                CustomText(
                  data: "${data.temperature}°C",
                  fontSize: 50,
                  color: theme.textColors[0],
                ),
                const SizedBox(height: 30),
                CustomText(
                  data: "Viento",
                  color: theme.textColors[0],
                  fontWeight: FontWeight.bold,
                ),
                const SizedBox(height: 10),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    CustomText(
                      data: "${data.wind[1]} km/h",
                      color: theme.textColors[0],
                    ),
                    Row(
                      children: [
                        Transform.rotate(
                          angle: -data.wind[0] * pi / 180,
                          child: Icon(
                            Icons.arrow_back,
                            color: theme.textColors[0],
                          ),
                        ),
                        CustomText(
                          data: "${data.wind[0]}°",
                          color: theme.textColors[0],
                        ),
                      ],
                    ),
                  ],
                ),
                const SizedBox(height: 30),
                CustomText(
                  data: "${data.height} m.s.",
                  fontSize: 25,
                  color: theme.textColors[0],
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
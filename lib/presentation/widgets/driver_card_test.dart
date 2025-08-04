import 'package:f1_app/data/models/driver.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class DriverCardTest extends StatelessWidget {
  final Driver driver;
  const DriverCardTest({super.key, required this.driver});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {},
      child: Container(
        decoration: BoxDecoration(color: const Color.fromARGB(255, 17, 17, 17)),
        child: Row(
          children: [
            Expanded(
              flex: 2,
              child: Container(
                height: double.infinity,
                decoration: BoxDecoration(
                  gradient: LinearGradient(
                    begin: Alignment.centerRight,
                    end: Alignment.centerLeft,
                    colors: [
                      // Colors.black,
                      colorFromHexAndSaturate(driver.teamColour),
                      colorFromHexAndSaturate(driver.teamColour),
                    ],
                  ),
                ),
                child: Image.network(
                  driver.headshotUrl,
                  fit: BoxFit.cover,
                ),
              ),
            ),
            Expanded(
              flex: 6,
              child: Row(
                children: [
                  Expanded(
                      flex: 5,
                      child: Padding(
                        padding: const EdgeInsets.all(10.0),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: [
                            Column(
                              children: [
                                Image.asset(
                                  'assets/images/logos/${driver.teamName}.png',
                                  width: 30,
                                ),
                                Expanded(child: SizedBox()),
                                SvgPicture.asset(
                                    width: 30,
                                    'assets/vectors/countries/flags_${driver.countryCode}.svg'),
                              ],
                            ),
                            SizedBox(width: 50),
                            Expanded(
                              flex: 8,
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.end,
                                mainAxisAlignment: MainAxisAlignment.start,
                                children: [
                                  Text(
                                    driver.nameAcronym,
                                    textAlign: TextAlign.end,
                                    style: TextStyle(
                                      height: 1.0,
                                      fontFamily: 'FugazOne',
                                      fontSize: 17,
                                      color: const Color.fromARGB(
                                          34, 255, 255, 255),
                                    ),
                                  ),
                                  Text(
                                    driver.fullName,
                                    textAlign: TextAlign.end,
                                    style: TextStyle(
                                      height: 1.15,
                                      fontFamily: 'FugazOne',
                                      fontSize: 30,
                                      color: Colors.white,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      )),
                ],
              ),
            ),
            Container(
              width: 7,
              color: colorFromHex(driver.teamColour),
            ),
          ],
        ),
      ),
    );
  }

  Color colorFromHex(String hexColor) {
    final buffer = StringBuffer();
    if (hexColor.length == 6) buffer.write('ff');
    buffer.write(hexColor);
    return Color(int.parse(buffer.toString(), radix: 16));
  }

  Color colorFromHexAndSaturate(String hexColor,
      {double saturationBoost = 1.2}) {
    final buffer = StringBuffer();
    if (hexColor.length == 6) buffer.write('ff');
    buffer.write(hexColor);
    final baseColor = Color(int.parse(buffer.toString(), radix: 16));

    final hslColor = HSLColor.fromColor(baseColor);
    final saturated = hslColor.withSaturation(
      (hslColor.saturation * saturationBoost).clamp(1.0, 1.0),
    );

    return saturated.toColor();
  }
}

import 'package:f1_app/data/models/driver.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class DriverCardTest extends StatelessWidget {
  final Driver driver;
  const DriverCardTest({super.key, required this.driver});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(color: const Color.fromARGB(255, 17, 17, 17)),
      child: Row(
        children: [
          Expanded(
            flex: 4,
            child: Container(
              width: 180,
              height: double.infinity,
              decoration: const BoxDecoration(
                gradient: LinearGradient(
                  begin: Alignment.centerRight,
                  end: Alignment.centerLeft,
                  colors: [
                    Colors.black,
                    Colors.red,
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
            child: Column(
              children: [
                Expanded(
                    flex: 5,
                    child: Padding(
                      padding: const EdgeInsets.all(10.0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          Expanded(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.end,
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: [
                                Row(
                                  children: [
                                    SvgPicture.asset(
                                        width: 25,
                                        'assets/vectors/countries/${driver.countryCode}.svg'),
                                    Expanded(child: SizedBox()),
                                    Text(
                                      driver.nameAcronym,
                                      textAlign: TextAlign.end,
                                      style: TextStyle(
                                        height: 1.0,
                                        fontFamily: 'FugazOne',
                                        fontSize: 22,
                                        color: const Color.fromARGB(
                                            34, 255, 255, 255),
                                      ),
                                    ),
                                  ],
                                ),
                                Text(
                                  driver.fullName,
                                  textAlign: TextAlign.end,
                                  style: TextStyle(
                                    height: 1.15,
                                    fontFamily: 'FugazOne',
                                    fontSize: 36,
                                    color: Colors.white,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    )),
                Expanded(
                    flex: 2,
                    child: Padding(
                      padding: const EdgeInsets.all(10.0),
                      child: Row(
                        children: [
                          Image.asset(
                            'assets/images/logos/${driver.teamName}.png',
                            width: 40,
                          )
                        ],
                      ),
                    )),
              ],
            ),
          ),
          Container(
            width: 10,
            color: Color.fromARGB(255, 37, 206, 206),
          ),
        ],
      ),
    );
  }
}

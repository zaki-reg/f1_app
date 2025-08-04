import 'package:f1_app/data/models/driver.dart';
import 'package:f1_app/logic/cubit/drivers_cubit.dart';
import 'package:f1_app/presentation/widgets/driver_card_test.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  void initState() {
    super.initState();
    context.read<DriversCubit>().getAllDrivers();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      // appBar: AppBar(
      //   backgroundColor: AppColors.myPurple,
      //   title: const Text("Drivers"),
      //   foregroundColor: Colors.white,
      // ),
      body: BlocBuilder<DriversCubit, DriversState>(
        builder: (context, state) {
          if (state is DriversLoaded) {
            return buildLoadedDriversList(state.drivers);
          } else if (state is DriversError) {
            return Center(child: Text(state.error));
          } else {
            return showLoadingIndicator();
          }
        },
      ),
    );
  }

  Widget buildLoadedDriversList(List<Driver> drivers) {
    return SafeArea(
      child: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(10.0),
          child: Column(
            children: [
              // Container(
              //   decoration: BoxDecoration(
              //     // color: const Color.fromARGB(255, 205, 18, 5),
              //     border: Border(
              //       top: BorderSide(
              //         width: 1,
              //         color: const Color.fromARGB(78, 255, 255, 255),
              //       ),
              //       bottom: BorderSide(
              //         width: 1,
              //         color: const Color.fromARGB(78, 255, 255, 255),
              //       ),
              //     ),
              //   ),
              //   child: Row(
              //     children: [
              //       Padding(
              //         padding: const EdgeInsets.symmetric(
              //           horizontal: 15.0,
              //           vertical: 10,
              //         ),
              //         child: Text(
              //           'F1 Drivers',
              //           style: TextStyle(
              //               color: Colors.white,
              //               fontSize: 30,
              //               fontFamily: 'FugazOne'),
              //         ),
              //       ),
              //     ],
              //   ),
              // ),
              // SizedBox(
              //   height: 10,
              // ),
              buildDriversList(drivers),
            ],
          ),
        ),
      ),
    );
  }

  Widget buildDriversList(List<Driver> drivers) {
    return GridView.builder(
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        childAspectRatio: 4.0,
        crossAxisCount: 1,
        mainAxisSpacing: 10,
        crossAxisSpacing: 10,
      ),
      shrinkWrap: true,
      padding: EdgeInsets.zero,
      itemCount: drivers.length,
      physics: const ClampingScrollPhysics(),
      itemBuilder: (context, index) {
        // return DriverCard(driver: drivers[index]);
        return DriverCardTest(
          driver: drivers[index],
        );
      },
    );
  }

  Widget showLoadingIndicator() {
    return const Center(child: CupertinoActivityIndicator());
  }
}

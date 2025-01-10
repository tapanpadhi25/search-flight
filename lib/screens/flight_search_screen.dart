import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:search_flight/utility/theme.dart';
import 'package:search_flight/widgets/custom_app_bar.dart';
import 'package:toggle_switch/toggle_switch.dart';

import '../utility/global_utility.dart';
import 'flight_details.dart';

class FlightSearchScreen extends StatefulWidget {
  const FlightSearchScreen({super.key});

  @override
  State<FlightSearchScreen> createState() => _FlightSearchScreenState();
}

class _FlightSearchScreenState extends State<FlightSearchScreen> {
  int initialIndex = 0;
  final fromController = TextEditingController();
  final toController = TextEditingController();
  final fromDateController = TextEditingController();
  final toDateController = TextEditingController();
  final travellerController = TextEditingController();
  final cabinClassController = TextEditingController();
  DateTime? fromDate;
  DateTime? toDate;

  @override
  Widget build(BuildContext context) {
    var style = CustomTheme.getTheme();

    return Scaffold(
      backgroundColor: const Color(0xfff2f4f7),
      appBar:
          CustomAppBar(title: "Search Flights", context: context, first: true)
              .getAppBar(),
      body: ListView(
        children: [
          Container(
            color: const Color(0xfff2f4f7),
            height: MediaQuery.sizeOf(context).height * 0.22,
            child: Stack(
              alignment: Alignment.topCenter,
              children: [
                SizedBox(
                  height: MediaQuery.of(context).size.height * 0.2,
                  child: Stack(
                    children: [
                      Image.asset(
                        "assets/images/top_banner.png",
                        fit: BoxFit.fill,
                      ),
                      Positioned(
                          top: 10,
                          left: 10,
                          child: Text(
                            "Let's start your trip",
                            style: style!.textTheme.titleSmall!.copyWith(
                              color: Colors.white,fontSize: 16,
                              fontWeight: FontWeight.w500,
                            ),
                          ))
                    ],
                  ),
                ),
                Positioned(
                    bottom: 8,
                    child: Card(
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10)),
                      elevation: 1,
                      child: ToggleSwitch(
                        radiusStyle: false,
                        totalSwitches: 3,
                        inactiveBgColor: Colors.white,
                        activeBgColor: [Colors.green],
                        minHeight: 46,
                        minWidth: 350,
                        cornerRadius: 4,
                        initialLabelIndex: initialIndex,
                        labels: const ["Round Trip", "One Way", "Multi-city"],
                        onToggle: (value) {
                          setState(() {
                            initialIndex = value!;
                            print(value);
                          });
                        },
                      ),
                    )),
              ],
            ),
          ),
          SingleChildScrollView(
            padding: const EdgeInsets.fromLTRB(16.0, 0, 16, 16),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Card(
                  color: Colors.white,
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10)),
                  elevation: 0,
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        SizedBox(
                          width: MediaQuery.of(context).size.width * 0.7,
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Row(
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                  SizedBox(
                                    height: 25,
                                    width: 25,
                                    child: Image.asset(
                                        "assets/images/flight_image.png"),
                                  ),
                                  SizedBox(
                                    width:
                                        MediaQuery.of(context).size.width * 0.6,
                                    child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        TextField(
                                          style: style.textTheme.titleSmall,
                                          controller: fromController,
                                          decoration: InputDecoration(
                                              hintText: "From",
                                              hintStyle:
                                                  style.textTheme.titleSmall,
                                              border: const OutlineInputBorder(
                                                  borderSide: BorderSide.none)),
                                        ),
                                        Container(
                                          height: 2,
                                          width: double.infinity,
                                          decoration: const BoxDecoration(
                                            gradient: LinearGradient(
                                              colors: [
                                                Colors.green,
                                                Colors.white
                                              ],
                                              begin: Alignment.centerLeft,
                                              end: Alignment.centerRight,
                                            ),
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ],
                              ),
                              Row(
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                  SizedBox(
                                    height: 25,
                                    width: 25,
                                    child: Image.asset(
                                        "assets/images/location.png"),
                                  ),
                                  SizedBox(
                                    width:
                                        MediaQuery.of(context).size.width * 0.6,
                                    child: TextField(
                                      style: style.textTheme.titleSmall,
                                      controller: toController,
                                      decoration: InputDecoration(
                                          hintText: "To",
                                          hintStyle: style.textTheme.titleSmall,
                                          border: const OutlineInputBorder(
                                              borderSide: BorderSide.none)),
                                    ),
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ),
                        SizedBox(
                          height: 45,
                          width: 45,
                          child: InkWell(
                              onTap: () {},
                              child: Image.asset("assets/images/reverse.png")),
                        )
                      ],
                    ),
                  ),
                ),
                const SizedBox(height: 16),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    SizedBox(
                      width: MediaQuery.sizeOf(context).width * 0.45,
                      height: MediaQuery.sizeOf(context).height * 0.07,
                      child: TextField(
                        style: style.textTheme.titleSmall,
                        controller: fromDateController,
                        readOnly: true,
                        onTap: () async {
                          fromDate = await showDatePicker(
                              context: context,
                              initialDate: DateTime.now(),
                              firstDate: DateTime.now(),
                              lastDate: DateTime(3000));
                          if (fromDate != null) {
                            setState(() {
                              fromDateController.text = getDate(fromDate!);
                            });
                          }
                        },
                        decoration: InputDecoration(
                            label: Container(
                              color: const Color(0xffE9F0E4),
                              child: Text("Departure",
                                  style: style.textTheme.titleSmall!
                                      .copyWith(fontSize: 15)),
                            ),
                            floatingLabelBehavior: FloatingLabelBehavior.always,
                            hintText: "Departure",
                            hintStyle: style.textTheme.titleSmall!
                                .copyWith(color: Colors.grey),
                            suffixIcon: SizedBox(
                              height: 5,
                              width: 5,
                              child: Image.asset("assets/images/calender.png"),
                            ),
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(8),
                              borderSide:
                                  const BorderSide(color: Color(0xff79747E)),
                            ),
                            focusedBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(8),
                              borderSide: BorderSide(color: style.primaryColor),
                            )),
                      ),
                    ),
                    SizedBox(
                      width: MediaQuery.sizeOf(context).width * 0.45,
                      height: MediaQuery.sizeOf(context).height * 0.07,
                      child: TextField(
                        style: style.textTheme.titleSmall!.copyWith(
                            color: (initialIndex == 1
                                ? const Color(0xffD4D4D4)
                                : Colors.black)),
                        controller: toDateController,
                        readOnly: true,
                        onTap: initialIndex == 1
                            ? null
                            : () async {
                                toDate = await showDatePicker(
                                    context: context,
                                    initialDate: fromDate!,
                                    firstDate: fromDate!,
                                    lastDate: DateTime(3000));
                                if (fromDate != null) {
                                  setState(() {
                                    toDateController.text = getDate(toDate!);
                                  });
                                }
                              },
                        decoration: InputDecoration(
                            label: Container(
                              color: initialIndex == 1
                                  ? const Color(0xffD4D4D4)
                                  : const Color(0xffE9F0E4),
                              child: Text("Return",
                                  style: style.textTheme.titleSmall!.copyWith(
                                      fontSize: 15,
                                      color: initialIndex == 1
                                          ? Colors.grey
                                          : Colors.black)),
                            ),
                            floatingLabelBehavior: FloatingLabelBehavior.always,
                            hintText: "Return",
                            hintStyle: style.textTheme.titleSmall!
                                .copyWith(color: Colors.grey),
                            suffixIcon: SizedBox(
                              height: 5,
                              width: 5,
                              child: Image.asset("assets/images/calender.png"),
                            ),
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(8),
                              borderSide: BorderSide(
                                  color: initialIndex == 1
                                      ? const Color(0xffD4D4D4)
                                      : const Color(0xff79747E)),
                            ),
                            focusedBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(8),
                              borderSide: BorderSide(
                                  color: initialIndex == 1
                                      ? const Color(0xffD4D4D4)
                                      : style.primaryColor),
                            )),
                      ),
                    )
                  ],
                ),
                const SizedBox(height: 16),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    SizedBox(
                      width: MediaQuery.sizeOf(context).width * 0.45,
                      height: MediaQuery.sizeOf(context).height * 0.07,
                      child: TextField(
                        style: style.textTheme.titleSmall,
                        controller: travellerController,
                        decoration: InputDecoration(
                            label: Container(
                              color: const Color(0xffE9F0E4),
                              child: Text("Travellers",
                                  style: style.textTheme.titleSmall!
                                      .copyWith(fontSize: 15)),
                            ),
                            floatingLabelBehavior: FloatingLabelBehavior.always,
                            hintText: "Travellers",
                            hintStyle: style.textTheme.titleSmall!
                                .copyWith(color: Colors.grey),
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(8),
                              borderSide:
                                  const BorderSide(color: Color(0xff79747E)),
                            ),
                            focusedBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(8),
                              borderSide: BorderSide(color: style.primaryColor),
                            )),
                      ),
                    ),
                    SizedBox(
                      width: MediaQuery.sizeOf(context).width * 0.45,
                      height: MediaQuery.sizeOf(context).height * 0.07,
                      child: TextField(
                        style: style.textTheme.titleSmall!
                            .copyWith(color: Colors.black),
                        controller: cabinClassController,
                        decoration: InputDecoration(
                            label: Container(
                              color: const Color(0xffE9F0E4),
                              child: Text("Cabin Class",
                                  style: style.textTheme.titleSmall!.copyWith(
                                      fontSize: 15, color: Colors.black)),
                            ),
                            floatingLabelBehavior: FloatingLabelBehavior.always,
                            hintText: "Cabin Class",
                            hintStyle: style.textTheme.titleSmall!
                                .copyWith(color: Colors.grey),
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(8),
                              borderSide:
                                  const BorderSide(color: Color(0xff79747E)),
                            ),
                            focusedBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(8),
                              borderSide: BorderSide(color: style.primaryColor),
                            )),
                      ),
                    )
                  ],
                ),
                const SizedBox(height: 16),
                Align(
                  alignment: Alignment.center,
                  child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.green,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10),
                          )),
                      onPressed: () {
                        if(fromController.text.isEmpty){
                          Fluttertoast.showToast(msg:"Select From location");
                          return;
                        }else if(toController.text.isEmpty){
                          Fluttertoast.showToast(msg: "Select To location");
                          return;
                        }else if(fromDateController.text.isEmpty){
                          Fluttertoast.showToast(msg: "Select departure date");
                        }else if(travellerController.text.isEmpty){
                          Fluttertoast.showToast(msg: "Enter travellers");
                          return;
                        }
                        else{
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (_) => FlightDetailsScreen(
                                    from: (fromController.text.isNotEmpty)? fromController.text:"",
                                    to: (toController.text.isNotEmpty)? toController.text:"",
                                    departure: (fromDateController.text.isNotEmpty)?fromDateController.text:"",
                                    arrival: (toDateController.text.isNotEmpty)? toDateController.text:"",
                                    tripType: (initialIndex == 0)
                                        ? "Round Trip"
                                        : (initialIndex == 1)
                                        ? "One Way"
                                        : 'Multi-city',
                                    dt: fromDate!,
                                  )));
                        }

                      },
                      child: Padding(
                        padding: const EdgeInsets.all(8),
                        child: Text(
                          "Search Flight",
                          style: style.textTheme.titleSmall!.copyWith(
                              fontWeight: FontWeight.w700, color: Colors.white),
                        ),
                      )),
                ),
                const SizedBox(height: 16),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    SizedBox(
                      width: MediaQuery.sizeOf(context).width * 0.6,
                      child: Text(
                        "Travel Inspirations",
                        style: style.textTheme.titleSmall!.copyWith(
                            fontSize: 16, fontWeight: FontWeight.w600),
                      ),
                    ),
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "Dubai",
                          style: style.textTheme.titleSmall!.copyWith(
                              fontSize: 16,
                              fontWeight: FontWeight.w600,
                              decoration: TextDecoration.underline),
                        ),
                        const Icon(Icons.keyboard_arrow_down,
                            size: 25, color: Colors.green),
                      ],
                    )
                  ],
                ),
                const SizedBox(height: 10),
                SizedBox(
                  height: MediaQuery.sizeOf(context).height * 0.3,
                  child: ListView.separated(
                      scrollDirection: Axis.horizontal,
                      itemBuilder: (context, index) {
                        return Stack(
                          children: [
                            SizedBox(
                              width: MediaQuery.sizeOf(context).width * 0.6,
                              child: ClipRRect(
                                borderRadius: BorderRadius.circular(10),
                                child: Image.asset(
                                  images[index],
                                  fit: BoxFit.fill,
                                ),
                              ),
                            ),
                            (index == 1)
                                ? Positioned(
                                    bottom: 10,
                                    left: 10,
                                    child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Text(
                                          "From AED867",
                                          style: style.textTheme.titleSmall!
                                              .copyWith(
                                                  color: Colors.white,
                                                  fontSize: 12),
                                        ),
                                        Text(
                                          "Economy round trip",
                                          style: style.textTheme.titleSmall!
                                              .copyWith(
                                                  color: Colors.white,
                                                  fontSize: 12),
                                        ),
                                        Text(
                                          "Kuwait",
                                          style: style.textTheme.titleSmall!
                                              .copyWith(
                                                  color: Colors.white,
                                                  fontSize: 20,
                                                  fontWeight: FontWeight.w600),
                                        ),
                                      ],
                                    ),
                                  )
                                : const SizedBox()
                          ],
                        );
                      },
                      separatorBuilder: (context, index) {
                        return const SizedBox(width: 10);
                      },
                      itemCount: images.length),
                ),
                const SizedBox(height: 16),
                Text(
                  "Flight & Hotel Packages",
                  style: style.textTheme.titleSmall!
                      .copyWith(fontSize: 16, fontWeight: FontWeight.w600),
                ),
                const SizedBox(height: 10),
                SizedBox(
                  height: MediaQuery.sizeOf(context).height * 0.3,
                  width: MediaQuery.sizeOf(context).width,
                  child: ClipRRect(
                    borderRadius: const BorderRadius.only(
                      topRight: Radius.circular(10),
                      topLeft: Radius.circular(10),
                    ),
                    child: Image.asset(
                      "assets/images/bottom_banner.png",
                      fit: BoxFit.fill,
                    ),
                  ),
                )
              ],
            ),
          ),
        ],
      ),
    );
  }
}

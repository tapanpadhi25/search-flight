import 'package:dotted_line/dotted_line.dart';
import 'package:dotted_line/dotted_line.dart';
import 'package:flutter/material.dart';

import '../utility/theme.dart';

class FlightDetailsWidget extends StatefulWidget {
  const FlightDetailsWidget({super.key});

  @override
  State<FlightDetailsWidget> createState() => _FlightDetailsWidgetState();
}

class _FlightDetailsWidgetState extends State<FlightDetailsWidget> {
  @override
  Widget build(BuildContext context) {
    var style = CustomTheme.getTheme();
    return Container(
      decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(10),
          boxShadow: const [
            BoxShadow(
                offset: Offset(1, 1.2),
                blurRadius: 0,
                spreadRadius: 0,
                color: Colors.black12)
          ]),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    SizedBox(
                        height: 30,
                        width: 30,
                        child: Image.asset("assets/images/flight_details.png")),
                    Text(
                      "Onward - Garuda Indonesia",
                      style: style!.textTheme.titleSmall!
                          .copyWith(fontWeight: FontWeight.w500),
                    ),
                    Text("AED 409",
                        style: style.textTheme.titleSmall!.copyWith(
                            fontWeight: FontWeight.w600,
                            fontSize: 16,
                            color: Colors.green)),
                  ],
                ),
                Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "14:35",
                          style: style.textTheme.titleSmall!.copyWith(
                              fontWeight: FontWeight.w700, fontSize: 22),
                        ),
                        Text("BLR - Bengaluru",
                            style: style.textTheme.titleSmall!.copyWith(
                                fontWeight: FontWeight.w400, fontSize: 12)),
                      ],
                    ),
                    SizedBox(
                      width: MediaQuery.sizeOf(context).width * 0.3,
                      child: Column(
                        children: [
                          Stack(
                            alignment: Alignment.center,
                            children: [
                              Image.asset("assets/images/divider.png"),
                              Image.asset("assets/images/flight_arrow.png"),
                            ],
                          ),
                          Text(
                            "4h 30m",
                            style: style.textTheme.titleSmall!
                                .copyWith(color: Colors.grey),
                          ),
                          Text(
                            "2 Stops",
                            style: style.textTheme.titleSmall!
                                .copyWith(color: Colors.grey, fontSize: 12),
                          ),
                        ],
                      ),
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "21:55",
                          style: style.textTheme.titleSmall!.copyWith(
                              fontWeight: FontWeight.w700, fontSize: 22),
                        ),
                        Text("DXB - Dubai",
                            style: style.textTheme.titleSmall!.copyWith(
                                fontWeight: FontWeight.w400, fontSize: 12)),
                      ],
                    ),
                  ],
                )
              ],
            ),
          ),
          const Divider(
            color: Colors.grey,
            thickness: 1,
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    SizedBox(
                        height: 30,
                        width: 30,
                        child: Image.asset("assets/images/flight_details.png")),
                    Text(
                      "Return - Garuda Indonesia",
                      style: style.textTheme.titleSmall!
                          .copyWith(fontWeight: FontWeight.w500),
                    ),
                    Text("AED 359",
                        style: style.textTheme.titleSmall!.copyWith(
                            fontWeight: FontWeight.w600,
                            fontSize: 16,
                            color: Colors.green)),
                  ],
                ),
                Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "21:55",
                          style: style.textTheme.titleSmall!.copyWith(
                              fontWeight: FontWeight.w700, fontSize: 22),
                        ),
                        Text("DXB - Dubai",
                            style: style.textTheme.titleSmall!.copyWith(
                                fontWeight: FontWeight.w400, fontSize: 12)),
                      ],
                    ),
                    SizedBox(
                      width: MediaQuery.sizeOf(context).width * 0.3,
                      child: Column(
                        children: [
                          Stack(
                            alignment: Alignment.center,
                            children: [
                              Image.asset("assets/images/divider.png"),
                              Image.asset("assets/images/flight_arrow.png"),
                            ],
                          ),
                          Text(
                            "4h 30m",
                            style: style.textTheme.titleSmall!
                                .copyWith(color: Colors.grey),
                          ),
                        ],
                      ),
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "14:55",
                          style: style.textTheme.titleSmall!.copyWith(
                              fontWeight: FontWeight.w700, fontSize: 22),
                        ),
                        Text("BLR - Bengaluru",
                            style: style.textTheme.titleSmall!.copyWith(
                                fontWeight: FontWeight.w400, fontSize: 12)),
                      ],
                    ),
                  ],
                ),
                const SizedBox(height: 6),
                const DottedLine(
                  direction: Axis.horizontal,
                  lineLength: double.infinity, // Make it span the width of the screen
                  lineThickness: 2.0,
                  dashLength: 4.0,
                  dashColor: Colors.grey,
                  dashGapLength: 4.0,
                  dashGapColor: Colors.transparent,
                ),
                const SizedBox(height: 6),
                Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    InkWell(
                      onTap: (){},
                      child: Container(
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(10),
                          border: Border.all(color: Colors.green),
                        ),
                        padding: const EdgeInsets.all(2),
                        child: Text("Cheapest",style: style.textTheme.titleSmall!.copyWith(fontSize: 12,color: Colors.green),),
                      ),
                    ),
                    const SizedBox(width: 20),
                    InkWell(
                      onTap: (){},
                      child: Container(
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(10),
                          border: Border.all(color: Colors.blue),
                        ),
                        padding: const EdgeInsets.all(2),
                        child: Text("Refundable",style: style.textTheme.titleSmall!.copyWith(fontSize: 12,color: Colors.blue),),
                      ),
                    ),
                    const Spacer(),
                    Text("Flight Details",style: style.textTheme.titleSmall!.copyWith(color: Colors.red),),
                    Icon(Icons.keyboard_arrow_down,color: Colors.red,),
                  ],
                )
              ],
            ),
          ),
        ],
      ),
    );
  }
}

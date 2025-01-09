import 'package:flutter/material.dart';
import 'package:search_flight/utility/theme.dart';
import 'package:search_flight/widgets/custom_app_bar.dart';

import '../utility/global_utility.dart';
import '../widgets/flight_details_widget.dart';

class FlightDetailsScreen extends StatefulWidget {
  final String from;
  final String to;
  final String departure;
  final String arrival;
  final String tripType;
  final DateTime dt;

  const FlightDetailsScreen(
      {super.key,
      required this.from,
      required this.to,
      required this.departure,
      required this.arrival,
      required this.tripType, required this.dt});

  @override
  State<FlightDetailsScreen> createState() => _FlightDetailsScreenState();
}

class _FlightDetailsScreenState extends State<FlightDetailsScreen> {
  @override
  Widget build(BuildContext context) {
    var style = CustomTheme.getTheme();
    List<Map<String, String>> data = generateDateRangeCards(widget.dt);
    return Scaffold(
      backgroundColor: const Color(0xfff2f4f7),
      appBar: CustomAppBar(title: "EZY Travel", context: context, first: false)
          .getAppBar(),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            width: MediaQuery.sizeOf(context).width,
            margin: const EdgeInsets.all(16),
            padding: const EdgeInsets.all(8),
            decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(10),
                boxShadow: const [
                  BoxShadow(
                    color: Colors.black12,
                    blurRadius: 0,
                    spreadRadius: 0,
                    offset: Offset(1, 1.2),
                  )
                ]),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  "${widget.from ?? ""} To ${widget.to ?? ""}",
                  style: style!.textTheme.titleSmall!
                      .copyWith(fontWeight: FontWeight.w700),
                ),
                Text(
                  "Departure: ${widget.departure.replaceAll("- 2025", "")} - Return: ${widget.arrival.replaceAll("- 2025", "")}",
                  style: style.textTheme.titleSmall,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      "(${widget.tripType})",
                      style: style.textTheme.titleSmall!
                          .copyWith(color: Colors.red, fontSize: 15),
                    ),
                    TextButton(
                        onPressed: () {},
                        child: Text(
                          "Modify Search",
                          style: style.textTheme.titleSmall!.copyWith(
                              color: Colors.green,
                              decoration: TextDecoration.underline),
                        )),
                  ],
                ),
                const Divider(
                  color: Colors.grey,
                  thickness: 1,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    SizedBox(
                      width: MediaQuery.sizeOf(context).width * 0.2,
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Text(
                            "Sort",
                            style: style.textTheme.titleSmall!
                                .copyWith(fontWeight: FontWeight.w600),
                          ),
                          Icon(Icons.keyboard_arrow_down),
                        ],
                      ),
                    ),
                    SizedBox(
                      width: MediaQuery.sizeOf(context).width * 0.2,
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Text(
                            "Non-Stop",
                            style: style.textTheme.titleSmall!
                                .copyWith(fontWeight: FontWeight.w600),
                          ),
                        ],
                      ),
                    ),
                    SizedBox(
                      width: MediaQuery.sizeOf(context).width * 0.2,
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Text(
                            "Filter ",
                            style: style.textTheme.titleSmall!
                                .copyWith(fontWeight: FontWeight.w600),
                          ),
                          Image.asset("assets/images/filter.png"),
                        ],
                      ),
                    )
                  ],
                )
              ],
            ),
          ),
          // const SizedBox(height: 16),
          SizedBox(
            height: MediaQuery.sizeOf(context).height*0.06,
              child: ListView.separated(
                padding: const EdgeInsets.symmetric(horizontal: 16),
                scrollDirection: Axis.horizontal,
                  itemBuilder: (context, index) {
                    return InkWell(
                      onTap: (){},
                      child: Container(
                        width: 120,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(7),
                          border: Border.all(color: Colors.black),

                        ),
                        child: Column(
                          children: [
                            Text(data[index]['dateRange']!,style: style.textTheme.titleSmall,),
                            Text(data[index]['title']!,style: style.textTheme.titleSmall,),
                          ],
                        ),
                      ),
                    );
                  },
                  separatorBuilder: (context, index) {
                    return const SizedBox(width: 10);
                  },
                  itemCount: data.length)),
          const SizedBox(height: 16),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16.0),
            child: Text(
              "851 Flight Found",
              style: style.textTheme.titleSmall!
                  .copyWith(fontSize: 15, fontWeight: FontWeight.w700),
            ),
          ),
          const SizedBox(height: 10),
          Expanded(
              child: ListView.separated(
                padding: const EdgeInsets.all(16),
                  itemBuilder: (context, index) {
                    return const FlightDetailsWidget();
                  },
                  separatorBuilder: (context, index) {
                    return const SizedBox(height: 10);
                  },
                  itemCount: 5))
        ],
      ),
    );
  }
}

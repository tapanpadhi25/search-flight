String getDate(DateTime dateTime) {
  String dayName =
      ["Sun", "Mon", "Tue", "Wed", "Thu", "Fri", "Sat"][dateTime.weekday % 7];
  String monthName =monthList[dateTime.month - 1];
  return "$dayName, ${dateTime.day} $monthName - ${dateTime.year}";
}

List images = ["assets/images/travel_image1.png","assets/images/travel_image2.png"];
List<String> monthList = [
  "Jan", "Feb", "Mar", "Apr", "May", "Jun",
  "Jul", "Aug", "Sep", "Oct", "Nov", "Dec"
];
List<Map<String, String>> generateDateRangeCards(DateTime currentDate) {
  String formatDate(DateTime date) {
    return "${date.day} ${monthList[date.month - 1]}";
  }
  List<Map<String, String>> dateRanges = List.generate(5, (index) {
    DateTime startDate = currentDate.add(Duration(days: index - 2));
    DateTime endDate = startDate.add(const Duration(days: 1));
    return {
      "title": "From AED 741",
      "dateRange": "${formatDate(startDate)} - ${formatDate(endDate)}",
    };
  });

  return dateRanges;
}


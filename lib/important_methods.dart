
class ImportantMethods {

  String formatDateString(String dateString) {
    // Extract year, month, and day
    String year = dateString.substring(0, 4);
    String month = dateString.substring(5, 7);
    String day = dateString.substring(8, 10);
    // Return in dd-MM-yyyy format
    return '$day-$month-$year';
  }

}
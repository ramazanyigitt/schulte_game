String timeConverter({int time_ago}) {
  String time_seconds = "%time% seconds";
  String time_minutes = "%time% minutes";
  String time_hours = "%time% hours";
  String time_days = "%time% days";
  String time_months = "%time% months";
  String time_years = "%time% years";
  double ago = time_ago.toDouble();
  //‭31.104.000‬
  double years = ago / 31104000;
  double months = ago % 31104000 / 2592000;
  double days = ago % 2592000 / 86400;
  double hours = ago % 86400 / 3600;
  double minutes = ago % 3600 / 60;
  double seconds = ago % 60;
  if (years >= 1) {
    return time_years.replaceAll("%time%", "${years.toInt()}");
  } else if (months >= 1) {
    return time_months.replaceAll("%time%", "${months.toInt()}");
  } else if (days >= 1) {
    return time_days.replaceAll("%time%", "${days.toInt()}");
  } else if (hours >= 1) {
    return time_hours.replaceAll("%time%", "${hours.toInt()}");
  } else if (minutes >= 1) {
    return time_minutes.replaceAll("%time%", "${minutes.toInt()}");
  } else if (seconds >= 1) {
    return time_seconds.replaceAll("%time%", "${seconds.toInt()}");
  } else {
    return "Now";
  }
}

import 'package:intl/intl.dart';

class ContestFilter {
  int duration;
  bool ongoing;
  bool upcoming;
  DateTime startDate;
  var platform;
  ContestFilter(
      {this.duration,
      this.platform,
      this.startDate,
      this.ongoing,
      this.upcoming});
}

String getLabelForValue(int value) {
  switch (value) {
    case 0:
      return "2 hours";
    case 1:
      return "3 hours";
    case 2:
      return "5 hours";
    case 3:
      return "1 day";
    case 4:
      return "10 days";
    case 5:
      return "1 month";
    case 6:
      return "∞";
    default:
      return "10 days";
  }
}

bool checkPlatform({String platform, ContestFilter filter}) {
  switch (platform.toLowerCase()) {
    case "codechef":
      return filter.platform[0];
    case "codeforces":
      return filter.platform[1];
    case "hackerearth":
      return filter.platform[2];
    case "hackerrank":
      return filter.platform[3];
    default:
      return filter.platform[4];
  }
}

bool checkDuration({ContestFilter filter, String endTime, String startTime}) {
  DateTime _endTime = DateFormat("EEE, dd MMM yyyy hh:mm").parse(endTime);
  DateTime _startTime = DateTime.now();
  if (startTime != null) {
    _startTime = DateFormat("EEE, dd MMM yyyy hh:mm").parse(startTime);
  }
  Duration _maxDuration;
  switch (filter.duration) {
    case 0:
      _maxDuration = Duration(hours: 2);
      break;
    case 1:
      _maxDuration = Duration(hours: 3);
      break;
    case 2:
      _maxDuration = Duration(hours: 5);
      break;
    case 3:
      _maxDuration = Duration(days: 1);
      break;
    case 4:
      _maxDuration = Duration(days: 10);
      break;
    case 5:
      _maxDuration = Duration(days: 31);
      break;
    default:
      return true;
  }
  if (_maxDuration.compareTo(_endTime.difference(_startTime)) >= 0) {
    return true;
  } else {
    return false;
  }
}

bool checkStartTime({String startTime, ContestFilter filter}) {
  DateTime _startTime = DateFormat("EEE, dd MMM yyyy hh:mm").parse(startTime);
  if (_startTime.isAfter(filter.startDate)) {
    return true;
  } else {
    return false;
  }
}

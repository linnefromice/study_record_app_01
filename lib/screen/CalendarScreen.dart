import 'package:flutter/material.dart';
import 'package:table_calendar/table_calendar.dart';

import 'RecordListScreen.dart';

final Map<DateTime, List> _holidays = {
  DateTime(2020, 1, 1): ['元日'],
  DateTime(2020, 1, 13): ['成人の日'],
  DateTime(2020, 2, 11): ['建国記念の日'],
  DateTime(2020, 2, 23): ['天皇誕生日'],
  DateTime(2020, 2, 24): ['振替休日'],
  DateTime(2020, 3, 20): ['春分の日'],
  DateTime(2020, 4, 29): ['昭和の日'],
  DateTime(2020, 5, 3): ['憲法記念日'],
  DateTime(2020, 5, 4): ['みどりの日'],
  DateTime(2020, 5, 5): ['こどもの日'],
  DateTime(2020, 5, 6): ['振替休日'],
  DateTime(2020, 7, 23): ['海の日'],
  DateTime(2020, 7, 24): ['スポーツの日'],
  DateTime(2020, 8, 10): ['山の日'],
  DateTime(2020, 9, 21): ['敬老の日'],
  DateTime(2020, 9, 22): ['秋分の日'],
  DateTime(2020, 11, 3): ['文化の日'],
  DateTime(2020, 11, 23): ['勤労感謝の日'],
};

class CalendarScreen extends StatefulWidget {

  @override
  _State createState() => _State();
}

class _State extends State<CalendarScreen> {
  CalendarController _calendarController;

  @override
  void initState() {
    super.initState();
    _calendarController = CalendarController();
  }

  @override
  void dispose() {
    _calendarController.dispose();
    super.dispose();
  }

  void _navigateToRecordListScreen(final BuildContext context, final DateTime datetime) {
    final route = MaterialPageRoute(builder: (context) => RecordListScreen(datetime: datetime));
    Navigator.of(context).push(route);
  }

  void _onDaySelected(DateTime day, List events) {
    _navigateToRecordListScreen(context, day);
  }

  Widget _buildTableCalendar() {
    return TableCalendar(
      locale: 'ja_JP',
      calendarController: _calendarController,
      holidays: _holidays,
      onDayLongPressed: (day, events) => _onDaySelected(day, events),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: _buildTableCalendar(),
    );
  }
}
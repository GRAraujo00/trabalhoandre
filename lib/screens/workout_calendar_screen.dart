import 'package:flutter/material.dart';
import 'package:table_calendar/table_calendar.dart';

class WorkoutCalendarScreen extends StatefulWidget {
  @override
  _WorkoutCalendarScreenState createState() => _WorkoutCalendarScreenState();
}

class _WorkoutCalendarScreenState extends State<WorkoutCalendarScreen> {
  CalendarFormat _calendarFormat = CalendarFormat.month;
  DateTime _focusedDay = DateTime.now();
  DateTime? _selectedDay;
  Map<DateTime, List<String>> _workoutSummaries = {
    DateTime(2023, 6, 12): [
      'Superiores',
      'Supino Reto - 4x12',
      'Supino Inclinado - 4x12'
    ],
    DateTime(2023, 6, 13): [
      'Inferiores',
      'Agachamento Livre - 4x12',
      'Leg Press - 4x12'
    ],
    DateTime(2023, 6, 14): ['Cardio', 'Corrida - 30 min', 'Bicicleta - 20 min'],
    // Adicione mais entradas conforme necessário
  };

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.deepPurple,
      appBar: AppBar(
        title: Text(
          'Calendário de Treinos',
          style: TextStyle(color: Colors.white),
        ),
        backgroundColor: Colors.deepPurple,
        centerTitle: true,
      ),
      body: Column(
        children: [
          TableCalendar(
            firstDay: DateTime.utc(2010, 10, 16),
            lastDay: DateTime.utc(2030, 3, 14),
            focusedDay: _focusedDay,
            calendarFormat: _calendarFormat,
            selectedDayPredicate: (day) {
              return isSameDay(_selectedDay, day);
            },
            onDaySelected: (selectedDay, focusedDay) {
              setState(() {
                _selectedDay = selectedDay;
                _focusedDay = focusedDay;
              });
            },
            onFormatChanged: (format) {
              if (_calendarFormat != format) {
                setState(() {
                  _calendarFormat = format;
                });
              }
            },
            onPageChanged: (focusedDay) {
              _focusedDay = focusedDay;
            },
            calendarStyle: CalendarStyle(
              defaultTextStyle:
                  TextStyle(color: Colors.white), // Estilo padrão dos dias
              weekendTextStyle:
                  TextStyle(color: Colors.white), // Estilo dos fins de semana
              selectedTextStyle:
                  TextStyle(color: Colors.black), // Estilo do dia selecionado
              todayTextStyle:
                  TextStyle(color: Colors.black), // Estilo do dia atual
              todayDecoration: BoxDecoration(
                color: Colors.amber, // Cor de fundo do dia atual
                shape: BoxShape.circle,
              ),
              selectedDecoration: BoxDecoration(
                color:
                    Colors.lightBlueAccent, // Cor de fundo do dia selecionado
                shape: BoxShape.circle,
              ),
            ),
            daysOfWeekStyle: DaysOfWeekStyle(
              weekdayStyle:
                  TextStyle(color: Colors.white), // Estilo dos dias da semana
              weekendStyle:
                  TextStyle(color: Colors.white), // Estilo dos finais de semana
            ),
            calendarBuilders: CalendarBuilders(
              markerBuilder: (context, date, events) {
                if (_workoutSummaries
                    .containsKey(DateTime(date.year, date.month, date.day))) {
                  return Container(
                    alignment: Alignment.center,
                    decoration: BoxDecoration(
                      color: Colors.blue,
                      shape: BoxShape.circle,
                    ),
                    child: Text(
                      _workoutSummaries[
                          DateTime(date.year, date.month, date.day)]![0],
                      style: TextStyle(color: Colors.white, fontSize: 12),
                    ),
                  );
                }
                return null;
              },
            ),
          ),
          Expanded(
            child: _selectedDay != null &&
                    _workoutSummaries.containsKey(DateTime(_selectedDay!.year,
                        _selectedDay!.month, _selectedDay!.day))
                ? Padding(
                    padding: const EdgeInsets.all(16.0),
                    child: ListView(
                      children: _workoutSummaries[DateTime(_selectedDay!.year,
                              _selectedDay!.month, _selectedDay!.day)]!
                          .map((exercise) => Text(
                                exercise,
                                style: TextStyle(
                                    fontSize: 16, color: Colors.white),
                              ))
                          .toList(),
                    ),
                  )
                : Padding(
                    padding: const EdgeInsets.all(16.0),
                    child: Text(
                      'Nenhum treino planejado para este dia.',
                      style: TextStyle(fontSize: 16, color: Colors.white),
                    ),
                  ),
          ),
        ],
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:pomodoronepal/model/pomodoro_status.dart';

const pomodoroTotalTime = 1;
const shortBreakTime = 1;
const longBreakTime = 1;
const pomodoroPerSet = 4;

const Map<PomodoroStatus, String> statusDescription = {
  PomodoroStatus.runningPomodoro : 'Pomodoro is running, time to focus',
  PomodoroStatus.pausedPomodoro : 'Ready for a focused pomodoro?',
  PomodoroStatus.pausedShortBreak : 'Let\'s have a short break? ',
  PomodoroStatus.pausedLongBreak : 'Let\'s have a long break?',
  PomodoroStatus.runningLongBreak : 'Long break running, time to relax',
  PomodoroStatus.runningShortBreak : 'Short break running, time to relax',
  PomodoroStatus.setFinished : 'Congrats, set completed, ready to start a new set?',

};

const Map<PomodoroStatus, MaterialColor> statusColor = {
  PomodoroStatus.runningPomodoro : Colors.red,
  PomodoroStatus.pausedPomodoro : Colors.orange,
  PomodoroStatus.pausedShortBreak : Colors.orange,
  PomodoroStatus.pausedLongBreak : Colors.orange,
  PomodoroStatus.runningLongBreak : Colors.green,
  PomodoroStatus.runningShortBreak : Colors.green,
  PomodoroStatus.setFinished : Colors.orange,

};
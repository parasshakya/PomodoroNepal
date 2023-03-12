import 'package:flutter/material.dart';
import 'package:pomodoronepal/model/pomodoro_status.dart';

const pomodoroTotalTime = 25 * 60;
const shortBreakTime = 5 * 60;
const longBreakTime = 15 * 60;
const pomodoroPerSet = 4;

const Map<PomodoroStatus, String> statusDescription = {
  PomodoroStatus.runningPomodoro : 'Pomodoro is running, time to focus',
  PomodoroStatus.pausedPomodoro : 'Ready for a focused pomodoro?',
  PomodoroStatus.pausedShortBreak : 'Let\'s have a short break? ',
  PomodoroStatus.pausedLongBreak : 'Let\'s have a long break?',
  PomodoroStatus.runningLongBreak : 'Long break running, time to relax',
  PomodoroStatus.runningShortBreak : 'Short break running, time to relax',
  PomodoroStatus.setFinished : 'Congrats, you deserve a long break, ready to start?',

};

const Map<PomodoroStatus, MaterialColor> statusColor = {
  PomodoroStatus.runningPomodoro : Colors.green,
  PomodoroStatus.pausedPomodoro : Colors.orange,
  PomodoroStatus.pausedShortBreak : Colors.orange,
  PomodoroStatus.pausedLongBreak : Colors.orange,
  PomodoroStatus.runningLongBreak : Colors.red,
  PomodoroStatus.runningShortBreak : Colors.red,
  PomodoroStatus.setFinished : Colors.orange,

};
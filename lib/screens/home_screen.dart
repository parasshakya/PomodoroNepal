import 'dart:async';

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:percent_indicator/circular_percent_indicator.dart';
import 'package:pomodoronepal/model/pomodoro_status.dart';
import 'package:pomodoronepal/utils/constants.dart';
import 'package:pomodoronepal/widgets/custom_button.dart';
import '../widgets/progress_icons.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);


  @override
  State<HomeScreen> createState() => _HomeScreenState();

}

const _btnTextStart = 'START POMODORO';
const _btnTextResumePomodoro = 'RESUME POMODORO';
const _btnTextResumeBreak = 'RESUME BREAK';
const _btnTextStartShortBreak = 'TAKE SHORT BREAK';
const _btnTextStartLongBreak = 'TAKE LONG BREAK';
const _btnTextStartNewSet = 'START NEW SET';
const _btnTextReset = 'RESET';
const _btnTextPause = "PAUSE POMODORO";


class _HomeScreenState extends State<HomeScreen> {

  int remainingTime = pomodoroTotalTime;
  String mainBtnText = _btnTextStart;
  PomodoroStatus pomodoroStatus = PomodoroStatus.pausedPomodoro;
   Timer? _timer;
  int pomodoroNum = 0;
  int setNum = 0;

  @override
  void dispose(){
    _cancelTimer();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {

    return Scaffold(

      backgroundColor: Colors.grey[900],
      appBar: AppBar(title: Row(
        children: [
          Text('Pomodoro Nepal',style: GoogleFonts.raleway(
            fontSize: 24,
            fontWeight: FontWeight.bold,
            color: Colors.black,
          ),
          ),
          // Image.asset('assets/images/flag.png', scale: 10,)

        ],
      ),
        actions: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: const Icon(Icons.person, size: 32,),
          ),
        ],
    ),

      body: SafeArea(
        child: Center(
          child: Column(
            children: [
              SizedBox(height: 20,),
              Text('Pomodoro Number: $pomodoroNum', style: GoogleFonts.raleway(
                fontSize: 30,
                fontWeight: FontWeight.bold,
                color: Colors.orange.shade100,
              ),
            ),
              SizedBox(height: 10,),
              Text('Set: $setNum', style: GoogleFonts.raleway(
                fontSize: 30,
                fontWeight: FontWeight.bold,
                color: Colors.orange.shade100,
              ),),
              Expanded(child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Stack(
                    children: [
                      Positioned(
                          child: Image.asset('assets/images/flag.png', width: 280,),
                        left: 50,
                        top: 6.5,
                        right: 10,
                        bottom: 30,


                      ),
                      CircularPercentIndicator(radius: 160, lineWidth: 15, percent: _getPomodoroPercentage(), center: Card(

                        shadowColor: Colors.black,
                        elevation: 10,
                        color: Colors.red.withOpacity(0.5),
                        child: Text(_secondsToFormattedString(remainingTime), style: GoogleFonts.lato(
                        fontSize: 70,
                        color: Colors.white,
                    ),),
                      ),
                      progressColor: statusColor[pomodoroStatus],
                      circularStrokeCap: CircularStrokeCap.round,
                    ),
                    ]
                  ),
                  SizedBox(height: 25,),
                  ProgressIcon(total: pomodoroPerSet, done: pomodoroNum - (setNum * pomodoroPerSet)),
                  SizedBox(height: 10,),
                  Text(statusDescription[pomodoroStatus]!, style: TextStyle(color: Colors.white, fontSize: 18),),
                  SizedBox(height: 10,),
                  CustomButton(onTap: (){
                    _mainButtonPressed();
                  }, text: mainBtnText ),
                  CustomButton(onTap: (){
                    _resetButtonPressed();
                  }, text: _btnTextReset)
                ],

              )),

            ],
          ),
        ),
      ),
    );
  }
  _secondsToFormattedString(int seconds){
    int roundedMinutes = seconds ~/ 60;
    int remainingSeconds = seconds - (roundedMinutes * 60);
    String remainingSecondsFormatted;
    if(remainingSeconds < 10){
      remainingSecondsFormatted = '0$remainingSeconds';
    }else{
      remainingSecondsFormatted = remainingSeconds.toString();
    }
    return '$roundedMinutes:$remainingSecondsFormatted';
    
  }

  _getPomodoroPercentage(){
    int totalTime;
    switch(pomodoroStatus){

      case PomodoroStatus.runningPomodoro:
        totalTime = pomodoroTotalTime;
        // TODO: Handle this case.
        break;
      case PomodoroStatus.pausedPomodoro:
        totalTime = pomodoroTotalTime;
        // TODO: Handle this case.
        break;
      case PomodoroStatus.runningShortBreak:
        totalTime = shortBreakTime;
        // TODO: Handle this case.
        break;
      case PomodoroStatus.pausedShortBreak:
        totalTime = shortBreakTime;
        // TODO: Handle this case.
        break;
      case PomodoroStatus.runningLongBreak:
        totalTime = longBreakTime;
        // TODO: Handle this case.
        break;
      case PomodoroStatus.pausedLongBreak:
        totalTime = longBreakTime;
        // TODO: Handle this case.
        break;
      case PomodoroStatus.setFinished:
        totalTime = pomodoroTotalTime;
        // TODO: Handle this case.
        break;
    }
    double percentage = (totalTime - remainingTime) / totalTime;
    return percentage;
  }
  _mainButtonPressed(){

    switch(pomodoroStatus){
      case PomodoroStatus.pausedPomodoro: _startPomodoroCountdown(); break;

      case PomodoroStatus.runningPomodoro : _pausePomodoroCountdown();
      break;

      case PomodoroStatus.runningShortBreak : break;


      case PomodoroStatus.pausedShortBreak :
        break;

      case PomodoroStatus.runningLongBreak :
        break;

      case PomodoroStatus.pausedLongBreak :
        break;


      case PomodoroStatus.setFinished :
        break;

    }

  }

  _startPomodoroCountdown(){
    pomodoroStatus = PomodoroStatus.runningPomodoro;
    _cancelTimer();
    if(_timer != null){
      _timer!.cancel();
    }

    _timer = Timer.periodic(Duration(seconds: 1), (timer) {
      if(remainingTime > 0){
        setState(() {
          remainingTime--;
          mainBtnText = _btnTextPause;
        });
      }else{
        pomodoroNum++;
       _cancelTimer();
       if(pomodoroNum % pomodoroPerSet == 0){
         pomodoroStatus = PomodoroStatus.pausedLongBreak;
         setState(() {
           remainingTime = longBreakTime;
           mainBtnText = _btnTextStartLongBreak;
         });
       }else {
         pomodoroStatus = PomodoroStatus.pausedShortBreak;
         setState(() {
           remainingTime = shortBreakTime;
           mainBtnText = _btnTextStartShortBreak;
         });
       }
      }
    });
  }
  _pausePomodoroCountdown(){
    pomodoroStatus = PomodoroStatus.pausedPomodoro;
    _cancelTimer();
    setState(() {
      mainBtnText = _btnTextResumePomodoro;
    });
  }

  _resetButtonPressed(){
    pomodoroNum = 0;
    setNum = 0;
    _cancelTimer();
    _stopCountDown();
  }

  _stopCountDown(){
    pomodoroStatus = PomodoroStatus.pausedPomodoro;
    setState(() {
      mainBtnText = _btnTextStart;
      remainingTime = pomodoroTotalTime;
    });
  }
  _cancelTimer(){
    if(_timer != null){
      _timer!.cancel();
    }
  }
  
}

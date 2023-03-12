import 'package:flutter/material.dart';

class ProgressIcon extends StatelessWidget {

  final int total;
  final int done;

  const ProgressIcon({required this.total, required this.done});



  @override
  Widget build(BuildContext context) {
    final iconSize = 50.0;
    final doneIcon = Icon(Icons.beenhere, color: Colors.orange, size: iconSize,);
    final notDoneIcon = Icon(Icons.beenhere_outlined, color: Colors.orange[100], size: iconSize,);
    List<Icon> icons = [];
    for(int i = 0 ; i < total ; i++){
      if(i<done){
        icons.add(doneIcon);
      }else{
        icons.add(notDoneIcon);
      }
    }
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: icons
    );
  }
}

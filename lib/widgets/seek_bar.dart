import 'package:flutter/material.dart';

class SeekBarData {
  Duration position;
  Duration bufferedPosition;
  Duration duration;

  SeekBarData(this.position, this.bufferedPosition, this.duration);
}

class SeekBar extends StatefulWidget {
  const SeekBar({Key? key}) : super(key: key);

  @override
  State<SeekBar> createState() => _SeekBarState();
}

class _SeekBarState extends State<SeekBar> {
  @override
  Widget build(BuildContext context) {
    return Container();
  }
}

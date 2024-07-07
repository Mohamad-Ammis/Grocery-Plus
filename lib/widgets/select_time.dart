import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
class SelectTime extends StatefulWidget {
  const SelectTime({Key? key}) : super(key: key);

  @override
  State<SelectTime> createState() => _SelectTimeState();
}

class _SelectTimeState extends State<SelectTime> {
  int? _selectedTimeIndex;

  void _selectTime(int index) {
    setState(() {
      _selectedTimeIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            TimeCon(
              time: '8',
              time2: '11',
              morEv: 'AM',
              morEv2: 'AM',
              isCurrentSelection: _selectedTimeIndex == 0,
              onTap: () => _selectTime(0),
            ),
            const Gap(5),
            TimeCon(
              time: '11',
              time2: '12',
              morEv: 'AM',
              morEv2: 'PM',
              isCurrentSelection: _selectedTimeIndex == 1,
              onTap: () => _selectTime(1),
            ),
            const Gap(5),
            TimeCon(
              time: '12',
              time2: '2',
              morEv: 'PM',
              morEv2: 'PM',
              isCurrentSelection: _selectedTimeIndex == 2,
              onTap: () => _selectTime(2),
            ),
          ],
        ),
        const Gap(5),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            TimeCon(
              time: '2',
              time2: '4',
              morEv: 'PM',
              morEv2: 'PM',
              isCurrentSelection: _selectedTimeIndex == 3,
              onTap: () => _selectTime(3),
            ),
            const Gap(5),
            TimeCon(
              time: '4',
              time2: '6',
              morEv: 'PM',
              morEv2: 'PM',
              isCurrentSelection: _selectedTimeIndex == 4,
              onTap: () => _selectTime(4),
            ),
            const Gap(5),
            TimeCon(
              time: '6',
              time2: '8',
              morEv: 'PM',
              morEv2: 'PM',
              isCurrentSelection: _selectedTimeIndex == 5,
              onTap: () => _selectTime(5),
            ),
          ],
        ),
      ],
    );
  }
}

class TimeCon extends StatefulWidget {
  const TimeCon({
    Key? key,
    required this.time,
    required this.time2,
    required this.morEv,
    required this.morEv2,
    required this.isCurrentSelection,
    required this.onTap,
  }) : super(key: key);

  final String time;
  final String time2;
  final String morEv;
  final String morEv2;
  final bool isCurrentSelection;
  final VoidCallback onTap;

  @override
  State<TimeCon> createState() => _TimeConState();
}

class _TimeConState extends State<TimeCon> {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: widget.onTap,
      child: Container(
        decoration: BoxDecoration(
          color: Color(0xffFFF7FC),
          borderRadius: BorderRadius.all(Radius.circular(12)),
          border: Border.all(
            color: widget.isCurrentSelection ? Colors.green : Colors.transparent,
          ),
        ),
        height: 52,
        width: 103,
        child: Center(
          child: Text(
            '${widget.time} ${widget.morEv}-${widget.time2} ${widget.morEv2}',
            style: TextStyle(color: widget.isCurrentSelection ? Colors.green : Colors.grey),
          ),
        ),
      ),
    );
  }
}

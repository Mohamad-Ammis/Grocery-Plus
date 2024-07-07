import 'package:flutter/material.dart';

class DatePicker extends StatefulWidget {
  const DatePicker({Key? key}) : super(key: key);

  @override
  State<DatePicker> createState() => _DatePickerState();
}

class _DatePickerState extends State<DatePicker> {
  TextEditingController dateController=TextEditingController();
  @override
  Widget build(BuildContext context) {//showDatePicker
    Future<void>selectDate()async{
    DateTime? picked=  await showDatePicker(context: context,
          firstDate: DateTime(2024,4,1),
          lastDate: DateTime(2025));
    if(picked!=null){
      setState(() {
        dateController.text=picked.toString().split(" ")[0];
      });
    }
    else{}
    }
    return TextField(
      controller: dateController,
      decoration: InputDecoration(
        labelText: 'Select Date',
        labelStyle: TextStyle(fontSize: 18,color: Colors.grey),
        filled: true,
        prefixIcon: Icon(Icons.date_range_outlined),
        suffixIcon: Icon(Icons.arrow_drop_down_outlined),
        enabledBorder: OutlineInputBorder(
          borderSide: BorderSide.none,
          borderRadius: BorderRadius.all(Radius.circular(12)),
        ),
        focusedBorder:  OutlineInputBorder(
          borderSide: BorderSide.none,
          borderRadius: BorderRadius.all(Radius.circular(12)),
        ),
      ),
      readOnly: true,
      onTap: (){
        selectDate();
      },
    );
  }
}

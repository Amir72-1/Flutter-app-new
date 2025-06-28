import 'package:flutter/material.dart';

class TextfieldWidgets extends StatefulWidget {
  final String label;
  final String text;
  final ValueChanged<String> onChanged;
  const TextfieldWidgets({
    Key? key,
    required this.label,
    required this.text,
    required this.onChanged,
  }
  ) : super(key: key);

  @override
  _TextfieldWidgetsState createState() => _TextfieldWidgetsState();
}

class _TextfieldWidgetsState extends State<TextfieldWidgets> {
  late final TextEditingController controller;
  @override
  void initState(){
    super.initState();

    controller = TextEditingController(text: widget.text);
  }

  @override
  void dispose() {
         controller.dispose();
    super.dispose();
  }
  


  @override
  Widget build(BuildContext context) => Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
      Text(
        widget.label,
        style: TextStyle(fontWeight: FontWeight.bold,fontSize: 16),
      ),
      const SizedBox(height: 24) ,
      TextField(
        controller: controller,
      ),
    ],
  );
    
  
}
import 'package:flutter/material.dart';

class Field extends StatelessWidget {
  
  final Control;
  final TextHint;

Field({
  required this.Control,
  required this.TextHint,
});
  @override
  Widget build(BuildContext context) {
    return Container(
      child: TextFormField(
        controller: Control,
        decoration: InputDecoration(
          border: OutlineInputBorder(),
          hintText: TextHint,
        ),
      ),

    
      
    );
  }
}
import 'package:flutter/material.dart';


Widget buildSideEffectsContainer(String? medicationCode , BuildContext context) {
  final Map<String, String> medicationData = {
    '12345': 'Headache, dizziness, nausea.',
    '67890': 'Dry mouth, drowsiness, upset stomach.',
    '11223': 'Fatigue, blurred vision, mild rash.'
  };
  final sideEffects = medicationData[medicationCode] ?? 
      'No side effects found for this medication.';

  
  print("the return container is called");
  return Container(
   
    padding: EdgeInsets.all(20),
    decoration: BoxDecoration(
      color: Colors.white,
      borderRadius: BorderRadius.circular(20),
      boxShadow: [
        BoxShadow(
          color: Colors.black26,
          blurRadius: 10,
          offset: Offset(0, 5),
        ),
      ],
    ),
    child: Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        Text(
          'Side Effects',
          style: TextStyle(
            fontSize: 20,
            fontWeight: FontWeight.bold,
          ),
        ),
        SizedBox(height: 15),
        Text(
          sideEffects,
          style: TextStyle(
            fontSize: 16,
            color: Colors.black54,
          ),
          textAlign: TextAlign.center,
        ),
        SizedBox(height: 20),
        ElevatedButton(
          onPressed: () => Navigator.of(context).pop(),
          style: ElevatedButton.styleFrom(
            backgroundColor: Colors.blue,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(10),
            ),
          ),
          child: Text(
            'OK',
            style: TextStyle(color: Colors.white),
          ),
        ),
      ],
    ),
     
  );
}

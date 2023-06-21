import 'package:flutter/material.dart';
import 'package:m2m_flutter_main/pages/mentee_page.dart';

class MySquare extends StatelessWidget {
  final child;

  MySquare({required this.child});
  @override
  Widget build(BuildContext context) {
       backgroundColor:Colors.white;
    return Padding(
   
      padding: const EdgeInsets.symmetric(vertical: 35, horizontal: 35),
      child: Container(
        height:200,
        decoration: BoxDecoration(
          borderRadius:BorderRadius.circular(50.0) ,
          shape: BoxShape.rectangle,
          color: Colors.deepPurple[400],
          
        ),
        child: ElevatedButton(
        
          style: ElevatedButton.styleFrom(
         
            primary: Theme.of(context).colorScheme.secondary,
            minimumSize: Size(MediaQuery.of(context).size.width * 0.5,
                MediaQuery.of(context).size.height * 0.9),
            //elevation: 3,
          ),
          child: Text(
            'Comments',
            style: TextStyle(fontSize: 20.0),
          ),
          onPressed: () {
            Navigator.push(
                context, MaterialPageRoute(builder: (context) => MenteePage()));
          },
        ),
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'menuApp.dart';

class PlatillosDisponibles extends StatefulWidget {
  const PlatillosDisponibles({super.key});

  @override
  State<PlatillosDisponibles> createState() => _PlatillosDisponiblesState();
}

class _PlatillosDisponiblesState extends State<PlatillosDisponibles> {
  @override
  Widget build(BuildContext context) {
    return Scaffold( body: ListView(
      children: [
        Padding(
  
    padding: const EdgeInsets.all(8.0),
    child: Row(
    children: [
    
      Container(
  color: Color.fromARGB(59, 233, 233, 233),
  
        child: 
        //boton menu principal
            IconButton(onPressed:() {
                
               Navigator.push(
            context,
                 MaterialPageRoute(builder: (context) => MenuApp()),);
                
            }, 
            icon: Image.asset("assets/images/Home.png", height: 40, )),
          
        ),
     
     Expanded(child:   Container(
        color:Color.fromARGB(255, 0, 0, 0),
         child: 

        Text("Plan de alimentos", style: TextStyle(fontSize: 20, color: Color.fromARGB(255, 255, 255, 255), fontWeight: FontWeight.w400), ),
       ),
       )
    ],
     ),
  ),
  Text(" Lunes"),
      Padding(
        padding: const EdgeInsets.only(left: 20, right: 20),
        child: Container(

 decoration: BoxDecoration(
        color:Color.fromARGB(50, 160, 160, 160),

  border: Border.all(
    color: const Color.fromARGB(255, 133, 133, 133),
    width: 1
  )
),
         alignment: Alignment.bottomLeft,
          child: Column(
            children: [
             
              Text("Desayuno ...... "),
              Text("Almuerzo...."),
              Text("Comida...."),

            ],
          ),
        ),
      ),

      Text(" Martes"),
      Padding(
        padding: const EdgeInsets.only(left: 20, right: 20),
        child: Container(

 decoration: BoxDecoration(
        color:Color.fromARGB(50, 160, 160, 160),

  border: Border.all(
    color: const Color.fromARGB(255, 133, 133, 133),
    width: 1
  )
),
         alignment: Alignment.bottomLeft,
          child: Column(
            children: [
             
              Text("Desayuno ...... "),
              Text("Almuerzo...."),
              Text("Comida...."),

            ],
          ),
        ),
      ),



      Text(" miercoles"),
      Padding(
        padding: const EdgeInsets.only(left: 20, right: 20),
        child: Container(

 decoration: BoxDecoration(
        color:Color.fromARGB(50, 160, 160, 160),

  border: Border.all(
    color: const Color.fromARGB(255, 133, 133, 133),
    width: 1
  )
),
         alignment: Alignment.bottomLeft,
          child: Column(
            children: [
             
              Text("Desayuno ...... "),
              Text("Almuerzo...."),
              Text("Comida...."),

            ],
          ),
        ),
      ),
      
      Text(" Jueves"),
      Padding(
        padding: const EdgeInsets.only(left: 20, right: 20),
        child: Container(

 decoration: BoxDecoration(
        color:Color.fromARGB(50, 160, 160, 160),

  border: Border.all(
    color: const Color.fromARGB(255, 133, 133, 133),
    width: 1
  )
),
         alignment: Alignment.bottomLeft,
          child: Column(
            children: [
             
              Text("Desayuno ...... "),
              Text("Almuerzo...."),
              Text("Comida...."),

            ],
          ),
        ),
      ),

      Text(" Viernes"),
      Padding(
        padding: const EdgeInsets.only(left: 20, right: 20),
        child: Container(

 decoration: BoxDecoration(
        color:Color.fromARGB(50, 160, 160, 160),

  border: Border.all(
    color: const Color.fromARGB(255, 133, 133, 133),
    width: 1
  )
),
         alignment: Alignment.bottomLeft,
          child: Column(
            children: [
             
              Text("Desayuno ...... "),
              Text("Almuerzo...."),
              Text("Comida...."),

            ],
          ),
        ),
      ),

      Text(" Sabado"),
      Padding(
        padding: const EdgeInsets.only(left: 20, right: 20),
        child: Container(

 decoration: BoxDecoration(
        color:Color.fromARGB(50, 160, 160, 160),

  border: Border.all(
    color: const Color.fromARGB(255, 133, 133, 133),
    width: 1
  )
),
         alignment: Alignment.bottomLeft,
          child: Column(
            children: [
             
              Text("Desayuno ...... "),
              Text("Almuerzo...."),
              Text("Comida...."),

            ],
          ),
        ),
      ),



      Text(" Domingo"),
      Padding(
        padding: const EdgeInsets.only(left: 20, right: 20),
        child: Container(

 decoration: BoxDecoration(
        color:Color.fromARGB(50, 160, 160, 160),

  border: Border.all(
    color: const Color.fromARGB(255, 133, 133, 133),
    width: 1
  )
),
         alignment: Alignment.bottomLeft,
          child: Column(
            children: [
             
              Text("Desayuno ...... "),
              Text("Almuerzo...."),
              Text("Comida...."),

            ],
          ),
        ),
      ),
   IconButton(onPressed:() {
                
               Navigator.push(
            context,
                 MaterialPageRoute(builder: (context) => MenuApp()),);
                
            }, 
            icon: Image.asset("assets/images/Home.png", height: 100, )),
      ],
    ));
  }
}
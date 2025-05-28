import 'package:flutter/material.dart';
import 'menuApp.dart';

class Recomendacion extends StatefulWidget {
  const Recomendacion({super.key});

  @override
  State<Recomendacion> createState() => _RecomendacionState();
}

class _RecomendacionState extends State<Recomendacion> {

  //variables
  String alimentoRegistrado= " Queso";
  String platillo = "hamburguesa";
  String ingredientes= "se requiere pan, queso, carne";

  // funcion de las 5 recomendaciones
  Widget recomendacion(String platillo, String ingrediente, ){
    return Container( 
      decoration: BoxDecoration(color: Colors.white,
        border: Border.all(width: 2, color: Color.fromARGB(199, 153, 153, 153),), borderRadius: BorderRadius.circular(5)),
      child: Row(
        children: [
          Text("$platillo",
           style: TextStyle(
            fontWeight: FontWeight.bold
            ),
            ),
            Spacer(),
            Text(" $ingrediente",
           style: TextStyle(
            color: Colors.grey
            ),
            ),
        ],
        
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold( body:  ListView(
      children: [
        
        Container(
          height: 40,
          alignment: Alignment.center,
          decoration: 
        BoxDecoration(
          color: Color.fromARGB(255, 1, 1, 1),
        ),
          child: Padding(
            padding: const EdgeInsets.only(top: 15),
            child: Column(
            children: [
                Text("Registraste el ingrediente alimento",
            style: TextStyle(color: Color.fromARGB(255 , 255, 255, 255)),),
              ],
            ),
          ),
        ),
      

      Padding(
        padding: const EdgeInsets.only(left: 40, right: 30, top: 30, bottom: 30),
        child: Column
        (
        
        children: [
          Text("Estas recetas que llevan $alimentoRegistrado podrian interesarte, de acuerdo a los ingredientes que se encuentran disponibles",
          style: TextStyle(fontSize: 16),
          ),

        ],  
        
        ),
      ),
      //contenedor de recomendaciones---------------------
    Container(
      height: 400,
      decoration: BoxDecoration(border: Border.all(
        width: 2,
        color: Colors.grey), color: const Color.fromARGB(100, 163, 163, 163)),
        child:ListView(
        children: [
          Padding(
            padding: const EdgeInsets.only(left: 10, right: 10, top: 10, bottom: 10 ),
            child: Column(
              children: [
                //ejemplos de la funcion en total debe mostrar al menos 5.
              recomendacion(platillo, ingredientes ),
              SizedBox(height: 15,),
              recomendacion(platillo, ingredientes ),
              SizedBox(height: 15,),
              
              recomendacion(platillo, ingredientes ),
              SizedBox(height: 15,),
              recomendacion(platillo, ingredientes ),
              SizedBox(height: 15,),
              recomendacion(platillo, ingredientes ),
            
              ],
            ),
          ),
          

        ],
      ) ,
    ),
       Container(
  color: Color.fromARGB(59, 233, 233, 233),
  
        child: 
        //boton menu principal
            IconButton(onPressed:() {
                
               Navigator.push(
            context,
                 MaterialPageRoute(builder: (context) => MenuApp()),);
                
            }, 
            icon: Image.asset("assets/images/Home.png", height: 100, )),
          
        ),
      ],
    ),);
  }
}
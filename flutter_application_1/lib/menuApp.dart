import 'package:flutter/material.dart';
import 'conservarAlimentos.dart';
import 'registroIngredientesDisponibles.dart';
import 'planAlimentos.dart';
import 'platillosDisponibles.dart';
class MenuApp extends StatefulWidget {
  const MenuApp({super.key});

  @override
  State<MenuApp> createState() => _MenuAppState();
}

class _MenuAppState extends State<MenuApp> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(  
    body: 
    ListView(
      
      children:
       [
        
      //inicio del menu y sus opciones
              //boton
 Padding(
   padding: const EdgeInsets.all(8.0),
   child: Column(
     children: [
        Container(

 color: Color.fromARGB(255, 231, 204, 113),
          child: Column(
            children: [
              Image.asset("assets/images/pan.png", height: 180,),
                     SizedBox(height: 10,),
                     
                     ElevatedButton(onPressed: (){

 Navigator.push(
    context,
 MaterialPageRoute(builder: (context) => RegistroIngredientes()));

                     } , child: Text("Resgistro ingredientes ", style: TextStyle(color: Colors.white)), 
                     
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.black, // Color de fondo
                minimumSize: Size(600, 50), // Ancho y alto mínimo
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(5), // Bordes redondeados
                  side: BorderSide(color: Colors.black, width: 2), // Borde con color y grosor
                ),
                     
                     ),),
            ],
          ),
        ),
       SizedBox(height: 50,),
       
         Container(
 color: Color.fromARGB(255, 115, 167, 235),

           child: Column(
             children: [
               Image.asset("assets/images/conservarA.png", height: 180,),
                      SizedBox(height: 10,),
                      //boton 2
                      
                      SizedBox(height: 10,),
                      ElevatedButton(onPressed: (){ 

 Navigator.push(
    context,
 MaterialPageRoute(builder: (context) => conservaAlimentos()));
                        
                      } , child: Text("Conservar alimentos", style: TextStyle(color: Colors.white)), 
                      
                       style: ElevatedButton.styleFrom(
                backgroundColor: Colors.black, // Color de fondo
                minimumSize: Size(600, 50), // Ancho y alto mínimo
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(5), // Bordes redondeados
                  side: BorderSide(color: Colors.black, width: 2), // Borde con color y grosor
                ),
                      
                      ),),
             ],
           ),
         ),
       SizedBox(height: 50,),

         Container(
 color: Color.fromARGB(255, 179, 179, 179),

           child: Column(
             children: [
               Image.asset("assets/images/planAlimentos.png", height: 180,),
                      SizedBox(height: 10,),
                      //boton 3
                      SizedBox(height: 10,),
                    
                      ElevatedButton(onPressed: (){



 Navigator.push(
    context,
 MaterialPageRoute(builder: (context) => PlanAlimentos()));

                      } , child: Text("Iniciar plan de alimentos", style: TextStyle(color: Colors.white)), 
                      
                       style: ElevatedButton.styleFrom(
                backgroundColor: Colors.black, // Color de fondo
                minimumSize: Size(600, 50), // Ancho y alto mínimo
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(5), // Bordes redondeados
                  side: BorderSide(color: Colors.black, width: 2), // Borde con color y grosor
                ),
                      
                      ),),
             ],
           ),
         ),
       
          SizedBox(height: 50,),

         Container(
 color: Color.fromARGB(255, 241, 177, 36),

           child: Column(
             children: [
               Image.asset("assets/images/comidaRica.png", height: 180,),
                      SizedBox(height: 10,),
                      //boton 3
                      SizedBox(height: 10,),
                    
                      ElevatedButton(onPressed: (){


 Navigator.push(
    context,
 MaterialPageRoute(builder: (context) => PlatillosDisponibles()));


                      } , child: Text("Plan alimento disponible ", style: TextStyle(color: Colors.white)), 
                      
                       style: ElevatedButton.styleFrom(
                backgroundColor: Colors.black, // Color de fondo
                minimumSize: Size(600, 50), // Ancho y alto mínimo
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(5), // Bordes redondeados
                  side: BorderSide(color: Colors.black, width: 2), // Borde con color y grosor
                ),
                      
                      ),),
             ],
           ),
         ),
     ],
   ),
 ),
      ],
      
    )
  );}
}
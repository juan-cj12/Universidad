import 'package:flutter/material.dart';
import 'package:FridgeHero/recomendacion.dart';
import 'menuApp.dart';
import 'package:intl/intl.dart';



class RegistroIngredientes extends StatefulWidget {
  const RegistroIngredientes({super.key});

  @override
  State<RegistroIngredientes> createState() => _RegistroIngredientesState();
  
}


class _RegistroIngredientesState extends State<RegistroIngredientes> {
  late TextEditingController controller;
   TextEditingController fechaController = TextEditingController();

   //variables
String alimentoSeleccionado= "";
int cantidad = 0;
String nombreAlimento= "";
   //funcion fecha
    Future<void> _mostrarCalendario(BuildContext context) async {
    DateTime? fechaSeleccionada = await showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime(1900),
      lastDate: DateTime(2100),
      locale: const Locale('es'),
    );

    if (fechaSeleccionada != null) {
      String fechaFormateada = DateFormat('dd/MM/yyyy').format(fechaSeleccionada);
      fechaController.text = fechaFormateada;
    }
  }

  @override
  void initState() {
    super.initState();
    controller = TextEditingController();
  }

  @override
  void dispose() {
        fechaController.dispose();
    controller.dispose();
    super.dispose();
  }
  @override

  Widget build(BuildContext context) {

    Widget botonComida(String alimento) {
  return SizedBox(
    width: 200,
    height: 60,
    child: ElevatedButton(
      onPressed: () {
        setState(() {
          alimentoSeleccionado = alimento;
        });
      },
      child: Text(
        "$alimento",
        style: TextStyle(fontSize: 18),
      ),
      style: ElevatedButton.styleFrom(
        backgroundColor: alimentoSeleccionado == alimento
            ? const Color.fromARGB(255, 56, 147, 221)
            : Colors.black,
        foregroundColor: Colors.white,
        elevation: 25,
        shadowColor: Colors.black,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(16),
          side: BorderSide(
            color: Colors.black,
            width: 2,
          ),
        ),
      ),
    ),
  );
}

    return Scaffold(body: 
    ListView(

      children:[
 // menu principal de zona superior junto texto 

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

        Text("Registro alimentos", style: TextStyle(fontSize: 20, color: Color.fromARGB(255, 255, 255, 255), fontWeight: FontWeight.w400), ),
       ),
       )
    ],
     ),
  ),

//Ingresar Nombre -----------------

Padding(
  padding: const EdgeInsets.all(8.0),
  child: Container(
    child: Column(
      children:[
          Text("Ingresa el nombre del alimento ", style: TextStyle(fontSize: 20, color: Color.fromARGB(255, 0, 0, 0), fontWeight: FontWeight.w400), ),
        TextField(
        controller: controller 
        ,decoration: InputDecoration(
          hintText: "Ejemplo: banano",
          border: OutlineInputBorder(),
           focusedBorder: OutlineInputBorder(
        borderSide: BorderSide(
          color: Colors.blue, // ✅ Color cuando haces clic o escribes
          width: 2,
        ),
      ),
        ) ,
        onChanged: (value){
          setState((){
            nombreAlimento= value;
          });
        },
        ),]
    ),
  ),
),

SizedBox(height: 10,),

// seleccionar  alimentos ------------------------------
Container( decoration: BoxDecoration(
  border: Border.all(
    color: Colors.grey,
    width: 2
  )
),
alignment: Alignment.center,
  child: Text("selecciona el grupo alimenticio al que pertenece dicho alimento"),
),

//alimento a seleccionar---------------------------------
Container(
      height: 400,
child: 
ListView(
  children: [
    Container(
       decoration: BoxDecoration(
  border: Border.all(
    color: const Color.fromARGB(255, 0, 0, 0),
    width: 2
  )
),
alignment: Alignment.center,

      child: Column(
        children: [

          SizedBox(height: 10,),
          
          botonComida("Producto lacteo"),
          SizedBox(height: 10,),
            botonComida("Proteina"),
          SizedBox(height: 10,),
             botonComida("Grano"),
          SizedBox(height: 10,),
             botonComida("Fruta"),
          SizedBox(height: 10,),
             botonComida("Verdura"),
          SizedBox(height: 10,),
             botonComida("Aceites grasas"),
          SizedBox(height: 10,),
             botonComida("Alcohol"),
          SizedBox(height: 10,),


        ],
      ),
    )
  ],
),),
//cantidad
Container( alignment: Alignment.center ,
  child: Column(
    children: [
      Text("Ingresar la cantidad"),
      Padding(
        padding: const EdgeInsets.only(left: 90, right:30 ),
        child: Row(
          
          children: [
               IconButton(onPressed: (){
                if(cantidad <=0 ){
                  
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text('no puedes registar un alimento de cantidad 0 o menos'),
        backgroundColor: Colors.red,
        duration: Duration(seconds: 2),
      ),
    );
                }
      else{
        setState(() {
        cantidad--;
          
        });
      }
               }, icon: Image.asset("assets/images/Menus.png", height: 25,)),
             Text("$cantidad", style: TextStyle(color: Colors.black, fontSize: 30),),
             IconButton(onPressed: (){
                setState(() {
        cantidad++;
          
        });
             }, icon: Image.asset("assets/images/Plus.png", height: 50,)),
        
          ],
        ),
      ),
    ],
  ),
             
),
//
Container(
  child: Column(
    children: [
      TextField(
          controller: fechaController,
          decoration: InputDecoration(
            labelText: "Fecha de vencimiento",
            hintText: "dd/mm/aaaa",
            suffixIcon: Icon(Icons.calendar_today),
            border: OutlineInputBorder(),
          ),
          readOnly: true, // impide escribir directamente
          onTap: () => _mostrarCalendario(context),
        ),
    ],
  ),
),
// boton de continuar-----------
SizedBox(height: 30,),
ElevatedButton(
      onPressed: () {
      
  ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text('$alimentoSeleccionado  $nombreAlimento cantidad $cantidad ${fechaController.text}  ' ),
        backgroundColor: Colors.green,
        duration: Duration(seconds: 2),
      ),
    );  
 Navigator.push(
    context,
 MaterialPageRoute(builder: (context) => Recomendacion()));

  
      },
      child: Text(

        "continuar",
        style: TextStyle(fontSize: 18),
      ),
      style: ElevatedButton.styleFrom(
        backgroundColor: Colors.black,
        foregroundColor: Colors.white,
        elevation: 25,
        shadowColor: Colors.black,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(16),
          side: BorderSide(
            color: Colors.black,
            width: 2,
          ),
        ),
      ),
    ),
      ]
      
    )



  
  );
  
  }
}

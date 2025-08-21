import 'package:flutter/material.dart';
import 'package:ola_mundo/app_controller.dart';

class HomePage extends StatefulWidget {
  @override
  State<HomePage> createState() {
    return HomePageState();
  }
}

class HomePageState extends State<HomePage> {
  int counter = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: Padding(
        padding: const EdgeInsets.only(top: 50.0),
        child: Drawer(
          child: Column(
            children: [
              UserAccountsDrawerHeader(
                accountName: Text("Werli"),
                accountEmail: Text("werli@gmail.com"),
                currentAccountPicture: ClipRRect(
                  borderRadius: BorderRadius.circular(10),
                  child: Image.network(
                    "https://i.pinimg.com/736x/28/48/81/2848819d44eb9587595abed56b5c1fa6.jpg",
                  ),
                ),
              ),
              ListTile(
                leading: Icon(Icons.home),
                title: Text('Inicio'),
                subtitle: Text('Tela de inicio'),
                onTap: () {
                  print("home");
                },
              ),
              ListTile(
                leading: Icon(Icons.home),
                title: Text('Logout'),
                subtitle: Text('Finalizar sessao'),
                onTap: () {
                  Navigator.of(context).pushReplacementNamed("/");
                },
              ),
            ],
          ),
        ),
      ),
      appBar: AppBar(
        title: Text("Contador de cliques"),
        actions: [CustomSwitcher()],
        centerTitle: true,
        backgroundColor: const Color.fromARGB(255, 159, 125, 253),
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Container(
          width: double.infinity,
          height: double.infinity,
          child: Center(child: Text('Contador: $counter')),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.add),
        onPressed: () {
          setState(() {
            counter++;
          });
        },
      ),
    );
  }
}

class CustomSwitcher extends StatelessWidget {
  const CustomSwitcher({super.key});

  @override
  Widget build(BuildContext context) {
    return Switch(
      value: AppController.instance.isDarkTheme,
      onChanged: (value) {
        AppController.instance.changeTheme();
      },
    );
  }
}

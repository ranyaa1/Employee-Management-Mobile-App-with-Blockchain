import 'package:flutter/material.dart';
import 'package:untitled/screens/signIn.dart';
import 'package:untitled/screens/EmployerProfilePage.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);


  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int _selectedIndex = 0;

  static const List<Widget> _widgetOptions = <Widget>[
    //Text('Page d\'accueil'),
    //Text('Profil'),
    //Text('Paramètres'),
    //Text('Déconnexion'),
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    final User user = FirebaseAuth.instance.currentUser;
    final CollectionReference usersCollection = FirebaseFirestore.instance.collection('users');

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.brown,


      ),
      drawer: Drawer(
        child: ListView(
          padding: EdgeInsets.zero,
          children: <Widget>[
            DrawerHeader(
              decoration: BoxDecoration(
                color: Colors.brown,
              ),
              child: Text(
                'Menu',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 24,
                ),
              ),
            ),
            ListTile(
              leading: Icon(Icons.home),
              title: Text('Accueil'),
              selected: _selectedIndex == 0,
              onTap: () {
                _onItemTapped(0);
                Navigator.pop(context);
              },
              subtitle: StreamBuilder<DocumentSnapshot>(
                stream: usersCollection.doc(user.uid).snapshots(),
                builder: (context, snapshot) {
                  if (!snapshot.hasData) {
                    return Text('Chargement...');
                  }

                  final data = snapshot.data;
                  final String nom = data['nom'];
                  final String prenom = data['prenom'];
                  final String codeRib = data['code_rib'];

                  return Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text('Nom et prénom : $nom $prenom'),
                      Text('Code RIB : $codeRib'),
                    ],
                  );
                },
              ),
              trailing: CircleAvatar(
                backgroundImage: NetworkImage(user.photoURL),
              ),
            ),
            // autres éléments de l'interface
          ],
        ),
            ListTile(
              leading: Icon(Icons.account_circle),
              title: Text('Profil'),
              selected: _selectedIndex == 1,
              onTap: () {
                _onItemTapped(1);
                Navigator.pop(context);
              },
            ),
            ListTile(
              leading: Icon(Icons.settings),
              title: Text('Paramètres'),
              selected: _selectedIndex == 2,
              onTap: () {
                _onItemTapped(2);
                Navigator.pop(context);
              },
            ),
            Divider(),
            ListTile(
              leading: Icon(Icons.logout),
              title: Text('Log out'),
              selected: _selectedIndex == 3,
              onTap: () {
// Show confirmation dialog
                  showDialog(
                    context: context,
                    builder: (BuildContext context) {
                      return AlertDialog(
                        title: Text("Confirmation"),
                        content: Text("Are you sure you want to log out?"),
                        actions: <Widget>[
                          ElevatedButton(
                              child: Text("Cancel"),
                              onPressed: () {
                                Navigator.of(context).pop();
                              },
                              style: ButtonStyle(
                                  backgroundColor: MaterialStateProperty.all(Colors.green))
                          ),
                          ElevatedButton(
                            child: Text("Log Out"),
                            onPressed: () {
                              Navigator.pushReplacement(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) =>
                                          signIn()));
                            },
                            style: ButtonStyle(
                                backgroundColor: MaterialStateProperty.all(Colors.red)
                            ),
                          ),
                        ],
                      );
                    },
                  );
                },
            ),
          ],
        ),
      ),
    );
  }
}

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';


class Formatif extends StatefulWidget {
  const Formatif({super.key});

  @override
  _FormatifState createState() => _FormatifState();
}

class _FormatifState extends State<Formatif> {
  final TextEditingController _textController = TextEditingController();
  bool _isOnHighTable = false;

  // Fonction pour ajouter un document dans Firestore
  Future<void> _addDocument() async {
    try {
      // Récupérer le contenu du champ texte et numéro de poste (pour l'exemple, ici je prends les 2 derniers chiffres d'un nom fictif)
      String contenu = _textController.text;
      int numeroDePoste = 05; // Remplacez ceci par la logique pour récupérer votre numéro de poste
      bool suisSurUneTableHaute = _isOnHighTable;

      // Ajouter un document dans Firestore dans la collection "Examens" > "FinalA23" > "Eleves"
      await FirebaseFirestore.instance
          .collection('Examens')
          .doc('FinalA23')
          .collection('Eleves')
          .add({
        'contenu': contenu, // Le contenu de votre champ texte
        'numeroDePoste': numeroDePoste, // Le numéro de poste
        'suisSurUneTableHaute': suisSurUneTableHaute, // Le booléen qui indique si on est sur une table haute
      });

      // Afficher un message de succès
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Document ajouté avec succès!')),
      );
    } catch (e) {
      // Gérer les erreurs
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Erreur: $e')),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Ajouter un document à Firestore'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            // Le bouton au centre de l'écran
            ElevatedButton(
              onPressed: _addDocument,
              child: const Text('Ajouter un document'),
            ),
            const SizedBox(height: 20),
            // Champ texte pour entrer le contenu du document
            TextField(
              controller: _textController,
              decoration: const InputDecoration(
                labelText: 'Contenu du document',
              ),
            ),
            const SizedBox(height: 20),
            // Switch pour indiquer si on est sur une table haute
            SwitchListTile(
              title: const Text('Je suis sur une table haute'),
              value: _isOnHighTable,
              onChanged: (value) {
                setState(() {
                  _isOnHighTable = value;
                });
              },
            ),
          ],
        ),
      ),
    );
  }
}

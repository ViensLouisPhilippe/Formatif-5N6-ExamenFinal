import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';  // Pour analyser les réponses JSON

class GamePage extends StatefulWidget {
  const GamePage({super.key});

  @override
  _GamePageState createState() => _GamePageState();
}

class _GamePageState extends State<GamePage> {
  final TextEditingController _controller = TextEditingController();

  // Fonction pour envoyer la requête HTTP GET
  Future<void> _sendRequest() async {
    // Récupérer le nombre saisi
    String input = _controller.text;

    // Vérifier si le champ contient un nombre valide
    if (input.isEmpty || int.tryParse(input) == null) {
      // Si ce n'est pas un entier valide
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Erreur : Entrez un entier valide.')),
      );
      return;
    }

    try {
      // Créer l'URL en utilisant l'input
      final int number = int.parse(input);
      final url = Uri.parse('https://examen-final-h23.azurewebsites.net/Exam2023/$number');

      // Effectuer la requête GET
      final response = await http.get(url);

      if (response.statusCode == 200) {
        // Si la requête réussit
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text('Succès: ${response.body}')),
        );
      } else if (response.statusCode == 400) {
        // Si le nombre est trop petit ou trop grand
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text('Erreur: ${response.body}')),
        );
      } else if (response.statusCode == 404) {
        // Si le nombre est invalide
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text('Erreur: ${response.body}')),
        );
      } else {
        // Autres erreurs
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text('Erreur inconnue: ${response.statusCode}')),
        );
      }
    } catch (e) {
      // Si une exception se produit
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Erreur lors de la requête: $e')),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Jeu du Nombre Mystère'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            // Champ de saisie
            TextField(
              controller: _controller,
              keyboardType: TextInputType.number,
              decoration: const InputDecoration(
                labelText: 'Entrez un nombre',
                hintText: 'Par exemple, 42',
                border: OutlineInputBorder(),
              ),
            ),
            const SizedBox(height: 20),
            // Bouton pour envoyer la requête
            ElevatedButton(
              onPressed: _sendRequest,
              child: const Text('Envoyer'),
            ),
          ],
        ),
      ),
    );
  }
}

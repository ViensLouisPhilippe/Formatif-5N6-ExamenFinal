import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const MyHomePage(title: 'Mise en page'),
      supportedLocales: [
        Locale('en', 'US'), // English
        Locale('fr', 'FR'), // French
      ],
      localizationsDelegates: [
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
        S.delegate
      ],
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});
  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

final List<String> months = [
  'Janvier',
  'Février',
  'Mars',
  'Avril',
  'Mai',
  'Juin',
  'Juillet',
  'Août',
  'Septembre',
  'Octobre',
  'Novembre',
  'Décembre',
];

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Text(widget.title),
      ),
      body: Column(
        children: [
          // Image at the top
          Image.network('https://fourn6-mobile-prof.onrender.com/exos/image'),

          // Buttons below the image
          Row(
            children: [
              // "Oui" button (green, takes 50% width)
              Expanded(
                child: FloatingActionButton.extended(
                  onPressed: () {
                    // Handle "Oui" button action
                    print('Oui pressed');
                  },
                  backgroundColor: Colors.green,
                  label: const Text(
                    'Oui',
                    style: TextStyle(color: Colors.white),
                  ),
                ),
              ),
              // "Non" button (red, takes 50% width)
              Expanded(
                child: FloatingActionButton.extended(
                  onPressed: () {
                    // Handle "Non" button action
                    print('Non pressed');
                  },
                  backgroundColor: Colors.red,
                  label: const Text(
                    'Non',
                    style: TextStyle(color: Colors.white),
                  ),
                ),
              ),
            ],
          ),

          // Use Expanded to wrap ListView.builder to prevent overflow
          Expanded(
            child: ListView.builder(
              itemCount: months.length,
              itemBuilder: (context, index) {
                return ListTile(
                  title: Text(months[index]),
                  trailing: IconButton(
                    onPressed: () {},
                    icon: const Icon(Icons.delete),
                  ),
                );
              },
            ),
          )
        ],
      ),
    );
  }
}

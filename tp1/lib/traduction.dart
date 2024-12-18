import 'package:flutter/material.dart';
import 'generated/l10n.dart';

class Traduction extends StatefulWidget {
  const Traduction({super.key});

  @override
  State<Traduction> createState() => _TraductionState();
}

class _TraductionState extends State<Traduction> {
  @override
  Widget build(BuildContext context) {
    // Access localized strings
    final localizations = S.of(context);
    final List<String> months = [
      localizations.january,
      localizations.february,
      localizations.march,
      localizations.april,
      localizations.may,
      localizations.june,
      localizations.july,
      localizations.august,
      localizations.september,
      localizations.october,
      localizations.november,
      localizations.december,
    ];
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Text(localizations.appTitle),  // Using translated app title
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
                    print(localizations.yes);  // Using translated "Yes"
                  },
                  backgroundColor: Colors.green,
                  label: Text(
                    localizations.yes,  // Using translated "Yes"
                    style: const TextStyle(color: Colors.white),
                  ),
                ),
              ),
              // "Non" button (red, takes 50% width)
              Expanded(
                child: FloatingActionButton.extended(
                  onPressed: () {
                    // Handle "Non" button action
                    print(localizations.no);  // Using translated "No"
                  },
                  backgroundColor: Colors.red,
                  label: Text(
                    localizations.no,  // Using translated "No"
                    style: const TextStyle(color: Colors.white),
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
                  title: Text(months[index]),  // Using translated month names
                  trailing: IconButton(
                    onPressed: () {},
                    icon: const Icon(Icons.delete),
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}

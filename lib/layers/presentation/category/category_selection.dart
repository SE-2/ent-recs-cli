import 'package:flutter/material.dart';

class Category {
  final String name;
  final String image;

  Category(this.name, this.image);
}

class SelectionScreen extends StatelessWidget {
  const SelectionScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Selection screen"),
      ),
      body: _SelectionForm(),
    );
  }
}

class _SelectionForm extends StatefulWidget {
  const _SelectionForm({Key? key}) : super(key: key);

  @override
  _SelectionFormState createState() => _SelectionFormState();
}

class _SelectionFormState extends State<_SelectionForm> {
  final List<Category> categories = [
    Category('Category 1',
        'https://img.freepik.com/free-psd/creative-film-poster-template_23-2149839039.jpg?size=626&ext=jpg&ga=GA1.1.548239202.1680728879&semt=robertav1_2_sidr'),
    Category('Category 2',
        'https://img.freepik.com/premium-psd/retro-print-crash-photo-effect_514605-461.jpg?w=740'),
    Category('Category 3',
        'https://img.freepik.com/free-psd/creative-film-poster-template_23-2149839039.jpg?size=626&ext=jpg&ga=GA1.1.548239202.1680728879&semt=robertav1_2_sidr'),
    Category('Category 4',
        'https://img.freepik.com/premium-psd/retro-print-crash-photo-effect_514605-461.jpg?w=740'),
    Category('Category 5',
        'https://img.freepik.com/free-psd/creative-film-poster-template_23-2149839039.jpg?size=626&ext=jpg&ga=GA1.1.548239202.1680728879&semt=robertav1_2_sidr'),
    Category('Category 6',
        'https://img.freepik.com/premium-psd/retro-print-crash-photo-effect_514605-461.jpg?w=740'),
    Category('Category 7',
        'https://img.freepik.com/free-psd/creative-film-poster-template_23-2149839039.jpg?size=626&ext=jpg&ga=GA1.1.548239202.1680728879&semt=robertav1_2_sidr'),
    Category('Category 8',
        'https://img.freepik.com/premium-psd/retro-print-crash-photo-effect_514605-461.jpg?w=740'),
    Category('Category 9',
        'https://img.freepik.com/free-psd/creative-film-poster-template_23-2149839039.jpg?size=626&ext=jpg&ga=GA1.1.548239202.1680728879&semt=robertav1_2_sidr'),
  ];
  final selectedCategories = <Category>[];

  @override
  Widget build(BuildContext context) {
    final crossAxisCount = (MediaQuery.of(context).size.width / 120).floor();

    return Scaffold(
      appBar: AppBar(title: const Text("Pick topics you're interested in")),
      body: Column(children: [
        const SizedBox(height: 20),
        const Text('Select at least 5 topics to personalize your experience.',
            style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
        const SizedBox(height: 20),
        Expanded(
          child: GridView.count(
            crossAxisCount: crossAxisCount,
            crossAxisSpacing: 20,
            mainAxisSpacing: 20,
            padding: const EdgeInsets.all(20),
            children: categories.map((category) {
              final isSelected = selectedCategories.contains(category);
              return GestureDetector(
                onTap: () => setState(() => isSelected
                    ? selectedCategories.remove(category)
                    : selectedCategories.add(category)),
                child: Stack(children: [
                  Container(
                    decoration: BoxDecoration(
                      image: DecorationImage(
                          image: NetworkImage(category.image),
                          fit: BoxFit.cover),
                      borderRadius: BorderRadius.circular(10),
                      color: isSelected ? Colors.black.withOpacity(0.9) : null,
                    ),
                  ),
                  if (isSelected)
                    const Positioned.fill(
                        child: Icon(Icons.check_circle,
                            color: Colors.white, size: 40)),
                  Positioned(
                    bottom: 0,
                    left: 0,
                    right: 0,
                    child: Container(
                      decoration: BoxDecoration(
                        borderRadius: const BorderRadius.only(
                          bottomLeft: Radius.circular(10),
                          bottomRight: Radius.circular(10),
                        ),
                        color: Colors.black.withOpacity(0.5),
                      ),
                      padding: const EdgeInsets.symmetric(
                          vertical: 8, horizontal: 16),
                      child: Text(category.name,
                          style: const TextStyle(
                              color: Colors.white,
                              fontSize: 12,
                              fontWeight: FontWeight.bold)),
                    ),
                  ),
                ]),
              );
            }).toList(),
          ),
        ),
      ]),
      floatingActionButton: FloatingActionButton.extended(
        onPressed: selectedCategories.length >= 5
            ? () {
                // Do something with the selected categories
              }
            : null,
        label: const Text('Get started'),
        icon: const Icon(Icons.arrow_forward),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(24)),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
    );
  }
}

import 'package:flutter/material.dart';
import 'package:supermedia/common/utils/app_localization.dart';
import 'package:supermedia/gen/assets.gen.dart';
import 'package:supermedia/layers/presentation/media/screens/show_media_screen.dart';
import 'package:supermedia/layers/presentation/recommend/screens/recommend_screen.dart';
import 'package:supermedia/layers/presentation/shared/widgets/custom_app_bar.dart';

class Category {
  final String name;
  final String image;

  Category(this.name, this.image);
}

class SelectionScreen extends StatelessWidget {
  static const String route = '/selection';

  const SelectionScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(
        title: AppLocalization.of(context)!.selectionScreenTitle,
        showBackButton: true,
      ),
      backgroundColor: Theme.of(context).colorScheme.background,
      body: const _SelectionForm(),
    );
  }
}

class _SelectionForm extends StatefulWidget {
  const _SelectionForm({Key? key}) : super(key: key);

  @override
  _SelectionFormState createState() => _SelectionFormState();
}

class _SelectionFormState extends State<_SelectionForm> {
  final List<Category> categories = List.generate(20, (index) {
    return Category('Category ${index + 1}',
        'https://i.pinimg.com/400x/41/2d/b6/412db620d4fb0354df7ad175b132ff38.jpg');
  });

  final selectedCategories = <Category>[];

  @override
  Widget build(BuildContext context) {
    final crossAxisCount = (MediaQuery.of(context).size.width / 120).floor();

    final aspectRatio =
        (MediaQuery.of(context).size.width) / (crossAxisCount * 160);

    return Column(children: [
      Padding(
        padding: const EdgeInsets.fromLTRB(32, 16, 32, 16),
        child: Text(
          AppLocalization.of(context)!.selectionScreenMessage,
          style: Theme.of(context)
              .textTheme
              .titleMedium!
              .copyWith(fontWeight: FontWeight.w600),
        ),
      ),
      const SizedBox(height: 20),
      Expanded(
        child: GridView.count(
          crossAxisCount: crossAxisCount,
          crossAxisSpacing: 20,
          mainAxisSpacing: 20,
          padding: const EdgeInsets.fromLTRB(32, 0, 32, 64),
          childAspectRatio: aspectRatio,
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
                      image: Image.asset('assets/images/default_category.png').image,
                      fit: BoxFit.cover,
                    ),
                    borderRadius: BorderRadius.circular(10),
                  ),
                ),
                if (isSelected)
                  Positioned(
                    bottom: 0,
                    left: 0,
                    right: 0,
                    top: 0,
                    child: Container(
                      decoration: BoxDecoration(
                        borderRadius: const BorderRadius.all(
                          Radius.circular(10),
                        ),
                        color: Colors.black.withOpacity(0.6),
                      ),
                    ),
                  ),
                Positioned(
                  bottom: 0,
                  left: 0,
                  right: 0,
                  child: Container(
                    padding:
                        const EdgeInsets.symmetric(vertical: 8, horizontal: 8),
                    child: Text(category.name,
                        style: const TextStyle(
                            color: Colors.white,
                            fontSize: 12,
                            fontWeight: FontWeight.bold)),
                  ),
                ),
                if (isSelected)
                  Positioned(
                    top: 0,
                    right: 0,
                    child: Container(
                      padding: const EdgeInsets.all(4),
                      child: const Icon(
                        Icons.check_circle_outlined,
                        color: Colors.white70,
                        size: 25,
                      ),
                    ),
                  ),
              ]),
            );
          }).toList(),
        ),
      ),
      const SizedBox(height: 20),
      ElevatedButton.icon(
        onPressed: selectedCategories.length >= 5
            ? () {
                Navigator.pushNamed(context, RecommendScreen.route);
              }
            : null,
        label: Text(
          AppLocalization.of(context)!.getStarted,
          style: Theme.of(context).textTheme.labelLarge,
        ),
        icon: const Icon(
          Icons.arrow_forward,
          size: 16,
        ),
        style: ElevatedButton.styleFrom(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(24),
          ),
        ),
      ),
      const SizedBox(height: 20),
    ]);
  }
}

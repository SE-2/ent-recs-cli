import 'package:flutter/material.dart';
import 'package:supermedia/common/utils/app_localization.dart';
import 'package:supermedia/layers/domain/entities/media_metadata.dart';
import 'package:supermedia/layers/presentation/shared/widgets/app_primary_button.dart';
import 'package:supermedia/layers/presentation/shared/widgets/custom_app_bar.dart';
import 'package:supermedia/layers/presentation/shared/widgets/custom_choice_chip_group.dart';
import 'package:supermedia/layers/presentation/shared/widgets/custom_filter_chip_group.dart';

class FilterModal extends StatefulWidget {
  final Map<MediaType, List<String>> defaultCategories;
  final Function(MediaType, List<String>?) onApplyFiltersTapped;
  final MediaType? initialSelectedType;
  final List<String>? initialSelectedCategories;

  const FilterModal({
    Key? key,
    required this.defaultCategories,
    required this.onApplyFiltersTapped,
    this.initialSelectedType,
    this.initialSelectedCategories,
  }) : super(key: key);

  @override
  FilterModalState createState() => FilterModalState();

  static Future<void> show({
    required BuildContext context,
    required Map<MediaType, List<String>> defaultCategories,
    required Function(MediaType, List<String>?) onApplyFiltersTapped,
    MediaType? initialSelectedType,
    List<String>? initialSelectedCategories,
  }) {
    return showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(24),
          topRight: Radius.circular(24),
        ),
      ),
      builder: (BuildContext context) {
        return FractionallySizedBox(
          heightFactor: 0.7,
          child: Container(
            decoration: BoxDecoration(
              color: Theme.of(context).colorScheme.background,
              borderRadius: const BorderRadius.only(
                topLeft: Radius.circular(24),
                topRight: Radius.circular(24),
              ),
            ),
            padding: const EdgeInsets.all(16),
            child: FilterModal(
              defaultCategories: defaultCategories,
              onApplyFiltersTapped: onApplyFiltersTapped,
              initialSelectedType: initialSelectedType,
              initialSelectedCategories: initialSelectedCategories,
            ),
          ),
        );
      },
    );
  }
}

class FilterModalState extends State<FilterModal> {
  late MediaType _selectedType;
  late List<String> _selectedCategories;

  @override
  void initState() {
    super.initState();
    _selectedType = widget.initialSelectedType ?? MediaType.music;
    _selectedCategories =
        List<String>.from(widget.initialSelectedCategories ?? []).toList();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.background,
      appBar: CustomAppBar(
        title: AppLocalization.of(context)!.filterTitle,
        showBackButton: true,
        action: TextButton(
          onPressed: () {
            setState(() {
              _selectedCategories.clear();
            });
          },
          child: Text(
            AppLocalization.of(context)!.resetFiltersButton,
            style: Theme.of(context).textTheme.labelLarge!.copyWith(
                color: Theme.of(context).colorScheme.primary,
                fontWeight: FontWeight.bold),
          ),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Stack(
          children: [
            Align(
              alignment: Alignment.topCenter,
              child: SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      AppLocalization.of(context)!.typeTitle,
                      style: Theme.of(context)
                          .textTheme
                          .titleMedium!
                          .copyWith(fontWeight: FontWeight.bold),
                    ),
                    const SizedBox(height: 8),
                    CustomChoiceChipGroup<MediaType>(
                      items: MediaType.values.toList(),
                      selectedItem: _selectedType,
                      onItemSelected: (type) => setState(() {
                        _selectedType = type;
                        _selectedCategories.clear();
                      }),
                      itemLabel: (type) => getMediaTypeValue(type),
                    ),
                    const SizedBox(height: 16),
                    Text(
                      AppLocalization.of(context)!.categoriesTitle,
                      style: Theme.of(context)
                          .textTheme
                          .titleMedium!
                          .copyWith(fontWeight: FontWeight.bold),
                    ),
                    const SizedBox(height: 8),
                    CustomFilterChipGroup(
                      items: widget.defaultCategories[_selectedType]!,
                      selectedItems: _selectedCategories,
                      onSelectionChanged: (category, selected) => setState(() {
                        if (selected) {
                          _selectedCategories.add(category);
                        } else {
                          _selectedCategories.remove(category);
                        }
                      }),
                    ),
                    const SizedBox(height: 80),
                  ],
                ),
              ),
            ),
            Align(
              alignment: Alignment.bottomCenter,
              child: Container(
                decoration: BoxDecoration(
                  boxShadow: [
                    BoxShadow(
                      color: Theme.of(context).colorScheme.background,
                      blurRadius: 20,
                      spreadRadius: 20,
                      offset: const Offset(0, 20),
                    ),
                  ],
                ),
                child: SizedBox(
                  height: 80,
                  child: Center(
                    child: AppPrimaryButton(
                      text: AppLocalization.of(context)!.applyFiltersButton,
                      onPressed: () {
                        widget.onApplyFiltersTapped(
                            _selectedType, _selectedCategories);
                        Navigator.pop(context);
                      },
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  String getMediaTypeValue(MediaType selected) {
    switch (selected) {
      case MediaType.music:
        return AppLocalization.of(context)!.musicType;
      case MediaType.movie:
        return AppLocalization.of(context)!.movieType;
      case MediaType.podcast:
        return AppLocalization.of(context)!.podcastType;
      case MediaType.book:
        return AppLocalization.of(context)!.ebookType;
    }
  }
}

import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:supermedia/layers/presentation/setting/widgets/toggle_switch_theme_mode.dart';

class GroupMenu extends StatefulWidget {
  final String title;
  final List<Pair> fields;
  const GroupMenu({super.key, required this.title, required this.fields});

  @override
  State<GroupMenu> createState() => _GroupMenuState();
}

class _GroupMenuState extends State<GroupMenu> {
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          widget.title,
          style:
              Theme.of(context).textTheme.headlineSmall?.copyWith(fontSize: 12),
        ),
        const SizedBox(
          height: 16,
        ),
        ListView.builder(
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
            scrollDirection: Axis.vertical,
            itemCount: widget.fields.length,
            itemBuilder: (context, int index) {
              return SizedBox(
                  width: MediaQuery.of(context).size.width,
                  child: feildCreator(context, widget.fields[index]));
            }),
      ],
    );
  }
}

Widget feildCreator(
  BuildContext context,
  Pair field,
) {
  return Padding(
    padding: const EdgeInsets.fromLTRB(0, 0, 0, 18),
    child: Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: <Widget>[
        Row(
          children: [
            IconButton(
              onPressed: null,
              icon: field.icon,
            ),
            const SizedBox(
              width: 12,
            ),
            Text(
              field.title,
              style: Theme.of(context)
                  .textTheme
                  .headlineSmall
                  ?.copyWith(fontSize: 16),
            ),
          ],
        ),
        if (field.showChevronRight)
          IconButton(
            onPressed: () {},
            icon: const Icon(Icons.chevron_right_rounded),
            iconSize: 24,
          )
        else if (field.showToggleButton)
          const ToggleSwitchThemeMode()
        else if (field.showCacheBytes)
          Text(
            '88 MB',
            style:
                Theme.of(context).textTheme.titleSmall?.copyWith(fontSize: 12),
          )
      ],
    ),
  );
}

class Pair {
  final String title;
  final SvgPicture icon;
  final bool showChevronRight;
  final bool showToggleButton;
  final bool showCacheBytes;

  Pair(
      {required this.title,
      required this.icon,
      this.showChevronRight = false,
      this.showToggleButton = false,
      this.showCacheBytes = false});
}

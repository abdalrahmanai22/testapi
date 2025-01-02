import 'package:collection/collection.dart';
import 'package:flutter/material.dart';

const List<String> list1 = <String>['EUR', 'USD', 'GBP', 'JPY'];

class DropdownMenuExample1 extends StatefulWidget {
  const DropdownMenuExample1({super.key});

  @override
  State<DropdownMenuExample1> createState() => _DropdownMenuExampleState();
}

typedef MenuEntry = DropdownMenuEntry<String>;

class _DropdownMenuExampleState extends State<DropdownMenuExample1> {
  static final List<MenuEntry> menuEntries = UnmodifiableListView<MenuEntry>(
    list1.map<MenuEntry>((String name) => MenuEntry(value: name, label: name)),
  );
  String dropdownValue = list1.first;

  @override
  Widget build(BuildContext context) {
    return DropdownMenu<String>(
      width: 180,
      initialSelection: list1.first,
      onSelected: (String? value) {
        // This is called when the user selects an item.
        setState(() {
          dropdownValue = value!;
        });
      },
      dropdownMenuEntries: menuEntries,
    );
  }
}

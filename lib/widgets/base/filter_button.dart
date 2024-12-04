import 'package:flutter/material.dart';
import 'package:myapp/core/standard_functions.dart';

class FilterButton extends StatelessWidget {
  final ValueNotifier<int> filterCount;
  final bool waitLoader;
  final IconData icon;

  const FilterButton({
    super.key,
    required this.filterCount,
    this.waitLoader = true,
    this.icon = Icons.filter_alt,
  });

  @override
  Widget build(BuildContext context) {
    return ValueListenableBuilder<int>(
      valueListenable: filterCount,
      builder: (context, count, child) {
        return Badge(
          isLabelVisible: count > 0,
          label: Text(count.toString()),
          child: IconButton(
            tooltip: 'Filtrar por...',
            icon: Icon(icon),
            onPressed: () {
              StandardFunctions.waitList(
                context,
                condiction: waitLoader,
                function: () => Scaffold.of(context).openEndDrawer(),
              );
            },
          ),
        );
      },
    );
  }
}

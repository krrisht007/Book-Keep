import 'package:flutter/material.dart';

class AdaptiveColumn extends StatelessWidget {
  const AdaptiveColumn({super.key, required this.children});

  final List<Widget> children;

  @override
  Widget build(BuildContext context) {
    final expanded = children.whereType<Expanded>().toList();
    if (MediaQuery.orientationOf(context) == Orientation.portrait ||
        expanded.length != 1) {
      return Column(children: children);
    }
    final header = children.where((w) => w is! Expanded).toList();
    return NestedScrollView(
      headerSliverBuilder:
          (_, __) => [SliverToBoxAdapter(child: Column(children: header))],
      body: expanded.single.child,
    );
  }
}

class SidePanelColumn extends StatelessWidget {
  const SidePanelColumn({
    super.key,
    required this.children,
    this.panelWidth = 340,
  });

  final List<Widget> children;
  final double panelWidth;

  @override
  Widget build(BuildContext context) {
    final at = children.indexWhere((w) => w is Expanded);
    if (MediaQuery.orientationOf(context) == Orientation.portrait || at < 0) {
      return Column(children: children);
    }
    return Column(
      children: [
        ...children.sublist(0, at),
        Expanded(
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Expanded(child: (children[at] as Expanded).child),
              SizedBox(
                width: panelWidth,
                child: SingleChildScrollView(
                  child: Column(children: children.sublist(at + 1)),
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}

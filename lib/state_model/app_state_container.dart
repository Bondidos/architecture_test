import 'package:architecture_test/state_model/inherited_state.dart';
import 'package:flutter/material.dart';

class AppStateContainer extends StatefulWidget {
  final AppState state;
  final Widget child;

  const AppStateContainer(Key? key,{required this.state, required this.child}) : super(key: key);

  static AppStateContainerState? of(BuildContext context, {required rebuild}) {
    return rebuild
        ? context
            .dependOnInheritedWidgetOfExactType<_InheritedStateContainer>()
            ?.data
        : context
            .findAncestorWidgetOfExactType<_InheritedStateContainer>()
            ?.data;
  }

  @override
  State<StatefulWidget> createState() => AppStateContainerState();
}

class AppStateContainerState extends State<AppStateContainer> {
  late AppState state;

  @override
  void initState() {
    state = widget.state;
    super.initState();
  }

  void addItem(int id) => setState(() {
        state.addItem(id);
      });

  void removeFromCard(int id) => setState(() {
        state.removeFromCard(id);
      });

  void clearCard() => setState(() {
        state.clearCard();
      });

  @override
  Widget build(BuildContext context) {
    return _InheritedStateContainer(
      data: this,
      child: widget.child,
    );
  }
}

class _InheritedStateContainer extends InheritedWidget {
  const _InheritedStateContainer({required this.data, required Widget child})
      : super(child: child);
  final AppStateContainerState data;

  @override
  bool updateShouldNotify(covariant InheritedWidget oldWidget) => true;
}

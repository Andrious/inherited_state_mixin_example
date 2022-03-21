// Copyright 2022 Andrious Solutions Ltd. All rights reserved.
// Use of this source code is governed by a Apache license that can be
// found in the LICENSE file.
///
///  Stores the InheritedWidget used to update the Cat images.
///

import 'package:inherited_state_mixin_example/src/controller.dart';

import 'package:inherited_state_mixin_example/src/view.dart';

/// This StatefulWidget stores an InheritedWidget
class InheritBird extends StatefulWidget {
  ///
  const InheritBird({
    Key? key,
    required this.child,
  }) : super(key: key);

  ///
  final Widget? child;

  @override
  State<StatefulWidget> createState() => _InheritBirdState();
}

class _InheritBirdState extends State<InheritBird> with InheritedStateMixin {
  //
  _InheritBirdState() {
    BirdController(this);
    initInheritedState<_BirdInherited>(
      state: this,
      inheritedWidgetBuilder: (child) => _BirdInherited(child: child),
    );
  }

  @override
  Widget buildChild(context) => widget.child!;
}

/// The InheritedWidget assigned 'dependent' child widgets.
class _BirdInherited extends InheritedWidget {
  ///
  const _BirdInherited({Key? key, required Widget child})
      : super(key: key, child: child);
  @override
  bool updateShouldNotify(covariant InheritedWidget oldWidget) => true;
}

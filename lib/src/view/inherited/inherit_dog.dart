// Copyright 2022 Andrious Solutions Ltd. All rights reserved.
// Use of this source code is governed by a Apache license that can be
// found in the LICENSE file.
///
///  This StatefulWidget works with the 'Dog' InheritedWidget
///

import 'package:inherited_state_mixin_example/src/controller.dart';

import 'package:inherited_state_mixin_example/src/view.dart';

/// This StatefulWidget stores an InheritedWidget
class InheritDog extends StatefulWidget {
  ///
  const InheritDog({Key? key, required this.child}) : super(key: key);

  ///
  final Widget? child;

  @override
  State<StatefulWidget> createState() => _InheritDogState();
}

class _InheritDogState extends State<InheritDog> with InheritedStateMixin {
  //
  _InheritDogState() {
    DogController(this);
    initInheritedState(
      state: this,
      inheritedWidgetBuilder: (child) => _DogInherited(child: child),
    );
  }
  @override
  Widget buildChild(context) => widget.child!;
}

/// The InheritedWidget assigned 'dependent' child widgets.
class _DogInherited extends InheritedWidget {
  ///
  const _DogInherited({Key? key, required Widget child})
      : super(key: key, child: child);
  @override
  bool updateShouldNotify(covariant InheritedWidget oldWidget) => true;
}

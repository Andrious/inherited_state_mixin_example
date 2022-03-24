// Copyright 2022 Andrious Solutions Ltd. All rights reserved.
// Use of this source code is governed by a Apache license that can be
// found in the LICENSE file.
///
///  This StatefulWidget works with the Fox InheritedWidget.
///

import 'package:inherited_state_mixin_example/src/controller.dart';

import 'package:inherited_state_mixin_example/src/view.dart';

/// This StatefulWidget stores an InheritedWidget
class InheritFox extends StatefulWidget {
  ///
  const InheritFox({Key? key, required this.child}) : super(key: key);

  ///
  final Widget? child;

  @override
  State<StatefulWidget> createState() => _InheritFoxState();
}

class _InheritFoxState extends State<InheritFox> with InheritedStateMixin {
  //
  @override
  void initState() {
    super.initState();
    FoxController(this);
    initInheritedState(
      inheritedWidgetBuilder: (child) => _FoxInherited(child: child),
    );
  }

  @override
  Widget buildChild(context) => widget.child!;
}

/// The InheritedWidget assigned 'dependent' child widgets.
class _FoxInherited extends InheritedWidget {
  ///
  const _FoxInherited({Key? key, required Widget child})
      : super(key: key, child: child);
  @override
  bool updateShouldNotify(oldWidget) => true;
}

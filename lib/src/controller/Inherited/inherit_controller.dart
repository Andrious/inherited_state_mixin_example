// Copyright 2022 Andrious Solutions Ltd. All rights reserved.
// Use of this source code is governed by a Apache license that can be
// found in the LICENSE file.
///
///  The 'Animal' Controller to call the appropriate InheritedWidget.
///

import 'package:inherited_state_mixin_example/src/controller.dart';

import 'package:inherited_state_mixin_example/src/view.dart';

///
class InheritController extends Controller {
  ///
  InheritController([State? state]) : super(state);

  ///
  bool widgetInherited(BuildContext? context) {
    bool inherit;

    inherit = state is InheritedStateMixin && context != null;

    if (inherit) {
      inherit = (state as InheritedStateMixin).widgetInherited(context);
    }
    return inherit;
  }

  /// Rebuild the InheritedWidget to also rebuild its dependencies.
  void newAnimals() {
    state?.setState(() {});
  }
}

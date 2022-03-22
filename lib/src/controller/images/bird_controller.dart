// Copyright 2022 Andrious Solutions Ltd. All rights reserved.
// Use of this source code is governed by a Apache license that can be
// found in the LICENSE file.
///
///
///

import 'package:inherited_state_mixin_example/src/controller.dart';

import 'package:inherited_state_mixin_example/src/view.dart';

/// This SOC is associated with the Bird images and works with
/// InheritBird StatefulWidget and the InheritedWidget, _BirdInherited
class BirdController extends InheritController {
  ///
  factory BirdController([State? state]) => _this ??= BirdController._(state);
  BirdController._([State? state]) : super(state);
  static BirdController? _this;
}

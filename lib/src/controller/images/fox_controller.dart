// Copyright 2022 Andrious Solutions Ltd. All rights reserved.
// Use of this source code is governed by a Apache license that can be
// found in the LICENSE file.
///
///
///

import 'package:inherited_state_mixin_example/src/controller.dart';

import 'package:inherited_state_mixin_example/src/view.dart';

///
class FoxController extends InheritController {
  ///
  factory FoxController([State? state]) => _this ??= FoxController._(state);
  FoxController._([State? state]) : super(state);
  static FoxController? _this;
}

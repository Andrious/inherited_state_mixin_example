// Copyright 2022 Andrious Solutions Ltd. All rights reserved.
// Use of this source code is governed by a Apache license that can be
// found in the LICENSE file.
///
///
///

import 'package:inherited_state_mixin_example/src/controller.dart';

import 'package:inherited_state_mixin_example/src/view.dart';

///
class CatController extends ImageAPIController implements InheritController {
  ///
  factory CatController([State? state]) => _this ??= CatController._(state);
  CatController._([State? state]) : super(state);
  static CatController? _this;
}

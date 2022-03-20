// Copyright 2022 Andrious Solutions Ltd. All rights reserved.
// Use of this source code is governed by a Apache license that can be
// found in the LICENSE file.
///
///
///

import 'package:inherited_state_mixin_example/src/controller.dart';

import 'package:inherited_state_mixin_example/src/view.dart';

///
class DogController extends ImageAPIController {
  ///
  factory DogController([State? state]) => _this ??= DogController._(state);
  DogController._([State? state]) : super(state);
  static DogController? _this;
}

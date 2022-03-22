// Copyright 2022 Andrious Solutions Ltd. All rights reserved.
// Use of this source code is governed by a Apache license that can be
// found in the LICENSE file.
///
///
///

import 'package:inherited_state_mixin_example/src/view.dart';

///
class Controller {
  ///
  Controller([State? state]) {
    _state = state;
  }

  /// State object associated with this Controller object.
  State? get state => _state;
  State? _state;

  /// Used to complete asynchronous operations
  Future<bool> initAsync() async => true;

  /// Call the associated State object to rebuild
  void setState(VoidCallback fn) => state?.setState(fn);
}

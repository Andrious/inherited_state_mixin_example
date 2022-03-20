// Copyright 2022 Andrious Solutions Ltd. All rights reserved.
// Use of this source code is governed by a Apache license that can be
// found in the LICENSE file.
///
///  This widget works with the free Cat API.
///

import 'package:inherited_state_mixin_example/src/controller.dart';

import 'package:inherited_state_mixin_example/src/view.dart';

///
class RandomCat extends StatefulWidget {
  ///
  const RandomCat({Key? key}) : super(key: key);
  @override
  State<StatefulWidget> createState() => _RandomCatState();
}

class _RandomCatState extends ImageAPIStateMVC<RandomCat> {
  _RandomCatState()
      : super(
          uri: Uri(
            scheme: 'https',
            host: 'aws.random.cat',
            path: 'meow',
          ),
          message: 'file',
        ) {
    add(CatController());
  }
}

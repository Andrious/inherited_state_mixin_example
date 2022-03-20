// Copyright 2022 Andrious Solutions Ltd. All rights reserved.
// Use of this source code is governed by a Apache license that can be
// found in the LICENSE file.
///
///  This widget works with the free Fox API.
///

import 'package:inherited_state_mixin_example/src/controller.dart';

import 'package:inherited_state_mixin_example/src/view.dart';

///
class RandomFox extends StatefulWidget {
  ///
  const RandomFox({Key? key}) : super(key: key);
  @override
  State<StatefulWidget> createState() => _RandomFoxState();
}

class _RandomFoxState extends ImageAPIStateMVC<RandomFox> {
  _RandomFoxState()
      : super(
          uri: Uri(
            scheme: 'https',
            host: 'randomfox.ca',
            path: 'floof',
          ),
          message: 'image',
        ) {
    add(FoxController());
  }
}

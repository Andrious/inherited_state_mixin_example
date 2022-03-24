// Copyright 2022 Andrious Solutions Ltd. All rights reserved.
// Use of this source code is governed by a Apache license that can be
// found in the LICENSE file.
///
///  Manages the API request for specifically 'image' public API's
///

import 'package:inherited_state_mixin_example/src/controller.dart';

import 'package:inherited_state_mixin_example/src/view.dart';

///
class ImageAPIStateMVC<T extends StatefulWidget> extends State<T>
    with FutureBuilderStateMixin
    implements ImageAPIState {
  ///
  ImageAPIStateMVC({
    required this.uri,
    this.message,
  }) {
    //
    _con = ImageAPIController(this);
  }

  /// Take in a Controller.
  void add(InheritController? controller) => this.controller ??= controller;

  ///
  InheritController? controller;

  ///
  @override
  final Uri? uri;

  ///
  @override
  final String? message;

  late ImageAPIController _con;

  @override
  Future<bool> initAsync() => _con.initAsync();

  /// Called after the FutureBuilder
  @override
  Widget buildWidget(BuildContext context) {
    controller?.widgetInherited(context);
    return GestureDetector(
      onTap: controller?.newAnimals,
      onDoubleTap: controller?.newAnimals,
      child: Card(
        child: _con.image ?? const SizedBox(),
      ),
    );
  }

  /// Supply an 'error handler' routine if something goes wrong
  /// in the corresponding initAsync() routine.
  @override
  bool onAsyncError(FlutterErrorDetails details) => false;
}

///
abstract class ImageAPIState {
  ///
  ImageAPIState({required this.uri, required this.message});

  ///
  final Uri? uri;

  ///
  final String? message;
}

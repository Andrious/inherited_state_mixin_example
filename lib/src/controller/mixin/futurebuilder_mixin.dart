// Copyright 2022 Andrious Solutions Ltd. All rights reserved.
// Use of this source code is governed by a Apache license that can be
// found in the LICENSE file.
///
/// Supply a FutureBuilder to a State object.
///

import 'package:flutter/cupertino.dart';

import 'package:flutter/material.dart';

/// Replace 'dart:io' for Web applications
import 'package:universal_platform/universal_platform.dart';

///
mixin FutureBuilderStateMixin {
  /// Traditionally called in the initState() function
  void initFutureBuilderState(State state) {
    // This is the State object with the mixin
    _withState ??= state;
  }

  /// The associated State object.
  State? _withState;

  /// Implement this function instead of the build() function
  /// to utilize a built-in FutureBuilder Widget.
  Widget buildWidget(BuildContext context) => const SizedBox();

  /// Run the CircularProgressIndicator() until asynchronous operations are
  /// completed before the app proceeds.
  Widget build(BuildContext context) => FutureBuilder<bool>(
      future: initAsync(), initialData: false, builder: futureBuilderBuilder);

  /// Used to complete asynchronous operations
  Future<bool> initAsync() async => true;

  ///
  Widget futureBuilderBuilder(
      BuildContext context, AsyncSnapshot<bool> snapshot) {
    //
    Widget? widget;
    FlutterErrorDetails? errorDetails;

    if (snapshot.hasData && snapshot.data!) {
      // Pass in the StatefulElement
      widget = buildWidget(_withState!.context);
      //
    } else if (snapshot.connectionState == ConnectionState.done) {
      //
      if (snapshot.hasError) {
        //
        final dynamic exception = snapshot.error;

        errorDetails = FlutterErrorDetails(
          exception: exception,
          stack: exception is Error ? exception.stackTrace : null,
          library: 'mvc_pattern.dart',
          context: ErrorDescription('While getting ready in FutureBuilder'),
        );

        // Possibly recover resources and close serivces before continuing to exit in error.
        onAsyncError(errorDetails);
        //
      } else {
        //
        errorDetails = FlutterErrorDetails(
          exception: Exception('App failed to initialize'),
          library: 'mvc_pattern.dart',
          context: ErrorDescription('Please, notify Admin.'),
        );
      }
    }

    // A Widget must be supplied.
    if (widget == null) {
      // Keep trying until there's an error.
      if (errorDetails == null) {
        //
        if (UniversalPlatform.isAndroid || UniversalPlatform.isWeb) {
          //
          widget = const Center(child: CircularProgressIndicator());
        } else {
          //
          widget = const Center(child: CupertinoActivityIndicator());
        }
        // There was an error instead.
      } else {
        //
        FlutterError.reportError(errorDetails);

        widget = ErrorWidget.builder(errorDetails);
      }
    }
    return widget;
  }

  /// Supply an 'error handler' routine if something goes wrong
  /// in the corresponding initAsync() routine.
  bool onAsyncError(FlutterErrorDetails details) => false;
}

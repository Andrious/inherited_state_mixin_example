// Copyright 2022 Andrious Solutions Ltd. All rights reserved.
// Use of this source code is governed by a Apache license that can be
// found in the LICENSE file.
///
///
///

import 'package:inherited_state_mixin_example/src/controller.dart';

import 'package:inherited_state_mixin_example/src/view.dart';

///
class MyHomePage extends StatefulWidget {
  ///
  const MyHomePage({Key? key}) : super(key: key);
  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  void initState() {
    super.initState();
    con = HomeController(this);
  }

  late HomeController con;

  @override
  Widget build(BuildContext context) => Scaffold(
        appBar: AppBar(
          title: const Text('Inherited Widget Example App'),
        ),
        body: InheritBird(
          child: InheritCat(
            child: InheritDog(
              child: InheritFox(
                child: GridView.count(
                  crossAxisCount: 3,
                  children: con.children,
                ),
              ),
            ),
          ),
        ),
        persistentFooterButtons: [
          Center(
            child: OverflowBar(
              spacing: 16,
              overflowAlignment: OverflowBarAlignment.end,
              children: [
                TextButton(
                  onPressed: () => con.newDogs(),
                  child: const Text('New Dogs'),
                ),
                TextButton(
                  onPressed: () => con.newCats(),
                  child: const Text('New Cats'),
                ),
                TextButton(
                  onPressed: () => con.newFoxes(),
                  child: const Text('New Foxes'),
                ),
                TextButton(
                  onPressed: () => con.newBirds(),
                  child: const Text('New Birds'),
                ),
              ],
            ),
          ),
        ],
      );
}

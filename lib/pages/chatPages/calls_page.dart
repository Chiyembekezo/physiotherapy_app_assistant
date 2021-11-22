import 'package:cupertino_list_tile/cupertino_list_tile.dart';
import 'package:flutter/cupertino.dart';

class Calls extends StatelessWidget {
  const Calls({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return CustomScrollView(
      slivers: [
        CupertinoSliverNavigationBar(
          largeTitle: Text('Charts'),
        ),
        SliverList(
          delegate: (SliverChildListDelegate([
            CupertinoListTile(
              title: Text("Chart1"),
            ),
            CupertinoListTile(
              title: Text("Chart1"),
            ),
            CupertinoListTile(
              title: Text("Chart1"),
            ),
          ])),
        )
      ],
    );
  }
}

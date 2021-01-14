import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:jxpguider_flutter/others/HYFTestModelProvider.dart';
import 'package:provider/provider.dart';

class MinePages extends StatefulWidget {
  @override
  _MinePagesState createState() => _MinePagesState();
}

class _MinePagesState extends State<MinePages> {
  @override
  Widget build(BuildContext context) {
    int num = Provider.of<HYFModelProvider>(context).num;
    return Container(
      child: Center(
        child: Center(
          child: Column(
            children: [
              Text('我的$num'),
              Consumer(
                builder: (context, value, child) {
                  return FloatingActionButton(
                    child: Icon(Icons.add),
                    onPressed: () {
                      value += 5;
                    },
                  );
                },
              )
            ],
          ),
        ),
      ),
    );
  }
}

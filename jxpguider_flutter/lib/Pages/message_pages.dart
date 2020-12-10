import 'package:flutter/widgets.dart';

class MessagePages extends StatefulWidget {
  @override
  _MessagePagesState createState() => _MessagePagesState();
}

class _MessagePagesState extends State<MessagePages> {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Center(
        child: Text('消息'),
      ),
    );
  }
}

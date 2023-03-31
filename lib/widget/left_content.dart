import 'package:fluent_ui/fluent_ui.dart';
import 'package:flutter/material.dart' as material;

class LeftContent extends StatefulWidget {
  const LeftContent({Key? key}) : super(key: key);

  @override
  State<LeftContent> createState() => _LeftContentState();
}

class _LeftContentState extends State<LeftContent> {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 10),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            "会话",
            style: material.Theme.of(context).textTheme.titleMedium,
          )
        ],
      ),
    );
  }

  Widget buildSessionItem(){
    return ListView.builder(
      itemCount: 5,
        itemBuilder: (context, index){
      return Container(

      );
    });
  }

}

import 'package:flutter/material.dart';

class DisplayNameInput extends StatelessWidget {
  const DisplayNameInput({
    Key key,
    @required Function onChanged,
    @required controller,
  }) : 
  _onChanged = onChanged,
  _controller = controller,
  super(key: key);

  final Function _onChanged;
  final _controller;


  @override
  Widget build(BuildContext context) {
  
    return Container(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 40),
        child: TextFormField(
          controller: _controller,
          onChanged: _onChanged,
          decoration: InputDecoration(
              fillColor: Colors.white,
              enabledBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(20),
                  borderSide: BorderSide(
                    width: 3.0,
                  )),
              border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10),
                  borderSide: BorderSide(
                      // color: Color(0xff949494),
                      color: Colors.red,
                      width: 50.0))),
        ),
      ),
    );
  }
}

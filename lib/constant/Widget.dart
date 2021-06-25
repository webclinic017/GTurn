import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:gturn/constant/ColorComman.dart';
Text normaltext(textshow) {
  return Text(
    textshow,
    style: TextStyle(color: Colors.white),
  );
}

Text boldtext20(textshow) {
  return Text(
    textshow,
    style: TextStyle(
        color: Colors.white, fontSize: 20, fontWeight: FontWeight.bold),
  );
}

Text blacktext(textshow) {
  return Text(
    textshow,
    textAlign: TextAlign.center,
    style: TextStyle(
      color: Colors.black,
      fontSize: 14,
      fontWeight: FontWeight.bold,
    ),
  );
}

Text blacktext16(textshow) {
  return Text(
    textshow,
    // textAlign: TextAlign.center,
    style: TextStyle(
      color: Colors.black,
      fontSize: 18,
      // fontWeight: FontWeight.bold,
    ),
  );
}

SizedBox drawersizedbox =
    SizedBox(height: 20, child: Container(color: whitecolor));

Text greentext20(textshow) {
  return Text(
    textshow,
    style: TextStyle(
        color: HexColor("#7EA42D"), fontSize: 20, fontWeight: FontWeight.bold),
  );
}

Text greentext18(textshow) {
  return Text(
    textshow,
    style: TextStyle(
        color: HexColor("#7EA42D"), fontSize: 18, fontWeight: FontWeight.bold),
  );
}

InputDecoration textboxdecoration(String _hintText) {
  return InputDecoration(
    hintText: _hintText,
    hintStyle: TextStyle(color: Colors.white),
    focusedBorder: UnderlineInputBorder(
      borderSide: BorderSide(width: 2, color: Colors.white),
    ),
    enabledBorder: UnderlineInputBorder(
      borderSide: BorderSide(width: 2, color: whitecolor),
    ),
  );
}

InputDecoration textboxdecorationbottomgreenline(String _hintText) {
  return InputDecoration(
    hintText: _hintText,
    hintStyle: TextStyle(color: appcolor),
    focusedBorder: UnderlineInputBorder(
      borderSide: BorderSide(width: 2, color: appcolor),
    ),
    enabledBorder: UnderlineInputBorder(
      borderSide: BorderSide(width: 2, color: appcolor),
    ),
  );
}

InputDecoration textboxdecorationbottomgreyline(String _hintText) {
  return InputDecoration(
    hintText: _hintText,
    hintStyle: TextStyle(color: greycolor),
    focusedBorder: UnderlineInputBorder(
      borderSide: BorderSide(width: 2, color: greycolor),
    ),
    enabledBorder: UnderlineInputBorder(
      borderSide: BorderSide(width: 2, color: greycolor),
    ),
  );
}

TextStyle textboxstyle = TextStyle(color: Colors.white, fontSize: 14);
TextStyle textboxstylewithgreencolor = TextStyle(color: appcolor, fontSize: 14);

InputDecoration mobiletextboxdecoration(String _hintText) {
  return InputDecoration(
    hintText: _hintText,
    hintStyle: TextStyle(color: Colors.white),
    focusedBorder: UnderlineInputBorder(
      borderSide: BorderSide(width: 2, color: Colors.white),
    ),
    enabledBorder: UnderlineInputBorder(
      borderSide: BorderSide(width: 2, color: whitecolor),
    ),
  );
}

String appurl = "";
// Color appcolor = HexColor("");
// Color whitecolor = Colors.white;
// Color blackcolor = Colors.black;
// Color bluecolor = Colors.blue;
// Color greycolor = Colors.grey;
// Color redcolor = HexColor("#A31B4A");
// Color yellowcolor = HexColor("#FFC400");
// Color litegrey = HexColor("#F5F5F5");

TextStyle splashHeading =
    TextStyle(fontSize: 56, fontWeight: FontWeight.bold, color: whitecolor);

Text normalwhitetext16(textshow) {
  return Text(
    textshow,
    style: TextStyle(color: Colors.white, fontSize: 16),
  );
}

Text liteboldwhitetext18(textshow) {
  return Text(
    textshow,
    style: TextStyle(
        color: Colors.white, fontSize: 18, fontWeight: FontWeight.w600),
  );
}

Text liteboldwhitetext16(textshow) {
  return Text(
    textshow,
    style: TextStyle(
        color: Colors.white, fontSize: 16, fontWeight: FontWeight.w600),
  );
}

Text normalwhitetext14(textshow) {
  return Text(
    textshow,
    style: TextStyle(color: Colors.white, fontSize: 14),
  );
}

SizedBox sh5 = SizedBox(
  height: 5,
);
SizedBox sh10 = SizedBox(
  height: 10,
);
SizedBox sh20 = SizedBox(
  height: 20,
);
SizedBox sh30 = SizedBox(
  height: 30,
);
SizedBox sh40 = SizedBox(
  height: 40,
);
SizedBox sw5 = SizedBox(
  width: 5,
);
SizedBox sw10 = SizedBox(
  width: 10,
);
SizedBox sw20 = SizedBox(
  width: 20,
);
SizedBox sw30 = SizedBox(
  width: 30,
);
SizedBox sw40 = SizedBox(
  width: 40,
);

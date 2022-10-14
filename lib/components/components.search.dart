
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import '../constants.dart';

class searchform extends StatelessWidget {
  const searchform({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Form(
      child:TextFormField(
        decoration:  InputDecoration(
          hintText: "search items....",
          filled: true,
          fillColor: Colors.white,
          border: outlineInputBorder,
          enabledBorder: outlineInputBorder,
          focusedBorder: outlineInputBorder,
          prefixIcon: Padding(
            padding: const EdgeInsets.all(12),
            child: SvgPicture.network("https://uxwing.com/wp-content/themes/uxwing/download/user-interface/search-icon.svg",width: 40),
          ),
          suffixIcon: Padding(
            padding: EdgeInsets.symmetric(horizontal: defaultPadding / 2),
            child: SizedBox(
              height: 48,
              width: 48,
              child: ElevatedButton(
                  onPressed: () {},
                  style: ElevatedButton.styleFrom(primary: Colors.orange,
                      shape: const RoundedRectangleBorder(
                          borderRadius: BorderRadius.all(Radius.circular(defaultBorderRadius))
                      )),
                  child: SvgPicture.network("https://uxwing.com/wp-content/themes/uxwing/download/e-commerce-currency-shopping/filters-icon.svg",width:40)),
            ),
          ),
        ),
      ),
    );
  }
}


const outlineInputBorder =    OutlineInputBorder(
  borderRadius: BorderRadius.all(Radius.circular(defaultBorderRadius)),
  borderSide: BorderSide.none,
);
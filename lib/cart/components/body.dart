
import 'package:untitled/models/cart.dart';
import 'package:untitled/sizeconfig.dart';
import 'package:flutter/cupertino.dart';
class Body extends StatelessWidget {
  const Body({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      children:  [
        SizedBox(
          width: 82,
        child: AspectRatio(aspectRatio: 0.88,
        child: Container(
          decoration: BoxDecoration(color: Color(0xFF5f6F9),
          borderRadius: BorderRadius.circular(15),

          ),
          child: Image.asset(democarts[0].product.image[0]),
        ),
        ),


          )

      ],
    );
  }
}

import 'package:flutter/material.dart';
class CalcButton extends StatelessWidget
{

  const CalcButton({super.key, required this.label,required this.size,required this.onTap,this.backcolor=Colors.white,this.Textcolor=Colors.black});
  final String label;
  final VoidCallback onTap;
  final double size;
  final Color? backcolor;
  final Color? Textcolor;

  @override
  Widget build(BuildContext context)
  {
    return  Padding(
        padding: const EdgeInsets.all(6),
        child: Ink(
            width: size+20.0,
            height: size,
            decoration: BoxDecoration(
                boxShadow: const [
                  BoxShadow(
                      color: Colors.grey,
                      offset: Offset(1, 1),
                      blurRadius: 2
                  ),
                ],
                borderRadius: BorderRadius.all(
                    Radius.circular(size / 2)
                ),
                color: backcolor
            ),
            child: InkWell(
                customBorder: RoundedRectangleBorder(
                borderRadius: BorderRadius.all(Radius.circular(size / 2)),
                  ),
                onTap: onTap,
                child: Center(
                  child: Text(
                      label,
                  style: TextStyle(fontSize: 24, color: Textcolor),
                ),
                ),
            )
        )
    );
  }
}


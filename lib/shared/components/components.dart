import 'package:flutter/material.dart';

Widget defaultButton({
  double width = double.infinity,
  Color background = Colors.blue,
  required Function function,
  required String text,
  bool isUpperCase = true,
}) =>
    Container(
      width: width,
      color: background,
      child: MaterialButton(
        onPressed: () {
          function();
        },
        child: Text(
          isUpperCase ? text.toUpperCase() : text,
          style: const TextStyle(
            color: Colors.white,
          ),
        ),
      ),
    );

Widget defaultFormField({
  required TextEditingController controller,
  required TextInputType type,
  Function? onSubmit,
  Function? onChanged,
  required Function validate,
  required String label,
  required IconData prefix,
  IconData? suffix,
  bool isPassword = false,
  Function? suffixPressed,
  Function? onTap,
  bool isClickable = true,
}) =>
    TextFormField(
      enabled: isClickable,
      onTap: onTap != null ? () => onTap() : null,
      validator: (s) {
        return validate(s);
      },
      obscureText: isPassword,
      controller: controller,
      onFieldSubmitted: onSubmit != null ? onSubmit() : null,
      onChanged: onChanged != null ? onChanged() : null,
      keyboardType: type,
      decoration: InputDecoration(
        labelText: label,
        border: const OutlineInputBorder(),
        prefixIcon: Icon(
          prefix,
        ),
        suffixIcon: suffix != null
            ? IconButton(
                icon: Icon(suffix),
                onPressed: () {
                  suffixPressed!();
                },
              )
            : null,
      ),
    );
  Widget buildTaskItem(Map model) => Padding(
    padding: const EdgeInsets.all(20.0),
    child: Row(
      children: [
         CircleAvatar(
          radius: 40.0,
          child: Text(
            '${model['time']}',
          ),
        ),
        const SizedBox(
          width: 20.0,
        ),
        Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children:  [
            Text(
              '${model['title']}',
              style: const TextStyle(
                fontSize: 20.0,
                fontWeight: FontWeight.bold,
              ),
            ),
            Text(
              '${model['date']}',
              style: const TextStyle(
                color: Colors.grey,
              ),
            ),
          ],
        ),

      ],

    ),
  );

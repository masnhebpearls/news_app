import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:news_app/config/themes/styles.dart';
import 'package:news_app/features/screens/home_page/presentation/bloc/news_bloc.dart';

import '../../models/news_model/news_model.dart';

void showSnackBar(String message,NewsModel model ,BuildContext context, bool showAction) {
  ScaffoldMessenger.of(context).showSnackBar(
    SnackBar(
      backgroundColor: Colors.tealAccent,
      behavior: SnackBarBehavior.floating,
      content: Text(
        message,
        style: textInSnackBar,
      ),
       action: showAction ? SnackBarAction(
        onPressed: (){
          context.read<NewsBloc>().add(SaveButtonPressedEvent(model: model));
        },
        label: "Undo",
         textColor: Colors.black,
      ): null,
    ),
  );
}

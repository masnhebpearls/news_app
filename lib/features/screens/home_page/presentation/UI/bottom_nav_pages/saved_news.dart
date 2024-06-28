import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:news_app/config/themes/styles.dart';
import 'package:news_app/features/screens/home_page/models/news_model/news_model.dart';
import 'package:news_app/features/screens/home_page/presentation/bloc/news_bloc.dart';
import 'package:news_app/features/screens/home_page/presentation/widgets/news_card.dart';

@RoutePage()
class LocalSavedNews extends StatefulWidget {
  const LocalSavedNews({super.key});

  @override
  State<LocalSavedNews> createState() => _LocalSavedNewsState();
}

class _LocalSavedNewsState extends State<LocalSavedNews> {
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => NewsBloc()..add(LoadSavedNewsEvent()),
      child: Scaffold(
        appBar: AppBar(
          title: Center(child: Text("Saved News", style: tittleTextInBlogCard,)),
        ),
        body: BlocConsumer<NewsBloc, NewsState>(
          listener: (context, state) {
            // TODO: implement listener
          },
          builder: (context, state) {
            print('State is ${state.runtimeType}');
            switch(state.runtimeType){
              case(const (SavedNewsLoadedState) || const (NewsDeletedState)):
                final List<NewsModel> savedList = (state.runtimeType == SavedNewsLoadedState) ? (state as SavedNewsLoadedState).savedNews : (state as NewsDeletedState).savedList;
                return ListView.builder(
                  itemCount: savedList.length,
                  itemBuilder: (context,index){
                    return NewsCard(model: savedList[index], isSavedView: true,);
                  },

                );
              case(const (NONewsSavedState)):
                return Container();
              default:
                return const Center(
                  child: CircularProgressIndicator(),
                );
            }
          },
        ),
      ),
    );
  }
}

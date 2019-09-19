import 'package:flutter/material.dart';
import 'package:tratar_erros_dio/src/home/home_bloc.dart';
import 'package:tratar_erros_dio/src/home/home_module.dart';
import 'package:tratar_erros_dio/src/shared/models/post_model.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {

  var bloc = HomeModule.to.getBloc<HomeBloc>();

  void initState() {
    super.initState();
    bloc.getPosts();
  }
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Home"),
      ),
      body: SingleChildScrollView(
        child: StreamBuilder<List<PostModel>>(
          stream: bloc.responseOut,
          builder: (context, snapshot) {

            if(snapshot.hasError) {
              return Center(child: Text(snapshot.error.toString()));
            }

            if(snapshot.hasData) {
              return Column(children: snapshot.data.map((item) => ListTile(title: Text(item.title),)).toList(),);
            }

            else {
              return Center(child: CircularProgressIndicator(),);
            }

          },
        ),
      ),
    );
  }
}

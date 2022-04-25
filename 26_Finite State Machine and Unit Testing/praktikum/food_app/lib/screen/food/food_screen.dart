// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';
import 'package:food_app/model/food_model.dart';
import 'package:food_app/screen/food/food_view_model.dart';
import 'package:provider/provider.dart';

class FoodScreen extends StatefulWidget {
  const FoodScreen({Key? key}) : super(key: key);

  @override
  State<FoodScreen> createState() => _FoodScreenState();
}

class _FoodScreenState extends State<FoodScreen> {
  @override
  void initState() {
    super.initState();

    WidgetsBinding.instance!.addPostFrameCallback((timeStamp) async {
      await Provider.of<FoodViewModel>(context, listen: false)
          .getFoodsFromAPI();
    });
  }

  Widget body(FoodViewModel viewModel) {
    final isLoading = viewModel.state == FoodViewState.loading;
    final isError = viewModel.state == FoodViewState.error;

    if (isLoading) {
      return Center(
        child: CircularProgressIndicator(),
      );
    }
    if (isError) {
      return Center(
        child: Text('Gagal Mengambil Data.'),
      );
    }

    return ListView.builder(
      itemCount: viewModel.foods.length,
      itemBuilder: (context, index) {
        FoodModel food = viewModel.foods[index];
        return ListTile(
          title: Text('${food.id}'),
          subtitle: Text('${food.name}'),
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    FoodViewModel foodViewModel = Provider.of<FoodViewModel>(context);

    return Scaffold(
      appBar: AppBar(
        title: Text('Food Screen'),
      ),
      body: body(foodViewModel),
    );
  }
}

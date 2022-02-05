import 'package:bloc/bloc.dart';
import 'package:food_market/services/services.dart';
import 'package:meta/meta.dart';
import 'package:equatable/equatable.dart';
import 'package:food_market/models/model.dart';

part 'food_state.dart';

class FoodCubit extends Cubit<FoodState> {
  FoodCubit() : super(FoodInitial());

  Future<void> getFoods() async {
    ApiReturnValue<List<Food>> result = await FoodServices.getFoods();

    if (result.value != null) {
      emit(FoodLoaded(result.value!));
    } else {
      emit(FoodLoadingFail(result.message!));
    }
  }
}

import 'package:apply_to/feature/Home/data/slider_pic.dart';
import 'package:apply_to/feature/Home/logic/cubit/home_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class HomeCubit extends Cubit<HomeState> {
  HomeCubit() : super(homeloading(isLoading: true));

  Future<void> imageStatus() async {
    print("======================= imageStatus is loading");
    final result = await ImageRepository.validateImages();
    if (!isClosed && result) {
      print("======================= imageStatus is loaded");
      emit(homeloading(isLoading: false));
    } else {
      print("======================= imageStatus is not complete loading");
    }
    //isClosed and the else statement its for handling this exc "StateError (Bad state: Cannot emit new states after calling close)" its happened when quick navigation done by the user so we first check if the screen still appear
  }
}

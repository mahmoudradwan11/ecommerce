import 'package:t/core/controllers/onboarding_states.dart';
import 'package:t/core/managers/nav.dart';
import 'package:t/core/network/local/cache_helper.dart';
import 'package:t/screens/modules/login.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
class OnBoardingCubit extends Cubit<OnboardingStates>{
  OnBoardingCubit() : super(OnboardingInitState());
  static OnBoardingCubit get(context) => BlocProvider.of(context);
  bool isPageLast = false;
  int screenIndex = 0;
  void pageLast(index){
    isPageLast = true;
    screenIndex = index;
    print(screenIndex);
    emit(PageLast());
  }
  void pageNotLast(index){
    isPageLast = false;
    screenIndex = index;
    print(screenIndex);
    emit(NotPageLast());
  }
  void submit(context){
    CacheHelper.saveData(key:'Boarding', value:true).then((value)=>
    navigateToNextScreen(context,const LoginScreen()));
  }
}
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:t/core/controllers/profile_cubit/profile_states.dart';
import 'package:t/core/managers/values.dart';
import 'package:t/core/network/constant.dart';
import 'package:t/core/network/remote/dio_helper.dart';
import 'package:t/models/user_model.dart';

class ProfileCubit extends Cubit<ProfileStates> {
  ProfileCubit() : super(ProfileInitState());

  static ProfileCubit get(context) => BlocProvider.of(context);
  UserModel? profileModel;
  void getUserData(){
    DioHelperStore.postData(url:ApiConstants.userProfileApi, data:{
        "token": token
    }).then((value){
     profileModel= UserModel.fromJson(value.data);
     print(profileModel!.user!.email);
     emit(GetUserData());
    }).catchError((error){
      print(error.toString());
      emit(ErrorGetUserData());
    });
  }
}
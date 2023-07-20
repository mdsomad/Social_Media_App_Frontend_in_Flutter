import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:social_media_app_frontend_in_flutter/Repository/change_password_repository.dart';
import 'package:social_media_app_frontend_in_flutter/Resources/Components/log.dart';
import 'package:social_media_app_frontend_in_flutter/logic/cubits/change_password_cubits/change_password_state.dart';

class ChangePasswordCubit extends Cubit<ChangePasswordState> {
  
   ChangePasswordCubit() : super( ChangePasswordInitialState() ) {
     Loggerclass.logger.i("ChangePasswordInitialState");
  }


final ChangePasswordRepository _changePasswordRepository = ChangePasswordRepository();


//TODO: Create ChangePassword functon 
void ChangePassword({required String OldPassWord,required String NewPassword}) async {
    emit(ChangePasswordLoadingState());
    try {
      final changePaddword = await _changePasswordRepository.ChangePassword(OldPassword: OldPassWord,NewPassword: NewPassword);
    
      emit(ChangePasswordSuccessfullyState(changePaddword!) );
    }
    catch(ex) {
      Loggerclass.logger.e(ex);
      emit(ChangePasswordErrorState(ex.toString()) );
    }
  }




  
    
}
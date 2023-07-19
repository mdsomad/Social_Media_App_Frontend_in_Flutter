import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:social_media_app_frontend_in_flutter/Models/Use_profiledetels_model.dart';
import 'package:social_media_app_frontend_in_flutter/Repository/search_user_repository.dart';
import 'package:social_media_app_frontend_in_flutter/Resources/Components/log.dart';
import 'package:social_media_app_frontend_in_flutter/logic/cubits/user_search_cubits/user_search_state.dart';

class SearchUserCubit extends Cubit<UserSearchState> {
  SearchUserCubit() : super( SearchUserInitialState() ) {
    
    Loggerclass.logger.i("SearchUserInitialState Yes");
  }

  final _searchUserRepository = SearchUserRepository();








// TODO Create SearchUser function
void SearchUser({required String name,}) async {
    try {

      List<UserProfileDetelsModel> searchUser = await _searchUserRepository.SearchUser(name);
       

   
       emit(SearchUserLoadedState(searchUser));


    } catch(ex) {
      Loggerclass.logger.e(ex.toString());
      emit( SearchUserErrorState(ex.toString(),state.searchUser) );
    }
  }






}
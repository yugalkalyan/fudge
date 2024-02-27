
import 'dart:async';
import 'dart:convert';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:http/http.dart' as http;

import '../../resources/error_toast.dart';
part 'top_users_events.dart';
part 'top_users_states.dart';

class TopUsersBloc extends Bloc<TopUsersEvents,TopUsersStates>{
  TopUsersBloc() : super(const TopUsersStates()) {
on<FetchTopUsers>(_fetchUserList);
  }

  Future<void> _fetchUserList(FetchTopUsers event,Emitter<TopUsersStates> emit) async {
    try {
      String url = "https://jsonplaceholder.typicode.com/users";
      var header = {
        'Content-Type': 'application/json',
      };

      final response = await http.get(
          Uri.parse(url,), headers: header,);
      if (response.statusCode == 200) {
List<String> userList=List.from(json.decode(response.body).map((x) => x["username"]));
emit(state.copyWith(status: Status.success,userName: userList));
      } else if (response.statusCode == 400) {
        debugPrint("handling of error message as per requirement");
        errorMessage();
        emit(state.copyWith(status: Status.failure,userName: []));
      } else if (response.statusCode == 401) {
       debugPrint("logout user if not authorised");
       emit(state.copyWith(status: Status.failure,userName: []));
       errorMessage(message: "Session Expired!");
      } else if (response.statusCode == 500) {
       debugPrint("internal server error");
       errorMessage(message: "Internal Server Error");
       emit(state.copyWith(status: Status.failure,userName: []));
      }
    } on SocketException catch (e) {
      switch (e.osError?.errorCode) {
        case 7:
          debugPrint( "NO internet connection!");
          errorMessage(message: "No internet connection!");
          emit(state.copyWith(status: Status.failure,userName: []));
          break;
        case 111:
          debugPrint( "Unable To Connect To Server!");
          errorMessage(message: "Unable To Connect To Server!");
          emit(state.copyWith(status: Status.failure,userName: []));
          break;
      }
      debugPrint( 'Socket Exception thrown --> $e');
    } on TimeoutException catch (e) {
      debugPrint( 'TimeoutException thrown --> $e');
      emit(state.copyWith(status: Status.failure,userName: []));
    } catch (err, s) {
      emit(state.copyWith(status: Status.failure,userName: []));
      debugPrint( 'Error While Making network call -> $err');
      debugPrint( 'Error While Making network call -> $s');
    }
  }
}
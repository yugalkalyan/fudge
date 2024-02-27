part of 'top_users_bloc.dart';

enum Status{
  loading,
  success,
  failure,
}

class  TopUsersStates{
  const TopUsersStates({this.status=Status.loading,this.userName=const<String>[]});
  final Status status;
  final List<String> userName;


  TopUsersStates copyWith({
    Status? status,
     List<String>? userName
}){
    return TopUsersStates(
      status: status??this.status,
      userName: userName??this.userName
    );
  }
}
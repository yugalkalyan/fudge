part of 'top_users_bloc.dart';

abstract class  TopUsersEvents{
  const TopUsersEvents();
}

class FetchTopUsers extends TopUsersEvents{
  const FetchTopUsers();
}
import 'package:mobx/mobx.dart';

part 'user_list.g.dart';

class UserList = _UserList with _$UserList;

abstract class _UserList with Store{

  @observable
  bool enableEditing = false;

  @action
  void setEnableEditing() => enableEditing = !enableEditing;


}
// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user_list.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$UserList on _UserList, Store {
  final _$enableEditingAtom = Atom(name: '_UserList.enableEditing');

  @override
  bool get enableEditing {
    _$enableEditingAtom.context.enforceReadPolicy(_$enableEditingAtom);
    _$enableEditingAtom.reportObserved();
    return super.enableEditing;
  }

  @override
  set enableEditing(bool value) {
    _$enableEditingAtom.context.conditionallyRunInAction(() {
      super.enableEditing = value;
      _$enableEditingAtom.reportChanged();
    }, _$enableEditingAtom, name: '${_$enableEditingAtom.name}_set');
  }

  final _$_UserListActionController = ActionController(name: '_UserList');

  @override
  void setEnableEditing() {
    final _$actionInfo = _$_UserListActionController.startAction();
    try {
      return super.setEnableEditing();
    } finally {
      _$_UserListActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    final string = 'enableEditing: ${enableEditing.toString()}';
    return '{$string}';
  }
}

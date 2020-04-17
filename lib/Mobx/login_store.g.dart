// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'login_store.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$LoginStore on _LoginStore, Store {
  Computed<bool> _$isPasswordValidComputed;

  @override
  bool get isPasswordValid => (_$isPasswordValidComputed ??=
          Computed<bool>(() => super.isPasswordValid))
      .value;
  Computed<bool> _$isLoginValidComputed;

  @override
  bool get isLoginValid =>
      (_$isLoginValidComputed ??= Computed<bool>(() => super.isLoginValid))
          .value;
  Computed<bool> _$isFormValidComputed;

  @override
  bool get isFormValid =>
      (_$isFormValidComputed ??= Computed<bool>(() => super.isFormValid)).value;
  Computed<Function> _$loginPressedComputed;

  @override
  Function get loginPressed =>
      (_$loginPressedComputed ??= Computed<Function>(() => super.loginPressed))
          .value;

  final _$loadingAtom = Atom(name: '_LoginStore.loading');

  @override
  bool get loading {
    _$loadingAtom.context.enforceReadPolicy(_$loadingAtom);
    _$loadingAtom.reportObserved();
    return super.loading;
  }

  @override
  set loading(bool value) {
    _$loadingAtom.context.conditionallyRunInAction(() {
      super.loading = value;
      _$loadingAtom.reportChanged();
    }, _$loadingAtom, name: '${_$loadingAtom.name}_set');
  }

  final _$usAtom = Atom(name: '_LoginStore.us');

  @override
  Usuario get us {
    _$usAtom.context.enforceReadPolicy(_$usAtom);
    _$usAtom.reportObserved();
    return super.us;
  }

  @override
  set us(Usuario value) {
    _$usAtom.context.conditionallyRunInAction(() {
      super.us = value;
      _$usAtom.reportChanged();
    }, _$usAtom, name: '${_$usAtom.name}_set');
  }

  final _$loginAtom = Atom(name: '_LoginStore.login');

  @override
  String get login {
    _$loginAtom.context.enforceReadPolicy(_$loginAtom);
    _$loginAtom.reportObserved();
    return super.login;
  }

  @override
  set login(String value) {
    _$loginAtom.context.conditionallyRunInAction(() {
      super.login = value;
      _$loginAtom.reportChanged();
    }, _$loginAtom, name: '${_$loginAtom.name}_set');
  }

  final _$passwordAtom = Atom(name: '_LoginStore.password');

  @override
  String get password {
    _$passwordAtom.context.enforceReadPolicy(_$passwordAtom);
    _$passwordAtom.reportObserved();
    return super.password;
  }

  @override
  set password(String value) {
    _$passwordAtom.context.conditionallyRunInAction(() {
      super.password = value;
      _$passwordAtom.reportChanged();
    }, _$passwordAtom, name: '${_$passwordAtom.name}_set');
  }

  final _$passwordVisibleAtom = Atom(name: '_LoginStore.passwordVisible');

  @override
  bool get passwordVisible {
    _$passwordVisibleAtom.context.enforceReadPolicy(_$passwordVisibleAtom);
    _$passwordVisibleAtom.reportObserved();
    return super.passwordVisible;
  }

  @override
  set passwordVisible(bool value) {
    _$passwordVisibleAtom.context.conditionallyRunInAction(() {
      super.passwordVisible = value;
      _$passwordVisibleAtom.reportChanged();
    }, _$passwordVisibleAtom, name: '${_$passwordVisibleAtom.name}_set');
  }

  final _$logarAsyncAction = AsyncAction('logar');

  @override
  Future logar() {
    return _$logarAsyncAction.run(() => super.logar());
  }

  final _$_LoginStoreActionController = ActionController(name: '_LoginStore');

  @override
  void setLogin(String value) {
    final _$actionInfo = _$_LoginStoreActionController.startAction();
    try {
      return super.setLogin(value);
    } finally {
      _$_LoginStoreActionController.endAction(_$actionInfo);
    }
  }

  @override
  void setPassword(String value) {
    final _$actionInfo = _$_LoginStoreActionController.startAction();
    try {
      return super.setPassword(value);
    } finally {
      _$_LoginStoreActionController.endAction(_$actionInfo);
    }
  }

  @override
  void senhaVisivel() {
    final _$actionInfo = _$_LoginStoreActionController.startAction();
    try {
      return super.senhaVisivel();
    } finally {
      _$_LoginStoreActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    final string =
        'loading: ${loading.toString()},us: ${us.toString()},login: ${login.toString()},password: ${password.toString()},passwordVisible: ${passwordVisible.toString()},isPasswordValid: ${isPasswordValid.toString()},isLoginValid: ${isLoginValid.toString()},isFormValid: ${isFormValid.toString()},loginPressed: ${loginPressed.toString()}';
    return '{$string}';
  }
}

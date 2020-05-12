// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'novo_usuario.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$NovoUsuario on _NovoUsuario, Store {
  Computed<bool> _$isFormValidComputed;

  @override
  bool get isFormValid =>
      (_$isFormValidComputed ??= Computed<bool>(() => super.isFormValid)).value;
  Computed<Function> _$novousuarioPressedComputed;

  @override
  Function get novousuarioPressed => (_$novousuarioPressedComputed ??=
          Computed<Function>(() => super.novousuarioPressed))
      .value;

  final _$crm_checkAtom = Atom(name: '_NovoUsuario.crm_check');

  @override
  bool get crm_check {
    _$crm_checkAtom.context.enforceReadPolicy(_$crm_checkAtom);
    _$crm_checkAtom.reportObserved();
    return super.crm_check;
  }

  @override
  set crm_check(bool value) {
    _$crm_checkAtom.context.conditionallyRunInAction(() {
      super.crm_check = value;
      _$crm_checkAtom.reportChanged();
    }, _$crm_checkAtom, name: '${_$crm_checkAtom.name}_set');
  }

  final _$cre_checkAtom = Atom(name: '_NovoUsuario.cre_check');

  @override
  bool get cre_check {
    _$cre_checkAtom.context.enforceReadPolicy(_$cre_checkAtom);
    _$cre_checkAtom.reportObserved();
    return super.cre_check;
  }

  @override
  set cre_check(bool value) {
    _$cre_checkAtom.context.conditionallyRunInAction(() {
      super.cre_check = value;
      _$cre_checkAtom.reportChanged();
    }, _$cre_checkAtom, name: '${_$cre_checkAtom.name}_set');
  }

  final _$completestepAtom = Atom(name: '_NovoUsuario.completestep');

  @override
  int get completestep {
    _$completestepAtom.context.enforceReadPolicy(_$completestepAtom);
    _$completestepAtom.reportObserved();
    return super.completestep;
  }

  @override
  set completestep(int value) {
    _$completestepAtom.context.conditionallyRunInAction(() {
      super.completestep = value;
      _$completestepAtom.reportChanged();
    }, _$completestepAtom, name: '${_$completestepAtom.name}_set');
  }

  final _$stepAtom = Atom(name: '_NovoUsuario.step');

  @override
  int get step {
    _$stepAtom.context.enforceReadPolicy(_$stepAtom);
    _$stepAtom.reportObserved();
    return super.step;
  }

  @override
  set step(int value) {
    _$stepAtom.context.conditionallyRunInAction(() {
      super.step = value;
      _$stepAtom.reportChanged();
    }, _$stepAtom, name: '${_$stepAtom.name}_set');
  }

  final _$nomeAtom = Atom(name: '_NovoUsuario.nome');

  @override
  String get nome {
    _$nomeAtom.context.enforceReadPolicy(_$nomeAtom);
    _$nomeAtom.reportObserved();
    return super.nome;
  }

  @override
  set nome(String value) {
    _$nomeAtom.context.conditionallyRunInAction(() {
      super.nome = value;
      _$nomeAtom.reportChanged();
    }, _$nomeAtom, name: '${_$nomeAtom.name}_set');
  }

  final _$emailAtom = Atom(name: '_NovoUsuario.email');

  @override
  String get email {
    _$emailAtom.context.enforceReadPolicy(_$emailAtom);
    _$emailAtom.reportObserved();
    return super.email;
  }

  @override
  set email(String value) {
    _$emailAtom.context.conditionallyRunInAction(() {
      super.email = value;
      _$emailAtom.reportChanged();
    }, _$emailAtom, name: '${_$emailAtom.name}_set');
  }

  final _$crmAtom = Atom(name: '_NovoUsuario.crm');

  @override
  String get crm {
    _$crmAtom.context.enforceReadPolicy(_$crmAtom);
    _$crmAtom.reportObserved();
    return super.crm;
  }

  @override
  set crm(String value) {
    _$crmAtom.context.conditionallyRunInAction(() {
      super.crm = value;
      _$crmAtom.reportChanged();
    }, _$crmAtom, name: '${_$crmAtom.name}_set');
  }

  final _$creAtom = Atom(name: '_NovoUsuario.cre');

  @override
  String get cre {
    _$creAtom.context.enforceReadPolicy(_$creAtom);
    _$creAtom.reportObserved();
    return super.cre;
  }

  @override
  set cre(String value) {
    _$creAtom.context.conditionallyRunInAction(() {
      super.cre = value;
      _$creAtom.reportChanged();
    }, _$creAtom, name: '${_$creAtom.name}_set');
  }

  final _$novoAsyncAction = AsyncAction('novo');

  @override
  Future novo() {
    return _$novoAsyncAction.run(() => super.novo());
  }

  final _$excluirAsyncAction = AsyncAction('excluir');

  @override
  Future excluir() {
    return _$excluirAsyncAction.run(() => super.excluir());
  }

  final _$_NovoUsuarioActionController = ActionController(name: '_NovoUsuario');

  @override
  void setCRMcheck(bool value) {
    final _$actionInfo = _$_NovoUsuarioActionController.startAction();
    try {
      return super.setCRMcheck(value);
    } finally {
      _$_NovoUsuarioActionController.endAction(_$actionInfo);
    }
  }

  @override
  void setCREcheck(bool value) {
    final _$actionInfo = _$_NovoUsuarioActionController.startAction();
    try {
      return super.setCREcheck(value);
    } finally {
      _$_NovoUsuarioActionController.endAction(_$actionInfo);
    }
  }

  @override
  void setStep() {
    final _$actionInfo = _$_NovoUsuarioActionController.startAction();
    try {
      return super.setStep();
    } finally {
      _$_NovoUsuarioActionController.endAction(_$actionInfo);
    }
  }

  @override
  void desStep() {
    final _$actionInfo = _$_NovoUsuarioActionController.startAction();
    try {
      return super.desStep();
    } finally {
      _$_NovoUsuarioActionController.endAction(_$actionInfo);
    }
  }

  @override
  void setNome(String value) {
    final _$actionInfo = _$_NovoUsuarioActionController.startAction();
    try {
      return super.setNome(value);
    } finally {
      _$_NovoUsuarioActionController.endAction(_$actionInfo);
    }
  }

  @override
  void setEmail(String value) {
    final _$actionInfo = _$_NovoUsuarioActionController.startAction();
    try {
      return super.setEmail(value);
    } finally {
      _$_NovoUsuarioActionController.endAction(_$actionInfo);
    }
  }

  @override
  void setCRM(String value) {
    final _$actionInfo = _$_NovoUsuarioActionController.startAction();
    try {
      return super.setCRM(value);
    } finally {
      _$_NovoUsuarioActionController.endAction(_$actionInfo);
    }
  }

  @override
  void setCRE(String value) {
    final _$actionInfo = _$_NovoUsuarioActionController.startAction();
    try {
      return super.setCRE(value);
    } finally {
      _$_NovoUsuarioActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    final string =
        'crm_check: ${crm_check.toString()},cre_check: ${cre_check.toString()},completestep: ${completestep.toString()},step: ${step.toString()},nome: ${nome.toString()},email: ${email.toString()},crm: ${crm.toString()},cre: ${cre.toString()},isFormValid: ${isFormValid.toString()},novousuarioPressed: ${novousuarioPressed.toString()}';
    return '{$string}';
  }
}

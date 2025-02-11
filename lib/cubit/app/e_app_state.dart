// import 'package:freezed_annotation/freezed_annotation.dart';
part of 'app_cubit.dart';

enum EAppState {
  loggedIn,
  loggedOut,
  notDetermined,
}
const _$EAppStateTypeMap = {EAppState.loggedIn: 'loggedIn'};

extension EAppStateHelper on EAppState {
  String encode() => _$EAppStateTypeMap[this];

  EAppState key(String value) => decodeEAppState(value);

  EAppState decodeEAppState(String value) {
    return _$EAppStateTypeMap.entries
        .singleWhere((element) => element.value == value, orElse: () => null)
        ?.key;
  }

  T when<T>({
    @required T Function() loggedIn,
    @required T Function() loggedOut,
    @required T Function() notDetermined,
  }) {
    switch (this) {
      case EAppState.loggedIn:
        if (loggedIn != null) {
          return loggedIn.call();
        }
        break;
      case EAppState.loggedOut:
        if (loggedOut != null) {
          return loggedOut.call();
        }
        break;
      case EAppState.notDetermined:
        if (notDetermined != null) {
          return notDetermined.call();
        }
        break;
      default:
    }
    return null;
  }

  T mayBeWhen<T>({
    @required T Function() elseMaybe,
    T Function() loggedIn,
    T Function() loggedOut,
    T Function() notDetermined,
  }) {
    switch (this) {
      case EAppState.loggedIn:
        if (loggedIn != null) {
          return loggedIn.call();
        } else {
          return elseMaybe();
        }
        break;
      case EAppState.loggedOut:
        if (loggedOut != null) {
          return loggedOut.call();
        } else {
          return elseMaybe();
        }
        break;
      case EAppState.notDetermined:
        if (notDetermined != null) {
          return notDetermined.call();
        } else {
          return elseMaybe();
        }
        break;
      default:
        return elseMaybe();
    }
  }
}

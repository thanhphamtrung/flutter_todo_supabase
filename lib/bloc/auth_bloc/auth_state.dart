enum AuthStatus { initial, loading, success, failure }

class AuthState {
  final bool isAuthenticated;
  final AuthStatus status;

  AuthState({
    required this.isAuthenticated,
    required this.status,
  });
  // Lay instance AuthState hien tai thay doi gia tri roi tra ve instance moi
  // vd: final state = AuthState(isAuthenticated: true, status: AuthStatus.success)
  // state.copyWith(isAuthenticated: false)
  //  -> AuthState(isAuthenticated: false, status: AuthStatus.success)
  AuthState copyWith({
    bool? isAuthenticated,
    AuthStatus? status,
  }) {
    return AuthState(
      isAuthenticated: isAuthenticated ?? this.isAuthenticated,
      status: status ?? this.status,
    );
  }
}

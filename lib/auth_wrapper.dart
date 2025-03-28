import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:supabase_flutter_app/auth_page.dart';
import 'package:supabase_flutter_app/bloc/auth_bloc/auth_bloc.dart';
import 'package:supabase_flutter_app/bloc/auth_bloc/auth_event.dart';
import 'package:supabase_flutter_app/bloc/auth_bloc/auth_state.dart';
import 'package:supabase_flutter_app/home_page.dart';

class AuthWrapper extends StatelessWidget {
  const AuthWrapper({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => AuthBloc()..add(AuthCheck()),
      child: AuthWrapperView(),
    );
  }
}

class AuthWrapperView extends StatelessWidget {
  const AuthWrapperView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<AuthBloc, AuthState>(builder: (context, state) {
      if (state.status == AuthStatus.loading) {
        return Center(child: CircularProgressIndicator());
      }

      else if (state.isAuthenticated && state.status == AuthStatus.success) {
        return HomeScreen();
      }
      else if (state.status == AuthStatus.failure) {
        showDialog(
            context: context,
            builder: (context) => AlertDialog(
                  title: Text('Error'),
                  content: Text('Failed to authenticate'),
                ));
      }
      return AuthScreen();
    });
  }
}

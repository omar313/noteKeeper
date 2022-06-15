import 'package:classpay_new/application/auth/sign_in_form/sign_in_form_bloc.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SignInForm extends StatelessWidget {
  const SignInForm({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<SignInFormBloc, SignInFormState>(
      listener: (context, state) {
        state.authFailureOrSuccess?.fold((failure) {
          final errorText = failure.map(
              cancelledByUser: (_) => 'cancel by user',
              serverError: (_) => 'server error',
              emailAlreadyInUse: (_) => 'email already in use',
              invalidEmailAndPasswordCombination: (_) => 'invalid email and password');
          ScaffoldMessenger.of(context)
              .showSnackBar(SnackBar(content: Text(errorText)));
        }, (r) => {});
      },
      builder: (context, state) {
        return Form(
          autovalidateMode: state.showErrorMessages
              ? AutovalidateMode.always
              : AutovalidateMode.disabled,
          child: ListView(
            padding: const EdgeInsets.all(8),
            children: [
              const Text(
                '📝',
                style: TextStyle(fontSize: 130),
                textAlign: TextAlign.center,
              ),
              const SizedBox(
                height: 8,
              ),
              TextFormField(
                decoration: const InputDecoration(
                    prefixIcon: Icon(Icons.email), labelText: 'Email'),
                onChanged: (text) => context
                    .read<SignInFormBloc>()
                    .add(SignInFormEvent.emailChanged(text)),
                validator: (_) =>
                    context.read<SignInFormBloc>().state.emailAddress.isValid
                        ? null
                        : 'invalid email',
                autocorrect: false,
              ),
              const SizedBox(
                height: 8,
              ),
              TextFormField(
                decoration: const InputDecoration(
                    prefixIcon: Icon(Icons.lock), labelText: 'Password'),
                validator: (_) =>
                    context.read<SignInFormBloc>().state.password.isValid
                        ? null
                        : 'invalid password',
                onChanged: (text) => context
                    .read<SignInFormBloc>()
                    .add(SignInFormEvent.passwordChanged(text)),
                autocorrect: false,
                obscureText: true,
              ),
              const SizedBox(
                height: 8,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  TextButton(
                      onPressed: () {
                        context.read<SignInFormBloc>().add(
                            const SignInFormEvent
                                .signInWithEmailAndPasswordPressed());
                      },
                      child: const Text('SIGN IN')),
                  TextButton(
                      onPressed: () {
                        context.read<SignInFormBloc>().add(
                            const SignInFormEvent
                                .registerWithEmailAndPasswordPressed());
                      }, child: const Text('REGISTER'))
                ],
              )
            ],
          ),
        );
      },
    );
  }
}

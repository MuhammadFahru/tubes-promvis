import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class PasswordVisibilityCubit extends Cubit<bool> {
  PasswordVisibilityCubit() : super(false);

  void showPassword() {
    emit(true);
  }

  void hidePassword() {
    emit(false);
  }
}

class PasswordTextField extends StatelessWidget {
  const PasswordTextField({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final passwordVisibilityCubit = context.read<PasswordVisibilityCubit>();

    return BlocBuilder<PasswordVisibilityCubit, bool>(
        builder: (context, isPasswordVisible) {
      return Container(
        decoration: BoxDecoration(
          color: Color(int.parse('0xffF6F6F6')),
          borderRadius: BorderRadius.circular(8.0),
          border: Border.all(
            color: Colors.grey,
            width: 1.0,
          ),
        ),
        child: TextField(
          obscureText: !isPasswordVisible,
          decoration: InputDecoration(
              contentPadding: const EdgeInsets.all(10),
              labelText: 'Password',
              labelStyle: TextStyle(
                  color: Color(int.parse('0xffBDBDBD')),
                  fontWeight: FontWeight.bold),
              suffixIcon: GestureDetector(
                onTapDown: (_) => passwordVisibilityCubit.showPassword(),
                onTapUp: (_) => passwordVisibilityCubit.hidePassword(),
                onTapCancel: () => passwordVisibilityCubit.hidePassword(),
                child: IconButton(
                  icon: const Icon(Icons.visibility),
                  onPressed: () {},
                ),
              )),
        ),
      );
    });
  }
}

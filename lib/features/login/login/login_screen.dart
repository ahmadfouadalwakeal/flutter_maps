import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_maps/core/helpers/show_progress_indicator.dart';
import 'package:flutter_maps/core/routing/routes.dart';
import 'package:flutter_maps/features/login/logic/phone_auth_cubit/phone_auth_cubit.dart';
import 'package:flutter_maps/features/login/login/widgets/build_intro_texts.dart';
import 'package:flutter_maps/features/login/login/widgets/build_next_button.dart';
import 'package:flutter_maps/features/login/login/widgets/build_phone_form_field.dart';

// ignore: must_be_immutable
class LoginScreen extends StatelessWidget {
  LoginScreen({Key? key}) : super(key: key);

  final GlobalKey<FormState> _phoneFormKey = GlobalKey();

  late String phoneNumber;

  Future<void> _register(BuildContext context) async {
    if (!_phoneFormKey.currentState!.validate()) {
      Navigator.pop(context);
      return;
    } else {
      Navigator.pop(context);
      _phoneFormKey.currentState!.save();
      BlocProvider.of<PhoneAuthCubit>(context).submitPhoneNumber(phoneNumber);
    }
  }

  Widget _buildPhoneNumberSubmitedBloc() {
    return BlocListener<PhoneAuthCubit, PhoneAuthState>(
      listenWhen: (previous, current) {
        return previous != current;
      },
      listener: (context, state) {
        if (state is Loading) {
          showProgressIndicator(context);
        }

        if (state is PhoneNumberSubmited) {
          Navigator.pop(context);
          Navigator.of(context).pushNamed(otpScreen, arguments: phoneNumber);
        }

        if (state is ErrorOccurred) {
          Navigator.pop(context);
          String errorMsg = (state).errorMsg;
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(
              content: Text(errorMsg),
              backgroundColor: Colors.black,
              duration: Duration(seconds: 3),
            ),
          );
        }
      },
      child: Container(),
    );
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        resizeToAvoidBottomInset: false,
        backgroundColor: Colors.white,
        body: Form(
          key: _phoneFormKey,
          child: Padding(
            padding: EdgeInsets.only(
              top: 64,
              left: 32,
              right: 32,
              bottom: MediaQuery.of(context).viewInsets.bottom > 0
                  ? MediaQuery.of(context).viewInsets.bottom *
                      0.08 // تقليل المسافة من الأسفل
                  : 20,
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const BuildIntroTexts(),
                const SizedBox(
                  height: 110,
                ),
                PhoneFormField(
                  onSaved: (value) {
                    phoneNumber = value!;
                  },
                ),
                const SizedBox(
                  height: 60,
                ),
                BuildNextButton(onPressed: () {
                  showProgressIndicator(context);
                  _register(context);
                }),
                _buildPhoneNumberSubmitedBloc(),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

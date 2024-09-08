import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tadmon/core/utils/colors.dart';
import 'package:tadmon/core/utils/text_styles.dart';
import 'package:tadmon/layout/login/presentation/cubit/login_cubit.dart';
import 'package:tadmon/layout/login/presentation/cubit/login_states.dart';
import 'package:tadmon/layout/login/presentation/view/widgets/custom_btn.dart';
import 'package:tadmon/layout/recipes/presentation/view/recipe_list_page.dart';
import 'widgets/custom_text_from_feild.dart';

class LoginScreen extends StatelessWidget {
  final _formKey = GlobalKey<FormState>();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => RecipeLoginCubit(),
      child: BlocConsumer<RecipeLoginCubit, RecipeLoginStates>(
        listener: (context, state) {
          if (state is RecipeLoginSuccessState) {
            Navigator.pushReplacement(
              context,
              MaterialPageRoute(
                  builder: (context) =>
                      RecipeListScreen()),
            );
          } else if (state is RecipeLoginErrorState) {
            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(content: Text(state.error)),
            );
          }
        },
        builder: (context, state) {
          final cubit = RecipeLoginCubit.get(context);

          return Scaffold(
            body: Form(
              key: _formKey,
              child: SingleChildScrollView(
                child: Column(
                  children: [
                    Padding(
                      padding: EdgeInsets.only(
                          top: MediaQuery.of(context).size.height * 0.06),
                      child: Column(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Image.asset(
                            'assets/images/login_ph.png',
                            fit: BoxFit.cover,
                            height: MediaQuery.of(context).size.height * 0.2,
                            width: double.infinity,
                            alignment: Alignment.topCenter,
                          ),
                        ],
                      ),
                    ),
                    Container(
                      padding: EdgeInsets.symmetric(
                          horizontal: 42.0, vertical: 35.0),
                      color: ColorCode.white,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'Sign In',
                            style: TextStyles.textXLarge,
                          ),
                          SizedBox(height: 32),
                          CustomTextFormField(
                            hint: 'Email',
                            inputType: TextInputType.emailAddress,
                            label: '',
                            prefixIcon: Icon(Icons.email_outlined),
                            controller: _emailController,
                            onSave: (String) {},
                          ),
                          SizedBox(height: 20),
                          CustomTextFormField(
                            hint: 'Password',
                            inputType: TextInputType.visiblePassword,
                            label: '',
                            controller: _passwordController,
                            obscureText:
                                cubit.isPassword,
                            prefixIcon: Icon(Icons.lock_outline),
                            onTapShowHidePassword: () {
                              cubit
                                  .changePasswordVisibility();
                            },
                            onSave: (String?
                                value) {},
                          ),
                          SizedBox(height: 20),
                          CustomButton(
                            child: Text(
                              'Sign In',
                              style: TextStyles.textMedium2.copyWith(
                                color: ColorCode.white,
                              ),
                            ),
                            onPressed: () {
                              if (_formKey.currentState?.validate() ?? false) {
                                cubit.userLogin(
                                  email: _emailController.text,
                                  password: _passwordController.text,
                                );
                              }
                            },
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}

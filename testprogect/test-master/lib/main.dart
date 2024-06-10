import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:newproject/bloc/add_person_cubit/cubit.dart';
import 'package:newproject/bloc/find_person_cubit/findperson_cubit.dart';
import 'package:newproject/bloc/forget_password/cubit/forget_password_cubit.dart';
import 'package:newproject/bloc/mylost/cubit/mylost_cubit.dart';
import 'package:newproject/bloc/search_cubit/cubit/search.dart';
import 'package:newproject/bloc/signup/cubit/signup_cubit.dart';
import 'package:newproject/bloc/update_name_cubit/cubit.dart';
import 'package:newproject/bloc/update_password.dart/update_pass_cubit.dart';
import 'package:newproject/data/api_services/dio_services.dart';
import 'package:newproject/data/sherdp_referense/cash_helper.dart';
import 'package:newproject/screens/profile_screen/profile/your_matches/your_mathches.dart';


void main() {
  WidgetsFlutterBinding.ensureInitialized();

  CacheHelper().init();

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
     return ScreenUtilInit(
      child: MultiBlocProvider(
        providers: [
        
          BlocProvider(
            create: (context) => SignupCubit(DioServices(Dio())),
          ),
          BlocProvider(create: (context) => AddPersonCubit(DioServices(Dio()))),
          BlocProvider(
            create: (context) => FindpersonCubit(DioServices(Dio())),
          ),
          BlocProvider(
            create: (context) => SearchCubit(DioServices(Dio())),
          ),
          BlocProvider(
            create: (context) => MyLostCubit(DioServices(Dio())),
          ),
          BlocProvider(
            create: (context) => UpDateNameCubit(DioServices(Dio())),
          ),
          BlocProvider(
            create: (context) => UpdatePasswordCubit(DioServices(Dio())),
          ),
          BlocProvider(
            create: (context) => ForgetPasswordCubit(DioServices(Dio())),
          ),
        ],
        child: MaterialApp(
          debugShowCheckedModeBanner: false,
          home: yourMatches(),
        ),
      ),
    );
   }

}
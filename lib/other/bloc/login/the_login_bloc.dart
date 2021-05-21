import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_sample/other/bloc/login/the_login_event.dart';
import 'package:flutter_sample/other/bloc/login/the_login_repositor.dart';
import 'package:flutter_sample/other/bloc/login/the_login_state.dart';
import 'package:flutter_sample/other/bloc/login/the_user_model.dart';

class LoginBloc extends Bloc<LoginEvent, LoginState> {
  LoginBloc(LoginState initialState) : super(initialState);

  @override
  LoginState get initialState => LoginInitialState();

  @override
  Stream<LoginState> mapEventToState(LoginEvent event) async* {
    try {
      if (event is LoginPressEvent) {
        UserModel model = UserModel.init();
        yield LoginInProgressState();
        final currentEvent = event;
        model = await LoginRepository.login(
            currentEvent.name.trim(), currentEvent.pwd.trim());
        yield LoginSuccessState(model);
      }
    } catch (e) {
      final errMsg = '登录错误';
      yield LoginFailureState(errMsg);
    }
  }
}

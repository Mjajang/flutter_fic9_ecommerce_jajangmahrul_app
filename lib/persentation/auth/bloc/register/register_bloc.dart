import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_fic9_ecommerce_jajangmahrul_app/data/datasources/auth_remote_datasource.dart';
import 'package:flutter_fic9_ecommerce_jajangmahrul_app/data/models/request/register_request_model.dart';
import 'package:flutter_fic9_ecommerce_jajangmahrul_app/data/models/response/auth_response_model.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'register_event.dart';
part 'register_state.dart';
part 'register_bloc.freezed.dart';

class RegisterBloc extends Bloc<RegisterEvent, RegisterState> {
  RegisterBloc() : super(const _Initial()) {
    on<_Register>((event, emit) async {
      emit(const _Loading());

      final response = await AuthRemoteDatasource().register(event.data!);

      response.fold(
        (l) => emit(_Error(l)),
        (r) => emit(_Success(r)),
      );
    });
  }
}

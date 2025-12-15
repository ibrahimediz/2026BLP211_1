import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hafta12/bloc/app_event.dart';
import 'package:hafta12/bloc/app_state.dart';
import 'package:hafta12/services/firestrore_service.dart';

class AppBloc extends Bloc<AppEvent, AppState> {
  final FirestoreService _service;

  AppBloc(this._service) : super(AppInitial()) {
    on<CreateProductEvent>((event, emit) async {
      try {
        emit(AppLoading());
        await _service.addItem(event.productMap);
        emit(AppSuccess());
      } catch (e) {
        emit(AppError(e.toString()));
      }
    });

    on<DeleteProductEvent>((event, emit) async {
      try {
        emit(AppLoading());
        await _service.deleteItem(event.productId);
        emit(AppSuccess());
      } catch (e) {
        emit(AppError(e.toString()));
      }
    });
  }
}

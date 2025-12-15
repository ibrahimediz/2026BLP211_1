import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hafta12/bloc/app_event.dart';
import '../services/firestore_service.dart';

class AppBloc extends Bloc<AppEvent, AppState> {
  final FirestoreService _service;

  AppBloc(this._service) : super(AppInitial()) {
    // TODO: Event Handler'lar derste yazılacak

    on<AddItemEvent>((event, emit) async {
      // 1. Loading emit et
      // 2. Servisi çağır
      // 3. Success emit et
    });

    on<DeleteItemEvent>((event, emit) async {
      // Silme işlemi...
    });
  }
}

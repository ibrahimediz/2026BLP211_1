abstract class AppState {}

class AppInitial extends AppState {}

class AppLoading extends AppState {}

class AppSuccess extends AppState {}

class AppError extends AppState {
  final String message;
  AppError(this.message);
}

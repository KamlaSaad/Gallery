part of 'cubit.dart';

class GalleryState {}

class InitState extends GalleryState {}
class LoadingState extends GalleryState {}
class LoadedState extends GalleryState {}
class ErrorState extends GalleryState {
  final String err;
  ErrorState({required this.err});
}

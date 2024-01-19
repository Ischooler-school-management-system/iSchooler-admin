import 'dart:async';

import '../models/loading_model.dart';

class LoadingRepository {
  final _controller = StreamController<LoadingModel>();

  void _updateLoading(LoadingModel loading) {
    _controller.add(loading);
  }

  Stream<LoadingModel> get loadingStatus async* {
    await Future<void>.delayed(const Duration(seconds: 1));
    yield LoadingModel.none;
    yield* _controller.stream;
  }

  Future<void> startLoading(LoadingType loadingType) async {
    final LoadingModel loading = LoadingModel(
      loadingStatus: LoadingStatus.loading,
      loadingType: loadingType,
    );

    /* Madpoly.print(
      loading,
      developer: "Ziad",
      isInspect: true,
      isLog: true,
      tag: "LoadingRepository",
    ); */

    _updateLoading(loading);
  }

  Future<void> stopLoading() async {
    const LoadingModel loading =
        LoadingModel(loadingStatus: LoadingStatus.finished);

    /*  Madpoly.print(
      loading,
      developer: "Ziad",
      isInspect: true,
      isLog: true,
      tag: "LoadingRepository",
    ); */

    _updateLoading(loading);
  }

  void close() {
    _controller.close();
  }
}

import 'package:base/base.dart';
import 'package:base/sources/cubit.dart';
import 'package:flutter/material.dart';

abstract class BaseScreen<Cubit extends BaseCubit<T>, T extends BaseState>
    extends StatelessWidget {
  Cubit get cubit;

  const BaseScreen({super.key});

  Configuration? getAppConfig(BuildContext context) {
    final root = IamRoot.maybeOf(context);
    assert(root != null, 'Need add IamRoot as a root widget tree');
    return root?.configuration;
  }

  Widget builder(BuildContext context, T state);

  @override
  Widget build(BuildContext context) {
    cubit.stream.distinct().listen((value) {
      onStateChanged(context, value);
    });

    return StreamBuilder<T>(
        initialData: cubit.stream.value,
        stream: cubit.stream.distinct(),
        builder: (context, snapshot) => builder(context, snapshot.data!));
  }

  void onStateChanged(BuildContext context, T state);
}

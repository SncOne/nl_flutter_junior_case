import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:jr_case_boilerplate/core/helpers/print.dart';
import 'package:jr_case_boilerplate/core/widgets/loading/loading_widget.dart';

class AsyncValueBuilder<T> extends StatelessWidget {
  const AsyncValueBuilder({
    required this.asyncData,
    required this.builder,
    this.loading,
    this.error,
    super.key,
  }) : _isSliver = false;

  const AsyncValueBuilder.sliver({
    required this.asyncData,
    required this.builder,
    this.loading,
    this.error,
    super.key,
  }) : _isSliver = true;

  final AsyncValue<T> asyncData;
  final Widget Function(T data) builder;
  final Widget? loading;
  final Widget Function(Object error, StackTrace? st)? error;
  final bool _isSliver;

  Widget errorCallback(final Object e, final StackTrace st) {
    Print.error(e, tag: 'AsyncValueBuilder', st: st);
    final errorWidget = Center(child: Text('$e'));
    if (_isSliver) return SliverToBoxAdapter(child: errorWidget);
    return errorWidget;
  }

  @override
  Widget build(final BuildContext context) {
    return asyncData.when(
      data: builder,
      error: error ?? errorCallback,
      loading: () {
        if (_isSliver) return SliverToBoxAdapter(child: LoadingWidget());
        return LoadingWidget();
      },
    );
  }
}

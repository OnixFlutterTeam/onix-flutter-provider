import 'package:flutter/material.dart';
import 'package:onix_flutter_provider/src/provider/mixins/failure_stream_mixin.dart';
import 'package:onix_flutter_provider/src/provider/mixins/progress_stream_mixin.dart';

abstract class BaseProvider extends ChangeNotifier
    with FailureStreamMixin, ProgressStreamMixin {
  @override
  void dispose() {
    closeProgressStream();
    closeFailureStream();
    super.dispose();
  }
}

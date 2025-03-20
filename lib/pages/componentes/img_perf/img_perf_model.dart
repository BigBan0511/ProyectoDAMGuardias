import '/flutter_flow/flutter_flow_util.dart';
import 'img_perf_widget.dart' show ImgPerfWidget;
import 'package:flutter/material.dart';

class ImgPerfModel extends FlutterFlowModel<ImgPerfWidget> {
  ///  State fields for stateful widgets in this component.

  bool isDataUploading = false;
  FFUploadedFile uploadedLocalFile =
      FFUploadedFile(bytes: Uint8List.fromList([]));
  String uploadedFileUrl = '';

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {}
}

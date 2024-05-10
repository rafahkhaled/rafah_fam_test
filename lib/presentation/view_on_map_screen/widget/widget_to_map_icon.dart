import 'package:flutter/material.dart';
import 'dart:typed_data';
import 'package:flutter/rendering.dart';
import 'dart:ui' as ui;

import 'package:google_maps_flutter/google_maps_flutter.dart';

extension ToBitDescription on Widget {
  /// Converts the given widget into a BitmapDescriptor asynchronously.
  /// The resulting BitmapDescriptor can be used in mapping applications, such as Google Maps.
  ///
  /// Parameters:
  /// - logicalSize: The logical size of the widget. If provided, the widget will be laid out
  ///   according to this size. Defaults to null.
  /// - imageSize: The size of the final image. Defaults to null, which calculates the size
  ///   from the application's main window.
  /// - waitToRender: Duration to wait before rendering the widget. Useful for widgets
  ///   that require time to load resources like network or asset images. Defaults to 300 milliseconds.
  /// - textDirection: The text direction to use when rendering the widget. Defaults to left-to-right.
  ///
  /// Returns:
  /// A Future that resolves to a BitmapDescriptor representing the rendered widget.
  Future<BitmapDescriptor> toBitmapDescriptor(
      {Size? logicalSize,
      Size? imageSize,
      Duration waitToRender = const Duration(milliseconds: 300),
      TextDirection textDirection = TextDirection.ltr}) async {
    final widget = RepaintBoundary(
      child: MediaQuery(
          data: const MediaQueryData(),
          child: Directionality(textDirection: TextDirection.ltr, child: this)),
    );
    final pngBytes = await createImageFromWidget(widget,
        waitToRender: waitToRender,
        logicalSize: logicalSize,
        imageSize: imageSize);
    return BitmapDescriptor.fromBytes(pngBytes);
  }
}

/// Creates an image from the given widget.
/// This function sets up a render tree and waits for rendering, especially useful for widgets
/// with asynchronous loading like network or asset images.
///
/// Parameters:
/// - widget: The widget to be rendered into an image.
/// - logicalSize: The logical size of the widget.
/// - waitToRender: Duration to wait before rendering the widget.
/// - imageSize: The size of the final image.
///
/// Returns:
/// A Future that resolves to a Uint8List representing the image bytes.

Future<Uint8List> createImageFromWidget(Widget widget,
    {Size? logicalSize,
    required Duration waitToRender,
    Size? imageSize}) async {
  final RenderRepaintBoundary repaintBoundary = RenderRepaintBoundary();
  final view = ui.PlatformDispatcher.instance.views.first;
  logicalSize ??= view.physicalSize / view.devicePixelRatio;
  imageSize ??= view.physicalSize;

  // assert(logicalSize.aspectRatio == imageSize.aspectRatio);

  final RenderView renderView = RenderView(
    view: view,
    child: RenderPositionedBox(
        alignment: Alignment.center, child: repaintBoundary),
    configuration: ViewConfiguration(
      size: logicalSize,
      devicePixelRatio: 1.0,
    ),
  );

  final PipelineOwner pipelineOwner = PipelineOwner();
  final BuildOwner buildOwner = BuildOwner(focusManager: FocusManager());

  pipelineOwner.rootNode = renderView;
  renderView.prepareInitialFrame();

  final RenderObjectToWidgetElement<RenderBox> rootElement =
      RenderObjectToWidgetAdapter<RenderBox>(
    container: repaintBoundary,
    child: widget,
  ).attachToRenderTree(buildOwner);

  buildOwner.buildScope(rootElement);

  await Future.delayed(waitToRender);

  buildOwner.buildScope(rootElement);
  buildOwner.finalizeTree();

  pipelineOwner.flushLayout();
  pipelineOwner.flushCompositingBits();
  pipelineOwner.flushPaint();

  final ui.Image image = await repaintBoundary.toImage(
      pixelRatio: imageSize.width / logicalSize.width);
  final ByteData? byteData =
      await image.toByteData(format: ui.ImageByteFormat.png);

  return byteData!.buffer.asUint8List();
}

/// this marker widget as shown in design in test
Widget getCustomMarkerIcon() {
  return Column(children: [
    Container(
      height: 100,
      width: 200,
      decoration: BoxDecoration(
          color: Colors.black, borderRadius: BorderRadius.circular(50)),
      child: Center(
        child: Text(
          'AED 450K',
          style: TextStyle(
              color: Colors.white, fontWeight: FontWeight.bold, fontSize: 30),
        ),
      ),
    ),
    Container(
      height: 20,
      width: 5,
      color: Colors.black,
    ),
    Container(
      height: 20,
      width: 20,
      decoration: BoxDecoration(color: Colors.black, shape: BoxShape.circle),
    ),
  ]);
}

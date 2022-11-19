import 'package:camera/camera.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:label_food/screens/display_picture/display_picture_screen.dart';

class CameraScreen extends StatefulWidget {
  static const String id = "camera_screen";
  final List<CameraDescription>? cameras;

  const CameraScreen({super.key, required this.cameras});

  @override
  State<CameraScreen> createState() => _CameraScreenState();
}

class _CameraScreenState extends State<CameraScreen> {
  late CameraController _cameraController;
  late Future<void> _initializeControllerFuture;
  bool _isRearCameraSelected = true;

  Future initCamera(CameraDescription cameraDescription) async {
    // create a cameraController
    _cameraController =
        CameraController(cameraDescription, ResolutionPreset.medium);

    // Next initialize the controller, this returns a Future.
    try {
      _initializeControllerFuture = _cameraController.initialize();
    } on CameraException catch (e) {
      debugPrint("camera error $e");
    }
  }

  Future takePicture() async {
    if (!_cameraController.value.isInitialized) {
      return null;
    }
    if (_cameraController.value.isTakingPicture) {
      return null;
    }
    try {
      // Ensure that the camera is initialized
      await _initializeControllerFuture;

      if (!mounted) return;

      await _cameraController.setFlashMode(FlashMode.off);
      // Attempt to take a picture and then get the location
      // where the image file is saved.
      XFile image = await _cameraController.takePicture();
      // If the picture was taken, display it on a new screen.
      // ignore: use_build_context_synchronously
      Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => DisplayPictureScreen(
            // Pass automatically generated path to
            // the DisplayPictureScreen widget.
            imagePath: image.path,
          ),
        ),
      );
    } on CameraException catch (e) {
      // If an error occurs, log the error to the console
      debugPrint('Error occured while taking picture: $e');
      return null;
    }
  }

  @override
  void initState() {
    super.initState();
    // initialize the rear camera
    initCamera(widget.cameras![0]);
  }

  @override
  void dispose() {
    // Disposed the controller when the widget is disposed.
    _cameraController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Stack(
          children: [
            FutureBuilder<void>(
              future: _initializeControllerFuture,
              builder: (context, snapshot) {
                if (snapshot.connectionState == ConnectionState.done) {
                  // If the Future is complete, display the preview.
                  return CameraPreview(_cameraController);
                } else {
                  // Otherwise display a loading indicator.
                  return const Center(
                    child: CircularProgressIndicator(),
                  );
                }
              },
            ),
            Align(
              alignment: Alignment.bottomCenter,
              child: Container(
                height: MediaQuery.of(context).size.height * 0.20,
                decoration: const BoxDecoration(
                    borderRadius:
                        BorderRadius.vertical(top: Radius.circular(24)),
                    color: Colors.black),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Expanded(
                      child: IconButton(
                        padding: EdgeInsets.zero,
                        iconSize: 30,
                        icon: Icon(
                            _isRearCameraSelected
                                ? CupertinoIcons.switch_camera
                                : CupertinoIcons.switch_camera_solid,
                            color: Colors.white),
                        onPressed: () {
                          setState(() =>
                              _isRearCameraSelected = !_isRearCameraSelected);
                          initCamera(
                            widget.cameras![_isRearCameraSelected ? 0 : 1],
                          );
                        },
                      ),
                    ),
                    Expanded(
                        child: IconButton(
                      onPressed: takePicture,
                      iconSize: 50,
                      padding: EdgeInsets.zero,
                      constraints: const BoxConstraints(),
                      icon: const Icon(Icons.circle, color: Colors.white),
                    )),
                    const Spacer(),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

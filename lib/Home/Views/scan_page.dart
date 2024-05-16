import 'dart:io';
import 'dart:math';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:tflite_flutter/tflite_flutter.dart';
import 'package:tflite_flutter_helper/tflite_flutter_helper.dart';
import 'package:image/image.dart' as img;

class ScanView extends StatefulWidget {
  ScanView({super.key});

  @override
  State<ScanView> createState() => _ScanViewState();
}

class _ScanViewState extends State<ScanView> {
  bool _isBusy = false;
  bool isLoaded = false;
  final record = [];
  File? image;

  Future<void> runMovenet() async {
    final interpreter = await Interpreter.fromAsset(
      'images/model.tflite',
      options: InterpreterOptions()..threads = 4,
    );

    final picker = ImagePicker();
    final pickedImage = await picker.pickImage(source: ImageSource.gallery);
    if (pickedImage == null) {
      return;
    }

    var inputImage = TensorImage(TfLiteType.float32);
    inputImage.loadImage(await convertPickedImage(File(pickedImage.path)));
    inputImage = getProcessedImage(inputImage);

    image = File(pickedImage.path);

    setState(() {
      _isBusy = true;
    });

    try {
      final outputBuffer = TensorBufferFloat([1, 1, 17, 3]);

      final inputArray = [inputImage.buffer];
      final outputArray = {
        0: outputBuffer.buffer,
      };
      interpreter.runForMultipleInputs(inputArray, outputArray);

      setState(() {
        final a = outputArray.values.first.asFloat32List();
        record.add(a);
        _isBusy = false;
      });
    } catch (e) {
      print('Error running model: $e');
    }
  }

  TensorImage getProcessedImage(TensorImage inputImage) {
    int padSize = max(inputImage.height, inputImage.width);
    final imageProcessor = ImageProcessorBuilder()
        .add(ResizeWithCropOrPadOp(padSize, padSize))
        .add(ResizeOp(192, 192, ResizeMethod.BILINEAR))
        .build();

    inputImage = imageProcessor.process(inputImage);
    return inputImage;
  }

  Future<img.Image> convertPickedImage(File pickedImage) async {
    // Leer la imagen desde el archivo seleccionado
    final bytes = await pickedImage.readAsBytes();
    final img.Image image = img.decodeImage(bytes)!;

    // Devolver la imagen decodificada
    return image;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Movenet Body Measurement'),
      ),
      body: image == null
          ? const Center(
              child: Text('Seleccione una imagen para analizar'),
            )
          : _isBusy
              ? const Center(
                  child: CircularProgressIndicator(),
                )
              : Column(
                  children: [
                    Image.file(
                      image!,
                      height: 300,
                    ),
                    Expanded(
                      child: ListView.builder(
                        itemCount: record.length,
                        itemBuilder: (context, index) {
                          final recognition = record[index];
                          return ListTile(
                            title: Text('$recognition'),
                          );
                        },
                      ),
                    ),
                  ],
                ),
      floatingActionButton: FloatingActionButton(
        onPressed: runMovenet,
        tooltip: 'Seleccionar imagen',
        child: Icon(Icons.image),
      ),
    );
  }
}

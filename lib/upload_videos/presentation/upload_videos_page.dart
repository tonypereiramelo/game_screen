import 'dart:developer';
import 'dart:io';

import 'package:file_picker/file_picker.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:game_screen/game_screen/domain/team_model.dart';
// ignore: depend_on_referenced_packages
import 'package:path/path.dart';

import '../../global/widgets/box_spacer.dart';
import '../infrastructure/upload_videos_repository.dart';

class UploadPage extends StatefulWidget {
  const UploadPage({super.key, required this.theme});
  final ThemeData theme;

  @override
  State<UploadPage> createState() => _UploadPageState();
}

class _UploadPageState extends State<UploadPage> {
  final bool isVideo = true;
  File? file;
  UploadTask? task;
  bool uploadIsCompleted = false;
  bool taskIsNull = true;

  @override
  Widget build(BuildContext context) {
    final fileName = file != null ? basename(file!.path) : 'No File Selected';
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(),
        body: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          mainAxisSize: MainAxisSize.max,
          children: [
            Text(
              fileName,
              style: widget.theme.textTheme.headline6,
            ),
            const DSBoxSpacer.large(),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 120),
              child: ElevatedButton(
                onPressed: selectFile,
                style: widget.theme.elevatedButtonTheme.style,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: const [
                    Icon(Icons.attach_file),
                    DSBoxSpacer.small(),
                    Text('Select a video'),
                  ],
                ),
              ),
            ),
            const DSBoxSpacer.large(),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 120),
              child: ElevatedButton(
                onPressed: () {
                  uploadFile().whenComplete(() => ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(
                      backgroundColor: Colors.green,
                      content: Text('Sucesso!'),
                    ),
                  ),);
                  ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(
                      backgroundColor: taskIsNull ? Colors.red : Colors.green,
                      content: taskIsNull
                          ? const Text('Selecione um arquivo!')
                          : const Text('Enviando arquivo'),
                    ),
                  );
                },
                style: widget.theme.elevatedButtonTheme.style,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: const [
                    Icon(Icons.upload),
                    DSBoxSpacer.small(),
                    Text('Upload video'),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Future selectFile() async {
    final result = await FilePicker.platform.pickFiles(allowMultiple: false);

    if (result == null) return;
    final path = result.files.single.path!;

    setState(() => file = File(path));
  }

  Future uploadFile() async {
    if (file == null) return;

    final fileName = basename(file!.path);
    final destination = 'games/game1/$fileName';

    task = UploadRepository.uploadFile(destination, file!);

    if (task != null) {
      setState(() {
        taskIsNull = false;
      });
      task!.whenComplete(
        () async {
          final taskUrl = await task!.snapshot.ref.getDownloadURL();
          UploadRepository.createDocument(
            TeamModel(
              teamName: 'Palmeiras',
              score: 2,
              shotType: 'Gol',
              shotLink: taskUrl,
              shotDate: task!.snapshot.metadata!.timeCreated,
              isLeftTeam: false,
            ),
          );
          setState(() {
            uploadIsCompleted = true;
          });
          log(uploadIsCompleted.toString());
        },
      );
    } else {
      setState(() {
        taskIsNull = true;
      });
    }

    if (task == null) return;
  }
}

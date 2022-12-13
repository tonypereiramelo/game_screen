import 'dart:developer';
import 'dart:io';

import 'package:file_picker/file_picker.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:game_screen/global/domain/team_model.dart';
// ignore: depend_on_referenced_packages
import 'package:path/path.dart';
import 'package:uuid/uuid.dart';

import '../../global/presentation/widgets/box_spacer.dart';
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
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                ElevatedButton(
                  onPressed: () {
                    uploadFile(
                      isLeftTeam: true,
                      score: 1,
                      shotType: 'Falta',
                      teamName: 'Corinthians',
                      shotDate: DateTime.now(),
                    ).whenComplete(
                      () => ScaffoldMessenger.of(context).showSnackBar(
                        const SnackBar(
                          backgroundColor: Colors.green,
                          content: Text('Sucesso!'),
                        ),
                      ),
                    );
                    ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(
                        backgroundColor: taskIsNull ? Colors.red : Colors.green,
                        content: taskIsNull
                            ? const Text('Selecione um arquivo!')
                            : const Text('Enviando arquivo'),
                      ),
                    );
                  },
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: const [
                      Icon(Icons.upload),
                      DSBoxSpacer.small(),
                      SizedBox(
                        width: 95,
                        child: Padding(
                          padding: EdgeInsets.symmetric(vertical: 4),
                          child: Text(
                            'Upload video to Left Team',
                            style: TextStyle(
                                color: Colors.white,
                                height: 1.5,
                                wordSpacing: 2),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                const DSBoxSpacer(),
                ElevatedButton(
                  onPressed: () {
                    uploadFile(
                      isLeftTeam: false,
                      score: 10,
                      shotType: 'Gol',
                      teamName: 'Palmeiras',
                      shotDate: DateTime.now(),
                    ).whenComplete(
                      () => ScaffoldMessenger.of(context).showSnackBar(
                        const SnackBar(
                          backgroundColor: Colors.green,
                          content: Text('Sucesso!'),
                        ),
                      ),
                    );
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
                      SizedBox(
                        width: 95,
                        child: Padding(
                          padding: EdgeInsets.symmetric(vertical: 4),
                          child: Text(
                            'Upload video to Right Team',
                            style: TextStyle(
                                color: Colors.white,
                                height: 1.5,
                                wordSpacing: 2),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
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

  Future uploadFile({
    required String teamName,
    required int score,
    required String shotType,
    required bool isLeftTeam,
    required DateTime shotDate,
  }) async {
    if (file == null) return;

    final fileName = basename(file!.path);
    final destination = 'shots/$fileName';

    task = UploadRepository.uploadFile(destination, file!);

    if (task != null) {
      setState(() {
        taskIsNull = false;
      });
      task!.whenComplete(
        () async {
          final taskUrl = await task!.snapshot.ref.getDownloadURL();
          final uid = const Uuid().v1();
          UploadRepository.createDocument(
            TeamModel(
              teamName: teamName,
              score: score,
              shotType: shotType,
              shotLink: taskUrl,
              isLeftTeam: isLeftTeam,
              shotDate: shotDate,
            ),
            uid,
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

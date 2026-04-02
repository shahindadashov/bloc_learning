import 'dart:io';

import 'package:bloc_learning/features/profile/presentation/cubit/profile_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:image_picker/image_picker.dart';
import 'package:syncfusion_flutter_pdfviewer/pdfviewer.dart';

class ProfilePage extends StatelessWidget {
  const ProfilePage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => ProfileCubit(),
      child: Builder(
        builder: (context) {
          return Scaffold(
            appBar: AppBar(title: Text("Profile"), centerTitle: true),
            body: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Center(
                  child: ElevatedButton(
                    onPressed: () {
                      context.read<ProfileCubit>().pickImage(ImageSource.gallery);
                    },
                    child: Text("Pick Image"),
                  ),
                ),
                Center(
                  child: ElevatedButton(
                    onPressed: () {
                      context.read<ProfileCubit>().pickImage(ImageSource.camera);
                    },
                    child: Text("Capture Image"),
                  ),
                ),
                Center(
                  child: ElevatedButton(
                    onPressed: () {
                      context.read<ProfileCubit>().pickFile();
                    },
                    child: Text("Pick File"),
                  ),
                ),
                SizedBox(height: 20),
                BlocBuilder<ProfileCubit, ProfileState>(
                  builder: (context, state) {
                    if (state is ProfileImagePicked) {
                      final selectedImages = state.selectedImages;
                      if (selectedImages.isEmpty && state.selectedFile == null) {
                        return Text("No images selected yet");
                      }

                      return Column(
                        children: [
                          if (state.selectedFile != null)
                            SizedBox(height: 300, child: SfPdfViewer.file(File(state.selectedFile!.path!))),
                          SizedBox(
                            height: 100,
                            child: ListView.separated(
                              padding: EdgeInsets.symmetric(horizontal: 10),
                              scrollDirection: Axis.horizontal,
                              itemBuilder: (_, index) {
                                return Stack(
                                  children: [
                                    ClipRRect(
                                      borderRadius: BorderRadius.circular(10),
                                      child: Image.file(File(selectedImages[index].path)),
                                    ),
                                    Positioned(
                                      right: 2,
                                      top: 2,
                                      child: Container(
                                        decoration: BoxDecoration(
                                          color: Colors.white,
                                          borderRadius: BorderRadius.circular(12),
                                        ),
                                        height: 18,
                                        width: 18,
                                        child: IconButton(
                                          padding: EdgeInsets.zero,
                                          onPressed: () {
                                            context.read<ProfileCubit>().removeImage(index);
                                          },
                                          icon: Icon(Icons.close, size: 12),
                                        ),
                                      ),
                                    ),
                                  ],
                                );
                              },
                              separatorBuilder: (BuildContext context, int index) {
                                return SizedBox(width: 10);
                              },
                              itemCount: selectedImages.length,
                            ),
                          ),
                        ],
                      );
                    }
                    return Text("No images selected yet");
                  },
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}

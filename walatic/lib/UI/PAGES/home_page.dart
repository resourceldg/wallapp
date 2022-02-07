

import 'dart:io';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:image_picker/image_picker.dart';
import 'package:walatic/bloc/auth_cubit.dart';
import 'package:walatic/bloc/my_user_cubit.dart';
import 'package:walatic/MODELS/user.dart';


import 'package:walatic/theme.dart';

class HomePage extends StatelessWidget {
 

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: CustomTheme.darkOff,
        appBar: AppBar(
          
          title:
            Center(
              child: 
                Text('WallaUser',
                  style: TextStyle(
                        color: CustomTheme.secundary),
                ),
            ),
            
            
          toolbarHeight: 100,
          elevation : 15 ,
          backgroundColor: CustomTheme.darkOn,
          actions: [
            IconButton(
              icon: const Icon(Icons.logout),
              tooltip: 'Logout',
              onPressed: () => context.read<AuthCubit>().signOut(),
            ),
            
             /*  width: 50,
              child: CircleAvatar(
                radius: 30,
                backgroundImage: AssetImage('assets/img/wabit_.jpg'),
                
                
              ), */
            
            SizedBox(
                  width: 20,
                ),
            Icon(Icons.more_vert),
          ],//actions
        ),
        body: BlocBuilder<MyUserCubit, MyUserState>(
        builder: (_, state) {
          if (state is MyUserReadyState) {
            return _MyUserSection(
              
              isSaving: state.isSaving,
            );
          }
          return Center(child: CircularProgressIndicator());
        },
      ),
      ),
    );
  }
}


class _MyUserSection extends StatefulWidget {
  final MyUser? user;
  final File? pickedImage;
  final bool isSaving;

  const _MyUserSection({this.user, this.pickedImage, this.isSaving = false});

  @override
  _MyUserSectionState createState() => _MyUserSectionState();
}

class _MyUserSectionState extends State<_MyUserSection> {
  final _nameController = TextEditingController();
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();

  final picker = ImagePicker();

  @override
  void initState() {
    _nameController.text = widget.user?.name ?? '';
    _emailController.text = widget.user?.email ?? '';
    _passwordController.text = widget.user?.password ?? '';
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    Widget image = Image.asset(
      'assets/intro_3.png',
      fit: BoxFit.cover,
    );

    if (widget.pickedImage != null) {
      image = Image.file(
        widget.pickedImage!,
        fit: BoxFit.cover,
      );
    } else if (widget.user?.image != null && widget.user!.image!.isNotEmpty) {
      image = CachedNetworkImage(
        imageUrl: widget.user!.image!,
        progressIndicatorBuilder: (_, __, progress) => CircularProgressIndicator(value: progress.progress),
        errorWidget: (_, __, ___) => Icon(Icons.error),
        fit: BoxFit.cover,
      );
    }

    return SingleChildScrollView(
      child: Container(
        padding: EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          
        ),
      ),
    );
  }
}

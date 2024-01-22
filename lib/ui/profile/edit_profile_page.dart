import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:intl/intl.dart';
import 'package:techcart/shared/constants.dart';
import 'package:techcart/shared/gen/assets.gen.dart';
import 'package:techcart/ui/profile/cubit/profile_cubit.dart';
import '../../shared/utils.dart';
import '../../shared/widgets/default_button.dart';
import '../../shared/widgets/text_formfield_label.dart';

// ignore: must_be_immutable
class EditProfilePage extends StatefulWidget {
  const EditProfilePage({super.key});

  @override
  State<EditProfilePage> createState() => _EditProfilePageState();
}

class _EditProfilePageState extends State<EditProfilePage> {
  final _usernameController = TextEditingController();
  final _birthdateController = TextEditingController();
  final bool _isGrey = true;

  @override
  void dispose() {
    super.dispose();
    _usernameController.dispose();
    _birthdateController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final profileCubit = context.read<ProfileCubit>();
    return Scaffold(
      appBar: AppBar(
        systemOverlayStyle: SystemUiOverlayStyle(
          statusBarColor: context.watch<ProfileCubit>().color,
        ),
        leading: MaterialButton(
          onPressed: () {
            context.pop();
          },
          child: const Icon(
            Icons.arrow_back_ios,
            color: Colors.blue,
          ),
        ),
        title: Text(
          "Edit you profile",
          style: TextStyle(
            color: Colors.black,
            fontSize: 35.0.sp,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: SingleChildScrollView(
          child: Column(
            children: [
              Center(
                child: Container(
                  decoration: BoxDecoration(
                      border: Border.all(
                        color: Colors.black,
                        width: 3.0.w,
                      ),
                      borderRadius: BorderRadius.circular(
                        197.0.r,
                      )),
                  child: InkWell(
                    borderRadius: BorderRadius.circular(
                      197.0.r,
                    ),
                    onTap: () {
                      profileCubit.getProfileImage();
                    },
                    child: BlocBuilder<ProfileCubit, ProfileState>(
                      builder: (context, state) {
                        return CircleAvatar(
                            radius: 157.0.r,
                            backgroundImage: AppConstants
                                        .appContants.pickedProfileImage !=
                                    null
                                ? FileImage(AppConstants
                                    .appContants.pickedProfileImage!)
                                : AppConstants.appContants.profilePhoto !=
                                            "null" &&
                                        AppConstants.appContants.profilePhoto !=
                                            null
                                    ? CachedNetworkImageProvider(
                                        AppConstants.appContants.profilePhoto!)
                                    : const $AssetsImagesGen()
                                        .defaultProfileImage
                                        .provider());
                      },
                    ),
                  ),
                ),
              ),
              SizedBox(
                height: 37.0.w,
              ),
              const TextFormFieldLabel(label: "Username"),
              TextFormField(
                controller: _usernameController,
                decoration: InputDecoration(
                  hintText: AppConstants.appContants.profileName,
                  contentPadding: const EdgeInsets.only(left: 13.0),
                ),
              ),
              SizedBox(
                height: 37.0.w,
              ),
              const TextFormFieldLabel(label: "Birthdate"),
              TextFormField(
                controller: _birthdateController,
                decoration: InputDecoration(
                  hintText: AppConstants.appContants.profileBirthdate,
                  contentPadding: const EdgeInsets.only(left: 13.0),
                ),
                onTap: () async {
                  profileCubit
                      .editProfileDatePickerStatusBarSwitchColor(_isGrey);
                  try {
                    profileCubit
                        .editProfileDatePickerStatusBarSwitchColor(_isGrey);
                    greyStatusBarTheme();
                    DateTime? birthDate = await showDatePicker(
                      context: context,
                      initialDate: DateTime.parse("2000-06-05"),
                      firstDate: DateTime(1900),
                      lastDate: DateTime(2100),
                    );

                    String formmatedDate =
                        DateFormat("yyyy-MM-dd").format(birthDate!);
                    _birthdateController.text = formmatedDate;
                  } catch (e) {
                    profileCubit
                        .editProfileDatePickerStatusBarSwitchColor(!_isGrey);
                    whiteStatusBarTheme();
                    return;
                  }
                  // ignore: use_build_context_synchronously
                  profileCubit
                      .editProfileDatePickerStatusBarSwitchColor(!_isGrey);
                  whiteStatusBarTheme();
                },
              ),
              SizedBox(
                height: 57.0.w,
              ),
              BlocBuilder<ProfileCubit, ProfileState>(
                builder: (context, state) {
                  if (state is EditMyProfileLoading) {
                    return const Center(
                      child: CircularProgressIndicator(),
                    );
                  } else {
                    return SizedBox(
                      width: 317.0.w,
                      height: 98.0.w,
                      child: DefaultButton(
                        buttonText: "Modify",
                        onPressed: () async {
                          profileCubit.editMyProfile(
                            photo: AppConstants
                                    .appContants.pickedProfileImage ??
                                (AppConstants.appContants.profilePhoto == "null"
                                    ? null
                                    : AppConstants.appContants.profilePhoto),
                            username: _usernameController.text.isEmpty
                                ? AppConstants.appContants.profileName
                                : _usernameController.text,
                            birthdate: _birthdateController.text.isEmpty
                                ? AppConstants.appContants.profileBirthdate
                                : _birthdateController.text,
                          );
                        },
                      ),
                    );
                  }
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}

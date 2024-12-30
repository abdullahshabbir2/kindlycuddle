import 'package:cuddle_care/Constants/colors_constants.dart';
import 'package:cuddle_care/Domain/Store/user_id_store.dart';
import 'package:cuddle_care/Domain/UseCase/get_profile_data_usecase.dart';
import 'package:cuddle_care/Domain/UseCase/upload_image_usecase.dart';
import 'package:cuddle_care/UI/Profile/profile_navigator.dart';
import 'package:cuddle_care/UI/Profile/profile_state.dart';
import 'package:cuddle_care/UI/ReUseAble/toast_message.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

// import 'package:image_picker/image_picker.dart';

import 'package:image_picker/image_picker.dart';
import 'Profile_initial_params.dart';

class ProfileCubit extends Cubit<ProfileState> {
 final ProfileInitialParams initialParams;
 final ProfileNavigator navigator;
 final UploadImageUseCase useCase;
 final GetProfileDataUseCase profileDataUseCase;
 final UserIdStore store;
 ProfileCubit(
     this.initialParams,
     this.navigator,
     this.useCase,
     this.profileDataUseCase,
     this.store
     ) : super(ProfileState.initial(initialParams: initialParams));


void onInit(ProfileInitialParams initialParams) => emit(state.copyWith());

  void setButtonValue(bool value) {
    emit(state.copyWith(isButtonOn: value));
  }

  void ChangeProfilePic() {

  }
 Future<void> pickImageFromGallery() async {
   final ImagePicker picker = ImagePicker();
   final XFile? image = await picker.pickImage(source: ImageSource.gallery);

   if (image != null) {
     // Use the picked image path (image.path) as needed
     print('Image path: ${image.path}');

     useCase.execute(image.path).then(
             (value) => value.fold(
                     (l) {
                       ToastMessage().showMessage(l.error, ColorsConstants.failureToastColor);
                     },
                     (r) {
                       emit(state.copyWith(image: r));
                     }
             )
     );

   } else {
     print('No image selected.');
   }
 }


 getProfileData(){
    String id = store.state;
    profileDataUseCase.getProfileData(id).then(
            (value) => value.fold(
                    (l) {
                      ToastMessage().showMessage(l.error, ColorsConstants.failureToastColor);
                    },
                    (r) {
                      emit(state.copyWith(image: r.image , profileDomain: r));
                    }
            )
    );
 }

}

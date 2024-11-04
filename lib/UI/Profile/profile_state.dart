import 'package:cuddle_care/Domain/Entity/profile_domain.dart';

import 'Profile_initial_params.dart';

class ProfileState {
  final bool isButtonOn;
  final String image;

  final ProfileDomain profileDomain;

  ProfileState({
    required this.isButtonOn,
    required this.image,
    required this.profileDomain
});

  factory ProfileState.initial({required ProfileInitialParams initialParams}) =>
      ProfileState(
        isButtonOn: true,
        image: '',
        profileDomain: ProfileDomain.empty()
  );

  ProfileState copyWith({
    bool? isButtonOn,
    String? image,
    ProfileDomain? profileDomain
}) =>
      ProfileState(
        isButtonOn: isButtonOn ?? this.isButtonOn,
        image: image ?? this.image,
        profileDomain: profileDomain ?? this.profileDomain
      );
}

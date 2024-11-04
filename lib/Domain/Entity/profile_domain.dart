class ProfileDomain{
  final String? id;
  final String? email;
  final String? name;
  final String? image;
  ProfileDomain({
    this.id,
    this.email,
    this.name,
    this.image
  });

  ProfileDomain copyWith({
    String? id,
    String? email,
    String? name,
    String? image
  }) => ProfileDomain(
    id: id ?? this.id,
    email: email ?? this.email,
    name: name ?? this.name,
    image: image ?? this.image
  );

  const ProfileDomain.empty() :
        id = '',
        name = '',
        email = '',
        image = ''
  ;

}
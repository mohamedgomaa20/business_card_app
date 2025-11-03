class UserModel {
  final String githubUrl;
  final String linkedinUrl;
  final String email;
  final String phone;
  final String name;
  final String jobTitle;
  final String imagePath;

  const UserModel({
    required this.githubUrl,
    required this.linkedinUrl,
    required this.email,
    required this.phone,
    required this.name,
    required this.jobTitle,
    required this.imagePath,
  });
}

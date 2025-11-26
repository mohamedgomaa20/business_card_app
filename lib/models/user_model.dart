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
final UserModel userModel = const UserModel(
  githubUrl: 'https://github.com/mohamedgomaa20',
  linkedinUrl: 'https://www.linkedin.com/in/mohamed-gomaa-874133284',
  email: '20monagy@gmail.com',
  phone: '(+20) 1002418816',
  name: 'Mohamed Gomaa',
  jobTitle: 'Flutter Developer',
  imagePath: "assets/images/free_p.jpg",
);
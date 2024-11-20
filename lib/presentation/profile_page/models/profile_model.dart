class ProfileModel {
  String name;
  String email;
  String studentId;
  bool displayEmail; // New field for email visibility preference

  ProfileModel({
    required this.name,
    required this.email,
    required this.studentId,
    this.displayEmail = true, // Default to true
  });
}

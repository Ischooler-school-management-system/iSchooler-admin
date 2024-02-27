class IschoolerAssets {
  static addImage(String name) => 'assets/images/$name';
  static addIcon(String name) => 'assets/icons/$name';
  // assets\images auth_image.png
  static final String authImage = addImage('auth_image.png');
  // assets\images blank-profile-picture.png
  static final String blankProfileImage = addImage('blank-profile-picture.png');
  // 'assets/icons/student.svg'
  static final String studentIcon = addIcon('student_icon.svg');
  // assets\icons admin_icon.png
  static final String adminIcon = addIcon('admin_icon.svg');
  // assets\icons teacher_icon.png
  static final String teacherIcon = addIcon('teacher_icon.svg');
}

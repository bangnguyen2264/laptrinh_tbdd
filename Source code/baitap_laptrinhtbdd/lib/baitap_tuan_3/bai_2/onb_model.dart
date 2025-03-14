class OnbModel {
  String image;
  String title;
  String description;

  OnbModel({
    required this.image,
    required this.title,
    required this.description,
  });
}

List<OnbModel> onbData = [
  OnbModel(
    image: 'assets/icons/onb.svg',
    title: 'Easy Time Management',
    description: 'With management based on priority and daily tasks, it will give you convenience in managing and determining the tasks that must be done first ',
  ),
  OnbModel(
    image: 'assets/icons/onb1.svg',
    title: 'Increase Work Effectiveness',
    description: 'Time management and the determination of more important tasks will give your job statistics better and always improve',
  ),
  OnbModel(
    image: 'assets/icons/onb2.svg',
    title: 'Reminder Notification',
    description: 'The advantage of this application is that it also provides reminders for you so you don\'t forget to keep doing your assignments well and according to the time you have set',
  ),
];

import 'package:community_hub/app/dashboard/data/models/community_service.dart';
import 'package:community_hub/src/res/assets/assets.dart';

class Worker {
  final int id;
  final String name;
  String? profilePic;
  final int price;
  final double rating;
  final CommunityServiceType? type;

  Worker(
      {required this.id,
      required this.name,
      this.profilePic,
      required this.price,
      required this.rating,
      required this.type}) {
    profilePic ??= AppAssets.getAvatarImg(id);
  }
}

class LocalDatabase {
  static List<Worker> get acRepair => [
        Worker(
            id: 1,
            name: 'Enoch Aik',
            price: 20,
            rating: 3.5,
            type: CommunityServiceType.ac),
        Worker(
            id: 3,
            name: 'Kieth Lee',
            price: 29,
            rating: 4.1,
            type: CommunityServiceType.ac),
        Worker(
            id: 5,
            name: 'James Reece',
            price: 10,
            rating: 4.4,
            type: CommunityServiceType.ac),
        Worker(
            id: 9,
            name: 'John Clark',
            price: 20,
            rating: 3.9,
            type: CommunityServiceType.ac),
        Worker(
            id: 18,
            name: 'Domingo Chavez',
            price: 20,
            rating: 3.5,
            type: CommunityServiceType.ac),
        Worker(
            id: 57,
            name: 'John Kelly',
            price: 29,
            rating: 4.1,
            type: CommunityServiceType.ac),
      ];

  static List<Worker> get beauty => [
        Worker(
            id: 1,
            name: 'Rose Smith',
            price: 70,
            rating: 4.5,
            type: CommunityServiceType.beauty),
        Worker(
            id: 6,
            name: 'Linda Williams',
            price: 50,
            rating: 4.1,
            type: CommunityServiceType.beauty),
        Worker(
            id: 8,
            name: 'Mary Brown',
            price: 60,
            rating: 4.4,
            type: CommunityServiceType.beauty),
        Worker(
            id: 55,
            name: 'Patricia Jones',
            price: 40,
            rating: 3.9,
            type: CommunityServiceType.beauty),
        Worker(
            id: 24,
            name: 'Jennifer Miller',
            price: 70,
            rating: 4.5,
            type: CommunityServiceType.beauty),
        Worker(
            id: 16,
            name: 'Elizabeth Davis',
            price: 50,
            rating: 4.1,
            type: CommunityServiceType.beauty),
        Worker(
            id: 44,
            name: 'Christie Ann',
            price: 90,
            rating: 4.8,
            type: CommunityServiceType.beauty),
      ];

  static List<Worker> get appliance => [
        Worker(
            id: 28,
            name: 'Richard Mac',
            price: 70,
            rating: 4.5,
            type: CommunityServiceType.appliance),
        Worker(
            id: 36,
            name: 'Joseph Jackson',
            price: 50,
            rating: 4.1,
            type: CommunityServiceType.appliance),
        Worker(
            id: 48,
            name: 'Thomas Thomas',
            price: 60,
            rating: 4.4,
            type: CommunityServiceType.appliance),
        Worker(
            id: 59,
            name: 'Charles White',
            price: 40,
            rating: 3.9,
            type: CommunityServiceType.appliance),
        Worker(
            id: 67,
            name: 'Joe Harris',
            price: 70,
            rating: 4.5,
            type: CommunityServiceType.appliance),
        Worker(
            id: 78,
            name: 'Daniel Martin',
            price: 50,
            rating: 4.1,
            type: CommunityServiceType.appliance),
        Worker(
            id: 89,
            name: 'Matthew Thompson',
            price: 90,
            rating: 4.8,
            type: CommunityServiceType.appliance),
      ];

  static List<Worker> get painting => [
        Worker(
            id: 22,
            name: 'Kevin Smith',
            price: 26,
            rating: 3.8,
            type: CommunityServiceType.painting),
        Worker(
            id: 33,
            name: 'Thomas Johnson',
            price: 30,
            rating: 4.1,
            type: CommunityServiceType.painting),
        Worker(
            id: 45,
            name: 'Robert Williams',
            price: 20,
            rating: 4.4,
            type: CommunityServiceType.painting),
        Worker(
            id: 56,
            name: 'Michael Brown',
            price: 25,
            rating: 3.9,
            type: CommunityServiceType.painting),
        Worker(
            id: 68,
            name: 'William Jones',
            price: 26,
            rating: 3.8,
            type: CommunityServiceType.painting),
        Worker(
            id: 79,
            name: 'David Miller',
            price: 30,
            rating: 4.1,
            type: CommunityServiceType.painting),
        Worker(
            id: 90,
            name: 'Richard Davis',
            price: 20,
            rating: 4.4,
            type: CommunityServiceType.painting),
      ];

  static List<Worker> get cleaning => [
        Worker(
            id: 32,
            name: 'Hart Jack',
            price: 23,
            rating: 3.2,
            type: CommunityServiceType.cleaning),
        Worker(
            id: 43,
            name: 'John Bod',
            price: 30,
            rating: 4.1,
            type: CommunityServiceType.cleaning),
        Worker(
            id: 54,
            name: 'Robert Bush',
            price: 20,
            rating: 4.4,
            type: CommunityServiceType.cleaning),
        Worker(
            id: 65,
            name: 'Michael Scott',
            price: 27,
            rating: 3.9,
            type: CommunityServiceType.cleaning),
        Worker(
            id: 76,
            name: 'William Jake',
            price: 21,
            rating: 3.8,
            type: CommunityServiceType.cleaning),
        Worker(
            id: 87,
            name: 'Chris Miller',
            price: 35,
            rating: 4.1,
            type: CommunityServiceType.cleaning),
        Worker(
            id: 98,
            name: 'Richard Dan',
            price: 23,
            rating: 4.4,
            type: CommunityServiceType.cleaning),
      ];

  static List<Worker> get plumbing => [
        Worker(
            id: 101,
            name: 'Eva Smith',
            price: 28,
            rating: 3.5,
            type: CommunityServiceType.plumbing),
        Worker(
            id: 102,
            name: 'Daniel White',
            price: 25,
            rating: 4.2,
            type: CommunityServiceType.plumbing),
        Worker(
            id: 103,
            name: 'Sophia Davis',
            price: 22,
            rating: 4.8,
            type: CommunityServiceType.plumbing),
        Worker(
            id: 104,
            name: 'Oliver Johnson',
            price: 30,
            rating: 4.0,
            type: CommunityServiceType.plumbing),
        Worker(
            id: 105,
            name: 'Ava Brown',
            price: 23,
            rating: 3.7,
            type: CommunityServiceType.plumbing),
        Worker(
            id: 106,
            name: 'Lucas Harris',
            price: 26,
            rating: 4.1,
            type: CommunityServiceType.plumbing),
        Worker(
            id: 107,
            name: 'Isabella Taylor',
            price: 32,
            rating: 4.5,
            type: CommunityServiceType.plumbing),
      ];

  static List<Worker> get electronics => [
        Worker(
            id: 91,
            name: 'Sophie Mitchell',
            price: 24,
            rating: 3.4,
            type: CommunityServiceType.electronics),
        Worker(
            id: 92,
            name: 'James Turner',
            price: 27,
            rating: 4.1,
            type: CommunityServiceType.electronics),
        Worker(
            id: 93,
            name: 'Ella Cooper',
            price: 23,
            rating: 4.3,
            type: CommunityServiceType.electronics),
        Worker(
            id: 94,
            name: 'Mason Reed',
            price: 25,
            rating: 3.8,
            type: CommunityServiceType.electronics),
        Worker(
            id: 95,
            name: 'Aria Bennett',
            price: 26,
            rating: 4.2,
            type: CommunityServiceType.electronics),
        Worker(
            id: 96,
            name: 'Jackson Murphy',
            price: 22,
            rating: 3.9,
            type: CommunityServiceType.electronics),
        Worker(
            id: 97,
            name: 'Amelia Evans',
            price: 28,
            rating: 4.0,
            type: CommunityServiceType.electronics),
      ];

  static List<Worker> get logistics => [
        Worker(
            id: 91,
            name: 'Olivia Foster',
            price: 25,
            rating: 4.0,
            type: CommunityServiceType.logistics),
        Worker(
            id: 94,
            name: 'Ethan Phillips',
            price: 23,
            rating: 3.8,
            type: CommunityServiceType.logistics),
        Worker(
            id: 97,
            name: 'Zoe Clark',
            price: 26,
            rating: 4.2,
            type: CommunityServiceType.logistics),
        Worker(
            id: 99,
            name: 'Liam Ward',
            price: 24,
            rating: 3.9,
            type: CommunityServiceType.logistics),
        Worker(
            id: 93,
            name: 'Ava Richardson',
            price: 22,
            rating: 4.1,
            type: CommunityServiceType.logistics),
        Worker(
            id: 95,
            name: 'Logan Bailey',
            price: 27,
            rating: 4.3,
            type: CommunityServiceType.logistics),
        Worker(
            id: 96,
            name: 'Mia Holmes',
            price: 28,
            rating: 3.7,
            type: CommunityServiceType.logistics),
      ];

  static List<Worker> get salon => [
        Worker(
            id: 92,
            name: 'Elijah Turner',
            price: 26,
            rating: 4.1,
            type: CommunityServiceType.salon),
        Worker(
            id: 95,
            name: 'Aria Jenkins',
            price: 24,
            rating: 3.8,
            type: CommunityServiceType.salon),
        Worker(
            id: 98,
            name: 'Oliver Bennett',
            price: 23,
            rating: 4.0,
            type: CommunityServiceType.salon),
        Worker(
            id: 94,
            name: 'Zoe Phillips',
            price: 27,
            rating: 4.2,
            type: CommunityServiceType.salon),
        Worker(
            id: 96,
            name: 'Mila Morgan',
            price: 22,
            rating: 3.9,
            type: CommunityServiceType.salon),
        Worker(
            id: 93,
            name: 'Lucas Adams',
            price: 25,
            rating: 4.3,
            type: CommunityServiceType.salon),
        Worker(
            id: 99,
            name: 'Ava Richardson',
            price: 28,
            rating: 3.7,
            type: CommunityServiceType.salon),
      ];
}

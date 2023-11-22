import 'package:community_hub/app/dashboard/data/models/community_service.dart';
import 'package:community_hub/src/res/assets/assets.dart';
import 'package:community_hub/app/dashboard/data/models/booking.dart';

class LocalDbWorker {
  final int id;
  final String name;
  String? profilePic;
  final int price;
  final double rating;
  final CommunityServiceType? type;
  List<Booking>? bookings;
  bool? fromLocalDb;
  String? email;
  String? service;
  String? fcmToken;

  LocalDbWorker({
    required this.id,
    required this.name,
    this.profilePic,
    required this.price,
    required this.rating,
    required this.type,
    this.bookings,
    this.fromLocalDb,
    this.email,
    this.service,
    this.fcmToken,
  }) {
    bookings ??= [];
    email ??= '';
    fcmToken ??= '';
    service ??= '';
    fromLocalDb ??= true;
    profilePic ??= AppAssets.getAvatarImg(id);
  }
}

class LocalDatabase {
  static List<LocalDbWorker> get acRepair => [
        LocalDbWorker(
            id: 1,
            name: 'Enoch Aik',
            price: 20,
            rating: 3.5,
            type: CommunityServiceType.ac),
        LocalDbWorker(
            id: 3,
            name: 'Kieth Lee',
            price: 29,
            rating: 4.1,
            type: CommunityServiceType.ac),
        LocalDbWorker(
            id: 5,
            name: 'James Reece',
            price: 10,
            rating: 4.4,
            type: CommunityServiceType.ac),
        LocalDbWorker(
            id: 9,
            name: 'John Clark',
            price: 20,
            rating: 3.9,
            type: CommunityServiceType.ac),
        LocalDbWorker(
            id: 18,
            name: 'Domingo Chavez',
            price: 20,
            rating: 3.5,
            type: CommunityServiceType.ac),
        LocalDbWorker(
            id: 57,
            name: 'John Kelly',
            price: 29,
            rating: 4.1,
            type: CommunityServiceType.ac),
      ];

  static List<LocalDbWorker> get beauty => [
        LocalDbWorker(
            id: 1,
            name: 'Rose Smith',
            price: 70,
            rating: 4.5,
            type: CommunityServiceType.beauty),
        LocalDbWorker(
            id: 6,
            name: 'Linda Williams',
            price: 50,
            rating: 4.1,
            type: CommunityServiceType.beauty),
        LocalDbWorker(
            id: 8,
            name: 'Mary Brown',
            price: 60,
            rating: 4.4,
            type: CommunityServiceType.beauty),
        LocalDbWorker(
            id: 55,
            name: 'Patricia Jones',
            price: 40,
            rating: 3.9,
            type: CommunityServiceType.beauty),
        LocalDbWorker(
            id: 24,
            name: 'Jennifer Miller',
            price: 70,
            rating: 4.5,
            type: CommunityServiceType.beauty),
        LocalDbWorker(
            id: 16,
            name: 'Elizabeth Davis',
            price: 50,
            rating: 4.1,
            type: CommunityServiceType.beauty),
        LocalDbWorker(
            id: 44,
            name: 'Christie Ann',
            price: 90,
            rating: 4.8,
            type: CommunityServiceType.beauty),
      ];

  static List<LocalDbWorker> get appliance => [
        LocalDbWorker(
            id: 28,
            name: 'Richard Mac',
            price: 70,
            rating: 4.5,
            type: CommunityServiceType.appliance),
        LocalDbWorker(
            id: 36,
            name: 'Joseph Jackson',
            price: 50,
            rating: 4.1,
            type: CommunityServiceType.appliance),
        LocalDbWorker(
            id: 48,
            name: 'Thomas Thomas',
            price: 60,
            rating: 4.4,
            type: CommunityServiceType.appliance),
        LocalDbWorker(
            id: 59,
            name: 'Charles White',
            price: 40,
            rating: 3.9,
            type: CommunityServiceType.appliance),
        LocalDbWorker(
            id: 67,
            name: 'Joe Harris',
            price: 70,
            rating: 4.5,
            type: CommunityServiceType.appliance),
        LocalDbWorker(
            id: 78,
            name: 'Daniel Martin',
            price: 50,
            rating: 4.1,
            type: CommunityServiceType.appliance),
        LocalDbWorker(
            id: 89,
            name: 'Matthew Thompson',
            price: 90,
            rating: 4.8,
            type: CommunityServiceType.appliance),
      ];

  static List<LocalDbWorker> get painting => [
        LocalDbWorker(
            id: 22,
            name: 'Kevin Smith',
            price: 26,
            rating: 3.8,
            type: CommunityServiceType.painting),
        LocalDbWorker(
            id: 33,
            name: 'Thomas Johnson',
            price: 30,
            rating: 4.1,
            type: CommunityServiceType.painting),
        LocalDbWorker(
            id: 45,
            name: 'Robert Williams',
            price: 20,
            rating: 4.4,
            type: CommunityServiceType.painting),
        LocalDbWorker(
            id: 56,
            name: 'Michael Brown',
            price: 25,
            rating: 3.9,
            type: CommunityServiceType.painting),
        LocalDbWorker(
            id: 68,
            name: 'William Jones',
            price: 26,
            rating: 3.8,
            type: CommunityServiceType.painting),
        LocalDbWorker(
            id: 79,
            name: 'David Miller',
            price: 30,
            rating: 4.1,
            type: CommunityServiceType.painting),
        LocalDbWorker(
            id: 90,
            name: 'Richard Davis',
            price: 20,
            rating: 4.4,
            type: CommunityServiceType.painting),
      ];

  static List<LocalDbWorker> get cleaning => [
        LocalDbWorker(
            id: 32,
            name: 'Hart Jack',
            price: 23,
            rating: 3.2,
            type: CommunityServiceType.cleaning),
        LocalDbWorker(
            id: 43,
            name: 'John Bod',
            price: 30,
            rating: 4.1,
            type: CommunityServiceType.cleaning),
        LocalDbWorker(
            id: 54,
            name: 'Robert Bush',
            price: 20,
            rating: 4.4,
            type: CommunityServiceType.cleaning),
        LocalDbWorker(
            id: 65,
            name: 'Michael Scott',
            price: 27,
            rating: 3.9,
            type: CommunityServiceType.cleaning),
        LocalDbWorker(
            id: 76,
            name: 'William Jake',
            price: 21,
            rating: 3.8,
            type: CommunityServiceType.cleaning),
        LocalDbWorker(
            id: 87,
            name: 'Chris Miller',
            price: 35,
            rating: 4.1,
            type: CommunityServiceType.cleaning),
        LocalDbWorker(
            id: 98,
            name: 'Richard Dan',
            price: 23,
            rating: 4.4,
            type: CommunityServiceType.cleaning),
      ];

  static List<LocalDbWorker> get plumbing => [
        LocalDbWorker(
            id: 101,
            name: 'Eva Smith',
            price: 28,
            rating: 3.5,
            type: CommunityServiceType.plumbing),
        LocalDbWorker(
            id: 102,
            name: 'Daniel White',
            price: 25,
            rating: 4.2,
            type: CommunityServiceType.plumbing),
        LocalDbWorker(
            id: 103,
            name: 'Sophia Davis',
            price: 22,
            rating: 4.8,
            type: CommunityServiceType.plumbing),
        LocalDbWorker(
            id: 104,
            name: 'Oliver Johnson',
            price: 30,
            rating: 4.0,
            type: CommunityServiceType.plumbing),
        LocalDbWorker(
            id: 105,
            name: 'Ava Brown',
            price: 23,
            rating: 3.7,
            type: CommunityServiceType.plumbing),
        LocalDbWorker(
            id: 106,
            name: 'Lucas Harris',
            price: 26,
            rating: 4.1,
            type: CommunityServiceType.plumbing),
        LocalDbWorker(
            id: 107,
            name: 'Isabella Taylor',
            price: 32,
            rating: 4.5,
            type: CommunityServiceType.plumbing),
      ];

  static List<LocalDbWorker> get electronics => [
        LocalDbWorker(
            id: 91,
            name: 'Sophie Mitchell',
            price: 24,
            rating: 3.4,
            type: CommunityServiceType.electronics),
        LocalDbWorker(
            id: 92,
            name: 'James Turner',
            price: 27,
            rating: 4.1,
            type: CommunityServiceType.electronics),
        LocalDbWorker(
            id: 93,
            name: 'Ella Cooper',
            price: 23,
            rating: 4.3,
            type: CommunityServiceType.electronics),
        LocalDbWorker(
            id: 94,
            name: 'Mason Reed',
            price: 25,
            rating: 3.8,
            type: CommunityServiceType.electronics),
        LocalDbWorker(
            id: 95,
            name: 'Aria Bennett',
            price: 26,
            rating: 4.2,
            type: CommunityServiceType.electronics),
        LocalDbWorker(
            id: 96,
            name: 'Jackson Murphy',
            price: 22,
            rating: 3.9,
            type: CommunityServiceType.electronics),
        LocalDbWorker(
            id: 97,
            name: 'Amelia Evans',
            price: 28,
            rating: 4.0,
            type: CommunityServiceType.electronics),
      ];

  static List<LocalDbWorker> get logistics => [
        LocalDbWorker(
            id: 91,
            name: 'Olivia Foster',
            price: 25,
            rating: 4.0,
            type: CommunityServiceType.logistics),
        LocalDbWorker(
            id: 94,
            name: 'Ethan Phillips',
            price: 23,
            rating: 3.8,
            type: CommunityServiceType.logistics),
        LocalDbWorker(
            id: 97,
            name: 'Zoe Clark',
            price: 26,
            rating: 4.2,
            type: CommunityServiceType.logistics),
        LocalDbWorker(
            id: 99,
            name: 'Liam Ward',
            price: 24,
            rating: 3.9,
            type: CommunityServiceType.logistics),
        LocalDbWorker(
            id: 93,
            name: 'Ava Richardson',
            price: 22,
            rating: 4.1,
            type: CommunityServiceType.logistics),
        LocalDbWorker(
            id: 95,
            name: 'Logan Bailey',
            price: 27,
            rating: 4.3,
            type: CommunityServiceType.logistics),
        LocalDbWorker(
            id: 96,
            name: 'Mia Holmes',
            price: 28,
            rating: 3.7,
            type: CommunityServiceType.logistics),
      ];

  static List<LocalDbWorker> get salon => [
        LocalDbWorker(
            id: 92,
            name: 'Elijah Turner',
            price: 26,
            rating: 4.1,
            type: CommunityServiceType.salon),
        LocalDbWorker(
            id: 95,
            name: 'Aria Jenkins',
            price: 24,
            rating: 3.8,
            type: CommunityServiceType.salon),
        LocalDbWorker(
            id: 98,
            name: 'Oliver Bennett',
            price: 23,
            rating: 4.0,
            type: CommunityServiceType.salon),
        LocalDbWorker(
            id: 94,
            name: 'Zoe Phillips',
            price: 27,
            rating: 4.2,
            type: CommunityServiceType.salon),
        LocalDbWorker(
            id: 96,
            name: 'Mila Morgan',
            price: 22,
            rating: 3.9,
            type: CommunityServiceType.salon),
        LocalDbWorker(
            id: 93,
            name: 'Lucas Adams',
            price: 25,
            rating: 4.3,
            type: CommunityServiceType.salon),
        LocalDbWorker(
            id: 99,
            name: 'Ava Richardson',
            price: 28,
            rating: 3.7,
            type: CommunityServiceType.salon),
      ];
}

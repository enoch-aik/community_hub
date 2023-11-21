class AppAssets {
  AppAssets._();

  static const String _svgDir = 'assets/svg';
  static const String _imgDir = 'assets/images';
  static const String _onboardingDir = '$_imgDir/onboarding';
  static const String _servicesDir = '$_imgDir/services_and_offers';
  static const String _avatarDir = '$_imgDir/avatars';

  static const logoSvg = '$_svgDir/logo.svg';

  //onboarding UI
  static const onboarding1 = '$_onboardingDir/onboarding1.png';
  static const onboarding2 = '$_onboardingDir/onboarding2.png';
  static const onboarding3 = '$_onboardingDir/onboarding3.png';

  //svg
  static const googleSvg = '$_svgDir/google.svg';
  static const seeAllSvg = '$_svgDir/see_all.svg';

  //services
  static const acRepair = '$_svgDir/services/ac_repair.svg';
  static const appliance = '$_svgDir/services/appliance.svg';
  static const beauty = '$_svgDir/services/beauty.svg';
  static const cleaning = '$_svgDir/services/cleaning.svg';
  static const electronics = '$_svgDir/services/electronics.svg';
  static const logistics = '$_svgDir/services/logistics.svg';
  static const painting = '$_svgDir/services/painting.svg';
  static const salon = '$_svgDir/services/salon.svg';
  static const plumbing = '$_svgDir/services/plumbing.svg';
  static const repair = '$_svgDir/services/repair.svg';

  //services and offer
  static const acInstallationImg = '$_servicesDir/ac_installation.png';
  static const acRegularServiceImg = '$_servicesDir/ac_regular_service.png';
  static const acUninstallationImg = '$_servicesDir/ac_uninstallation.png';
  static const applianceRepairImg = '$_servicesDir/appliance_repair.png';
  static const applianceRepairOfferImg =
      '$_servicesDir/appliance_repair_offer.png';
  static const carpetCleaningImg = '$_servicesDir/carpet_cleaning.png';
  static const homeCleaningImg = '$_servicesDir/home_cleaning.png';

 static String getAvatarImg(int index) {
    if (index == 0 || index > 116) {
      return '$_avatarDir/Number=1.png';
    }
    return '$_avatarDir/Number=$index.png';
  }

 static  List<String> getAllAvatarImg() {
    List<String> images = [];
    for (int i = 1; i < 117; i++) {
      images.add('$_avatarDir/Number=$i.png');
    }
    return images;
  }
}

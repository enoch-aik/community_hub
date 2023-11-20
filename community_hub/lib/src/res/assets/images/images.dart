String _tokenDir = 'assets/images/tokens';
String _logoDir = 'assets/images/logo';
String _cryptoDir = 'assets/images/cryptos';
String _avatarDir = 'assets/images/avatars';

///[TOKENS]
String espeesTokenImg = '$_tokenDir/espees.png';
String plastokenImg = '$_tokenDir/plastoken.png';
String toroTokenImg = '$_tokenDir/toro.png';
String toroGTokenImg = '$_tokenDir/toroG.png';

///[LOGO]
String appLogoImg = '$_logoDir/app-logo.png';
String toronetLogoImg = '$_logoDir/toronet.png';

///[CRYPTO]
String avaxCryptoImg = '$_cryptoDir/crypto-avax.png';
String bitcoinCryptoImg = '$_cryptoDir/crypto-bitcoin.png';
String bnbCryptoImg = '$_cryptoDir/crypto-bnb.png';
String celoCryptoImg = '$_cryptoDir/crypto-celo.png';
String ethCryptoImg = '$_cryptoDir/crypto-eth.png';
String shibaCryptoImg = '$_cryptoDir/crypto-shiba.png';
String solanaCryptoImg = '$_cryptoDir/crypto-solana.png';
String tetherCryptoImg = '$_cryptoDir/crypto-tether.png';

///TOTAL NUMBER OF AVATARS => 116, from 1-116

String getAvatarImg(int index) {
  if (index == 0 || index > 116) {
    return '$_avatarDir/Number=1.png';
  }
  return '$_avatarDir/Number=$index.png';
}

List<String> getAllAvatarImg() {
  List<String> images = [];
  for (int i = 1; i < 117; i++) {
    images.add('$_avatarDir/Number=$i.png');
  }
  return images;
}

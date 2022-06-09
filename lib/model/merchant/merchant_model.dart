import '../../config/firebase/references.dart';
import '../models.dart';

class Merchant {
  String id;
  String shopName;
  String pickUpPoint;
  User user;
  String userId;
  String phoneNumber;
  String email;
  String instagram;
  String webPage;
  String category1;
  String category2;
  String nit;
  String razonSocial;
  bool colombianProducts;
  bool isOpen;
  Rate rate;

  Address storeLocation;

  String storeAddress;
  String storeLat;
  String storeLng;

  Merchant({
    this.id,
    this.shopName,
    this.pickUpPoint,
    this.user,
    this.userId,
    this.phoneNumber,
    this.email,
    this.instagram,
    this.webPage,
    this.category1,
    this.category2,
    this.nit,
    this.razonSocial,
    this.colombianProducts,
    this.isOpen,
    this.rate,
    this.storeLocation,
  });
}

class Rate {
  int rateA;
  int rateB;
  int rateC;
  int rateD;
  int rateE;
  int rateF;

  Rate({
    this.rateA,
    this.rateB,
    this.rateC,
    this.rateD,
    this.rateE,
    this.rateF,
  });
}

  Future<Merchant> getMerchant(String uid) async {
  Merchant m;
  await References.merchant
      .where('userId', isEqualTo: uid)
      .get()
      .then((merchantStream) {
    m = Merchant(
      id: merchantStream.docs.first.id,
      shopName: merchantStream.docs.first.data()["shopName"],
      category1: merchantStream.docs.first.data()["principalCategory"],
      category2: merchantStream.docs.first.data()["secondaryCategory"],
      storeLocation: Address(
        address: merchantStream.docs.first.data()['storeLocation'] != null
            ? merchantStream.docs.first.data()['storeLocation']['address']
            : "",
        city: merchantStream.docs.first.data()['storeLocation'] != null
            ? merchantStream.docs.first.data()['storeLocation']['city']
            : "",
        country: merchantStream.docs.first.data()['storeLocation'] != null
            ? merchantStream.docs.first.data()['storeLocation']['country']
            : "",
        state: merchantStream.docs.first.data()['storeLocation'] != null
            ? merchantStream.docs.first.data()['storeLocation']['state']
            : "",
        zipCode: merchantStream.docs.first.data()['storeLocation'] != null
            ? merchantStream.docs.first.data()['storeLocation']['zipCode']
            : "",
      ),
    );
  });

  return m;
}

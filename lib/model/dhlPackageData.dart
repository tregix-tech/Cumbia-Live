import 'package:cumbialive/model/product/product.dart';

import '../config/constants/shopping_cart_constants.dart';

class DHLPackageData{

  double height;
  double width;
  double weight;
  double depth;

  String fromCountry;
  String fromPostalCode;

  String toCountry;
  String toPostalCode;

  String date;






  static String createRequest(String countryFrom, String countryCodeFrom, String toCountry, String toCountyCode){


    List<Product> products = shoppingCart.list;

    String productsRequest = "";


    for(Product product in products){

      productsRequest += '''<Piece> <PieceID>1</PieceID> <Height>${product.height}</Height> <Depth>${product.large}</Depth><Width>${product.width}</Width><Weight>${product.weight}</Weight></Piece>''';
    }

    String data =  '''<?xml version="1.0" encoding="utf-8"?> <p:DCTRequest xmlns:p="http://www.dhl.com" xmlns:p1="http://www.dhl.com/datatypes" xmlns:p2="http://www.dhl.com/DCTRequestdatatypes" schemaVersion="2.0" xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance" xsi:schemaLocation="http://www.dhl.com DCT-req.xsd "> <GetQuote> <Request> <ServiceHeader> <MessageTime>2022-08-20T11:28:56.000-08:00</MessageTime> <MessageReference>1234567890123456789012345678901</MessageReference> <SiteID>v62_DD44qtjHu2</SiteID> <Password>9pCDpOCOXv</Password> </ServiceHeader> <MetaData> <SoftwareName>3PV</SoftwareName> <SoftwareVersion>1.0</SoftwareVersion> </MetaData> </Request> <From> <CountryCode>$countryFrom</CountryCode> <Postalcode>$countryCodeFrom</Postalcode> </From> <BkgDetails> <PaymentCountryCode>CO</PaymentCountryCode> <Date>2022-03-10</Date> <ReadyTime>PT10H21M</ReadyTime> <ReadyTimeGMTOffset>+01:00</ReadyTimeGMTOffset> <DimensionUnit>CM</DimensionUnit> <WeightUnit>KG</WeightUnit> <Pieces> $productsRequest </Pieces> <PaymentAccountNumber>683141085</PaymentAccountNumber> <IsDutiable>Y</IsDutiable> <NetworkTypeCode>AL</NetworkTypeCode> <QtdShp> <GlobalProductCode>P</GlobalProductCode> <LocalProductCode>P</LocalProductCode> </QtdShp> </BkgDetails> <To> <CountryCode>GR</CountryCode> <Postalcode>18535</Postalcode> </To> <Dutiable> <DeclaredCurrency>EUR</DeclaredCurrency> <DeclaredValue>1.0</DeclaredValue> </Dutiable> </GetQuote> </p:DCTRequest>''';


    return data;





  }
}
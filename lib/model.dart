import 'dart:convert';
import 'package:intl/intl.dart';

Welcome welcomeFromJson(String str) => Welcome.fromJson(json.decode(str));

String welcomeToJson(Welcome data) => json.encode(data.toJson());

class Welcome {
  Welcome({
    required this.tempOrder,
  });

  TempOrder tempOrder;

  factory Welcome.fromJson(Map<String, dynamic> json) => Welcome(
        tempOrder: TempOrder.fromJson(json["tempOrder"]),
      );

  Map<String, dynamic> toJson() => {
        "tempOrder": tempOrder.toJson(),
      };
}

class TempOrder {
  TempOrder({
    required this.id,
    required this.isTempStore,
    required this.firstCheck,
    required this.doubleCheck,
    required this.loadCheck,
    required this.isVat,
    required this.status,
    required this.tempOrderInvoiceNo,
    required this.invoiceType,
    required this.sales,
    required this.store,
    required this.productDetails,
    required this.categoryList,
    required this.note,
    required this.discount,
    required this.totalQuantity,
    required this.totalCost,
    required this.date,
    required this.createdAt,
    required this.updatedAt,
    required this.v,
  });

  String id;
  bool isTempStore;
  bool firstCheck;
  bool doubleCheck;
  bool loadCheck;
  bool isVat;
  String status;
  String tempOrderInvoiceNo;
  String invoiceType;
  String sales;
  String store;
  List<ProductDetail> productDetails;
  List<CategoryList> categoryList;
  String note;
  int discount;
  int totalQuantity;
  double totalCost;
  String date;
  DateTime createdAt;
  DateTime updatedAt;
  int v;


  factory TempOrder.fromJson(Map<String, dynamic> json) => TempOrder(
        id: json["_id"],
        isTempStore: json["isTempStore"],
        firstCheck: json["firstCheck"],
        doubleCheck: json["doubleCheck"],
        loadCheck: json["loadCheck"],
        isVat: json["isVat"],
        status: json["status"],
        tempOrderInvoiceNo: json["tempOrderInvoiceNo"],
        invoiceType: json["invoiceType"],
        sales: json["sales"],
        store: json["store"]["storeName"],
        productDetails: List<ProductDetail>.from(
            json["productDetails"].map((x) => ProductDetail.fromJson(x))),
        categoryList: List<CategoryList>.from(
            json["categoryList"].map((x) => CategoryList.fromJson(x))),
        note: json["note"],
        discount: json["discount"],
        totalQuantity: json["totalQuantity"],
        totalCost: json["totalCost"].toDouble(),
        date: DateFormat.yMMMEd().format(DateTime.parse(json["date"])),
        createdAt: DateTime.parse(json["createdAt"]),
        updatedAt: DateTime.parse(json["updatedAt"]),
        v: json["__v"],
      );

  Map<String, dynamic> toJson() => {
        "_id": id,
        "isTempStore": isTempStore,
        "firstCheck": firstCheck,
        "doubleCheck": doubleCheck,
        "loadCheck": loadCheck,
        "isVat": isVat,
        "status": status,
        "tempOrderInvoiceNo": tempOrderInvoiceNo,
        "invoiceType": invoiceType,
        "sales": sales,
        "store": store,
        "productDetails":
            List<dynamic>.from(productDetails.map((x) => x.toJson())),
        "categoryList": List<dynamic>.from(categoryList.map((x) => x.toJson())),
        "note": note,
        "discount": discount,
        "totalQuantity": totalQuantity,
        "totalCost": totalCost,
        "date": date,
        "createdAt": createdAt.toIso8601String(),
        "updatedAt": updatedAt.toIso8601String(),
        "__v": v,
      };
}

class CategoryList {
  CategoryList({
    required this.isDone,
    required this.masterCategoryId,
  });

  bool isDone;
  String masterCategoryId;

  factory CategoryList.fromJson(Map<String, dynamic> json) => CategoryList(
        isDone: json["isDone"],
        masterCategoryId: json["masterCategoryId"],
      );

  Map<String, dynamic> toJson() => {
        "isDone": isDone,
        "masterCategoryId": masterCategoryId,
      };
}

class ProductDetail {
  ProductDetail({
    required this.isChecked,
    required this.firstCheck,
    required this.doubleCheck,
    required this.loadCheck,
    required this.quantityAv,
    required this.unitAv,
    required this.cartonId,
    required this.product,
    required this.storeCost,
    required this.aggregateCost,
    required this.quantityReq,
    required this.unitReq,
    required this.categoryId,
  });

  bool isChecked;
  bool firstCheck;
  bool doubleCheck;
  bool loadCheck;
  int quantityAv;
  UnitAvEnum unitAv;
  List<dynamic> cartonId;
  Product product;
  double storeCost;
  double aggregateCost;
  int quantityReq;
  UnitAvEnum unitReq;
  String categoryId;

  factory ProductDetail.fromJson(Map<String, dynamic> json) => ProductDetail(
        isChecked: json["isChecked"],
        firstCheck: json["firstCheck"],
        doubleCheck: json["doubleCheck"],
        loadCheck: json["loadCheck"],
        quantityAv: json["quantityAv"],
        unitAv: unitAvEnumValues.map[json["unitAv"]]!,
        cartonId: List<dynamic>.from(json["cartonId"].map((x) => x)),
        product: Product.fromJson(json["product"]),
        storeCost: json["storeCost"].toDouble(),
        aggregateCost: json["aggregateCost"].toDouble(),
        quantityReq: json["quantityReq"],
        unitReq: unitAvEnumValues.map[json["unitReq"]]!,
        categoryId: json["categoryId"],
      );

  Map<String, dynamic> toJson() => {
        "isChecked": isChecked,
        "firstCheck": firstCheck,
        "doubleCheck": doubleCheck,
        "loadCheck": loadCheck,
        "quantityAv": quantityAv,
        "unitAv": unitAvEnumValues.reverse[unitAv],
        "cartonId": List<dynamic>.from(cartonId.map((x) => x)),
        "product": product.toJson(),
        "storeCost": storeCost,
        "aggregateCost": aggregateCost,
        "quantityReq": quantityReq,
        "unitReq": unitAvEnumValues.reverse[unitReq],
        "categoryId": categoryId,
      };
}

class Product {
  Product({
    required this.id,
    required this.inQty,
    required this.isDisplay,
    required this.itemRef,
    required this.itemName,
    required this.category,
    required this.masterCategoryId,
    required this.sellingPrice,
    required this.unit,
    required this.ratio,
    required this.imagePath,
    required this.storeProfileList,
    required this.salesProfileList,
    required this.createdAt,
    required this.updatedAt,
    required this.v,
    required this.isNewProduct,
    required this.imageCount,
  });

  String id;
  InQty inQty;
  bool isDisplay;
  String itemRef;
  String itemName;
  String category;
  String masterCategoryId;
  double sellingPrice;
  Unit unit;
  int ratio;
  String imagePath;
  List<dynamic> storeProfileList;
  List<dynamic> salesProfileList;
  DateTime createdAt;
  DateTime updatedAt;
  int v;
  bool isNewProduct;
  int imageCount;

  factory Product.fromJson(Map<String, dynamic> json) => Product(
        id: json["_id"],
        inQty: InQty.fromJson(json["inQty"]),
        isDisplay: json["isDisplay"],
        itemRef: json["itemRef"],
        itemName: json["itemName"],
        category: json["category"],
        masterCategoryId: json["masterCategoryId"],
        sellingPrice: json["sellingPrice"].toDouble(),
        unit: unitValues.map[json["unit"]]!,
        ratio: json["ratio"],
        imagePath: json["imagePath"],
        storeProfileList:
            List<dynamic>.from(json["storeProfileList"].map((x) => x)),
        salesProfileList:
            List<dynamic>.from(json["salesProfileList"].map((x) => x)),
        createdAt: DateTime.parse(json["createdAt"]),
        updatedAt: DateTime.parse(json["updatedAt"]),
        v: json["__v"],
        isNewProduct: json["isNewProduct"],
        imageCount: json["imageCount"],
      );

  Map<String, dynamic> toJson() => {
        "_id": id,
        "inQty": inQty.toJson(),
        "isDisplay": isDisplay,
        "itemRef": itemRef,
        "itemName": itemName,
        "category": category,
        "masterCategoryId": masterCategoryId,
        "sellingPrice": sellingPrice,
        "unit": unitValues.reverse[unit],
        "ratio": ratio,
        "imagePath": imagePath,
        "storeProfileList": List<dynamic>.from(storeProfileList.map((x) => x)),
        "salesProfileList": List<dynamic>.from(salesProfileList.map((x) => x)),
        "createdAt": createdAt.toIso8601String(),
        "updatedAt": updatedAt.toIso8601String(),
        "__v": v,
        "isNewProduct": isNewProduct,
        "imageCount": imageCount,
      };
}

class InQty {
  InQty({
    required this.amountInCartons,
    required this.amountInUnits,
  });

  int amountInCartons;
  int amountInUnits;

  factory InQty.fromJson(Map<String, dynamic> json) => InQty(
        amountInCartons: json["amountInCartons"],
        amountInUnits: json["amountInUnits"],
      );

  Map<String, dynamic> toJson() => {
        "amountInCartons": amountInCartons,
        "amountInUnits": amountInUnits,
      };
}

enum Unit { PCS, SETS, BOXES }

final unitValues =
    EnumValues({"BOXES": Unit.BOXES, "PCS": Unit.PCS, "SETS": Unit.SETS});

enum UnitAvEnum { CARTONS, PCS, BOXES }

final unitAvEnumValues = EnumValues({
  "BOXES": UnitAvEnum.BOXES,
  "CARTONS": UnitAvEnum.CARTONS,
  "PCS": UnitAvEnum.PCS
});

class EnumValues<T> {
  Map<String, T> map;
  Map<T, String>? reverseMap;

  EnumValues(this.map);

  Map<T, String> get reverse {
    if (reverseMap == null) {
      reverseMap = map.map((k, v) => new MapEntry(v, k));
    }
    return reverseMap!;
  }
}

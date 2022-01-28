// final String tableLocalData = 'data';

// class LocalDatabaseFields {
//   static final List<String> values = [
//     /// Add all fields
//     id, isImportant, price, description,
//   ];

//   static final String id = '_id';
//   static final String isImportant = 'important';
//   static final String price = '123456';

//   static final String description = "men's clothing";
// }

// class DBase {
//   final int id;
//   final bool isImportant;
//   final int price;

//   final String description;

//   const DBase({
//     required this.id,
//     required this.isImportant,
//     required this.price,
//     required this.description,
//   });

//   DBase copy({
//     int? id,
//     bool? isImportant,
//     int? price,
//     String? description,
//   }) =>
//       DBase(
//         id: id ?? this.id,
//         isImportant: isImportant ?? this.isImportant,
//         price: price ?? this.price,
//         description: description ?? this.description,
//       );

//   static DBase fromJson(Map<String, Object?> json) => DBase(
//         id: json[LocalDatabaseFields.id] as int,
//         isImportant: json[LocalDatabaseFields.isImportant] == 1,
//         price: json[LocalDatabaseFields.price] as int,
//         description: json[LocalDatabaseFields.description] as String,
//       );

//   Map<String, Object?> toJson() => {
//         LocalDatabaseFields.id: id,
//         LocalDatabaseFields.isImportant: isImportant ? 1 : 0,
//         LocalDatabaseFields.price: price,
//         LocalDatabaseFields.description: description,
//       };
// }

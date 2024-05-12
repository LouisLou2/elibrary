// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'book_shelf.dart';

// **************************************************************************
// IsarCollectionGenerator
// **************************************************************************

// coverage:ignore-file
// ignore_for_file: duplicate_ignore, non_constant_identifier_names, constant_identifier_names, invalid_use_of_protected_member, unnecessary_cast, prefer_const_constructors, lines_longer_than_80_chars, require_trailing_commas, inference_failure_on_function_invocation, unnecessary_parenthesis, unnecessary_raw_strings, unnecessary_null_checks, join_return_with_assignment, prefer_final_locals, avoid_js_rounded_ints, avoid_positional_boolean_parameters, always_specify_types

extension GetBookShelfCollection on Isar {
  IsarCollection<BookShelf> get bookShelfs => this.collection();
}

const BookShelfSchema = CollectionSchema(
  name: r'BookShelf',
  id: -8394026179780817189,
  properties: {
    r'isbnList': PropertySchema(
      id: 0,
      name: r'isbnList',
      type: IsarType.stringList,
    ),
    r'lastModifyTime': PropertySchema(
      id: 1,
      name: r'lastModifyTime',
      type: IsarType.dateTime,
    ),
    r'userId': PropertySchema(
      id: 2,
      name: r'userId',
      type: IsarType.long,
    )
  },
  estimateSize: _bookShelfEstimateSize,
  serialize: _bookShelfSerialize,
  deserialize: _bookShelfDeserialize,
  deserializeProp: _bookShelfDeserializeProp,
  idName: r'id',
  indexes: {
    r'userId': IndexSchema(
      id: -2005826577402374815,
      name: r'userId',
      unique: true,
      replace: false,
      properties: [
        IndexPropertySchema(
          name: r'userId',
          type: IndexType.value,
          caseSensitive: false,
        )
      ],
    )
  },
  links: {},
  embeddedSchemas: {},
  getId: _bookShelfGetId,
  getLinks: _bookShelfGetLinks,
  attach: _bookShelfAttach,
  version: '3.1.0+1',
);

int _bookShelfEstimateSize(
  BookShelf object,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  var bytesCount = offsets.last;
  bytesCount += 3 + object.isbnList.length * 3;
  {
    for (var i = 0; i < object.isbnList.length; i++) {
      final value = object.isbnList[i];
      bytesCount += value.length * 3;
    }
  }
  return bytesCount;
}

void _bookShelfSerialize(
  BookShelf object,
  IsarWriter writer,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  writer.writeStringList(offsets[0], object.isbnList);
  writer.writeDateTime(offsets[1], object.lastModifyTime);
  writer.writeLong(offsets[2], object.userId);
}

BookShelf _bookShelfDeserialize(
  Id id,
  IsarReader reader,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  final object = BookShelf(
    isbnList: reader.readStringList(offsets[0]) ?? [],
    lastModifyTime: reader.readDateTime(offsets[1]),
    userId: reader.readLong(offsets[2]),
  );
  object.id = id;
  return object;
}

P _bookShelfDeserializeProp<P>(
  IsarReader reader,
  int propertyId,
  int offset,
  Map<Type, List<int>> allOffsets,
) {
  switch (propertyId) {
    case 0:
      return (reader.readStringList(offset) ?? []) as P;
    case 1:
      return (reader.readDateTime(offset)) as P;
    case 2:
      return (reader.readLong(offset)) as P;
    default:
      throw IsarError('Unknown property with id $propertyId');
  }
}

Id _bookShelfGetId(BookShelf object) {
  return object.id;
}

List<IsarLinkBase<dynamic>> _bookShelfGetLinks(BookShelf object) {
  return [];
}

void _bookShelfAttach(IsarCollection<dynamic> col, Id id, BookShelf object) {
  object.id = id;
}

extension BookShelfByIndex on IsarCollection<BookShelf> {
  Future<BookShelf?> getByUserId(int userId) {
    return getByIndex(r'userId', [userId]);
  }

  BookShelf? getByUserIdSync(int userId) {
    return getByIndexSync(r'userId', [userId]);
  }

  Future<bool> deleteByUserId(int userId) {
    return deleteByIndex(r'userId', [userId]);
  }

  bool deleteByUserIdSync(int userId) {
    return deleteByIndexSync(r'userId', [userId]);
  }

  Future<List<BookShelf?>> getAllByUserId(List<int> userIdValues) {
    final values = userIdValues.map((e) => [e]).toList();
    return getAllByIndex(r'userId', values);
  }

  List<BookShelf?> getAllByUserIdSync(List<int> userIdValues) {
    final values = userIdValues.map((e) => [e]).toList();
    return getAllByIndexSync(r'userId', values);
  }

  Future<int> deleteAllByUserId(List<int> userIdValues) {
    final values = userIdValues.map((e) => [e]).toList();
    return deleteAllByIndex(r'userId', values);
  }

  int deleteAllByUserIdSync(List<int> userIdValues) {
    final values = userIdValues.map((e) => [e]).toList();
    return deleteAllByIndexSync(r'userId', values);
  }

  Future<Id> putByUserId(BookShelf object) {
    return putByIndex(r'userId', object);
  }

  Id putByUserIdSync(BookShelf object, {bool saveLinks = true}) {
    return putByIndexSync(r'userId', object, saveLinks: saveLinks);
  }

  Future<List<Id>> putAllByUserId(List<BookShelf> objects) {
    return putAllByIndex(r'userId', objects);
  }

  List<Id> putAllByUserIdSync(List<BookShelf> objects,
      {bool saveLinks = true}) {
    return putAllByIndexSync(r'userId', objects, saveLinks: saveLinks);
  }
}

extension BookShelfQueryWhereSort
    on QueryBuilder<BookShelf, BookShelf, QWhere> {
  QueryBuilder<BookShelf, BookShelf, QAfterWhere> anyId() {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(const IdWhereClause.any());
    });
  }

  QueryBuilder<BookShelf, BookShelf, QAfterWhere> anyUserId() {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        const IndexWhereClause.any(indexName: r'userId'),
      );
    });
  }
}

extension BookShelfQueryWhere
    on QueryBuilder<BookShelf, BookShelf, QWhereClause> {
  QueryBuilder<BookShelf, BookShelf, QAfterWhereClause> idEqualTo(Id id) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IdWhereClause.between(
        lower: id,
        upper: id,
      ));
    });
  }

  QueryBuilder<BookShelf, BookShelf, QAfterWhereClause> idNotEqualTo(Id id) {
    return QueryBuilder.apply(this, (query) {
      if (query.whereSort == Sort.asc) {
        return query
            .addWhereClause(
              IdWhereClause.lessThan(upper: id, includeUpper: false),
            )
            .addWhereClause(
              IdWhereClause.greaterThan(lower: id, includeLower: false),
            );
      } else {
        return query
            .addWhereClause(
              IdWhereClause.greaterThan(lower: id, includeLower: false),
            )
            .addWhereClause(
              IdWhereClause.lessThan(upper: id, includeUpper: false),
            );
      }
    });
  }

  QueryBuilder<BookShelf, BookShelf, QAfterWhereClause> idGreaterThan(Id id,
      {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        IdWhereClause.greaterThan(lower: id, includeLower: include),
      );
    });
  }

  QueryBuilder<BookShelf, BookShelf, QAfterWhereClause> idLessThan(Id id,
      {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        IdWhereClause.lessThan(upper: id, includeUpper: include),
      );
    });
  }

  QueryBuilder<BookShelf, BookShelf, QAfterWhereClause> idBetween(
    Id lowerId,
    Id upperId, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IdWhereClause.between(
        lower: lowerId,
        includeLower: includeLower,
        upper: upperId,
        includeUpper: includeUpper,
      ));
    });
  }

  QueryBuilder<BookShelf, BookShelf, QAfterWhereClause> userIdEqualTo(
      int userId) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IndexWhereClause.equalTo(
        indexName: r'userId',
        value: [userId],
      ));
    });
  }

  QueryBuilder<BookShelf, BookShelf, QAfterWhereClause> userIdNotEqualTo(
      int userId) {
    return QueryBuilder.apply(this, (query) {
      if (query.whereSort == Sort.asc) {
        return query
            .addWhereClause(IndexWhereClause.between(
              indexName: r'userId',
              lower: [],
              upper: [userId],
              includeUpper: false,
            ))
            .addWhereClause(IndexWhereClause.between(
              indexName: r'userId',
              lower: [userId],
              includeLower: false,
              upper: [],
            ));
      } else {
        return query
            .addWhereClause(IndexWhereClause.between(
              indexName: r'userId',
              lower: [userId],
              includeLower: false,
              upper: [],
            ))
            .addWhereClause(IndexWhereClause.between(
              indexName: r'userId',
              lower: [],
              upper: [userId],
              includeUpper: false,
            ));
      }
    });
  }

  QueryBuilder<BookShelf, BookShelf, QAfterWhereClause> userIdGreaterThan(
    int userId, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IndexWhereClause.between(
        indexName: r'userId',
        lower: [userId],
        includeLower: include,
        upper: [],
      ));
    });
  }

  QueryBuilder<BookShelf, BookShelf, QAfterWhereClause> userIdLessThan(
    int userId, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IndexWhereClause.between(
        indexName: r'userId',
        lower: [],
        upper: [userId],
        includeUpper: include,
      ));
    });
  }

  QueryBuilder<BookShelf, BookShelf, QAfterWhereClause> userIdBetween(
    int lowerUserId,
    int upperUserId, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IndexWhereClause.between(
        indexName: r'userId',
        lower: [lowerUserId],
        includeLower: includeLower,
        upper: [upperUserId],
        includeUpper: includeUpper,
      ));
    });
  }
}

extension BookShelfQueryFilter
    on QueryBuilder<BookShelf, BookShelf, QFilterCondition> {
  QueryBuilder<BookShelf, BookShelf, QAfterFilterCondition> idEqualTo(
      Id value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'id',
        value: value,
      ));
    });
  }

  QueryBuilder<BookShelf, BookShelf, QAfterFilterCondition> idGreaterThan(
    Id value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'id',
        value: value,
      ));
    });
  }

  QueryBuilder<BookShelf, BookShelf, QAfterFilterCondition> idLessThan(
    Id value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'id',
        value: value,
      ));
    });
  }

  QueryBuilder<BookShelf, BookShelf, QAfterFilterCondition> idBetween(
    Id lower,
    Id upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'id',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
      ));
    });
  }

  QueryBuilder<BookShelf, BookShelf, QAfterFilterCondition>
      isbnListElementEqualTo(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'isbnList',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<BookShelf, BookShelf, QAfterFilterCondition>
      isbnListElementGreaterThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'isbnList',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<BookShelf, BookShelf, QAfterFilterCondition>
      isbnListElementLessThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'isbnList',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<BookShelf, BookShelf, QAfterFilterCondition>
      isbnListElementBetween(
    String lower,
    String upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'isbnList',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<BookShelf, BookShelf, QAfterFilterCondition>
      isbnListElementStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'isbnList',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<BookShelf, BookShelf, QAfterFilterCondition>
      isbnListElementEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'isbnList',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<BookShelf, BookShelf, QAfterFilterCondition>
      isbnListElementContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'isbnList',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<BookShelf, BookShelf, QAfterFilterCondition>
      isbnListElementMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'isbnList',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<BookShelf, BookShelf, QAfterFilterCondition>
      isbnListElementIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'isbnList',
        value: '',
      ));
    });
  }

  QueryBuilder<BookShelf, BookShelf, QAfterFilterCondition>
      isbnListElementIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'isbnList',
        value: '',
      ));
    });
  }

  QueryBuilder<BookShelf, BookShelf, QAfterFilterCondition>
      isbnListLengthEqualTo(int length) {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'isbnList',
        length,
        true,
        length,
        true,
      );
    });
  }

  QueryBuilder<BookShelf, BookShelf, QAfterFilterCondition> isbnListIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'isbnList',
        0,
        true,
        0,
        true,
      );
    });
  }

  QueryBuilder<BookShelf, BookShelf, QAfterFilterCondition>
      isbnListIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'isbnList',
        0,
        false,
        999999,
        true,
      );
    });
  }

  QueryBuilder<BookShelf, BookShelf, QAfterFilterCondition>
      isbnListLengthLessThan(
    int length, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'isbnList',
        0,
        true,
        length,
        include,
      );
    });
  }

  QueryBuilder<BookShelf, BookShelf, QAfterFilterCondition>
      isbnListLengthGreaterThan(
    int length, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'isbnList',
        length,
        include,
        999999,
        true,
      );
    });
  }

  QueryBuilder<BookShelf, BookShelf, QAfterFilterCondition>
      isbnListLengthBetween(
    int lower,
    int upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'isbnList',
        lower,
        includeLower,
        upper,
        includeUpper,
      );
    });
  }

  QueryBuilder<BookShelf, BookShelf, QAfterFilterCondition>
      lastModifyTimeEqualTo(DateTime value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'lastModifyTime',
        value: value,
      ));
    });
  }

  QueryBuilder<BookShelf, BookShelf, QAfterFilterCondition>
      lastModifyTimeGreaterThan(
    DateTime value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'lastModifyTime',
        value: value,
      ));
    });
  }

  QueryBuilder<BookShelf, BookShelf, QAfterFilterCondition>
      lastModifyTimeLessThan(
    DateTime value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'lastModifyTime',
        value: value,
      ));
    });
  }

  QueryBuilder<BookShelf, BookShelf, QAfterFilterCondition>
      lastModifyTimeBetween(
    DateTime lower,
    DateTime upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'lastModifyTime',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
      ));
    });
  }

  QueryBuilder<BookShelf, BookShelf, QAfterFilterCondition> userIdEqualTo(
      int value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'userId',
        value: value,
      ));
    });
  }

  QueryBuilder<BookShelf, BookShelf, QAfterFilterCondition> userIdGreaterThan(
    int value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'userId',
        value: value,
      ));
    });
  }

  QueryBuilder<BookShelf, BookShelf, QAfterFilterCondition> userIdLessThan(
    int value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'userId',
        value: value,
      ));
    });
  }

  QueryBuilder<BookShelf, BookShelf, QAfterFilterCondition> userIdBetween(
    int lower,
    int upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'userId',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
      ));
    });
  }
}

extension BookShelfQueryObject
    on QueryBuilder<BookShelf, BookShelf, QFilterCondition> {}

extension BookShelfQueryLinks
    on QueryBuilder<BookShelf, BookShelf, QFilterCondition> {}

extension BookShelfQuerySortBy on QueryBuilder<BookShelf, BookShelf, QSortBy> {
  QueryBuilder<BookShelf, BookShelf, QAfterSortBy> sortByLastModifyTime() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'lastModifyTime', Sort.asc);
    });
  }

  QueryBuilder<BookShelf, BookShelf, QAfterSortBy> sortByLastModifyTimeDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'lastModifyTime', Sort.desc);
    });
  }

  QueryBuilder<BookShelf, BookShelf, QAfterSortBy> sortByUserId() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'userId', Sort.asc);
    });
  }

  QueryBuilder<BookShelf, BookShelf, QAfterSortBy> sortByUserIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'userId', Sort.desc);
    });
  }
}

extension BookShelfQuerySortThenBy
    on QueryBuilder<BookShelf, BookShelf, QSortThenBy> {
  QueryBuilder<BookShelf, BookShelf, QAfterSortBy> thenById() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'id', Sort.asc);
    });
  }

  QueryBuilder<BookShelf, BookShelf, QAfterSortBy> thenByIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'id', Sort.desc);
    });
  }

  QueryBuilder<BookShelf, BookShelf, QAfterSortBy> thenByLastModifyTime() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'lastModifyTime', Sort.asc);
    });
  }

  QueryBuilder<BookShelf, BookShelf, QAfterSortBy> thenByLastModifyTimeDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'lastModifyTime', Sort.desc);
    });
  }

  QueryBuilder<BookShelf, BookShelf, QAfterSortBy> thenByUserId() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'userId', Sort.asc);
    });
  }

  QueryBuilder<BookShelf, BookShelf, QAfterSortBy> thenByUserIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'userId', Sort.desc);
    });
  }
}

extension BookShelfQueryWhereDistinct
    on QueryBuilder<BookShelf, BookShelf, QDistinct> {
  QueryBuilder<BookShelf, BookShelf, QDistinct> distinctByIsbnList() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'isbnList');
    });
  }

  QueryBuilder<BookShelf, BookShelf, QDistinct> distinctByLastModifyTime() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'lastModifyTime');
    });
  }

  QueryBuilder<BookShelf, BookShelf, QDistinct> distinctByUserId() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'userId');
    });
  }
}

extension BookShelfQueryProperty
    on QueryBuilder<BookShelf, BookShelf, QQueryProperty> {
  QueryBuilder<BookShelf, int, QQueryOperations> idProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'id');
    });
  }

  QueryBuilder<BookShelf, List<String>, QQueryOperations> isbnListProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'isbnList');
    });
  }

  QueryBuilder<BookShelf, DateTime, QQueryOperations> lastModifyTimeProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'lastModifyTime');
    });
  }

  QueryBuilder<BookShelf, int, QQueryOperations> userIdProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'userId');
    });
  }
}

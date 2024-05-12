// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'book_info.dart';

// **************************************************************************
// IsarCollectionGenerator
// **************************************************************************

// coverage:ignore-file
// ignore_for_file: duplicate_ignore, non_constant_identifier_names, constant_identifier_names, invalid_use_of_protected_member, unnecessary_cast, prefer_const_constructors, lines_longer_than_80_chars, require_trailing_commas, inference_failure_on_function_invocation, unnecessary_parenthesis, unnecessary_raw_strings, unnecessary_null_checks, join_return_with_assignment, prefer_final_locals, avoid_js_rounded_ints, avoid_positional_boolean_parameters, always_specify_types

extension GetBookInfoCollection on Isar {
  IsarCollection<BookInfo> get bookInfos => this.collection();
}

const BookInfoSchema = CollectionSchema(
  name: r'BookInfo',
  id: 1400514355585208475,
  properties: {
    r'authorIds': PropertySchema(
      id: 0,
      name: r'authorIds',
      type: IsarType.longList,
    ),
    r'authorNames': PropertySchema(
      id: 1,
      name: r'authorNames',
      type: IsarType.stringList,
    ),
    r'category1': PropertySchema(
      id: 2,
      name: r'category1',
      type: IsarType.long,
    ),
    r'category2': PropertySchema(
      id: 3,
      name: r'category2',
      type: IsarType.long,
    ),
    r'cover_l_url': PropertySchema(
      id: 4,
      name: r'cover_l_url',
      type: IsarType.string,
    ),
    r'cover_m_url': PropertySchema(
      id: 5,
      name: r'cover_m_url',
      type: IsarType.string,
    ),
    r'cover_s_url': PropertySchema(
      id: 6,
      name: r'cover_s_url',
      type: IsarType.string,
    ),
    r'desc': PropertySchema(
      id: 7,
      name: r'desc',
      type: IsarType.string,
    ),
    r'ebook_url': PropertySchema(
      id: 8,
      name: r'ebook_url',
      type: IsarType.string,
    ),
    r'isbn': PropertySchema(
      id: 9,
      name: r'isbn',
      type: IsarType.string,
    ),
    r'originalTitle': PropertySchema(
      id: 10,
      name: r'originalTitle',
      type: IsarType.string,
    ),
    r'pubDate': PropertySchema(
      id: 11,
      name: r'pubDate',
      type: IsarType.dateTime,
    ),
    r'publisher': PropertySchema(
      id: 12,
      name: r'publisher',
      type: IsarType.string,
    ),
    r'tags': PropertySchema(
      id: 13,
      name: r'tags',
      type: IsarType.stringList,
    ),
    r'title': PropertySchema(
      id: 14,
      name: r'title',
      type: IsarType.string,
    ),
    r'wordCount': PropertySchema(
      id: 15,
      name: r'wordCount',
      type: IsarType.long,
    )
  },
  estimateSize: _bookInfoEstimateSize,
  serialize: _bookInfoSerialize,
  deserialize: _bookInfoDeserialize,
  deserializeProp: _bookInfoDeserializeProp,
  idName: r'id',
  indexes: {
    r'isbn': IndexSchema(
      id: 6054191419597679524,
      name: r'isbn',
      unique: true,
      replace: false,
      properties: [
        IndexPropertySchema(
          name: r'isbn',
          type: IndexType.hash,
          caseSensitive: true,
        )
      ],
    )
  },
  links: {},
  embeddedSchemas: {},
  getId: _bookInfoGetId,
  getLinks: _bookInfoGetLinks,
  attach: _bookInfoAttach,
  version: '3.1.0+1',
);

int _bookInfoEstimateSize(
  BookInfo object,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  var bytesCount = offsets.last;
  bytesCount += 3 + object.authorIds.length * 8;
  bytesCount += 3 + object.authorNames.length * 3;
  {
    for (var i = 0; i < object.authorNames.length; i++) {
      final value = object.authorNames[i];
      bytesCount += value.length * 3;
    }
  }
  {
    final value = object.cover_l_url;
    if (value != null) {
      bytesCount += 3 + value.length * 3;
    }
  }
  {
    final value = object.cover_m_url;
    if (value != null) {
      bytesCount += 3 + value.length * 3;
    }
  }
  {
    final value = object.cover_s_url;
    if (value != null) {
      bytesCount += 3 + value.length * 3;
    }
  }
  {
    final value = object.desc;
    if (value != null) {
      bytesCount += 3 + value.length * 3;
    }
  }
  {
    final value = object.ebook_url;
    if (value != null) {
      bytesCount += 3 + value.length * 3;
    }
  }
  bytesCount += 3 + object.isbn.length * 3;
  {
    final value = object.originalTitle;
    if (value != null) {
      bytesCount += 3 + value.length * 3;
    }
  }
  bytesCount += 3 + object.publisher.length * 3;
  {
    final list = object.tags;
    if (list != null) {
      bytesCount += 3 + list.length * 3;
      {
        for (var i = 0; i < list.length; i++) {
          final value = list[i];
          bytesCount += value.length * 3;
        }
      }
    }
  }
  bytesCount += 3 + object.title.length * 3;
  return bytesCount;
}

void _bookInfoSerialize(
  BookInfo object,
  IsarWriter writer,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  writer.writeLongList(offsets[0], object.authorIds);
  writer.writeStringList(offsets[1], object.authorNames);
  writer.writeLong(offsets[2], object.category1);
  writer.writeLong(offsets[3], object.category2);
  writer.writeString(offsets[4], object.cover_l_url);
  writer.writeString(offsets[5], object.cover_m_url);
  writer.writeString(offsets[6], object.cover_s_url);
  writer.writeString(offsets[7], object.desc);
  writer.writeString(offsets[8], object.ebook_url);
  writer.writeString(offsets[9], object.isbn);
  writer.writeString(offsets[10], object.originalTitle);
  writer.writeDateTime(offsets[11], object.pubDate);
  writer.writeString(offsets[12], object.publisher);
  writer.writeStringList(offsets[13], object.tags);
  writer.writeString(offsets[14], object.title);
  writer.writeLong(offsets[15], object.wordCount);
}

BookInfo _bookInfoDeserialize(
  Id id,
  IsarReader reader,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  final object = BookInfo(
    authorIds: reader.readLongList(offsets[0]) ?? [],
    authorNames: reader.readStringList(offsets[1]) ?? [],
    category1: reader.readLong(offsets[2]),
    category2: reader.readLong(offsets[3]),
    cover_l_url: reader.readStringOrNull(offsets[4]),
    cover_m_url: reader.readStringOrNull(offsets[5]),
    cover_s_url: reader.readStringOrNull(offsets[6]),
    desc: reader.readStringOrNull(offsets[7]),
    ebook_url: reader.readStringOrNull(offsets[8]),
    isbn: reader.readString(offsets[9]),
    originalTitle: reader.readStringOrNull(offsets[10]),
    pubDate: reader.readDateTime(offsets[11]),
    publisher: reader.readString(offsets[12]),
    tags: reader.readStringList(offsets[13]),
    title: reader.readString(offsets[14]),
    wordCount: reader.readLong(offsets[15]),
  );
  object.id = id;
  return object;
}

P _bookInfoDeserializeProp<P>(
  IsarReader reader,
  int propertyId,
  int offset,
  Map<Type, List<int>> allOffsets,
) {
  switch (propertyId) {
    case 0:
      return (reader.readLongList(offset) ?? []) as P;
    case 1:
      return (reader.readStringList(offset) ?? []) as P;
    case 2:
      return (reader.readLong(offset)) as P;
    case 3:
      return (reader.readLong(offset)) as P;
    case 4:
      return (reader.readStringOrNull(offset)) as P;
    case 5:
      return (reader.readStringOrNull(offset)) as P;
    case 6:
      return (reader.readStringOrNull(offset)) as P;
    case 7:
      return (reader.readStringOrNull(offset)) as P;
    case 8:
      return (reader.readStringOrNull(offset)) as P;
    case 9:
      return (reader.readString(offset)) as P;
    case 10:
      return (reader.readStringOrNull(offset)) as P;
    case 11:
      return (reader.readDateTime(offset)) as P;
    case 12:
      return (reader.readString(offset)) as P;
    case 13:
      return (reader.readStringList(offset)) as P;
    case 14:
      return (reader.readString(offset)) as P;
    case 15:
      return (reader.readLong(offset)) as P;
    default:
      throw IsarError('Unknown property with id $propertyId');
  }
}

Id _bookInfoGetId(BookInfo object) {
  return object.id;
}

List<IsarLinkBase<dynamic>> _bookInfoGetLinks(BookInfo object) {
  return [];
}

void _bookInfoAttach(IsarCollection<dynamic> col, Id id, BookInfo object) {
  object.id = id;
}

extension BookInfoByIndex on IsarCollection<BookInfo> {
  Future<BookInfo?> getByIsbn(String isbn) {
    return getByIndex(r'isbn', [isbn]);
  }

  BookInfo? getByIsbnSync(String isbn) {
    return getByIndexSync(r'isbn', [isbn]);
  }

  Future<bool> deleteByIsbn(String isbn) {
    return deleteByIndex(r'isbn', [isbn]);
  }

  bool deleteByIsbnSync(String isbn) {
    return deleteByIndexSync(r'isbn', [isbn]);
  }

  Future<List<BookInfo?>> getAllByIsbn(List<String> isbnValues) {
    final values = isbnValues.map((e) => [e]).toList();
    return getAllByIndex(r'isbn', values);
  }

  List<BookInfo?> getAllByIsbnSync(List<String> isbnValues) {
    final values = isbnValues.map((e) => [e]).toList();
    return getAllByIndexSync(r'isbn', values);
  }

  Future<int> deleteAllByIsbn(List<String> isbnValues) {
    final values = isbnValues.map((e) => [e]).toList();
    return deleteAllByIndex(r'isbn', values);
  }

  int deleteAllByIsbnSync(List<String> isbnValues) {
    final values = isbnValues.map((e) => [e]).toList();
    return deleteAllByIndexSync(r'isbn', values);
  }

  Future<Id> putByIsbn(BookInfo object) {
    return putByIndex(r'isbn', object);
  }

  Id putByIsbnSync(BookInfo object, {bool saveLinks = true}) {
    return putByIndexSync(r'isbn', object, saveLinks: saveLinks);
  }

  Future<List<Id>> putAllByIsbn(List<BookInfo> objects) {
    return putAllByIndex(r'isbn', objects);
  }

  List<Id> putAllByIsbnSync(List<BookInfo> objects, {bool saveLinks = true}) {
    return putAllByIndexSync(r'isbn', objects, saveLinks: saveLinks);
  }
}

extension BookInfoQueryWhereSort on QueryBuilder<BookInfo, BookInfo, QWhere> {
  QueryBuilder<BookInfo, BookInfo, QAfterWhere> anyId() {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(const IdWhereClause.any());
    });
  }
}

extension BookInfoQueryWhere on QueryBuilder<BookInfo, BookInfo, QWhereClause> {
  QueryBuilder<BookInfo, BookInfo, QAfterWhereClause> idEqualTo(Id id) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IdWhereClause.between(
        lower: id,
        upper: id,
      ));
    });
  }

  QueryBuilder<BookInfo, BookInfo, QAfterWhereClause> idNotEqualTo(Id id) {
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

  QueryBuilder<BookInfo, BookInfo, QAfterWhereClause> idGreaterThan(Id id,
      {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        IdWhereClause.greaterThan(lower: id, includeLower: include),
      );
    });
  }

  QueryBuilder<BookInfo, BookInfo, QAfterWhereClause> idLessThan(Id id,
      {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        IdWhereClause.lessThan(upper: id, includeUpper: include),
      );
    });
  }

  QueryBuilder<BookInfo, BookInfo, QAfterWhereClause> idBetween(
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

  QueryBuilder<BookInfo, BookInfo, QAfterWhereClause> isbnEqualTo(String isbn) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IndexWhereClause.equalTo(
        indexName: r'isbn',
        value: [isbn],
      ));
    });
  }

  QueryBuilder<BookInfo, BookInfo, QAfterWhereClause> isbnNotEqualTo(
      String isbn) {
    return QueryBuilder.apply(this, (query) {
      if (query.whereSort == Sort.asc) {
        return query
            .addWhereClause(IndexWhereClause.between(
              indexName: r'isbn',
              lower: [],
              upper: [isbn],
              includeUpper: false,
            ))
            .addWhereClause(IndexWhereClause.between(
              indexName: r'isbn',
              lower: [isbn],
              includeLower: false,
              upper: [],
            ));
      } else {
        return query
            .addWhereClause(IndexWhereClause.between(
              indexName: r'isbn',
              lower: [isbn],
              includeLower: false,
              upper: [],
            ))
            .addWhereClause(IndexWhereClause.between(
              indexName: r'isbn',
              lower: [],
              upper: [isbn],
              includeUpper: false,
            ));
      }
    });
  }
}

extension BookInfoQueryFilter
    on QueryBuilder<BookInfo, BookInfo, QFilterCondition> {
  QueryBuilder<BookInfo, BookInfo, QAfterFilterCondition>
      authorIdsElementEqualTo(int value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'authorIds',
        value: value,
      ));
    });
  }

  QueryBuilder<BookInfo, BookInfo, QAfterFilterCondition>
      authorIdsElementGreaterThan(
    int value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'authorIds',
        value: value,
      ));
    });
  }

  QueryBuilder<BookInfo, BookInfo, QAfterFilterCondition>
      authorIdsElementLessThan(
    int value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'authorIds',
        value: value,
      ));
    });
  }

  QueryBuilder<BookInfo, BookInfo, QAfterFilterCondition>
      authorIdsElementBetween(
    int lower,
    int upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'authorIds',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
      ));
    });
  }

  QueryBuilder<BookInfo, BookInfo, QAfterFilterCondition>
      authorIdsLengthEqualTo(int length) {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'authorIds',
        length,
        true,
        length,
        true,
      );
    });
  }

  QueryBuilder<BookInfo, BookInfo, QAfterFilterCondition> authorIdsIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'authorIds',
        0,
        true,
        0,
        true,
      );
    });
  }

  QueryBuilder<BookInfo, BookInfo, QAfterFilterCondition>
      authorIdsIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'authorIds',
        0,
        false,
        999999,
        true,
      );
    });
  }

  QueryBuilder<BookInfo, BookInfo, QAfterFilterCondition>
      authorIdsLengthLessThan(
    int length, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'authorIds',
        0,
        true,
        length,
        include,
      );
    });
  }

  QueryBuilder<BookInfo, BookInfo, QAfterFilterCondition>
      authorIdsLengthGreaterThan(
    int length, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'authorIds',
        length,
        include,
        999999,
        true,
      );
    });
  }

  QueryBuilder<BookInfo, BookInfo, QAfterFilterCondition>
      authorIdsLengthBetween(
    int lower,
    int upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'authorIds',
        lower,
        includeLower,
        upper,
        includeUpper,
      );
    });
  }

  QueryBuilder<BookInfo, BookInfo, QAfterFilterCondition>
      authorNamesElementEqualTo(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'authorNames',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<BookInfo, BookInfo, QAfterFilterCondition>
      authorNamesElementGreaterThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'authorNames',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<BookInfo, BookInfo, QAfterFilterCondition>
      authorNamesElementLessThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'authorNames',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<BookInfo, BookInfo, QAfterFilterCondition>
      authorNamesElementBetween(
    String lower,
    String upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'authorNames',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<BookInfo, BookInfo, QAfterFilterCondition>
      authorNamesElementStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'authorNames',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<BookInfo, BookInfo, QAfterFilterCondition>
      authorNamesElementEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'authorNames',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<BookInfo, BookInfo, QAfterFilterCondition>
      authorNamesElementContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'authorNames',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<BookInfo, BookInfo, QAfterFilterCondition>
      authorNamesElementMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'authorNames',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<BookInfo, BookInfo, QAfterFilterCondition>
      authorNamesElementIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'authorNames',
        value: '',
      ));
    });
  }

  QueryBuilder<BookInfo, BookInfo, QAfterFilterCondition>
      authorNamesElementIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'authorNames',
        value: '',
      ));
    });
  }

  QueryBuilder<BookInfo, BookInfo, QAfterFilterCondition>
      authorNamesLengthEqualTo(int length) {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'authorNames',
        length,
        true,
        length,
        true,
      );
    });
  }

  QueryBuilder<BookInfo, BookInfo, QAfterFilterCondition> authorNamesIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'authorNames',
        0,
        true,
        0,
        true,
      );
    });
  }

  QueryBuilder<BookInfo, BookInfo, QAfterFilterCondition>
      authorNamesIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'authorNames',
        0,
        false,
        999999,
        true,
      );
    });
  }

  QueryBuilder<BookInfo, BookInfo, QAfterFilterCondition>
      authorNamesLengthLessThan(
    int length, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'authorNames',
        0,
        true,
        length,
        include,
      );
    });
  }

  QueryBuilder<BookInfo, BookInfo, QAfterFilterCondition>
      authorNamesLengthGreaterThan(
    int length, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'authorNames',
        length,
        include,
        999999,
        true,
      );
    });
  }

  QueryBuilder<BookInfo, BookInfo, QAfterFilterCondition>
      authorNamesLengthBetween(
    int lower,
    int upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'authorNames',
        lower,
        includeLower,
        upper,
        includeUpper,
      );
    });
  }

  QueryBuilder<BookInfo, BookInfo, QAfterFilterCondition> category1EqualTo(
      int value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'category1',
        value: value,
      ));
    });
  }

  QueryBuilder<BookInfo, BookInfo, QAfterFilterCondition> category1GreaterThan(
    int value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'category1',
        value: value,
      ));
    });
  }

  QueryBuilder<BookInfo, BookInfo, QAfterFilterCondition> category1LessThan(
    int value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'category1',
        value: value,
      ));
    });
  }

  QueryBuilder<BookInfo, BookInfo, QAfterFilterCondition> category1Between(
    int lower,
    int upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'category1',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
      ));
    });
  }

  QueryBuilder<BookInfo, BookInfo, QAfterFilterCondition> category2EqualTo(
      int value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'category2',
        value: value,
      ));
    });
  }

  QueryBuilder<BookInfo, BookInfo, QAfterFilterCondition> category2GreaterThan(
    int value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'category2',
        value: value,
      ));
    });
  }

  QueryBuilder<BookInfo, BookInfo, QAfterFilterCondition> category2LessThan(
    int value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'category2',
        value: value,
      ));
    });
  }

  QueryBuilder<BookInfo, BookInfo, QAfterFilterCondition> category2Between(
    int lower,
    int upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'category2',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
      ));
    });
  }

  QueryBuilder<BookInfo, BookInfo, QAfterFilterCondition> cover_l_urlIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'cover_l_url',
      ));
    });
  }

  QueryBuilder<BookInfo, BookInfo, QAfterFilterCondition>
      cover_l_urlIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'cover_l_url',
      ));
    });
  }

  QueryBuilder<BookInfo, BookInfo, QAfterFilterCondition> cover_l_urlEqualTo(
    String? value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'cover_l_url',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<BookInfo, BookInfo, QAfterFilterCondition>
      cover_l_urlGreaterThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'cover_l_url',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<BookInfo, BookInfo, QAfterFilterCondition> cover_l_urlLessThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'cover_l_url',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<BookInfo, BookInfo, QAfterFilterCondition> cover_l_urlBetween(
    String? lower,
    String? upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'cover_l_url',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<BookInfo, BookInfo, QAfterFilterCondition> cover_l_urlStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'cover_l_url',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<BookInfo, BookInfo, QAfterFilterCondition> cover_l_urlEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'cover_l_url',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<BookInfo, BookInfo, QAfterFilterCondition> cover_l_urlContains(
      String value,
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'cover_l_url',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<BookInfo, BookInfo, QAfterFilterCondition> cover_l_urlMatches(
      String pattern,
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'cover_l_url',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<BookInfo, BookInfo, QAfterFilterCondition> cover_l_urlIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'cover_l_url',
        value: '',
      ));
    });
  }

  QueryBuilder<BookInfo, BookInfo, QAfterFilterCondition>
      cover_l_urlIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'cover_l_url',
        value: '',
      ));
    });
  }

  QueryBuilder<BookInfo, BookInfo, QAfterFilterCondition> cover_m_urlIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'cover_m_url',
      ));
    });
  }

  QueryBuilder<BookInfo, BookInfo, QAfterFilterCondition>
      cover_m_urlIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'cover_m_url',
      ));
    });
  }

  QueryBuilder<BookInfo, BookInfo, QAfterFilterCondition> cover_m_urlEqualTo(
    String? value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'cover_m_url',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<BookInfo, BookInfo, QAfterFilterCondition>
      cover_m_urlGreaterThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'cover_m_url',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<BookInfo, BookInfo, QAfterFilterCondition> cover_m_urlLessThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'cover_m_url',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<BookInfo, BookInfo, QAfterFilterCondition> cover_m_urlBetween(
    String? lower,
    String? upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'cover_m_url',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<BookInfo, BookInfo, QAfterFilterCondition> cover_m_urlStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'cover_m_url',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<BookInfo, BookInfo, QAfterFilterCondition> cover_m_urlEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'cover_m_url',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<BookInfo, BookInfo, QAfterFilterCondition> cover_m_urlContains(
      String value,
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'cover_m_url',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<BookInfo, BookInfo, QAfterFilterCondition> cover_m_urlMatches(
      String pattern,
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'cover_m_url',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<BookInfo, BookInfo, QAfterFilterCondition> cover_m_urlIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'cover_m_url',
        value: '',
      ));
    });
  }

  QueryBuilder<BookInfo, BookInfo, QAfterFilterCondition>
      cover_m_urlIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'cover_m_url',
        value: '',
      ));
    });
  }

  QueryBuilder<BookInfo, BookInfo, QAfterFilterCondition> cover_s_urlIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'cover_s_url',
      ));
    });
  }

  QueryBuilder<BookInfo, BookInfo, QAfterFilterCondition>
      cover_s_urlIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'cover_s_url',
      ));
    });
  }

  QueryBuilder<BookInfo, BookInfo, QAfterFilterCondition> cover_s_urlEqualTo(
    String? value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'cover_s_url',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<BookInfo, BookInfo, QAfterFilterCondition>
      cover_s_urlGreaterThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'cover_s_url',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<BookInfo, BookInfo, QAfterFilterCondition> cover_s_urlLessThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'cover_s_url',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<BookInfo, BookInfo, QAfterFilterCondition> cover_s_urlBetween(
    String? lower,
    String? upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'cover_s_url',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<BookInfo, BookInfo, QAfterFilterCondition> cover_s_urlStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'cover_s_url',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<BookInfo, BookInfo, QAfterFilterCondition> cover_s_urlEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'cover_s_url',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<BookInfo, BookInfo, QAfterFilterCondition> cover_s_urlContains(
      String value,
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'cover_s_url',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<BookInfo, BookInfo, QAfterFilterCondition> cover_s_urlMatches(
      String pattern,
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'cover_s_url',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<BookInfo, BookInfo, QAfterFilterCondition> cover_s_urlIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'cover_s_url',
        value: '',
      ));
    });
  }

  QueryBuilder<BookInfo, BookInfo, QAfterFilterCondition>
      cover_s_urlIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'cover_s_url',
        value: '',
      ));
    });
  }

  QueryBuilder<BookInfo, BookInfo, QAfterFilterCondition> descIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'desc',
      ));
    });
  }

  QueryBuilder<BookInfo, BookInfo, QAfterFilterCondition> descIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'desc',
      ));
    });
  }

  QueryBuilder<BookInfo, BookInfo, QAfterFilterCondition> descEqualTo(
    String? value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'desc',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<BookInfo, BookInfo, QAfterFilterCondition> descGreaterThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'desc',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<BookInfo, BookInfo, QAfterFilterCondition> descLessThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'desc',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<BookInfo, BookInfo, QAfterFilterCondition> descBetween(
    String? lower,
    String? upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'desc',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<BookInfo, BookInfo, QAfterFilterCondition> descStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'desc',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<BookInfo, BookInfo, QAfterFilterCondition> descEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'desc',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<BookInfo, BookInfo, QAfterFilterCondition> descContains(
      String value,
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'desc',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<BookInfo, BookInfo, QAfterFilterCondition> descMatches(
      String pattern,
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'desc',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<BookInfo, BookInfo, QAfterFilterCondition> descIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'desc',
        value: '',
      ));
    });
  }

  QueryBuilder<BookInfo, BookInfo, QAfterFilterCondition> descIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'desc',
        value: '',
      ));
    });
  }

  QueryBuilder<BookInfo, BookInfo, QAfterFilterCondition> ebook_urlIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'ebook_url',
      ));
    });
  }

  QueryBuilder<BookInfo, BookInfo, QAfterFilterCondition> ebook_urlIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'ebook_url',
      ));
    });
  }

  QueryBuilder<BookInfo, BookInfo, QAfterFilterCondition> ebook_urlEqualTo(
    String? value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'ebook_url',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<BookInfo, BookInfo, QAfterFilterCondition> ebook_urlGreaterThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'ebook_url',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<BookInfo, BookInfo, QAfterFilterCondition> ebook_urlLessThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'ebook_url',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<BookInfo, BookInfo, QAfterFilterCondition> ebook_urlBetween(
    String? lower,
    String? upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'ebook_url',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<BookInfo, BookInfo, QAfterFilterCondition> ebook_urlStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'ebook_url',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<BookInfo, BookInfo, QAfterFilterCondition> ebook_urlEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'ebook_url',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<BookInfo, BookInfo, QAfterFilterCondition> ebook_urlContains(
      String value,
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'ebook_url',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<BookInfo, BookInfo, QAfterFilterCondition> ebook_urlMatches(
      String pattern,
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'ebook_url',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<BookInfo, BookInfo, QAfterFilterCondition> ebook_urlIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'ebook_url',
        value: '',
      ));
    });
  }

  QueryBuilder<BookInfo, BookInfo, QAfterFilterCondition>
      ebook_urlIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'ebook_url',
        value: '',
      ));
    });
  }

  QueryBuilder<BookInfo, BookInfo, QAfterFilterCondition> idEqualTo(Id value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'id',
        value: value,
      ));
    });
  }

  QueryBuilder<BookInfo, BookInfo, QAfterFilterCondition> idGreaterThan(
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

  QueryBuilder<BookInfo, BookInfo, QAfterFilterCondition> idLessThan(
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

  QueryBuilder<BookInfo, BookInfo, QAfterFilterCondition> idBetween(
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

  QueryBuilder<BookInfo, BookInfo, QAfterFilterCondition> isbnEqualTo(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'isbn',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<BookInfo, BookInfo, QAfterFilterCondition> isbnGreaterThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'isbn',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<BookInfo, BookInfo, QAfterFilterCondition> isbnLessThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'isbn',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<BookInfo, BookInfo, QAfterFilterCondition> isbnBetween(
    String lower,
    String upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'isbn',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<BookInfo, BookInfo, QAfterFilterCondition> isbnStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'isbn',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<BookInfo, BookInfo, QAfterFilterCondition> isbnEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'isbn',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<BookInfo, BookInfo, QAfterFilterCondition> isbnContains(
      String value,
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'isbn',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<BookInfo, BookInfo, QAfterFilterCondition> isbnMatches(
      String pattern,
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'isbn',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<BookInfo, BookInfo, QAfterFilterCondition> isbnIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'isbn',
        value: '',
      ));
    });
  }

  QueryBuilder<BookInfo, BookInfo, QAfterFilterCondition> isbnIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'isbn',
        value: '',
      ));
    });
  }

  QueryBuilder<BookInfo, BookInfo, QAfterFilterCondition>
      originalTitleIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'originalTitle',
      ));
    });
  }

  QueryBuilder<BookInfo, BookInfo, QAfterFilterCondition>
      originalTitleIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'originalTitle',
      ));
    });
  }

  QueryBuilder<BookInfo, BookInfo, QAfterFilterCondition> originalTitleEqualTo(
    String? value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'originalTitle',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<BookInfo, BookInfo, QAfterFilterCondition>
      originalTitleGreaterThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'originalTitle',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<BookInfo, BookInfo, QAfterFilterCondition> originalTitleLessThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'originalTitle',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<BookInfo, BookInfo, QAfterFilterCondition> originalTitleBetween(
    String? lower,
    String? upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'originalTitle',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<BookInfo, BookInfo, QAfterFilterCondition>
      originalTitleStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'originalTitle',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<BookInfo, BookInfo, QAfterFilterCondition> originalTitleEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'originalTitle',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<BookInfo, BookInfo, QAfterFilterCondition> originalTitleContains(
      String value,
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'originalTitle',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<BookInfo, BookInfo, QAfterFilterCondition> originalTitleMatches(
      String pattern,
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'originalTitle',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<BookInfo, BookInfo, QAfterFilterCondition>
      originalTitleIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'originalTitle',
        value: '',
      ));
    });
  }

  QueryBuilder<BookInfo, BookInfo, QAfterFilterCondition>
      originalTitleIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'originalTitle',
        value: '',
      ));
    });
  }

  QueryBuilder<BookInfo, BookInfo, QAfterFilterCondition> pubDateEqualTo(
      DateTime value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'pubDate',
        value: value,
      ));
    });
  }

  QueryBuilder<BookInfo, BookInfo, QAfterFilterCondition> pubDateGreaterThan(
    DateTime value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'pubDate',
        value: value,
      ));
    });
  }

  QueryBuilder<BookInfo, BookInfo, QAfterFilterCondition> pubDateLessThan(
    DateTime value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'pubDate',
        value: value,
      ));
    });
  }

  QueryBuilder<BookInfo, BookInfo, QAfterFilterCondition> pubDateBetween(
    DateTime lower,
    DateTime upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'pubDate',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
      ));
    });
  }

  QueryBuilder<BookInfo, BookInfo, QAfterFilterCondition> publisherEqualTo(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'publisher',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<BookInfo, BookInfo, QAfterFilterCondition> publisherGreaterThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'publisher',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<BookInfo, BookInfo, QAfterFilterCondition> publisherLessThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'publisher',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<BookInfo, BookInfo, QAfterFilterCondition> publisherBetween(
    String lower,
    String upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'publisher',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<BookInfo, BookInfo, QAfterFilterCondition> publisherStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'publisher',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<BookInfo, BookInfo, QAfterFilterCondition> publisherEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'publisher',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<BookInfo, BookInfo, QAfterFilterCondition> publisherContains(
      String value,
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'publisher',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<BookInfo, BookInfo, QAfterFilterCondition> publisherMatches(
      String pattern,
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'publisher',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<BookInfo, BookInfo, QAfterFilterCondition> publisherIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'publisher',
        value: '',
      ));
    });
  }

  QueryBuilder<BookInfo, BookInfo, QAfterFilterCondition>
      publisherIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'publisher',
        value: '',
      ));
    });
  }

  QueryBuilder<BookInfo, BookInfo, QAfterFilterCondition> tagsIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'tags',
      ));
    });
  }

  QueryBuilder<BookInfo, BookInfo, QAfterFilterCondition> tagsIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'tags',
      ));
    });
  }

  QueryBuilder<BookInfo, BookInfo, QAfterFilterCondition> tagsElementEqualTo(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'tags',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<BookInfo, BookInfo, QAfterFilterCondition>
      tagsElementGreaterThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'tags',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<BookInfo, BookInfo, QAfterFilterCondition> tagsElementLessThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'tags',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<BookInfo, BookInfo, QAfterFilterCondition> tagsElementBetween(
    String lower,
    String upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'tags',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<BookInfo, BookInfo, QAfterFilterCondition> tagsElementStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'tags',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<BookInfo, BookInfo, QAfterFilterCondition> tagsElementEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'tags',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<BookInfo, BookInfo, QAfterFilterCondition> tagsElementContains(
      String value,
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'tags',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<BookInfo, BookInfo, QAfterFilterCondition> tagsElementMatches(
      String pattern,
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'tags',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<BookInfo, BookInfo, QAfterFilterCondition> tagsElementIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'tags',
        value: '',
      ));
    });
  }

  QueryBuilder<BookInfo, BookInfo, QAfterFilterCondition>
      tagsElementIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'tags',
        value: '',
      ));
    });
  }

  QueryBuilder<BookInfo, BookInfo, QAfterFilterCondition> tagsLengthEqualTo(
      int length) {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'tags',
        length,
        true,
        length,
        true,
      );
    });
  }

  QueryBuilder<BookInfo, BookInfo, QAfterFilterCondition> tagsIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'tags',
        0,
        true,
        0,
        true,
      );
    });
  }

  QueryBuilder<BookInfo, BookInfo, QAfterFilterCondition> tagsIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'tags',
        0,
        false,
        999999,
        true,
      );
    });
  }

  QueryBuilder<BookInfo, BookInfo, QAfterFilterCondition> tagsLengthLessThan(
    int length, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'tags',
        0,
        true,
        length,
        include,
      );
    });
  }

  QueryBuilder<BookInfo, BookInfo, QAfterFilterCondition> tagsLengthGreaterThan(
    int length, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'tags',
        length,
        include,
        999999,
        true,
      );
    });
  }

  QueryBuilder<BookInfo, BookInfo, QAfterFilterCondition> tagsLengthBetween(
    int lower,
    int upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'tags',
        lower,
        includeLower,
        upper,
        includeUpper,
      );
    });
  }

  QueryBuilder<BookInfo, BookInfo, QAfterFilterCondition> titleEqualTo(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'title',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<BookInfo, BookInfo, QAfterFilterCondition> titleGreaterThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'title',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<BookInfo, BookInfo, QAfterFilterCondition> titleLessThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'title',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<BookInfo, BookInfo, QAfterFilterCondition> titleBetween(
    String lower,
    String upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'title',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<BookInfo, BookInfo, QAfterFilterCondition> titleStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'title',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<BookInfo, BookInfo, QAfterFilterCondition> titleEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'title',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<BookInfo, BookInfo, QAfterFilterCondition> titleContains(
      String value,
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'title',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<BookInfo, BookInfo, QAfterFilterCondition> titleMatches(
      String pattern,
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'title',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<BookInfo, BookInfo, QAfterFilterCondition> titleIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'title',
        value: '',
      ));
    });
  }

  QueryBuilder<BookInfo, BookInfo, QAfterFilterCondition> titleIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'title',
        value: '',
      ));
    });
  }

  QueryBuilder<BookInfo, BookInfo, QAfterFilterCondition> wordCountEqualTo(
      int value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'wordCount',
        value: value,
      ));
    });
  }

  QueryBuilder<BookInfo, BookInfo, QAfterFilterCondition> wordCountGreaterThan(
    int value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'wordCount',
        value: value,
      ));
    });
  }

  QueryBuilder<BookInfo, BookInfo, QAfterFilterCondition> wordCountLessThan(
    int value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'wordCount',
        value: value,
      ));
    });
  }

  QueryBuilder<BookInfo, BookInfo, QAfterFilterCondition> wordCountBetween(
    int lower,
    int upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'wordCount',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
      ));
    });
  }
}

extension BookInfoQueryObject
    on QueryBuilder<BookInfo, BookInfo, QFilterCondition> {}

extension BookInfoQueryLinks
    on QueryBuilder<BookInfo, BookInfo, QFilterCondition> {}

extension BookInfoQuerySortBy on QueryBuilder<BookInfo, BookInfo, QSortBy> {
  QueryBuilder<BookInfo, BookInfo, QAfterSortBy> sortByCategory1() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'category1', Sort.asc);
    });
  }

  QueryBuilder<BookInfo, BookInfo, QAfterSortBy> sortByCategory1Desc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'category1', Sort.desc);
    });
  }

  QueryBuilder<BookInfo, BookInfo, QAfterSortBy> sortByCategory2() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'category2', Sort.asc);
    });
  }

  QueryBuilder<BookInfo, BookInfo, QAfterSortBy> sortByCategory2Desc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'category2', Sort.desc);
    });
  }

  QueryBuilder<BookInfo, BookInfo, QAfterSortBy> sortByCover_l_url() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'cover_l_url', Sort.asc);
    });
  }

  QueryBuilder<BookInfo, BookInfo, QAfterSortBy> sortByCover_l_urlDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'cover_l_url', Sort.desc);
    });
  }

  QueryBuilder<BookInfo, BookInfo, QAfterSortBy> sortByCover_m_url() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'cover_m_url', Sort.asc);
    });
  }

  QueryBuilder<BookInfo, BookInfo, QAfterSortBy> sortByCover_m_urlDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'cover_m_url', Sort.desc);
    });
  }

  QueryBuilder<BookInfo, BookInfo, QAfterSortBy> sortByCover_s_url() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'cover_s_url', Sort.asc);
    });
  }

  QueryBuilder<BookInfo, BookInfo, QAfterSortBy> sortByCover_s_urlDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'cover_s_url', Sort.desc);
    });
  }

  QueryBuilder<BookInfo, BookInfo, QAfterSortBy> sortByDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'desc', Sort.asc);
    });
  }

  QueryBuilder<BookInfo, BookInfo, QAfterSortBy> sortByDescDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'desc', Sort.desc);
    });
  }

  QueryBuilder<BookInfo, BookInfo, QAfterSortBy> sortByEbook_url() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'ebook_url', Sort.asc);
    });
  }

  QueryBuilder<BookInfo, BookInfo, QAfterSortBy> sortByEbook_urlDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'ebook_url', Sort.desc);
    });
  }

  QueryBuilder<BookInfo, BookInfo, QAfterSortBy> sortByIsbn() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'isbn', Sort.asc);
    });
  }

  QueryBuilder<BookInfo, BookInfo, QAfterSortBy> sortByIsbnDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'isbn', Sort.desc);
    });
  }

  QueryBuilder<BookInfo, BookInfo, QAfterSortBy> sortByOriginalTitle() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'originalTitle', Sort.asc);
    });
  }

  QueryBuilder<BookInfo, BookInfo, QAfterSortBy> sortByOriginalTitleDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'originalTitle', Sort.desc);
    });
  }

  QueryBuilder<BookInfo, BookInfo, QAfterSortBy> sortByPubDate() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'pubDate', Sort.asc);
    });
  }

  QueryBuilder<BookInfo, BookInfo, QAfterSortBy> sortByPubDateDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'pubDate', Sort.desc);
    });
  }

  QueryBuilder<BookInfo, BookInfo, QAfterSortBy> sortByPublisher() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'publisher', Sort.asc);
    });
  }

  QueryBuilder<BookInfo, BookInfo, QAfterSortBy> sortByPublisherDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'publisher', Sort.desc);
    });
  }

  QueryBuilder<BookInfo, BookInfo, QAfterSortBy> sortByTitle() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'title', Sort.asc);
    });
  }

  QueryBuilder<BookInfo, BookInfo, QAfterSortBy> sortByTitleDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'title', Sort.desc);
    });
  }

  QueryBuilder<BookInfo, BookInfo, QAfterSortBy> sortByWordCount() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'wordCount', Sort.asc);
    });
  }

  QueryBuilder<BookInfo, BookInfo, QAfterSortBy> sortByWordCountDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'wordCount', Sort.desc);
    });
  }
}

extension BookInfoQuerySortThenBy
    on QueryBuilder<BookInfo, BookInfo, QSortThenBy> {
  QueryBuilder<BookInfo, BookInfo, QAfterSortBy> thenByCategory1() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'category1', Sort.asc);
    });
  }

  QueryBuilder<BookInfo, BookInfo, QAfterSortBy> thenByCategory1Desc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'category1', Sort.desc);
    });
  }

  QueryBuilder<BookInfo, BookInfo, QAfterSortBy> thenByCategory2() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'category2', Sort.asc);
    });
  }

  QueryBuilder<BookInfo, BookInfo, QAfterSortBy> thenByCategory2Desc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'category2', Sort.desc);
    });
  }

  QueryBuilder<BookInfo, BookInfo, QAfterSortBy> thenByCover_l_url() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'cover_l_url', Sort.asc);
    });
  }

  QueryBuilder<BookInfo, BookInfo, QAfterSortBy> thenByCover_l_urlDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'cover_l_url', Sort.desc);
    });
  }

  QueryBuilder<BookInfo, BookInfo, QAfterSortBy> thenByCover_m_url() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'cover_m_url', Sort.asc);
    });
  }

  QueryBuilder<BookInfo, BookInfo, QAfterSortBy> thenByCover_m_urlDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'cover_m_url', Sort.desc);
    });
  }

  QueryBuilder<BookInfo, BookInfo, QAfterSortBy> thenByCover_s_url() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'cover_s_url', Sort.asc);
    });
  }

  QueryBuilder<BookInfo, BookInfo, QAfterSortBy> thenByCover_s_urlDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'cover_s_url', Sort.desc);
    });
  }

  QueryBuilder<BookInfo, BookInfo, QAfterSortBy> thenByDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'desc', Sort.asc);
    });
  }

  QueryBuilder<BookInfo, BookInfo, QAfterSortBy> thenByDescDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'desc', Sort.desc);
    });
  }

  QueryBuilder<BookInfo, BookInfo, QAfterSortBy> thenByEbook_url() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'ebook_url', Sort.asc);
    });
  }

  QueryBuilder<BookInfo, BookInfo, QAfterSortBy> thenByEbook_urlDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'ebook_url', Sort.desc);
    });
  }

  QueryBuilder<BookInfo, BookInfo, QAfterSortBy> thenById() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'id', Sort.asc);
    });
  }

  QueryBuilder<BookInfo, BookInfo, QAfterSortBy> thenByIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'id', Sort.desc);
    });
  }

  QueryBuilder<BookInfo, BookInfo, QAfterSortBy> thenByIsbn() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'isbn', Sort.asc);
    });
  }

  QueryBuilder<BookInfo, BookInfo, QAfterSortBy> thenByIsbnDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'isbn', Sort.desc);
    });
  }

  QueryBuilder<BookInfo, BookInfo, QAfterSortBy> thenByOriginalTitle() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'originalTitle', Sort.asc);
    });
  }

  QueryBuilder<BookInfo, BookInfo, QAfterSortBy> thenByOriginalTitleDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'originalTitle', Sort.desc);
    });
  }

  QueryBuilder<BookInfo, BookInfo, QAfterSortBy> thenByPubDate() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'pubDate', Sort.asc);
    });
  }

  QueryBuilder<BookInfo, BookInfo, QAfterSortBy> thenByPubDateDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'pubDate', Sort.desc);
    });
  }

  QueryBuilder<BookInfo, BookInfo, QAfterSortBy> thenByPublisher() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'publisher', Sort.asc);
    });
  }

  QueryBuilder<BookInfo, BookInfo, QAfterSortBy> thenByPublisherDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'publisher', Sort.desc);
    });
  }

  QueryBuilder<BookInfo, BookInfo, QAfterSortBy> thenByTitle() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'title', Sort.asc);
    });
  }

  QueryBuilder<BookInfo, BookInfo, QAfterSortBy> thenByTitleDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'title', Sort.desc);
    });
  }

  QueryBuilder<BookInfo, BookInfo, QAfterSortBy> thenByWordCount() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'wordCount', Sort.asc);
    });
  }

  QueryBuilder<BookInfo, BookInfo, QAfterSortBy> thenByWordCountDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'wordCount', Sort.desc);
    });
  }
}

extension BookInfoQueryWhereDistinct
    on QueryBuilder<BookInfo, BookInfo, QDistinct> {
  QueryBuilder<BookInfo, BookInfo, QDistinct> distinctByAuthorIds() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'authorIds');
    });
  }

  QueryBuilder<BookInfo, BookInfo, QDistinct> distinctByAuthorNames() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'authorNames');
    });
  }

  QueryBuilder<BookInfo, BookInfo, QDistinct> distinctByCategory1() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'category1');
    });
  }

  QueryBuilder<BookInfo, BookInfo, QDistinct> distinctByCategory2() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'category2');
    });
  }

  QueryBuilder<BookInfo, BookInfo, QDistinct> distinctByCover_l_url(
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'cover_l_url', caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<BookInfo, BookInfo, QDistinct> distinctByCover_m_url(
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'cover_m_url', caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<BookInfo, BookInfo, QDistinct> distinctByCover_s_url(
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'cover_s_url', caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<BookInfo, BookInfo, QDistinct> distinctByDesc(
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'desc', caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<BookInfo, BookInfo, QDistinct> distinctByEbook_url(
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'ebook_url', caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<BookInfo, BookInfo, QDistinct> distinctByIsbn(
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'isbn', caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<BookInfo, BookInfo, QDistinct> distinctByOriginalTitle(
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'originalTitle',
          caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<BookInfo, BookInfo, QDistinct> distinctByPubDate() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'pubDate');
    });
  }

  QueryBuilder<BookInfo, BookInfo, QDistinct> distinctByPublisher(
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'publisher', caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<BookInfo, BookInfo, QDistinct> distinctByTags() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'tags');
    });
  }

  QueryBuilder<BookInfo, BookInfo, QDistinct> distinctByTitle(
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'title', caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<BookInfo, BookInfo, QDistinct> distinctByWordCount() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'wordCount');
    });
  }
}

extension BookInfoQueryProperty
    on QueryBuilder<BookInfo, BookInfo, QQueryProperty> {
  QueryBuilder<BookInfo, int, QQueryOperations> idProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'id');
    });
  }

  QueryBuilder<BookInfo, List<int>, QQueryOperations> authorIdsProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'authorIds');
    });
  }

  QueryBuilder<BookInfo, List<String>, QQueryOperations> authorNamesProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'authorNames');
    });
  }

  QueryBuilder<BookInfo, int, QQueryOperations> category1Property() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'category1');
    });
  }

  QueryBuilder<BookInfo, int, QQueryOperations> category2Property() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'category2');
    });
  }

  QueryBuilder<BookInfo, String?, QQueryOperations> cover_l_urlProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'cover_l_url');
    });
  }

  QueryBuilder<BookInfo, String?, QQueryOperations> cover_m_urlProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'cover_m_url');
    });
  }

  QueryBuilder<BookInfo, String?, QQueryOperations> cover_s_urlProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'cover_s_url');
    });
  }

  QueryBuilder<BookInfo, String?, QQueryOperations> descProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'desc');
    });
  }

  QueryBuilder<BookInfo, String?, QQueryOperations> ebook_urlProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'ebook_url');
    });
  }

  QueryBuilder<BookInfo, String, QQueryOperations> isbnProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'isbn');
    });
  }

  QueryBuilder<BookInfo, String?, QQueryOperations> originalTitleProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'originalTitle');
    });
  }

  QueryBuilder<BookInfo, DateTime, QQueryOperations> pubDateProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'pubDate');
    });
  }

  QueryBuilder<BookInfo, String, QQueryOperations> publisherProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'publisher');
    });
  }

  QueryBuilder<BookInfo, List<String>?, QQueryOperations> tagsProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'tags');
    });
  }

  QueryBuilder<BookInfo, String, QQueryOperations> titleProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'title');
    });
  }

  QueryBuilder<BookInfo, int, QQueryOperations> wordCountProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'wordCount');
    });
  }
}

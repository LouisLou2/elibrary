// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'reco_book.dart';

// **************************************************************************
// IsarCollectionGenerator
// **************************************************************************

// coverage:ignore-file
// ignore_for_file: duplicate_ignore, non_constant_identifier_names, constant_identifier_names, invalid_use_of_protected_member, unnecessary_cast, prefer_const_constructors, lines_longer_than_80_chars, require_trailing_commas, inference_failure_on_function_invocation, unnecessary_parenthesis, unnecessary_raw_strings, unnecessary_null_checks, join_return_with_assignment, prefer_final_locals, avoid_js_rounded_ints, avoid_positional_boolean_parameters, always_specify_types

extension GetRecoBookCollection on Isar {
  IsarCollection<RecoBook> get recoBooks => this.collection();
}

const RecoBookSchema = CollectionSchema(
  name: r'RecoBook',
  id: 3742331121696725248,
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
    r'recoTime': PropertySchema(
      id: 13,
      name: r'recoTime',
      type: IsarType.dateTime,
    ),
    r'tags': PropertySchema(
      id: 14,
      name: r'tags',
      type: IsarType.stringList,
    ),
    r'title': PropertySchema(
      id: 15,
      name: r'title',
      type: IsarType.string,
    ),
    r'wordCount': PropertySchema(
      id: 16,
      name: r'wordCount',
      type: IsarType.long,
    )
  },
  estimateSize: _recoBookEstimateSize,
  serialize: _recoBookSerialize,
  deserialize: _recoBookDeserialize,
  deserializeProp: _recoBookDeserializeProp,
  idName: r'id',
  indexes: {
    r'isbn': IndexSchema(
      id: 6054191419597679524,
      name: r'isbn',
      unique: true,
      replace: true,
      properties: [
        IndexPropertySchema(
          name: r'isbn',
          type: IndexType.hash,
          caseSensitive: true,
        )
      ],
    ),
    r'pubDate': IndexSchema(
      id: 1447833746908351955,
      name: r'pubDate',
      unique: false,
      replace: false,
      properties: [
        IndexPropertySchema(
          name: r'pubDate',
          type: IndexType.value,
          caseSensitive: false,
        )
      ],
    ),
    r'wordCount': IndexSchema(
      id: -6865332602315195179,
      name: r'wordCount',
      unique: false,
      replace: false,
      properties: [
        IndexPropertySchema(
          name: r'wordCount',
          type: IndexType.value,
          caseSensitive: false,
        )
      ],
    ),
    r'category1': IndexSchema(
      id: -8262179610149854474,
      name: r'category1',
      unique: false,
      replace: false,
      properties: [
        IndexPropertySchema(
          name: r'category1',
          type: IndexType.value,
          caseSensitive: false,
        )
      ],
    ),
    r'category2': IndexSchema(
      id: -349816774401027997,
      name: r'category2',
      unique: false,
      replace: false,
      properties: [
        IndexPropertySchema(
          name: r'category2',
          type: IndexType.value,
          caseSensitive: false,
        )
      ],
    )
  },
  links: {},
  embeddedSchemas: {},
  getId: _recoBookGetId,
  getLinks: _recoBookGetLinks,
  attach: _recoBookAttach,
  version: '3.1.0+1',
);

int _recoBookEstimateSize(
  RecoBook object,
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
  bytesCount += 3 + object.cover_l_url.length * 3;
  {
    final value = object.cover_m_url;
    if (value != null) {
      bytesCount += 3 + value.length * 3;
    }
  }
  bytesCount += 3 + object.cover_s_url.length * 3;
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

void _recoBookSerialize(
  RecoBook object,
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
  writer.writeDateTime(offsets[13], object.recoTime);
  writer.writeStringList(offsets[14], object.tags);
  writer.writeString(offsets[15], object.title);
  writer.writeLong(offsets[16], object.wordCount);
}

RecoBook _recoBookDeserialize(
  Id id,
  IsarReader reader,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  final object = RecoBook(
    authorIds: reader.readLongList(offsets[0]) ?? [],
    authorNames: reader.readStringList(offsets[1]) ?? [],
    category1: reader.readLong(offsets[2]),
    category2: reader.readLong(offsets[3]),
    cover_l_url: reader.readString(offsets[4]),
    cover_m_url: reader.readStringOrNull(offsets[5]),
    cover_s_url: reader.readString(offsets[6]),
    desc: reader.readStringOrNull(offsets[7]),
    ebook_url: reader.readStringOrNull(offsets[8]),
    isbn: reader.readString(offsets[9]),
    originalTitle: reader.readStringOrNull(offsets[10]),
    pubDate: reader.readDateTime(offsets[11]),
    publisher: reader.readString(offsets[12]),
    recoTime: reader.readDateTime(offsets[13]),
    tags: reader.readStringList(offsets[14]),
    title: reader.readString(offsets[15]),
    wordCount: reader.readLong(offsets[16]),
  );
  object.id = id;
  return object;
}

P _recoBookDeserializeProp<P>(
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
      return (reader.readString(offset)) as P;
    case 5:
      return (reader.readStringOrNull(offset)) as P;
    case 6:
      return (reader.readString(offset)) as P;
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
      return (reader.readDateTime(offset)) as P;
    case 14:
      return (reader.readStringList(offset)) as P;
    case 15:
      return (reader.readString(offset)) as P;
    case 16:
      return (reader.readLong(offset)) as P;
    default:
      throw IsarError('Unknown property with id $propertyId');
  }
}

Id _recoBookGetId(RecoBook object) {
  return object.id;
}

List<IsarLinkBase<dynamic>> _recoBookGetLinks(RecoBook object) {
  return [];
}

void _recoBookAttach(IsarCollection<dynamic> col, Id id, RecoBook object) {
  object.id = id;
}

extension RecoBookByIndex on IsarCollection<RecoBook> {
  Future<RecoBook?> getByIsbn(String isbn) {
    return getByIndex(r'isbn', [isbn]);
  }

  RecoBook? getByIsbnSync(String isbn) {
    return getByIndexSync(r'isbn', [isbn]);
  }

  Future<bool> deleteByIsbn(String isbn) {
    return deleteByIndex(r'isbn', [isbn]);
  }

  bool deleteByIsbnSync(String isbn) {
    return deleteByIndexSync(r'isbn', [isbn]);
  }

  Future<List<RecoBook?>> getAllByIsbn(List<String> isbnValues) {
    final values = isbnValues.map((e) => [e]).toList();
    return getAllByIndex(r'isbn', values);
  }

  List<RecoBook?> getAllByIsbnSync(List<String> isbnValues) {
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

  Future<Id> putByIsbn(RecoBook object) {
    return putByIndex(r'isbn', object);
  }

  Id putByIsbnSync(RecoBook object, {bool saveLinks = true}) {
    return putByIndexSync(r'isbn', object, saveLinks: saveLinks);
  }

  Future<List<Id>> putAllByIsbn(List<RecoBook> objects) {
    return putAllByIndex(r'isbn', objects);
  }

  List<Id> putAllByIsbnSync(List<RecoBook> objects, {bool saveLinks = true}) {
    return putAllByIndexSync(r'isbn', objects, saveLinks: saveLinks);
  }
}

extension RecoBookQueryWhereSort on QueryBuilder<RecoBook, RecoBook, QWhere> {
  QueryBuilder<RecoBook, RecoBook, QAfterWhere> anyId() {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(const IdWhereClause.any());
    });
  }

  QueryBuilder<RecoBook, RecoBook, QAfterWhere> anyPubDate() {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        const IndexWhereClause.any(indexName: r'pubDate'),
      );
    });
  }

  QueryBuilder<RecoBook, RecoBook, QAfterWhere> anyWordCount() {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        const IndexWhereClause.any(indexName: r'wordCount'),
      );
    });
  }

  QueryBuilder<RecoBook, RecoBook, QAfterWhere> anyCategory1() {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        const IndexWhereClause.any(indexName: r'category1'),
      );
    });
  }

  QueryBuilder<RecoBook, RecoBook, QAfterWhere> anyCategory2() {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        const IndexWhereClause.any(indexName: r'category2'),
      );
    });
  }
}

extension RecoBookQueryWhere on QueryBuilder<RecoBook, RecoBook, QWhereClause> {
  QueryBuilder<RecoBook, RecoBook, QAfterWhereClause> idEqualTo(Id id) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IdWhereClause.between(
        lower: id,
        upper: id,
      ));
    });
  }

  QueryBuilder<RecoBook, RecoBook, QAfterWhereClause> idNotEqualTo(Id id) {
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

  QueryBuilder<RecoBook, RecoBook, QAfterWhereClause> idGreaterThan(Id id,
      {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        IdWhereClause.greaterThan(lower: id, includeLower: include),
      );
    });
  }

  QueryBuilder<RecoBook, RecoBook, QAfterWhereClause> idLessThan(Id id,
      {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        IdWhereClause.lessThan(upper: id, includeUpper: include),
      );
    });
  }

  QueryBuilder<RecoBook, RecoBook, QAfterWhereClause> idBetween(
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

  QueryBuilder<RecoBook, RecoBook, QAfterWhereClause> isbnEqualTo(String isbn) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IndexWhereClause.equalTo(
        indexName: r'isbn',
        value: [isbn],
      ));
    });
  }

  QueryBuilder<RecoBook, RecoBook, QAfterWhereClause> isbnNotEqualTo(
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

  QueryBuilder<RecoBook, RecoBook, QAfterWhereClause> pubDateEqualTo(
      DateTime pubDate) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IndexWhereClause.equalTo(
        indexName: r'pubDate',
        value: [pubDate],
      ));
    });
  }

  QueryBuilder<RecoBook, RecoBook, QAfterWhereClause> pubDateNotEqualTo(
      DateTime pubDate) {
    return QueryBuilder.apply(this, (query) {
      if (query.whereSort == Sort.asc) {
        return query
            .addWhereClause(IndexWhereClause.between(
              indexName: r'pubDate',
              lower: [],
              upper: [pubDate],
              includeUpper: false,
            ))
            .addWhereClause(IndexWhereClause.between(
              indexName: r'pubDate',
              lower: [pubDate],
              includeLower: false,
              upper: [],
            ));
      } else {
        return query
            .addWhereClause(IndexWhereClause.between(
              indexName: r'pubDate',
              lower: [pubDate],
              includeLower: false,
              upper: [],
            ))
            .addWhereClause(IndexWhereClause.between(
              indexName: r'pubDate',
              lower: [],
              upper: [pubDate],
              includeUpper: false,
            ));
      }
    });
  }

  QueryBuilder<RecoBook, RecoBook, QAfterWhereClause> pubDateGreaterThan(
    DateTime pubDate, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IndexWhereClause.between(
        indexName: r'pubDate',
        lower: [pubDate],
        includeLower: include,
        upper: [],
      ));
    });
  }

  QueryBuilder<RecoBook, RecoBook, QAfterWhereClause> pubDateLessThan(
    DateTime pubDate, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IndexWhereClause.between(
        indexName: r'pubDate',
        lower: [],
        upper: [pubDate],
        includeUpper: include,
      ));
    });
  }

  QueryBuilder<RecoBook, RecoBook, QAfterWhereClause> pubDateBetween(
    DateTime lowerPubDate,
    DateTime upperPubDate, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IndexWhereClause.between(
        indexName: r'pubDate',
        lower: [lowerPubDate],
        includeLower: includeLower,
        upper: [upperPubDate],
        includeUpper: includeUpper,
      ));
    });
  }

  QueryBuilder<RecoBook, RecoBook, QAfterWhereClause> wordCountEqualTo(
      int wordCount) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IndexWhereClause.equalTo(
        indexName: r'wordCount',
        value: [wordCount],
      ));
    });
  }

  QueryBuilder<RecoBook, RecoBook, QAfterWhereClause> wordCountNotEqualTo(
      int wordCount) {
    return QueryBuilder.apply(this, (query) {
      if (query.whereSort == Sort.asc) {
        return query
            .addWhereClause(IndexWhereClause.between(
              indexName: r'wordCount',
              lower: [],
              upper: [wordCount],
              includeUpper: false,
            ))
            .addWhereClause(IndexWhereClause.between(
              indexName: r'wordCount',
              lower: [wordCount],
              includeLower: false,
              upper: [],
            ));
      } else {
        return query
            .addWhereClause(IndexWhereClause.between(
              indexName: r'wordCount',
              lower: [wordCount],
              includeLower: false,
              upper: [],
            ))
            .addWhereClause(IndexWhereClause.between(
              indexName: r'wordCount',
              lower: [],
              upper: [wordCount],
              includeUpper: false,
            ));
      }
    });
  }

  QueryBuilder<RecoBook, RecoBook, QAfterWhereClause> wordCountGreaterThan(
    int wordCount, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IndexWhereClause.between(
        indexName: r'wordCount',
        lower: [wordCount],
        includeLower: include,
        upper: [],
      ));
    });
  }

  QueryBuilder<RecoBook, RecoBook, QAfterWhereClause> wordCountLessThan(
    int wordCount, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IndexWhereClause.between(
        indexName: r'wordCount',
        lower: [],
        upper: [wordCount],
        includeUpper: include,
      ));
    });
  }

  QueryBuilder<RecoBook, RecoBook, QAfterWhereClause> wordCountBetween(
    int lowerWordCount,
    int upperWordCount, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IndexWhereClause.between(
        indexName: r'wordCount',
        lower: [lowerWordCount],
        includeLower: includeLower,
        upper: [upperWordCount],
        includeUpper: includeUpper,
      ));
    });
  }

  QueryBuilder<RecoBook, RecoBook, QAfterWhereClause> category1EqualTo(
      int category1) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IndexWhereClause.equalTo(
        indexName: r'category1',
        value: [category1],
      ));
    });
  }

  QueryBuilder<RecoBook, RecoBook, QAfterWhereClause> category1NotEqualTo(
      int category1) {
    return QueryBuilder.apply(this, (query) {
      if (query.whereSort == Sort.asc) {
        return query
            .addWhereClause(IndexWhereClause.between(
              indexName: r'category1',
              lower: [],
              upper: [category1],
              includeUpper: false,
            ))
            .addWhereClause(IndexWhereClause.between(
              indexName: r'category1',
              lower: [category1],
              includeLower: false,
              upper: [],
            ));
      } else {
        return query
            .addWhereClause(IndexWhereClause.between(
              indexName: r'category1',
              lower: [category1],
              includeLower: false,
              upper: [],
            ))
            .addWhereClause(IndexWhereClause.between(
              indexName: r'category1',
              lower: [],
              upper: [category1],
              includeUpper: false,
            ));
      }
    });
  }

  QueryBuilder<RecoBook, RecoBook, QAfterWhereClause> category1GreaterThan(
    int category1, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IndexWhereClause.between(
        indexName: r'category1',
        lower: [category1],
        includeLower: include,
        upper: [],
      ));
    });
  }

  QueryBuilder<RecoBook, RecoBook, QAfterWhereClause> category1LessThan(
    int category1, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IndexWhereClause.between(
        indexName: r'category1',
        lower: [],
        upper: [category1],
        includeUpper: include,
      ));
    });
  }

  QueryBuilder<RecoBook, RecoBook, QAfterWhereClause> category1Between(
    int lowerCategory1,
    int upperCategory1, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IndexWhereClause.between(
        indexName: r'category1',
        lower: [lowerCategory1],
        includeLower: includeLower,
        upper: [upperCategory1],
        includeUpper: includeUpper,
      ));
    });
  }

  QueryBuilder<RecoBook, RecoBook, QAfterWhereClause> category2EqualTo(
      int category2) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IndexWhereClause.equalTo(
        indexName: r'category2',
        value: [category2],
      ));
    });
  }

  QueryBuilder<RecoBook, RecoBook, QAfterWhereClause> category2NotEqualTo(
      int category2) {
    return QueryBuilder.apply(this, (query) {
      if (query.whereSort == Sort.asc) {
        return query
            .addWhereClause(IndexWhereClause.between(
              indexName: r'category2',
              lower: [],
              upper: [category2],
              includeUpper: false,
            ))
            .addWhereClause(IndexWhereClause.between(
              indexName: r'category2',
              lower: [category2],
              includeLower: false,
              upper: [],
            ));
      } else {
        return query
            .addWhereClause(IndexWhereClause.between(
              indexName: r'category2',
              lower: [category2],
              includeLower: false,
              upper: [],
            ))
            .addWhereClause(IndexWhereClause.between(
              indexName: r'category2',
              lower: [],
              upper: [category2],
              includeUpper: false,
            ));
      }
    });
  }

  QueryBuilder<RecoBook, RecoBook, QAfterWhereClause> category2GreaterThan(
    int category2, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IndexWhereClause.between(
        indexName: r'category2',
        lower: [category2],
        includeLower: include,
        upper: [],
      ));
    });
  }

  QueryBuilder<RecoBook, RecoBook, QAfterWhereClause> category2LessThan(
    int category2, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IndexWhereClause.between(
        indexName: r'category2',
        lower: [],
        upper: [category2],
        includeUpper: include,
      ));
    });
  }

  QueryBuilder<RecoBook, RecoBook, QAfterWhereClause> category2Between(
    int lowerCategory2,
    int upperCategory2, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IndexWhereClause.between(
        indexName: r'category2',
        lower: [lowerCategory2],
        includeLower: includeLower,
        upper: [upperCategory2],
        includeUpper: includeUpper,
      ));
    });
  }
}

extension RecoBookQueryFilter
    on QueryBuilder<RecoBook, RecoBook, QFilterCondition> {
  QueryBuilder<RecoBook, RecoBook, QAfterFilterCondition>
      authorIdsElementEqualTo(int value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'authorIds',
        value: value,
      ));
    });
  }

  QueryBuilder<RecoBook, RecoBook, QAfterFilterCondition>
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

  QueryBuilder<RecoBook, RecoBook, QAfterFilterCondition>
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

  QueryBuilder<RecoBook, RecoBook, QAfterFilterCondition>
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

  QueryBuilder<RecoBook, RecoBook, QAfterFilterCondition>
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

  QueryBuilder<RecoBook, RecoBook, QAfterFilterCondition> authorIdsIsEmpty() {
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

  QueryBuilder<RecoBook, RecoBook, QAfterFilterCondition>
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

  QueryBuilder<RecoBook, RecoBook, QAfterFilterCondition>
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

  QueryBuilder<RecoBook, RecoBook, QAfterFilterCondition>
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

  QueryBuilder<RecoBook, RecoBook, QAfterFilterCondition>
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

  QueryBuilder<RecoBook, RecoBook, QAfterFilterCondition>
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

  QueryBuilder<RecoBook, RecoBook, QAfterFilterCondition>
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

  QueryBuilder<RecoBook, RecoBook, QAfterFilterCondition>
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

  QueryBuilder<RecoBook, RecoBook, QAfterFilterCondition>
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

  QueryBuilder<RecoBook, RecoBook, QAfterFilterCondition>
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

  QueryBuilder<RecoBook, RecoBook, QAfterFilterCondition>
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

  QueryBuilder<RecoBook, RecoBook, QAfterFilterCondition>
      authorNamesElementContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'authorNames',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<RecoBook, RecoBook, QAfterFilterCondition>
      authorNamesElementMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'authorNames',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<RecoBook, RecoBook, QAfterFilterCondition>
      authorNamesElementIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'authorNames',
        value: '',
      ));
    });
  }

  QueryBuilder<RecoBook, RecoBook, QAfterFilterCondition>
      authorNamesElementIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'authorNames',
        value: '',
      ));
    });
  }

  QueryBuilder<RecoBook, RecoBook, QAfterFilterCondition>
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

  QueryBuilder<RecoBook, RecoBook, QAfterFilterCondition> authorNamesIsEmpty() {
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

  QueryBuilder<RecoBook, RecoBook, QAfterFilterCondition>
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

  QueryBuilder<RecoBook, RecoBook, QAfterFilterCondition>
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

  QueryBuilder<RecoBook, RecoBook, QAfterFilterCondition>
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

  QueryBuilder<RecoBook, RecoBook, QAfterFilterCondition>
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

  QueryBuilder<RecoBook, RecoBook, QAfterFilterCondition> category1EqualTo(
      int value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'category1',
        value: value,
      ));
    });
  }

  QueryBuilder<RecoBook, RecoBook, QAfterFilterCondition> category1GreaterThan(
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

  QueryBuilder<RecoBook, RecoBook, QAfterFilterCondition> category1LessThan(
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

  QueryBuilder<RecoBook, RecoBook, QAfterFilterCondition> category1Between(
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

  QueryBuilder<RecoBook, RecoBook, QAfterFilterCondition> category2EqualTo(
      int value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'category2',
        value: value,
      ));
    });
  }

  QueryBuilder<RecoBook, RecoBook, QAfterFilterCondition> category2GreaterThan(
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

  QueryBuilder<RecoBook, RecoBook, QAfterFilterCondition> category2LessThan(
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

  QueryBuilder<RecoBook, RecoBook, QAfterFilterCondition> category2Between(
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

  QueryBuilder<RecoBook, RecoBook, QAfterFilterCondition> cover_l_urlEqualTo(
    String value, {
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

  QueryBuilder<RecoBook, RecoBook, QAfterFilterCondition>
      cover_l_urlGreaterThan(
    String value, {
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

  QueryBuilder<RecoBook, RecoBook, QAfterFilterCondition> cover_l_urlLessThan(
    String value, {
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

  QueryBuilder<RecoBook, RecoBook, QAfterFilterCondition> cover_l_urlBetween(
    String lower,
    String upper, {
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

  QueryBuilder<RecoBook, RecoBook, QAfterFilterCondition> cover_l_urlStartsWith(
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

  QueryBuilder<RecoBook, RecoBook, QAfterFilterCondition> cover_l_urlEndsWith(
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

  QueryBuilder<RecoBook, RecoBook, QAfterFilterCondition> cover_l_urlContains(
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

  QueryBuilder<RecoBook, RecoBook, QAfterFilterCondition> cover_l_urlMatches(
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

  QueryBuilder<RecoBook, RecoBook, QAfterFilterCondition> cover_l_urlIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'cover_l_url',
        value: '',
      ));
    });
  }

  QueryBuilder<RecoBook, RecoBook, QAfterFilterCondition>
      cover_l_urlIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'cover_l_url',
        value: '',
      ));
    });
  }

  QueryBuilder<RecoBook, RecoBook, QAfterFilterCondition> cover_m_urlIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'cover_m_url',
      ));
    });
  }

  QueryBuilder<RecoBook, RecoBook, QAfterFilterCondition>
      cover_m_urlIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'cover_m_url',
      ));
    });
  }

  QueryBuilder<RecoBook, RecoBook, QAfterFilterCondition> cover_m_urlEqualTo(
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

  QueryBuilder<RecoBook, RecoBook, QAfterFilterCondition>
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

  QueryBuilder<RecoBook, RecoBook, QAfterFilterCondition> cover_m_urlLessThan(
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

  QueryBuilder<RecoBook, RecoBook, QAfterFilterCondition> cover_m_urlBetween(
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

  QueryBuilder<RecoBook, RecoBook, QAfterFilterCondition> cover_m_urlStartsWith(
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

  QueryBuilder<RecoBook, RecoBook, QAfterFilterCondition> cover_m_urlEndsWith(
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

  QueryBuilder<RecoBook, RecoBook, QAfterFilterCondition> cover_m_urlContains(
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

  QueryBuilder<RecoBook, RecoBook, QAfterFilterCondition> cover_m_urlMatches(
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

  QueryBuilder<RecoBook, RecoBook, QAfterFilterCondition> cover_m_urlIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'cover_m_url',
        value: '',
      ));
    });
  }

  QueryBuilder<RecoBook, RecoBook, QAfterFilterCondition>
      cover_m_urlIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'cover_m_url',
        value: '',
      ));
    });
  }

  QueryBuilder<RecoBook, RecoBook, QAfterFilterCondition> cover_s_urlEqualTo(
    String value, {
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

  QueryBuilder<RecoBook, RecoBook, QAfterFilterCondition>
      cover_s_urlGreaterThan(
    String value, {
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

  QueryBuilder<RecoBook, RecoBook, QAfterFilterCondition> cover_s_urlLessThan(
    String value, {
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

  QueryBuilder<RecoBook, RecoBook, QAfterFilterCondition> cover_s_urlBetween(
    String lower,
    String upper, {
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

  QueryBuilder<RecoBook, RecoBook, QAfterFilterCondition> cover_s_urlStartsWith(
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

  QueryBuilder<RecoBook, RecoBook, QAfterFilterCondition> cover_s_urlEndsWith(
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

  QueryBuilder<RecoBook, RecoBook, QAfterFilterCondition> cover_s_urlContains(
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

  QueryBuilder<RecoBook, RecoBook, QAfterFilterCondition> cover_s_urlMatches(
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

  QueryBuilder<RecoBook, RecoBook, QAfterFilterCondition> cover_s_urlIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'cover_s_url',
        value: '',
      ));
    });
  }

  QueryBuilder<RecoBook, RecoBook, QAfterFilterCondition>
      cover_s_urlIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'cover_s_url',
        value: '',
      ));
    });
  }

  QueryBuilder<RecoBook, RecoBook, QAfterFilterCondition> descIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'desc',
      ));
    });
  }

  QueryBuilder<RecoBook, RecoBook, QAfterFilterCondition> descIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'desc',
      ));
    });
  }

  QueryBuilder<RecoBook, RecoBook, QAfterFilterCondition> descEqualTo(
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

  QueryBuilder<RecoBook, RecoBook, QAfterFilterCondition> descGreaterThan(
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

  QueryBuilder<RecoBook, RecoBook, QAfterFilterCondition> descLessThan(
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

  QueryBuilder<RecoBook, RecoBook, QAfterFilterCondition> descBetween(
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

  QueryBuilder<RecoBook, RecoBook, QAfterFilterCondition> descStartsWith(
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

  QueryBuilder<RecoBook, RecoBook, QAfterFilterCondition> descEndsWith(
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

  QueryBuilder<RecoBook, RecoBook, QAfterFilterCondition> descContains(
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

  QueryBuilder<RecoBook, RecoBook, QAfterFilterCondition> descMatches(
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

  QueryBuilder<RecoBook, RecoBook, QAfterFilterCondition> descIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'desc',
        value: '',
      ));
    });
  }

  QueryBuilder<RecoBook, RecoBook, QAfterFilterCondition> descIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'desc',
        value: '',
      ));
    });
  }

  QueryBuilder<RecoBook, RecoBook, QAfterFilterCondition> ebook_urlIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'ebook_url',
      ));
    });
  }

  QueryBuilder<RecoBook, RecoBook, QAfterFilterCondition> ebook_urlIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'ebook_url',
      ));
    });
  }

  QueryBuilder<RecoBook, RecoBook, QAfterFilterCondition> ebook_urlEqualTo(
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

  QueryBuilder<RecoBook, RecoBook, QAfterFilterCondition> ebook_urlGreaterThan(
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

  QueryBuilder<RecoBook, RecoBook, QAfterFilterCondition> ebook_urlLessThan(
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

  QueryBuilder<RecoBook, RecoBook, QAfterFilterCondition> ebook_urlBetween(
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

  QueryBuilder<RecoBook, RecoBook, QAfterFilterCondition> ebook_urlStartsWith(
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

  QueryBuilder<RecoBook, RecoBook, QAfterFilterCondition> ebook_urlEndsWith(
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

  QueryBuilder<RecoBook, RecoBook, QAfterFilterCondition> ebook_urlContains(
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

  QueryBuilder<RecoBook, RecoBook, QAfterFilterCondition> ebook_urlMatches(
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

  QueryBuilder<RecoBook, RecoBook, QAfterFilterCondition> ebook_urlIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'ebook_url',
        value: '',
      ));
    });
  }

  QueryBuilder<RecoBook, RecoBook, QAfterFilterCondition>
      ebook_urlIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'ebook_url',
        value: '',
      ));
    });
  }

  QueryBuilder<RecoBook, RecoBook, QAfterFilterCondition> idEqualTo(Id value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'id',
        value: value,
      ));
    });
  }

  QueryBuilder<RecoBook, RecoBook, QAfterFilterCondition> idGreaterThan(
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

  QueryBuilder<RecoBook, RecoBook, QAfterFilterCondition> idLessThan(
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

  QueryBuilder<RecoBook, RecoBook, QAfterFilterCondition> idBetween(
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

  QueryBuilder<RecoBook, RecoBook, QAfterFilterCondition> isbnEqualTo(
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

  QueryBuilder<RecoBook, RecoBook, QAfterFilterCondition> isbnGreaterThan(
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

  QueryBuilder<RecoBook, RecoBook, QAfterFilterCondition> isbnLessThan(
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

  QueryBuilder<RecoBook, RecoBook, QAfterFilterCondition> isbnBetween(
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

  QueryBuilder<RecoBook, RecoBook, QAfterFilterCondition> isbnStartsWith(
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

  QueryBuilder<RecoBook, RecoBook, QAfterFilterCondition> isbnEndsWith(
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

  QueryBuilder<RecoBook, RecoBook, QAfterFilterCondition> isbnContains(
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

  QueryBuilder<RecoBook, RecoBook, QAfterFilterCondition> isbnMatches(
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

  QueryBuilder<RecoBook, RecoBook, QAfterFilterCondition> isbnIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'isbn',
        value: '',
      ));
    });
  }

  QueryBuilder<RecoBook, RecoBook, QAfterFilterCondition> isbnIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'isbn',
        value: '',
      ));
    });
  }

  QueryBuilder<RecoBook, RecoBook, QAfterFilterCondition>
      originalTitleIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'originalTitle',
      ));
    });
  }

  QueryBuilder<RecoBook, RecoBook, QAfterFilterCondition>
      originalTitleIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'originalTitle',
      ));
    });
  }

  QueryBuilder<RecoBook, RecoBook, QAfterFilterCondition> originalTitleEqualTo(
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

  QueryBuilder<RecoBook, RecoBook, QAfterFilterCondition>
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

  QueryBuilder<RecoBook, RecoBook, QAfterFilterCondition> originalTitleLessThan(
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

  QueryBuilder<RecoBook, RecoBook, QAfterFilterCondition> originalTitleBetween(
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

  QueryBuilder<RecoBook, RecoBook, QAfterFilterCondition>
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

  QueryBuilder<RecoBook, RecoBook, QAfterFilterCondition> originalTitleEndsWith(
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

  QueryBuilder<RecoBook, RecoBook, QAfterFilterCondition> originalTitleContains(
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

  QueryBuilder<RecoBook, RecoBook, QAfterFilterCondition> originalTitleMatches(
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

  QueryBuilder<RecoBook, RecoBook, QAfterFilterCondition>
      originalTitleIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'originalTitle',
        value: '',
      ));
    });
  }

  QueryBuilder<RecoBook, RecoBook, QAfterFilterCondition>
      originalTitleIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'originalTitle',
        value: '',
      ));
    });
  }

  QueryBuilder<RecoBook, RecoBook, QAfterFilterCondition> pubDateEqualTo(
      DateTime value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'pubDate',
        value: value,
      ));
    });
  }

  QueryBuilder<RecoBook, RecoBook, QAfterFilterCondition> pubDateGreaterThan(
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

  QueryBuilder<RecoBook, RecoBook, QAfterFilterCondition> pubDateLessThan(
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

  QueryBuilder<RecoBook, RecoBook, QAfterFilterCondition> pubDateBetween(
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

  QueryBuilder<RecoBook, RecoBook, QAfterFilterCondition> publisherEqualTo(
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

  QueryBuilder<RecoBook, RecoBook, QAfterFilterCondition> publisherGreaterThan(
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

  QueryBuilder<RecoBook, RecoBook, QAfterFilterCondition> publisherLessThan(
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

  QueryBuilder<RecoBook, RecoBook, QAfterFilterCondition> publisherBetween(
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

  QueryBuilder<RecoBook, RecoBook, QAfterFilterCondition> publisherStartsWith(
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

  QueryBuilder<RecoBook, RecoBook, QAfterFilterCondition> publisherEndsWith(
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

  QueryBuilder<RecoBook, RecoBook, QAfterFilterCondition> publisherContains(
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

  QueryBuilder<RecoBook, RecoBook, QAfterFilterCondition> publisherMatches(
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

  QueryBuilder<RecoBook, RecoBook, QAfterFilterCondition> publisherIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'publisher',
        value: '',
      ));
    });
  }

  QueryBuilder<RecoBook, RecoBook, QAfterFilterCondition>
      publisherIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'publisher',
        value: '',
      ));
    });
  }

  QueryBuilder<RecoBook, RecoBook, QAfterFilterCondition> recoTimeEqualTo(
      DateTime value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'recoTime',
        value: value,
      ));
    });
  }

  QueryBuilder<RecoBook, RecoBook, QAfterFilterCondition> recoTimeGreaterThan(
    DateTime value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'recoTime',
        value: value,
      ));
    });
  }

  QueryBuilder<RecoBook, RecoBook, QAfterFilterCondition> recoTimeLessThan(
    DateTime value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'recoTime',
        value: value,
      ));
    });
  }

  QueryBuilder<RecoBook, RecoBook, QAfterFilterCondition> recoTimeBetween(
    DateTime lower,
    DateTime upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'recoTime',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
      ));
    });
  }

  QueryBuilder<RecoBook, RecoBook, QAfterFilterCondition> tagsIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'tags',
      ));
    });
  }

  QueryBuilder<RecoBook, RecoBook, QAfterFilterCondition> tagsIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'tags',
      ));
    });
  }

  QueryBuilder<RecoBook, RecoBook, QAfterFilterCondition> tagsElementEqualTo(
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

  QueryBuilder<RecoBook, RecoBook, QAfterFilterCondition>
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

  QueryBuilder<RecoBook, RecoBook, QAfterFilterCondition> tagsElementLessThan(
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

  QueryBuilder<RecoBook, RecoBook, QAfterFilterCondition> tagsElementBetween(
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

  QueryBuilder<RecoBook, RecoBook, QAfterFilterCondition> tagsElementStartsWith(
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

  QueryBuilder<RecoBook, RecoBook, QAfterFilterCondition> tagsElementEndsWith(
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

  QueryBuilder<RecoBook, RecoBook, QAfterFilterCondition> tagsElementContains(
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

  QueryBuilder<RecoBook, RecoBook, QAfterFilterCondition> tagsElementMatches(
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

  QueryBuilder<RecoBook, RecoBook, QAfterFilterCondition> tagsElementIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'tags',
        value: '',
      ));
    });
  }

  QueryBuilder<RecoBook, RecoBook, QAfterFilterCondition>
      tagsElementIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'tags',
        value: '',
      ));
    });
  }

  QueryBuilder<RecoBook, RecoBook, QAfterFilterCondition> tagsLengthEqualTo(
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

  QueryBuilder<RecoBook, RecoBook, QAfterFilterCondition> tagsIsEmpty() {
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

  QueryBuilder<RecoBook, RecoBook, QAfterFilterCondition> tagsIsNotEmpty() {
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

  QueryBuilder<RecoBook, RecoBook, QAfterFilterCondition> tagsLengthLessThan(
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

  QueryBuilder<RecoBook, RecoBook, QAfterFilterCondition> tagsLengthGreaterThan(
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

  QueryBuilder<RecoBook, RecoBook, QAfterFilterCondition> tagsLengthBetween(
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

  QueryBuilder<RecoBook, RecoBook, QAfterFilterCondition> titleEqualTo(
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

  QueryBuilder<RecoBook, RecoBook, QAfterFilterCondition> titleGreaterThan(
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

  QueryBuilder<RecoBook, RecoBook, QAfterFilterCondition> titleLessThan(
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

  QueryBuilder<RecoBook, RecoBook, QAfterFilterCondition> titleBetween(
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

  QueryBuilder<RecoBook, RecoBook, QAfterFilterCondition> titleStartsWith(
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

  QueryBuilder<RecoBook, RecoBook, QAfterFilterCondition> titleEndsWith(
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

  QueryBuilder<RecoBook, RecoBook, QAfterFilterCondition> titleContains(
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

  QueryBuilder<RecoBook, RecoBook, QAfterFilterCondition> titleMatches(
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

  QueryBuilder<RecoBook, RecoBook, QAfterFilterCondition> titleIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'title',
        value: '',
      ));
    });
  }

  QueryBuilder<RecoBook, RecoBook, QAfterFilterCondition> titleIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'title',
        value: '',
      ));
    });
  }

  QueryBuilder<RecoBook, RecoBook, QAfterFilterCondition> wordCountEqualTo(
      int value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'wordCount',
        value: value,
      ));
    });
  }

  QueryBuilder<RecoBook, RecoBook, QAfterFilterCondition> wordCountGreaterThan(
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

  QueryBuilder<RecoBook, RecoBook, QAfterFilterCondition> wordCountLessThan(
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

  QueryBuilder<RecoBook, RecoBook, QAfterFilterCondition> wordCountBetween(
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

extension RecoBookQueryObject
    on QueryBuilder<RecoBook, RecoBook, QFilterCondition> {}

extension RecoBookQueryLinks
    on QueryBuilder<RecoBook, RecoBook, QFilterCondition> {}

extension RecoBookQuerySortBy on QueryBuilder<RecoBook, RecoBook, QSortBy> {
  QueryBuilder<RecoBook, RecoBook, QAfterSortBy> sortByCategory1() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'category1', Sort.asc);
    });
  }

  QueryBuilder<RecoBook, RecoBook, QAfterSortBy> sortByCategory1Desc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'category1', Sort.desc);
    });
  }

  QueryBuilder<RecoBook, RecoBook, QAfterSortBy> sortByCategory2() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'category2', Sort.asc);
    });
  }

  QueryBuilder<RecoBook, RecoBook, QAfterSortBy> sortByCategory2Desc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'category2', Sort.desc);
    });
  }

  QueryBuilder<RecoBook, RecoBook, QAfterSortBy> sortByCover_l_url() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'cover_l_url', Sort.asc);
    });
  }

  QueryBuilder<RecoBook, RecoBook, QAfterSortBy> sortByCover_l_urlDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'cover_l_url', Sort.desc);
    });
  }

  QueryBuilder<RecoBook, RecoBook, QAfterSortBy> sortByCover_m_url() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'cover_m_url', Sort.asc);
    });
  }

  QueryBuilder<RecoBook, RecoBook, QAfterSortBy> sortByCover_m_urlDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'cover_m_url', Sort.desc);
    });
  }

  QueryBuilder<RecoBook, RecoBook, QAfterSortBy> sortByCover_s_url() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'cover_s_url', Sort.asc);
    });
  }

  QueryBuilder<RecoBook, RecoBook, QAfterSortBy> sortByCover_s_urlDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'cover_s_url', Sort.desc);
    });
  }

  QueryBuilder<RecoBook, RecoBook, QAfterSortBy> sortByDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'desc', Sort.asc);
    });
  }

  QueryBuilder<RecoBook, RecoBook, QAfterSortBy> sortByDescDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'desc', Sort.desc);
    });
  }

  QueryBuilder<RecoBook, RecoBook, QAfterSortBy> sortByEbook_url() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'ebook_url', Sort.asc);
    });
  }

  QueryBuilder<RecoBook, RecoBook, QAfterSortBy> sortByEbook_urlDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'ebook_url', Sort.desc);
    });
  }

  QueryBuilder<RecoBook, RecoBook, QAfterSortBy> sortByIsbn() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'isbn', Sort.asc);
    });
  }

  QueryBuilder<RecoBook, RecoBook, QAfterSortBy> sortByIsbnDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'isbn', Sort.desc);
    });
  }

  QueryBuilder<RecoBook, RecoBook, QAfterSortBy> sortByOriginalTitle() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'originalTitle', Sort.asc);
    });
  }

  QueryBuilder<RecoBook, RecoBook, QAfterSortBy> sortByOriginalTitleDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'originalTitle', Sort.desc);
    });
  }

  QueryBuilder<RecoBook, RecoBook, QAfterSortBy> sortByPubDate() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'pubDate', Sort.asc);
    });
  }

  QueryBuilder<RecoBook, RecoBook, QAfterSortBy> sortByPubDateDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'pubDate', Sort.desc);
    });
  }

  QueryBuilder<RecoBook, RecoBook, QAfterSortBy> sortByPublisher() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'publisher', Sort.asc);
    });
  }

  QueryBuilder<RecoBook, RecoBook, QAfterSortBy> sortByPublisherDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'publisher', Sort.desc);
    });
  }

  QueryBuilder<RecoBook, RecoBook, QAfterSortBy> sortByRecoTime() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'recoTime', Sort.asc);
    });
  }

  QueryBuilder<RecoBook, RecoBook, QAfterSortBy> sortByRecoTimeDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'recoTime', Sort.desc);
    });
  }

  QueryBuilder<RecoBook, RecoBook, QAfterSortBy> sortByTitle() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'title', Sort.asc);
    });
  }

  QueryBuilder<RecoBook, RecoBook, QAfterSortBy> sortByTitleDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'title', Sort.desc);
    });
  }

  QueryBuilder<RecoBook, RecoBook, QAfterSortBy> sortByWordCount() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'wordCount', Sort.asc);
    });
  }

  QueryBuilder<RecoBook, RecoBook, QAfterSortBy> sortByWordCountDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'wordCount', Sort.desc);
    });
  }
}

extension RecoBookQuerySortThenBy
    on QueryBuilder<RecoBook, RecoBook, QSortThenBy> {
  QueryBuilder<RecoBook, RecoBook, QAfterSortBy> thenByCategory1() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'category1', Sort.asc);
    });
  }

  QueryBuilder<RecoBook, RecoBook, QAfterSortBy> thenByCategory1Desc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'category1', Sort.desc);
    });
  }

  QueryBuilder<RecoBook, RecoBook, QAfterSortBy> thenByCategory2() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'category2', Sort.asc);
    });
  }

  QueryBuilder<RecoBook, RecoBook, QAfterSortBy> thenByCategory2Desc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'category2', Sort.desc);
    });
  }

  QueryBuilder<RecoBook, RecoBook, QAfterSortBy> thenByCover_l_url() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'cover_l_url', Sort.asc);
    });
  }

  QueryBuilder<RecoBook, RecoBook, QAfterSortBy> thenByCover_l_urlDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'cover_l_url', Sort.desc);
    });
  }

  QueryBuilder<RecoBook, RecoBook, QAfterSortBy> thenByCover_m_url() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'cover_m_url', Sort.asc);
    });
  }

  QueryBuilder<RecoBook, RecoBook, QAfterSortBy> thenByCover_m_urlDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'cover_m_url', Sort.desc);
    });
  }

  QueryBuilder<RecoBook, RecoBook, QAfterSortBy> thenByCover_s_url() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'cover_s_url', Sort.asc);
    });
  }

  QueryBuilder<RecoBook, RecoBook, QAfterSortBy> thenByCover_s_urlDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'cover_s_url', Sort.desc);
    });
  }

  QueryBuilder<RecoBook, RecoBook, QAfterSortBy> thenByDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'desc', Sort.asc);
    });
  }

  QueryBuilder<RecoBook, RecoBook, QAfterSortBy> thenByDescDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'desc', Sort.desc);
    });
  }

  QueryBuilder<RecoBook, RecoBook, QAfterSortBy> thenByEbook_url() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'ebook_url', Sort.asc);
    });
  }

  QueryBuilder<RecoBook, RecoBook, QAfterSortBy> thenByEbook_urlDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'ebook_url', Sort.desc);
    });
  }

  QueryBuilder<RecoBook, RecoBook, QAfterSortBy> thenById() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'id', Sort.asc);
    });
  }

  QueryBuilder<RecoBook, RecoBook, QAfterSortBy> thenByIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'id', Sort.desc);
    });
  }

  QueryBuilder<RecoBook, RecoBook, QAfterSortBy> thenByIsbn() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'isbn', Sort.asc);
    });
  }

  QueryBuilder<RecoBook, RecoBook, QAfterSortBy> thenByIsbnDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'isbn', Sort.desc);
    });
  }

  QueryBuilder<RecoBook, RecoBook, QAfterSortBy> thenByOriginalTitle() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'originalTitle', Sort.asc);
    });
  }

  QueryBuilder<RecoBook, RecoBook, QAfterSortBy> thenByOriginalTitleDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'originalTitle', Sort.desc);
    });
  }

  QueryBuilder<RecoBook, RecoBook, QAfterSortBy> thenByPubDate() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'pubDate', Sort.asc);
    });
  }

  QueryBuilder<RecoBook, RecoBook, QAfterSortBy> thenByPubDateDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'pubDate', Sort.desc);
    });
  }

  QueryBuilder<RecoBook, RecoBook, QAfterSortBy> thenByPublisher() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'publisher', Sort.asc);
    });
  }

  QueryBuilder<RecoBook, RecoBook, QAfterSortBy> thenByPublisherDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'publisher', Sort.desc);
    });
  }

  QueryBuilder<RecoBook, RecoBook, QAfterSortBy> thenByRecoTime() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'recoTime', Sort.asc);
    });
  }

  QueryBuilder<RecoBook, RecoBook, QAfterSortBy> thenByRecoTimeDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'recoTime', Sort.desc);
    });
  }

  QueryBuilder<RecoBook, RecoBook, QAfterSortBy> thenByTitle() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'title', Sort.asc);
    });
  }

  QueryBuilder<RecoBook, RecoBook, QAfterSortBy> thenByTitleDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'title', Sort.desc);
    });
  }

  QueryBuilder<RecoBook, RecoBook, QAfterSortBy> thenByWordCount() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'wordCount', Sort.asc);
    });
  }

  QueryBuilder<RecoBook, RecoBook, QAfterSortBy> thenByWordCountDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'wordCount', Sort.desc);
    });
  }
}

extension RecoBookQueryWhereDistinct
    on QueryBuilder<RecoBook, RecoBook, QDistinct> {
  QueryBuilder<RecoBook, RecoBook, QDistinct> distinctByAuthorIds() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'authorIds');
    });
  }

  QueryBuilder<RecoBook, RecoBook, QDistinct> distinctByAuthorNames() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'authorNames');
    });
  }

  QueryBuilder<RecoBook, RecoBook, QDistinct> distinctByCategory1() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'category1');
    });
  }

  QueryBuilder<RecoBook, RecoBook, QDistinct> distinctByCategory2() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'category2');
    });
  }

  QueryBuilder<RecoBook, RecoBook, QDistinct> distinctByCover_l_url(
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'cover_l_url', caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<RecoBook, RecoBook, QDistinct> distinctByCover_m_url(
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'cover_m_url', caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<RecoBook, RecoBook, QDistinct> distinctByCover_s_url(
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'cover_s_url', caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<RecoBook, RecoBook, QDistinct> distinctByDesc(
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'desc', caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<RecoBook, RecoBook, QDistinct> distinctByEbook_url(
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'ebook_url', caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<RecoBook, RecoBook, QDistinct> distinctByIsbn(
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'isbn', caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<RecoBook, RecoBook, QDistinct> distinctByOriginalTitle(
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'originalTitle',
          caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<RecoBook, RecoBook, QDistinct> distinctByPubDate() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'pubDate');
    });
  }

  QueryBuilder<RecoBook, RecoBook, QDistinct> distinctByPublisher(
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'publisher', caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<RecoBook, RecoBook, QDistinct> distinctByRecoTime() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'recoTime');
    });
  }

  QueryBuilder<RecoBook, RecoBook, QDistinct> distinctByTags() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'tags');
    });
  }

  QueryBuilder<RecoBook, RecoBook, QDistinct> distinctByTitle(
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'title', caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<RecoBook, RecoBook, QDistinct> distinctByWordCount() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'wordCount');
    });
  }
}

extension RecoBookQueryProperty
    on QueryBuilder<RecoBook, RecoBook, QQueryProperty> {
  QueryBuilder<RecoBook, int, QQueryOperations> idProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'id');
    });
  }

  QueryBuilder<RecoBook, List<int>, QQueryOperations> authorIdsProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'authorIds');
    });
  }

  QueryBuilder<RecoBook, List<String>, QQueryOperations> authorNamesProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'authorNames');
    });
  }

  QueryBuilder<RecoBook, int, QQueryOperations> category1Property() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'category1');
    });
  }

  QueryBuilder<RecoBook, int, QQueryOperations> category2Property() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'category2');
    });
  }

  QueryBuilder<RecoBook, String, QQueryOperations> cover_l_urlProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'cover_l_url');
    });
  }

  QueryBuilder<RecoBook, String?, QQueryOperations> cover_m_urlProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'cover_m_url');
    });
  }

  QueryBuilder<RecoBook, String, QQueryOperations> cover_s_urlProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'cover_s_url');
    });
  }

  QueryBuilder<RecoBook, String?, QQueryOperations> descProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'desc');
    });
  }

  QueryBuilder<RecoBook, String?, QQueryOperations> ebook_urlProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'ebook_url');
    });
  }

  QueryBuilder<RecoBook, String, QQueryOperations> isbnProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'isbn');
    });
  }

  QueryBuilder<RecoBook, String?, QQueryOperations> originalTitleProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'originalTitle');
    });
  }

  QueryBuilder<RecoBook, DateTime, QQueryOperations> pubDateProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'pubDate');
    });
  }

  QueryBuilder<RecoBook, String, QQueryOperations> publisherProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'publisher');
    });
  }

  QueryBuilder<RecoBook, DateTime, QQueryOperations> recoTimeProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'recoTime');
    });
  }

  QueryBuilder<RecoBook, List<String>?, QQueryOperations> tagsProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'tags');
    });
  }

  QueryBuilder<RecoBook, String, QQueryOperations> titleProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'title');
    });
  }

  QueryBuilder<RecoBook, int, QQueryOperations> wordCountProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'wordCount');
    });
  }
}

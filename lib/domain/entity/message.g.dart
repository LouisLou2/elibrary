// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'message.dart';

// **************************************************************************
// IsarCollectionGenerator
// **************************************************************************

// coverage:ignore-file
// ignore_for_file: duplicate_ignore, non_constant_identifier_names, constant_identifier_names, invalid_use_of_protected_member, unnecessary_cast, prefer_const_constructors, lines_longer_than_80_chars, require_trailing_commas, inference_failure_on_function_invocation, unnecessary_parenthesis, unnecessary_raw_strings, unnecessary_null_checks, join_return_with_assignment, prefer_final_locals, avoid_js_rounded_ints, avoid_positional_boolean_parameters, always_specify_types

extension GetAppMessageCollection on Isar {
  IsarCollection<AppMessage> get appMessages => this.collection();
}

const AppMessageSchema = CollectionSchema(
  name: r'AppMessage',
  id: -5163273426852073966,
  properties: {
    r'message': PropertySchema(
      id: 0,
      name: r'message',
      type: IsarType.string,
    ),
    r'receiverId': PropertySchema(
      id: 1,
      name: r'receiverId',
      type: IsarType.long,
    ),
    r'senderId': PropertySchema(
      id: 2,
      name: r'senderId',
      type: IsarType.long,
    ),
    r'time': PropertySchema(
      id: 3,
      name: r'time',
      type: IsarType.dateTime,
    )
  },
  estimateSize: _appMessageEstimateSize,
  serialize: _appMessageSerialize,
  deserialize: _appMessageDeserialize,
  deserializeProp: _appMessageDeserializeProp,
  idName: r'id',
  indexes: {
    r'senderId_receiverId_time': IndexSchema(
      id: -7051153464285327534,
      name: r'senderId_receiverId_time',
      unique: false,
      replace: false,
      properties: [
        IndexPropertySchema(
          name: r'senderId',
          type: IndexType.value,
          caseSensitive: false,
        ),
        IndexPropertySchema(
          name: r'receiverId',
          type: IndexType.value,
          caseSensitive: false,
        ),
        IndexPropertySchema(
          name: r'time',
          type: IndexType.value,
          caseSensitive: false,
        )
      ],
    )
  },
  links: {},
  embeddedSchemas: {},
  getId: _appMessageGetId,
  getLinks: _appMessageGetLinks,
  attach: _appMessageAttach,
  version: '3.1.0+1',
);

int _appMessageEstimateSize(
  AppMessage object,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  var bytesCount = offsets.last;
  bytesCount += 3 + object.message.length * 3;
  return bytesCount;
}

void _appMessageSerialize(
  AppMessage object,
  IsarWriter writer,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  writer.writeString(offsets[0], object.message);
  writer.writeLong(offsets[1], object.receiverId);
  writer.writeLong(offsets[2], object.senderId);
  writer.writeDateTime(offsets[3], object.time);
}

AppMessage _appMessageDeserialize(
  Id id,
  IsarReader reader,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  final object = AppMessage(
    message: reader.readString(offsets[0]),
    receiverId: reader.readLong(offsets[1]),
    senderId: reader.readLong(offsets[2]),
    time: reader.readDateTime(offsets[3]),
  );
  object.id = id;
  return object;
}

P _appMessageDeserializeProp<P>(
  IsarReader reader,
  int propertyId,
  int offset,
  Map<Type, List<int>> allOffsets,
) {
  switch (propertyId) {
    case 0:
      return (reader.readString(offset)) as P;
    case 1:
      return (reader.readLong(offset)) as P;
    case 2:
      return (reader.readLong(offset)) as P;
    case 3:
      return (reader.readDateTime(offset)) as P;
    default:
      throw IsarError('Unknown property with id $propertyId');
  }
}

Id _appMessageGetId(AppMessage object) {
  return object.id;
}

List<IsarLinkBase<dynamic>> _appMessageGetLinks(AppMessage object) {
  return [];
}

void _appMessageAttach(IsarCollection<dynamic> col, Id id, AppMessage object) {
  object.id = id;
}

extension AppMessageQueryWhereSort
    on QueryBuilder<AppMessage, AppMessage, QWhere> {
  QueryBuilder<AppMessage, AppMessage, QAfterWhere> anyId() {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(const IdWhereClause.any());
    });
  }

  QueryBuilder<AppMessage, AppMessage, QAfterWhere>
      anySenderIdReceiverIdTime() {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        const IndexWhereClause.any(indexName: r'senderId_receiverId_time'),
      );
    });
  }
}

extension AppMessageQueryWhere
    on QueryBuilder<AppMessage, AppMessage, QWhereClause> {
  QueryBuilder<AppMessage, AppMessage, QAfterWhereClause> idEqualTo(Id id) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IdWhereClause.between(
        lower: id,
        upper: id,
      ));
    });
  }

  QueryBuilder<AppMessage, AppMessage, QAfterWhereClause> idNotEqualTo(Id id) {
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

  QueryBuilder<AppMessage, AppMessage, QAfterWhereClause> idGreaterThan(Id id,
      {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        IdWhereClause.greaterThan(lower: id, includeLower: include),
      );
    });
  }

  QueryBuilder<AppMessage, AppMessage, QAfterWhereClause> idLessThan(Id id,
      {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        IdWhereClause.lessThan(upper: id, includeUpper: include),
      );
    });
  }

  QueryBuilder<AppMessage, AppMessage, QAfterWhereClause> idBetween(
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

  QueryBuilder<AppMessage, AppMessage, QAfterWhereClause>
      senderIdEqualToAnyReceiverIdTime(int senderId) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IndexWhereClause.equalTo(
        indexName: r'senderId_receiverId_time',
        value: [senderId],
      ));
    });
  }

  QueryBuilder<AppMessage, AppMessage, QAfterWhereClause>
      senderIdNotEqualToAnyReceiverIdTime(int senderId) {
    return QueryBuilder.apply(this, (query) {
      if (query.whereSort == Sort.asc) {
        return query
            .addWhereClause(IndexWhereClause.between(
              indexName: r'senderId_receiverId_time',
              lower: [],
              upper: [senderId],
              includeUpper: false,
            ))
            .addWhereClause(IndexWhereClause.between(
              indexName: r'senderId_receiverId_time',
              lower: [senderId],
              includeLower: false,
              upper: [],
            ));
      } else {
        return query
            .addWhereClause(IndexWhereClause.between(
              indexName: r'senderId_receiverId_time',
              lower: [senderId],
              includeLower: false,
              upper: [],
            ))
            .addWhereClause(IndexWhereClause.between(
              indexName: r'senderId_receiverId_time',
              lower: [],
              upper: [senderId],
              includeUpper: false,
            ));
      }
    });
  }

  QueryBuilder<AppMessage, AppMessage, QAfterWhereClause>
      senderIdGreaterThanAnyReceiverIdTime(
    int senderId, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IndexWhereClause.between(
        indexName: r'senderId_receiverId_time',
        lower: [senderId],
        includeLower: include,
        upper: [],
      ));
    });
  }

  QueryBuilder<AppMessage, AppMessage, QAfterWhereClause>
      senderIdLessThanAnyReceiverIdTime(
    int senderId, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IndexWhereClause.between(
        indexName: r'senderId_receiverId_time',
        lower: [],
        upper: [senderId],
        includeUpper: include,
      ));
    });
  }

  QueryBuilder<AppMessage, AppMessage, QAfterWhereClause>
      senderIdBetweenAnyReceiverIdTime(
    int lowerSenderId,
    int upperSenderId, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IndexWhereClause.between(
        indexName: r'senderId_receiverId_time',
        lower: [lowerSenderId],
        includeLower: includeLower,
        upper: [upperSenderId],
        includeUpper: includeUpper,
      ));
    });
  }

  QueryBuilder<AppMessage, AppMessage, QAfterWhereClause>
      senderIdReceiverIdEqualToAnyTime(int senderId, int receiverId) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IndexWhereClause.equalTo(
        indexName: r'senderId_receiverId_time',
        value: [senderId, receiverId],
      ));
    });
  }

  QueryBuilder<AppMessage, AppMessage, QAfterWhereClause>
      senderIdEqualToReceiverIdNotEqualToAnyTime(int senderId, int receiverId) {
    return QueryBuilder.apply(this, (query) {
      if (query.whereSort == Sort.asc) {
        return query
            .addWhereClause(IndexWhereClause.between(
              indexName: r'senderId_receiverId_time',
              lower: [senderId],
              upper: [senderId, receiverId],
              includeUpper: false,
            ))
            .addWhereClause(IndexWhereClause.between(
              indexName: r'senderId_receiverId_time',
              lower: [senderId, receiverId],
              includeLower: false,
              upper: [senderId],
            ));
      } else {
        return query
            .addWhereClause(IndexWhereClause.between(
              indexName: r'senderId_receiverId_time',
              lower: [senderId, receiverId],
              includeLower: false,
              upper: [senderId],
            ))
            .addWhereClause(IndexWhereClause.between(
              indexName: r'senderId_receiverId_time',
              lower: [senderId],
              upper: [senderId, receiverId],
              includeUpper: false,
            ));
      }
    });
  }

  QueryBuilder<AppMessage, AppMessage, QAfterWhereClause>
      senderIdEqualToReceiverIdGreaterThanAnyTime(
    int senderId,
    int receiverId, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IndexWhereClause.between(
        indexName: r'senderId_receiverId_time',
        lower: [senderId, receiverId],
        includeLower: include,
        upper: [senderId],
      ));
    });
  }

  QueryBuilder<AppMessage, AppMessage, QAfterWhereClause>
      senderIdEqualToReceiverIdLessThanAnyTime(
    int senderId,
    int receiverId, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IndexWhereClause.between(
        indexName: r'senderId_receiverId_time',
        lower: [senderId],
        upper: [senderId, receiverId],
        includeUpper: include,
      ));
    });
  }

  QueryBuilder<AppMessage, AppMessage, QAfterWhereClause>
      senderIdEqualToReceiverIdBetweenAnyTime(
    int senderId,
    int lowerReceiverId,
    int upperReceiverId, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IndexWhereClause.between(
        indexName: r'senderId_receiverId_time',
        lower: [senderId, lowerReceiverId],
        includeLower: includeLower,
        upper: [senderId, upperReceiverId],
        includeUpper: includeUpper,
      ));
    });
  }

  QueryBuilder<AppMessage, AppMessage, QAfterWhereClause>
      senderIdReceiverIdTimeEqualTo(
          int senderId, int receiverId, DateTime time) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IndexWhereClause.equalTo(
        indexName: r'senderId_receiverId_time',
        value: [senderId, receiverId, time],
      ));
    });
  }

  QueryBuilder<AppMessage, AppMessage, QAfterWhereClause>
      senderIdReceiverIdEqualToTimeNotEqualTo(
          int senderId, int receiverId, DateTime time) {
    return QueryBuilder.apply(this, (query) {
      if (query.whereSort == Sort.asc) {
        return query
            .addWhereClause(IndexWhereClause.between(
              indexName: r'senderId_receiverId_time',
              lower: [senderId, receiverId],
              upper: [senderId, receiverId, time],
              includeUpper: false,
            ))
            .addWhereClause(IndexWhereClause.between(
              indexName: r'senderId_receiverId_time',
              lower: [senderId, receiverId, time],
              includeLower: false,
              upper: [senderId, receiverId],
            ));
      } else {
        return query
            .addWhereClause(IndexWhereClause.between(
              indexName: r'senderId_receiverId_time',
              lower: [senderId, receiverId, time],
              includeLower: false,
              upper: [senderId, receiverId],
            ))
            .addWhereClause(IndexWhereClause.between(
              indexName: r'senderId_receiverId_time',
              lower: [senderId, receiverId],
              upper: [senderId, receiverId, time],
              includeUpper: false,
            ));
      }
    });
  }

  QueryBuilder<AppMessage, AppMessage, QAfterWhereClause>
      senderIdReceiverIdEqualToTimeGreaterThan(
    int senderId,
    int receiverId,
    DateTime time, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IndexWhereClause.between(
        indexName: r'senderId_receiverId_time',
        lower: [senderId, receiverId, time],
        includeLower: include,
        upper: [senderId, receiverId],
      ));
    });
  }

  QueryBuilder<AppMessage, AppMessage, QAfterWhereClause>
      senderIdReceiverIdEqualToTimeLessThan(
    int senderId,
    int receiverId,
    DateTime time, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IndexWhereClause.between(
        indexName: r'senderId_receiverId_time',
        lower: [senderId, receiverId],
        upper: [senderId, receiverId, time],
        includeUpper: include,
      ));
    });
  }

  QueryBuilder<AppMessage, AppMessage, QAfterWhereClause>
      senderIdReceiverIdEqualToTimeBetween(
    int senderId,
    int receiverId,
    DateTime lowerTime,
    DateTime upperTime, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IndexWhereClause.between(
        indexName: r'senderId_receiverId_time',
        lower: [senderId, receiverId, lowerTime],
        includeLower: includeLower,
        upper: [senderId, receiverId, upperTime],
        includeUpper: includeUpper,
      ));
    });
  }
}

extension AppMessageQueryFilter
    on QueryBuilder<AppMessage, AppMessage, QFilterCondition> {
  QueryBuilder<AppMessage, AppMessage, QAfterFilterCondition> idEqualTo(
      Id value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'id',
        value: value,
      ));
    });
  }

  QueryBuilder<AppMessage, AppMessage, QAfterFilterCondition> idGreaterThan(
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

  QueryBuilder<AppMessage, AppMessage, QAfterFilterCondition> idLessThan(
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

  QueryBuilder<AppMessage, AppMessage, QAfterFilterCondition> idBetween(
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

  QueryBuilder<AppMessage, AppMessage, QAfterFilterCondition> messageEqualTo(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'message',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<AppMessage, AppMessage, QAfterFilterCondition>
      messageGreaterThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'message',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<AppMessage, AppMessage, QAfterFilterCondition> messageLessThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'message',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<AppMessage, AppMessage, QAfterFilterCondition> messageBetween(
    String lower,
    String upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'message',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<AppMessage, AppMessage, QAfterFilterCondition> messageStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'message',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<AppMessage, AppMessage, QAfterFilterCondition> messageEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'message',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<AppMessage, AppMessage, QAfterFilterCondition> messageContains(
      String value,
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'message',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<AppMessage, AppMessage, QAfterFilterCondition> messageMatches(
      String pattern,
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'message',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<AppMessage, AppMessage, QAfterFilterCondition> messageIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'message',
        value: '',
      ));
    });
  }

  QueryBuilder<AppMessage, AppMessage, QAfterFilterCondition>
      messageIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'message',
        value: '',
      ));
    });
  }

  QueryBuilder<AppMessage, AppMessage, QAfterFilterCondition> receiverIdEqualTo(
      int value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'receiverId',
        value: value,
      ));
    });
  }

  QueryBuilder<AppMessage, AppMessage, QAfterFilterCondition>
      receiverIdGreaterThan(
    int value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'receiverId',
        value: value,
      ));
    });
  }

  QueryBuilder<AppMessage, AppMessage, QAfterFilterCondition>
      receiverIdLessThan(
    int value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'receiverId',
        value: value,
      ));
    });
  }

  QueryBuilder<AppMessage, AppMessage, QAfterFilterCondition> receiverIdBetween(
    int lower,
    int upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'receiverId',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
      ));
    });
  }

  QueryBuilder<AppMessage, AppMessage, QAfterFilterCondition> senderIdEqualTo(
      int value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'senderId',
        value: value,
      ));
    });
  }

  QueryBuilder<AppMessage, AppMessage, QAfterFilterCondition>
      senderIdGreaterThan(
    int value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'senderId',
        value: value,
      ));
    });
  }

  QueryBuilder<AppMessage, AppMessage, QAfterFilterCondition> senderIdLessThan(
    int value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'senderId',
        value: value,
      ));
    });
  }

  QueryBuilder<AppMessage, AppMessage, QAfterFilterCondition> senderIdBetween(
    int lower,
    int upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'senderId',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
      ));
    });
  }

  QueryBuilder<AppMessage, AppMessage, QAfterFilterCondition> timeEqualTo(
      DateTime value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'time',
        value: value,
      ));
    });
  }

  QueryBuilder<AppMessage, AppMessage, QAfterFilterCondition> timeGreaterThan(
    DateTime value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'time',
        value: value,
      ));
    });
  }

  QueryBuilder<AppMessage, AppMessage, QAfterFilterCondition> timeLessThan(
    DateTime value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'time',
        value: value,
      ));
    });
  }

  QueryBuilder<AppMessage, AppMessage, QAfterFilterCondition> timeBetween(
    DateTime lower,
    DateTime upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'time',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
      ));
    });
  }
}

extension AppMessageQueryObject
    on QueryBuilder<AppMessage, AppMessage, QFilterCondition> {}

extension AppMessageQueryLinks
    on QueryBuilder<AppMessage, AppMessage, QFilterCondition> {}

extension AppMessageQuerySortBy
    on QueryBuilder<AppMessage, AppMessage, QSortBy> {
  QueryBuilder<AppMessage, AppMessage, QAfterSortBy> sortByMessage() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'message', Sort.asc);
    });
  }

  QueryBuilder<AppMessage, AppMessage, QAfterSortBy> sortByMessageDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'message', Sort.desc);
    });
  }

  QueryBuilder<AppMessage, AppMessage, QAfterSortBy> sortByReceiverId() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'receiverId', Sort.asc);
    });
  }

  QueryBuilder<AppMessage, AppMessage, QAfterSortBy> sortByReceiverIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'receiverId', Sort.desc);
    });
  }

  QueryBuilder<AppMessage, AppMessage, QAfterSortBy> sortBySenderId() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'senderId', Sort.asc);
    });
  }

  QueryBuilder<AppMessage, AppMessage, QAfterSortBy> sortBySenderIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'senderId', Sort.desc);
    });
  }

  QueryBuilder<AppMessage, AppMessage, QAfterSortBy> sortByTime() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'time', Sort.asc);
    });
  }

  QueryBuilder<AppMessage, AppMessage, QAfterSortBy> sortByTimeDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'time', Sort.desc);
    });
  }
}

extension AppMessageQuerySortThenBy
    on QueryBuilder<AppMessage, AppMessage, QSortThenBy> {
  QueryBuilder<AppMessage, AppMessage, QAfterSortBy> thenById() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'id', Sort.asc);
    });
  }

  QueryBuilder<AppMessage, AppMessage, QAfterSortBy> thenByIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'id', Sort.desc);
    });
  }

  QueryBuilder<AppMessage, AppMessage, QAfterSortBy> thenByMessage() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'message', Sort.asc);
    });
  }

  QueryBuilder<AppMessage, AppMessage, QAfterSortBy> thenByMessageDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'message', Sort.desc);
    });
  }

  QueryBuilder<AppMessage, AppMessage, QAfterSortBy> thenByReceiverId() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'receiverId', Sort.asc);
    });
  }

  QueryBuilder<AppMessage, AppMessage, QAfterSortBy> thenByReceiverIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'receiverId', Sort.desc);
    });
  }

  QueryBuilder<AppMessage, AppMessage, QAfterSortBy> thenBySenderId() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'senderId', Sort.asc);
    });
  }

  QueryBuilder<AppMessage, AppMessage, QAfterSortBy> thenBySenderIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'senderId', Sort.desc);
    });
  }

  QueryBuilder<AppMessage, AppMessage, QAfterSortBy> thenByTime() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'time', Sort.asc);
    });
  }

  QueryBuilder<AppMessage, AppMessage, QAfterSortBy> thenByTimeDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'time', Sort.desc);
    });
  }
}

extension AppMessageQueryWhereDistinct
    on QueryBuilder<AppMessage, AppMessage, QDistinct> {
  QueryBuilder<AppMessage, AppMessage, QDistinct> distinctByMessage(
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'message', caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<AppMessage, AppMessage, QDistinct> distinctByReceiverId() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'receiverId');
    });
  }

  QueryBuilder<AppMessage, AppMessage, QDistinct> distinctBySenderId() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'senderId');
    });
  }

  QueryBuilder<AppMessage, AppMessage, QDistinct> distinctByTime() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'time');
    });
  }
}

extension AppMessageQueryProperty
    on QueryBuilder<AppMessage, AppMessage, QQueryProperty> {
  QueryBuilder<AppMessage, int, QQueryOperations> idProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'id');
    });
  }

  QueryBuilder<AppMessage, String, QQueryOperations> messageProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'message');
    });
  }

  QueryBuilder<AppMessage, int, QQueryOperations> receiverIdProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'receiverId');
    });
  }

  QueryBuilder<AppMessage, int, QQueryOperations> senderIdProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'senderId');
    });
  }

  QueryBuilder<AppMessage, DateTime, QQueryOperations> timeProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'time');
    });
  }
}

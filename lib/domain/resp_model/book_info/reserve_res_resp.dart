class ReserveResultResp{
  final int reserveId;
  final DateTime reserveTime;
  final DateTime dueTime;

  ReserveResultResp({
    required this.reserveId,
    required this.reserveTime,
    required this.dueTime,
  });

  factory ReserveResultResp.fromJson(Map<String, dynamic> json){
    return ReserveResultResp(
      reserveId: json['reserve_id'],
      reserveTime: DateTime.parse(json['reserve_time']),
      dueTime: DateTime.parse(json['due_time']),
    );
  }
}
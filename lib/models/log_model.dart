class LogModel {
  String? eventType;
  String? tableName;
  String? eventTime;
  String? eventData;

  LogModel({
    this.eventType,
    this.tableName,
    this.eventTime,
    this.eventData,
  });

    LogModel.fromJson(Map<String, dynamic> json) {

    if(json["TableName"] is String) {
      tableName = json["TableName"];
    }
    if(json["EventType"] is String) {
      eventType = json["EventType"];
    }
    if(json["EventTime"] is String) {
      eventTime = json["EventTime"];
    }
    if(json["EventData"] is String) {
      eventData = json["EventData"];
    }
    
  }
}

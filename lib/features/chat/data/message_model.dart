// ignore_for_file: public_member_api_docs, sort_constructors_first
class MessageModel {
  int? id;
  int? conversationId;
  String? dateCreate;
  String? message;
  MessageModel({
    this.id,
    this.conversationId,
    this.dateCreate,
    this.message,
  });

  factory MessageModel.fromJson(Map<String, dynamic> json) {
    
    return MessageModel( 
      
      
    );
  }
}

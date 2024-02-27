class IschoolerResponse {
  final bool hasData;
  final Map<String, dynamic> data;

  IschoolerResponse({
    required this.hasData,
    required this.data,
  });
  factory IschoolerResponse.empty() {
    return IschoolerResponse(hasData: false, data: {});
  }

  toJson() {}

/* 
  Map<String, dynamic>? getDocumentData(DocumentSnapshot documentSnapshot) {
   
  } */
}

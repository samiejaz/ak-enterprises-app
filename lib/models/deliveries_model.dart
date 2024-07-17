class DeliveriesModel {
  int voucherID;
  String customerName;
  String voucherNo;
  double amount;
  String status;

  DeliveriesModel({
    required this.voucherID,
    required this.customerName,
    required this.voucherNo,
    required this.amount,
    required this.status,
  });

  factory DeliveriesModel.fromJson(Map<String, dynamic> json) {
    return DeliveriesModel(
      voucherID: json['VoucherID'] ?? 0,
      customerName: json['CustomerName'] ?? '',
      voucherNo: json['VoucherNo'] ?? '',
      amount: (json['Amount'] ?? 0).toDouble(),
      status: json['Status'] ?? '',
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'VoucherID': voucherID,
      'CustomerName': customerName,
      'VoucherNo': voucherNo,
      'Amount': amount,
      'Status': status,
    };
  }
}

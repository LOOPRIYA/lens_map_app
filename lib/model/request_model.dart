class RequestModel {
  final int id;
  final int uid;
  final int cid;
  final int price;
  final bool approveFreelancer;
  final bool approveCustomer;
  final bool reviewCustomer;
  final bool reviewFreelancer;
  const RequestModel({
    required this.uid,
    required this.id,
    required this.price,
    required this.cid,
    required this.reviewCustomer,
    required this.reviewFreelancer,
    required this.approveCustomer,
    required this.approveFreelancer,
});
}
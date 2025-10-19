class User {
  final String id;
  final String email;
  final String name;
  final bool isUmkmOwner;
  final String? umkmId; // If user owns an UMKM

  User({
    required this.id,
    required this.email,
    required this.name,
    this.isUmkmOwner = false,
    this.umkmId,
  });
}
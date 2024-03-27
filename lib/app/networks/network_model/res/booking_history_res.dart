class BookingHistoryRes {
  String? error;
  List<Bookings>? bookings;

  BookingHistoryRes({this.error, this.bookings});

  BookingHistoryRes.fromJson(Map<String, dynamic> json) {
    error = json['error'];
    if (json['bookings'] != null) {
      bookings = <Bookings>[];
      json['bookings'].forEach((v) {
        bookings!.add(new Bookings.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['error'] = this.error;
    if (this.bookings != null) {
      data['bookings'] = this.bookings!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Bookings {
  String? sId;
  String? bookingDate;
  String? bookingTime;
  String? userId;
  List<String>? address;
  int? totalAmount;
  List<String>? product;
  String? bookingId;
  int? iV;

  Bookings(
      {this.sId,
      this.bookingDate,
      this.bookingTime,
      this.userId,
      this.address,
      this.totalAmount,
      this.product,
      this.bookingId,
      this.iV});

  Bookings.fromJson(Map<String, dynamic> json) {
    sId = json['_id'];
    bookingDate = json['bookingDate'];
    bookingTime = json['bookingTime'];
    userId = json['userId'];
    address = json['address'].cast<String>();
    totalAmount = json['totalAmount'];
    product = json['product'].cast<String>();
    bookingId = json['bookingId'];
    iV = json['__v'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['_id'] = this.sId;
    data['bookingDate'] = this.bookingDate;
    data['bookingTime'] = this.bookingTime;
    data['userId'] = this.userId;
    data['address'] = this.address;
    data['totalAmount'] = this.totalAmount;
    data['product'] = this.product;
    data['bookingId'] = this.bookingId;
    data['__v'] = this.iV;
    return data;
  }
}

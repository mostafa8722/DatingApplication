class IndexPeopleRequestModel{
  String? fullName;
  String? gender;
  String? ageGte;
  String? ageLte;
  String? interests0;
  String? interests1;

  IndexPeopleRequestModel({
    this.fullName,
    this.gender,
    this.ageGte,
    this.ageLte,
    this.interests0,
    this.interests1
  });

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['full_name'] = fullName;
    map['gender'] = gender;
    map['age_gte'] = ageGte;
    map['age_lte'] = ageLte;
    map['interests[0]'] = interests0;
    map['interests[1]'] = interests1;
    return map;
  }
}
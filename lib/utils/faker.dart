import 'package:faker_dart/faker_dart.dart';

import '../model/fake/userFakeModel.dart';

 List<UserFakeModel> getHomeUser(){
   List<UserFakeModel> list = [];

   for(int i=0;i<9;i++){
     final faker = Faker.instance;
     list.add(
       UserFakeModel(
         name: faker.name.lastName(),
         status: faker.name.jobTitle(),
         distance: "96"
       )
     );
   }

   return list;
 }
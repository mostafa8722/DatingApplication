import 'dart:convert';

import 'countries.dart';
import 'gateways.dart';
import 'interests.dart';
import 'locales.dart';
import 'prices.dart';
import 'socials.dart';

/// prices : [{"price_chat":5},{"price_chat_gif":5},{"price_chat_gift":5},{"price_chat_kiss":5},{"price_chat_reaction":5},{"price_mail":5},{"price_mail_show":5},{"price_stream":5},{"price_video":5},{"price_voice":5}]
/// countries : [{"id":1,"name":"Afghanistan","phone_prefix":93},{"id":2,"name":"Albania","phone_prefix":355},{"id":3,"name":"Algeria","phone_prefix":213},{"id":4,"name":"American Samoa","phone_prefix":1684},{"id":5,"name":"Andorra","phone_prefix":376},{"id":6,"name":"Angola","phone_prefix":244},{"id":7,"name":"Anguilla","phone_prefix":1264},{"id":8,"name":"Antarctica","phone_prefix":0},{"id":9,"name":"Antigua and Barbuda","phone_prefix":1268},{"id":10,"name":"Argentina","phone_prefix":54},{"id":11,"name":"Armenia","phone_prefix":374},{"id":12,"name":"Aruba","phone_prefix":297},{"id":13,"name":"Australia","phone_prefix":61},{"id":14,"name":"Austria","phone_prefix":43},{"id":15,"name":"Azerbaijan","phone_prefix":994},{"id":16,"name":"Bahamas","phone_prefix":1242},{"id":17,"name":"Bahrain","phone_prefix":973},{"id":18,"name":"Bangladesh","phone_prefix":880},{"id":19,"name":"Barbados","phone_prefix":1246},{"id":20,"name":"Belarus","phone_prefix":375},{"id":21,"name":"Belgium","phone_prefix":32},{"id":22,"name":"Belize","phone_prefix":501},{"id":23,"name":"Benin","phone_prefix":229},{"id":24,"name":"Bermuda","phone_prefix":1441},{"id":25,"name":"Bhutan","phone_prefix":975},{"id":26,"name":"Bolivia","phone_prefix":591},{"id":27,"name":"Bosnia and Herzegovina","phone_prefix":387},{"id":28,"name":"Botswana","phone_prefix":267},{"id":29,"name":"Bouvet Island","phone_prefix":0},{"id":30,"name":"Brazil","phone_prefix":55},{"id":31,"name":"British Indian Ocean Territory","phone_prefix":246},{"id":32,"name":"Brunei Darussalam","phone_prefix":673},{"id":33,"name":"Bulgaria","phone_prefix":359},{"id":34,"name":"Burkina Faso","phone_prefix":226},{"id":35,"name":"Burundi","phone_prefix":257},{"id":36,"name":"Cambodia","phone_prefix":855},{"id":37,"name":"Cameroon","phone_prefix":237},{"id":38,"name":"Canada","phone_prefix":1},{"id":39,"name":"Cape Verde","phone_prefix":238},{"id":40,"name":"Cayman Islands","phone_prefix":1345},{"id":41,"name":"Central African Republic","phone_prefix":236},{"id":42,"name":"Chad","phone_prefix":235},{"id":43,"name":"Chile","phone_prefix":56},{"id":44,"name":"China","phone_prefix":86},{"id":45,"name":"Christmas Island","phone_prefix":61},{"id":46,"name":"Cocos (Keeling) Islands","phone_prefix":672},{"id":47,"name":"Colombia","phone_prefix":57},{"id":48,"name":"Comoros","phone_prefix":269},{"id":49,"name":"Congo","phone_prefix":242},{"id":50,"name":"Congo, the Democratic Republic of the","phone_prefix":242},{"id":51,"name":"Cook Islands","phone_prefix":682},{"id":52,"name":"Costa Rica","phone_prefix":506},{"id":53,"name":"Cote D'Ivoire","phone_prefix":225},{"id":54,"name":"Croatia","phone_prefix":385},{"id":55,"name":"Cuba","phone_prefix":53},{"id":56,"name":"Cyprus","phone_prefix":357},{"id":57,"name":"Czech Republic","phone_prefix":420},{"id":58,"name":"Denmark","phone_prefix":45},{"id":59,"name":"Djibouti","phone_prefix":253},{"id":60,"name":"Dominica","phone_prefix":1767},{"id":61,"name":"Dominican Republic","phone_prefix":1809},{"id":62,"name":"Ecuador","phone_prefix":593},{"id":63,"name":"Egypt","phone_prefix":20},{"id":64,"name":"El Salvador","phone_prefix":503},{"id":65,"name":"Equatorial Guinea","phone_prefix":240},{"id":66,"name":"Eritrea","phone_prefix":291},{"id":67,"name":"Estonia","phone_prefix":372},{"id":68,"name":"Ethiopia","phone_prefix":251},{"id":69,"name":"Falkland Islands (Malvinas)","phone_prefix":500},{"id":70,"name":"Faroe Islands","phone_prefix":298},{"id":71,"name":"Fiji","phone_prefix":679},{"id":72,"name":"Finland","phone_prefix":358},{"id":73,"name":"France","phone_prefix":33},{"id":74,"name":"French Guiana","phone_prefix":594},{"id":75,"name":"French Polynesia","phone_prefix":689},{"id":76,"name":"French Southern Territories","phone_prefix":0},{"id":77,"name":"Gabon","phone_prefix":241},{"id":78,"name":"Gambia","phone_prefix":220},{"id":79,"name":"Georgia","phone_prefix":995},{"id":80,"name":"Germany","phone_prefix":49},{"id":81,"name":"Ghana","phone_prefix":233},{"id":82,"name":"Gibraltar","phone_prefix":350},{"id":83,"name":"Greece","phone_prefix":30},{"id":84,"name":"Greenland","phone_prefix":299},{"id":85,"name":"Grenada","phone_prefix":1473},{"id":86,"name":"Guadeloupe","phone_prefix":590},{"id":87,"name":"Guam","phone_prefix":1671},{"id":88,"name":"Guatemala","phone_prefix":502},{"id":89,"name":"Guinea","phone_prefix":224},{"id":90,"name":"Guinea-Bissau","phone_prefix":245},{"id":91,"name":"Guyana","phone_prefix":592},{"id":92,"name":"Haiti","phone_prefix":509},{"id":93,"name":"Heard Island and Mcdonald Islands","phone_prefix":0},{"id":94,"name":"Holy See (Vatican City State)","phone_prefix":39},{"id":95,"name":"Honduras","phone_prefix":504},{"id":96,"name":"Hong Kong","phone_prefix":852},{"id":97,"name":"Hungary","phone_prefix":36},{"id":98,"name":"Iceland","phone_prefix":354},{"id":99,"name":"India","phone_prefix":91},{"id":100,"name":"Indonesia","phone_prefix":62},{"id":101,"name":"Iran, Islamic Republic of","phone_prefix":98},{"id":102,"name":"Iraq","phone_prefix":964},{"id":103,"name":"Ireland","phone_prefix":353},{"id":104,"name":"Israel","phone_prefix":972},{"id":105,"name":"Italy","phone_prefix":39},{"id":106,"name":"Jamaica","phone_prefix":1876},{"id":107,"name":"Japan","phone_prefix":81},{"id":108,"name":"Jordan","phone_prefix":962},{"id":109,"name":"Kazakhstan","phone_prefix":7},{"id":110,"name":"Kenya","phone_prefix":254},{"id":111,"name":"Kiribati","phone_prefix":686},{"id":112,"name":"Korea, Democratic People's Republic of","phone_prefix":850},{"id":113,"name":"Korea, Republic of","phone_prefix":82},{"id":114,"name":"Kuwait","phone_prefix":965},{"id":115,"name":"Kyrgyzstan","phone_prefix":996},{"id":116,"name":"Lao People's Democratic Republic","phone_prefix":856},{"id":117,"name":"Latvia","phone_prefix":371},{"id":118,"name":"Lebanon","phone_prefix":961},{"id":119,"name":"Lesotho","phone_prefix":266},{"id":120,"name":"Liberia","phone_prefix":231},{"id":121,"name":"Libyan Arab Jamahiriya","phone_prefix":218},{"id":122,"name":"Liechtenstein","phone_prefix":423},{"id":123,"name":"Lithuania","phone_prefix":370},{"id":124,"name":"Luxembourg","phone_prefix":352},{"id":125,"name":"Macao","phone_prefix":853},{"id":126,"name":"Macedonia, the Former Yugoslav Republic of","phone_prefix":389},{"id":127,"name":"Madagascar","phone_prefix":261},{"id":128,"name":"Malawi","phone_prefix":265},{"id":129,"name":"Malaysia","phone_prefix":60},{"id":130,"name":"Maldives","phone_prefix":960},{"id":131,"name":"Mali","phone_prefix":223},{"id":132,"name":"Malta","phone_prefix":356},{"id":133,"name":"Marshall Islands","phone_prefix":692},{"id":134,"name":"Martinique","phone_prefix":596},{"id":135,"name":"Mauritania","phone_prefix":222},{"id":136,"name":"Mauritius","phone_prefix":230},{"id":137,"name":"Mayotte","phone_prefix":269},{"id":138,"name":"Mexico","phone_prefix":52},{"id":139,"name":"Micronesia, Federated States of","phone_prefix":691},{"id":140,"name":"Moldova, Republic of","phone_prefix":373},{"id":141,"name":"Monaco","phone_prefix":377},{"id":142,"name":"Mongolia","phone_prefix":976},{"id":143,"name":"Montserrat","phone_prefix":1664},{"id":144,"name":"Morocco","phone_prefix":212},{"id":145,"name":"Mozambique","phone_prefix":258},{"id":146,"name":"Myanmar","phone_prefix":95},{"id":147,"name":"Namibia","phone_prefix":264},{"id":148,"name":"Nauru","phone_prefix":674},{"id":149,"name":"Nepal","phone_prefix":977},{"id":150,"name":"Netherlands","phone_prefix":31},{"id":151,"name":"Netherlands Antilles","phone_prefix":599},{"id":152,"name":"New Caledonia","phone_prefix":687},{"id":153,"name":"New Zealand","phone_prefix":64},{"id":154,"name":"Nicaragua","phone_prefix":505},{"id":155,"name":"Niger","phone_prefix":227},{"id":156,"name":"Nigeria","phone_prefix":234},{"id":157,"name":"Niue","phone_prefix":683},{"id":158,"name":"Norfolk Island","phone_prefix":672},{"id":159,"name":"Northern Mariana Islands","phone_prefix":1670},{"id":160,"name":"Norway","phone_prefix":47},{"id":161,"name":"Oman","phone_prefix":968},{"id":162,"name":"Pakistan","phone_prefix":92},{"id":163,"name":"Palau","phone_prefix":680},{"id":164,"name":"Palestinian Territory, Occupied","phone_prefix":970},{"id":165,"name":"Panama","phone_prefix":507},{"id":166,"name":"Papua New Guinea","phone_prefix":675},{"id":167,"name":"Paraguay","phone_prefix":595},{"id":168,"name":"Peru","phone_prefix":51},{"id":169,"name":"Philippines","phone_prefix":63},{"id":170,"name":"Pitcairn","phone_prefix":0},{"id":171,"name":"Poland","phone_prefix":48},{"id":172,"name":"Portugal","phone_prefix":351},{"id":173,"name":"Puerto Rico","phone_prefix":1787},{"id":174,"name":"Qatar","phone_prefix":974},{"id":175,"name":"Reunion","phone_prefix":262},{"id":176,"name":"Romania","phone_prefix":40},{"id":177,"name":"Russian Federation","phone_prefix":70},{"id":178,"name":"Rwanda","phone_prefix":250},{"id":179,"name":"Saint Helena","phone_prefix":290},{"id":180,"name":"Saint Kitts and Nevis","phone_prefix":1869},{"id":181,"name":"Saint Lucia","phone_prefix":1758},{"id":182,"name":"Saint Pierre and Miquelon","phone_prefix":508},{"id":183,"name":"Saint Vincent and the Grenadines","phone_prefix":1784},{"id":184,"name":"Samoa","phone_prefix":684},{"id":185,"name":"San Marino","phone_prefix":378},{"id":186,"name":"Sao Tome and Principe","phone_prefix":239},{"id":187,"name":"Saudi Arabia","phone_prefix":966},{"id":188,"name":"Senegal","phone_prefix":221},{"id":189,"name":"Serbia and Montenegro","phone_prefix":381},{"id":190,"name":"Seychelles","phone_prefix":248},{"id":191,"name":"Sierra Leone","phone_prefix":232},{"id":192,"name":"Singapore","phone_prefix":65},{"id":193,"name":"Slovakia","phone_prefix":421},{"id":194,"name":"Slovenia","phone_prefix":386},{"id":195,"name":"Solomon Islands","phone_prefix":677},{"id":196,"name":"Somalia","phone_prefix":252},{"id":197,"name":"South Africa","phone_prefix":27},{"id":198,"name":"South Georgia and the South Sandwich Islands","phone_prefix":0},{"id":199,"name":"Spain","phone_prefix":34},{"id":200,"name":"Sri Lanka","phone_prefix":94},{"id":201,"name":"Sudan","phone_prefix":249},{"id":202,"name":"Suriname","phone_prefix":597},{"id":203,"name":"Svalbard and Jan Mayen","phone_prefix":47},{"id":204,"name":"Swaziland","phone_prefix":268},{"id":205,"name":"Sweden","phone_prefix":46},{"id":206,"name":"Switzerland","phone_prefix":41},{"id":207,"name":"Syrian Arab Republic","phone_prefix":963},{"id":208,"name":"Taiwan, Province of China","phone_prefix":886},{"id":209,"name":"Tajikistan","phone_prefix":992},{"id":210,"name":"Tanzania, United Republic of","phone_prefix":255},{"id":211,"name":"Thailand","phone_prefix":66},{"id":212,"name":"Timor-Leste","phone_prefix":670},{"id":213,"name":"Togo","phone_prefix":228},{"id":214,"name":"Tokelau","phone_prefix":690},{"id":215,"name":"Tonga","phone_prefix":676},{"id":216,"name":"Trinidad and Tobago","phone_prefix":1868},{"id":217,"name":"Tunisia","phone_prefix":216},{"id":218,"name":"Turkey","phone_prefix":90},{"id":219,"name":"Turkmenistan","phone_prefix":7370},{"id":220,"name":"Turks and Caicos Islands","phone_prefix":1649},{"id":221,"name":"Tuvalu","phone_prefix":688},{"id":222,"name":"Uganda","phone_prefix":256},{"id":223,"name":"Ukraine","phone_prefix":380},{"id":224,"name":"United Arab Emirates","phone_prefix":971},{"id":225,"name":"United Kingdom","phone_prefix":44},{"id":226,"name":"United States","phone_prefix":1},{"id":227,"name":"United States Minor Outlying Islands","phone_prefix":1},{"id":228,"name":"Uruguay","phone_prefix":598},{"id":229,"name":"Uzbekistan","phone_prefix":998},{"id":230,"name":"Vanuatu","phone_prefix":678},{"id":231,"name":"Venezuela","phone_prefix":58},{"id":232,"name":"Viet Nam","phone_prefix":84},{"id":233,"name":"Virgin Islands, British","phone_prefix":1284},{"id":234,"name":"Virgin Islands, U.S.","phone_prefix":1340},{"id":235,"name":"Wallis and Futuna","phone_prefix":681},{"id":236,"name":"Western Sahara","phone_prefix":212},{"id":237,"name":"Yemen","phone_prefix":967},{"id":238,"name":"Zambia","phone_prefix":260},{"id":239,"name":"Zimbabwe","phone_prefix":263},{"id":240,"name":"Serbia","phone_prefix":381},{"id":241,"name":"Asia / Pacific Region","phone_prefix":0},{"id":242,"name":"Montenegro","phone_prefix":382},{"id":243,"name":"Aland Islands","phone_prefix":358},{"id":244,"name":"Bonaire, Sint Eustatius and Saba","phone_prefix":599},{"id":245,"name":"Curacao","phone_prefix":599},{"id":246,"name":"Guernsey","phone_prefix":44},{"id":247,"name":"Isle of Man","phone_prefix":44},{"id":248,"name":"Jersey","phone_prefix":44},{"id":249,"name":"Kosovo","phone_prefix":381},{"id":250,"name":"Saint Barthelemy","phone_prefix":590},{"id":251,"name":"Saint Martin","phone_prefix":590},{"id":252,"name":"Sint Maarten","phone_prefix":1},{"id":253,"name":"South Sudan","phone_prefix":211}]
/// gateways : [{"id":1,"name":"PayPal","image":"http://dating.ultimatesoft.co/uploads/gateways/paypal.png"}]
/// socials : {"facebook":"#","youtube":"#","instagram":"#","linkedin":"#","whatsapp":"#","phone":"+1 123 456 7892"}
/// interests : [{"id":1,"name":"Mr. Darrick Leuschke","image":"http://dating.ultimatesoft.co/uploads/no_image.jpeg"},{"id":2,"name":"Tatyana Stiedemann","image":"http://dating.ultimatesoft.co/uploads/no_image.jpeg"},{"id":3,"name":"Leola Pouros","image":"http://dating.ultimatesoft.co/uploads/no_image.jpeg"},{"id":4,"name":"Jaylon Schoen","image":"http://dating.ultimatesoft.co/uploads/no_image.jpeg"},{"id":5,"name":"Cali Kilback","image":"http://dating.ultimatesoft.co/uploads/no_image.jpeg"},{"id":6,"name":"Dr. Jules Stiedemann","image":"http://dating.ultimatesoft.co/uploads/no_image.jpeg"},{"id":7,"name":"Mr. Oswald Metz V","image":"http://dating.ultimatesoft.co/uploads/no_image.jpeg"},{"id":8,"name":"Dee Schoen","image":"http://dating.ultimatesoft.co/uploads/no_image.jpeg"},{"id":9,"name":"Trinity Nikolaus","image":"http://dating.ultimatesoft.co/uploads/no_image.jpeg"},{"id":10,"name":"Kayley Kuhlman","image":"http://dating.ultimatesoft.co/uploads/no_image.jpeg"},{"id":11,"name":"Jessika Koepp","image":"http://dating.ultimatesoft.co/uploads/no_image.jpeg"},{"id":12,"name":"Emely Zieme II","image":"http://dating.ultimatesoft.co/uploads/no_image.jpeg"},{"id":13,"name":"Demario Dickinson","image":"http://dating.ultimatesoft.co/uploads/no_image.jpeg"},{"id":14,"name":"Vena Wolf","image":"http://dating.ultimatesoft.co/uploads/no_image.jpeg"},{"id":15,"name":"Frederik O'Kon DDS","image":"http://dating.ultimatesoft.co/uploads/no_image.jpeg"},{"id":16,"name":"Chance VonRueden IV","image":"http://dating.ultimatesoft.co/uploads/no_image.jpeg"},{"id":17,"name":"Rebecca Medhurst","image":"http://dating.ultimatesoft.co/uploads/no_image.jpeg"},{"id":18,"name":"Rafael Legros","image":"http://dating.ultimatesoft.co/uploads/no_image.jpeg"},{"id":19,"name":"Saul Bins","image":"http://dating.ultimatesoft.co/uploads/no_image.jpeg"},{"id":20,"name":"Prof. Dudley Wehner II","image":"http://dating.ultimatesoft.co/uploads/no_image.jpeg"},{"id":21,"name":"Bette Leuschke Jr.","image":"http://dating.ultimatesoft.co/uploads/no_image.jpeg"},{"id":22,"name":"Daniella Kilback","image":"http://dating.ultimatesoft.co/uploads/no_image.jpeg"},{"id":23,"name":"Dr. Myron Runolfsson","image":"http://dating.ultimatesoft.co/uploads/no_image.jpeg"},{"id":24,"name":"Albin Grimes","image":"http://dating.ultimatesoft.co/uploads/no_image.jpeg"},{"id":25,"name":"Dr. Francis Cormier IV","image":"http://dating.ultimatesoft.co/uploads/no_image.jpeg"},{"id":26,"name":"Jerry Kuhlman","image":"http://dating.ultimatesoft.co/uploads/no_image.jpeg"},{"id":27,"name":"Darrion Cummerata","image":"http://dating.ultimatesoft.co/uploads/no_image.jpeg"},{"id":28,"name":"Chadrick Koss","image":"http://dating.ultimatesoft.co/uploads/no_image.jpeg"},{"id":29,"name":"Prof. Norbert Blick","image":"http://dating.ultimatesoft.co/uploads/no_image.jpeg"},{"id":30,"name":"Kyra Predovic PhD","image":"http://dating.ultimatesoft.co/uploads/no_image.jpeg"},{"id":31,"name":"Prof. Marcelo Wolf III","image":"http://dating.ultimatesoft.co/uploads/no_image.jpeg"},{"id":32,"name":"Dr. Ferne Leannon Sr.","image":"http://dating.ultimatesoft.co/uploads/no_image.jpeg"},{"id":33,"name":"Beth Hills PhD","image":"http://dating.ultimatesoft.co/uploads/no_image.jpeg"},{"id":34,"name":"Mr. Keegan Block V","image":"http://dating.ultimatesoft.co/uploads/no_image.jpeg"},{"id":35,"name":"Amanda Ruecker","image":"http://dating.ultimatesoft.co/uploads/no_image.jpeg"},{"id":36,"name":"Darius Olson V","image":"http://dating.ultimatesoft.co/uploads/no_image.jpeg"},{"id":37,"name":"Jazmin Schaefer","image":"http://dating.ultimatesoft.co/uploads/no_image.jpeg"},{"id":38,"name":"Bill Herman","image":"http://dating.ultimatesoft.co/uploads/no_image.jpeg"},{"id":39,"name":"Raven Stoltenberg","image":"http://dating.ultimatesoft.co/uploads/no_image.jpeg"},{"id":40,"name":"Mrs. Joanny Feil V","image":"http://dating.ultimatesoft.co/uploads/no_image.jpeg"},{"id":41,"name":"Jena Corwin","image":"http://dating.ultimatesoft.co/uploads/no_image.jpeg"},{"id":42,"name":"Prof. Trenton Walker MD","image":"http://dating.ultimatesoft.co/uploads/no_image.jpeg"},{"id":43,"name":"Andre Goldner","image":"http://dating.ultimatesoft.co/uploads/no_image.jpeg"},{"id":44,"name":"Prof. Madyson Hermann II","image":"http://dating.ultimatesoft.co/uploads/no_image.jpeg"},{"id":45,"name":"Candelario Runolfsson DVM","image":"http://dating.ultimatesoft.co/uploads/no_image.jpeg"},{"id":46,"name":"Rubye Heaney IV","image":"http://dating.ultimatesoft.co/uploads/no_image.jpeg"},{"id":47,"name":"Dasia Hansen","image":"http://dating.ultimatesoft.co/uploads/no_image.jpeg"},{"id":48,"name":"Hank Kemmer PhD","image":"http://dating.ultimatesoft.co/uploads/no_image.jpeg"},{"id":49,"name":"Dr. Eulalia Hintz","image":"http://dating.ultimatesoft.co/uploads/no_image.jpeg"},{"id":50,"name":"Marlene Hayes","image":"http://dating.ultimatesoft.co/uploads/no_image.jpeg"}]
/// locales : [{"id":1,"name":"English","iso_code":"en","dir":"LTR","deleted_at":null,"created_at":"2022-12-06T15:56:02.000000Z","updated_at":"2022-12-06T15:56:02.000000Z"}]

Initialize initializeFromJson(String str) => Initialize.fromJson(json.decode(str));
String initializeToJson(Initialize data) => json.encode(data.toJson());
class Initialize {
  Initialize({
      List<Prices>? prices, 
      List<Countries>? countries, 
      List<Gateways>? gateways, 
      Socials? socials, 
      List<Interests>? interests, 
      List<Locales>? locales,}){
    _prices = prices;
    _countries = countries;
    _gateways = gateways;
    _socials = socials;
    _interests = interests;
    _locales = locales;
}

  Initialize.fromJson(dynamic json) {
    if (json['prices'] != null) {
      _prices = [];
      json['prices'].forEach((v) {
        _prices?.add(Prices.fromJson(v));
      });
    }
    if (json['countries'] != null) {
      _countries = [];
      json['countries'].forEach((v) {
        _countries?.add(Countries.fromJson(v));
      });
    }
    if (json['gateways'] != null) {
      _gateways = [];
      json['gateways'].forEach((v) {
        _gateways?.add(Gateways.fromJson(v));
      });
    }
    _socials = json['socials'] != null ? Socials.fromJson(json['socials']) : null;
    if (json['interests'] != null) {
      _interests = [];
      json['interests'].forEach((v) {
        _interests?.add(Interests.fromJson(v));
      });
    }
    if (json['locales'] != null) {
      _locales = [];
      json['locales'].forEach((v) {
        _locales?.add(Locales.fromJson(v));
      });
    }
  }
  List<Prices>? _prices;
  List<Countries>? _countries;
  List<Gateways>? _gateways;
  Socials? _socials;
  List<Interests>? _interests;
  List<Locales>? _locales;
Initialize copyWith({  List<Prices>? prices,
  List<Countries>? countries,
  List<Gateways>? gateways,
  Socials? socials,
  List<Interests>? interests,
  List<Locales>? locales,
}) => Initialize(  prices: prices ?? _prices,
  countries: countries ?? _countries,
  gateways: gateways ?? _gateways,
  socials: socials ?? _socials,
  interests: interests ?? _interests,
  locales: locales ?? _locales,
);
  List<Prices>? get prices => _prices;
  List<Countries>? get countries => _countries;
  List<Gateways>? get gateways => _gateways;
  Socials? get socials => _socials;
  List<Interests>? get interests => _interests;
  List<Locales>? get locales => _locales;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    if (_prices != null) {
      map['prices'] = _prices?.map((v) => v.toJson()).toList();
    }
    if (_countries != null) {
      map['countries'] = _countries?.map((v) => v.toJson()).toList();
    }
    if (_gateways != null) {
      map['gateways'] = _gateways?.map((v) => v.toJson()).toList();
    }
    if (_socials != null) {
      map['socials'] = _socials?.toJson();
    }
    if (_interests != null) {
      map['interests'] = _interests?.map((v) => v.toJson()).toList();
    }
    if (_locales != null) {
      map['locales'] = _locales?.map((v) => v.toJson()).toList();
    }
    return map;
  }

}

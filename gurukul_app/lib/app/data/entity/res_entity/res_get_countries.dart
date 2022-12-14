
import 'dart:convert';

class ResCountries {

  static var data = ResCountries.fromJson(jsonDecode(jsonCountries));

  ResCountries({
    this.countries,
  });

  List<Country>? countries;

  factory ResCountries.fromJson(Map<String, dynamic> json) => ResCountries(
    countries: List<Country>.from(json["countries"].map((x) => Country.fromJson(x))),
  );

}

class Country {
  Country({
    this.id,
    this.city,
    this.state,
    this.country,
  });

  String? id;
  String? city;
  String? state;
  String? country;

  factory Country.fromJson(Map<String, dynamic> json) => Country(
    id: json["id"],
    city: json["city"],
    state: json["state"],
    country: json["country"],
  );
}


// class ResCountries {
//
//   static var data = ResCountries.fromJson(jsonDecode(jsonCountries));
//
//   ResCountries({
//     this.countries,
//   });
//
//   List<Country>? countries;
//
//   factory ResCountries.fromJson(Map<String, dynamic> json) => ResCountries(
//     countries: List<Country>.from(json["countries"].map((x) => Country.fromJson(x))),
//   );
//
//   Map<String, dynamic> toJson() => {
//     "countries": List<dynamic>.from(countries!.map((x) => x.toJson())),
//   };
// }
//
// class Country {
//   Country({
//     this.country,
//     this.states,
//   });
//
//   String? country;
//   List<ResState>? states;
//
//   factory Country.fromJson(Map<String, dynamic> json) => Country(
//     country: json["country"],
//     states: List<ResState>.from(json["states"].map((x) => ResState.fromJson(x))),
//   );
//
//   Map<String, dynamic> toJson() => {
//     "country": country,
//     "states": List<dynamic>.from(states!.map((x) => x.toJson())),
//   };
// }
//
// class ResState {
//   ResState({
//     this.state,
//     this.cities,
//   });
//
//   String? state;
//   List<String>? cities;
//
//   factory ResState.fromJson(Map<String, dynamic> json) => ResState(
//     state: json["state"],
//     cities: List<String>.from(json["cities"].map((x) => x)),
//   );
//
//   Map<String, dynamic> toJson() => {
//     "state": state,
//     "cities": List<dynamic>.from(cities!.map((x) => x)),
//   };
// }

String jsonCountries = """{
    "countries": [{
		"id": "1",
		"city": "Mumbai",
		"state": "Maharashtra",
		"country": "India"
	},
	{
		"id": "2",
		"city": "Delhi",
		"state": "Delhi",
		"country": "India"
	},
	{
		"id": "3",
		"city": "Bengaluru",
		"state": "Karnataka",
		"country": "India"
	},
	{
		"id": "4",
		"city": "Ahmedabad",
		"state": "Gujarat",
		"country": "India"
	},
	{
		"id": "5",
		"city": "Hyderabad",
		"state": "Telangana",
		"country": "India"
	},
	{
		"id": "6",
		"city": "Chennai",
		"state": "Tamil Nadu",
		"country": "India"
	},
	{
		"id": "7",
		"city": "Kolkata",
		"state": "West Bengal",
		"country": "India"
	},
	{
		"id": "8",
		"city": "Pune",
		"state": "Maharashtra",
		"country": "India"
	},
	{
		"id": "9",
		"city": "Jaipur",
		"state": "Rajasthan",
		"country": "India"
	},
	{
		"id": "10",
		"city": "Surat",
		"state": "Gujarat",
		"country": "India"
	},
	{
		"id": "11",
		"city": "Lucknow",
		"state": "Uttar Pradesh",
		"country": "India"
	},
	{
		"id": "12",
		"city": "Kanpur",
		"state": "Uttar Pradesh",
		"country": "India"
	},
	{
		"id": "13",
		"city": "Nagpur",
		"state": "Maharashtra",
		"country": "India"
	},
	{
		"id": "14",
		"city": "Patna",
		"state": "Bihar",
		"country": "India"
	},
	{
		"id": "15",
		"city": "Indore",
		"state": "Madhya Pradesh",
		"country": "India"
	},
	{
		"id": "16",
		"city": "Thane",
		"state": "Maharashtra",
		"country": "India"
	},
	{
		"id": "17",
		"city": "Bhopal",
		"state": "Madhya Pradesh",
		"country": "India"
	},
	{
		"id": "18",
		"city": "Visakhapatnam",
		"state": "Andhra Pradesh",
		"country": "India"
	},
	{
		"id": "19",
		"city": "Vadodara",
		"state": "Gujarat",
		"country": "India"
	},
	{
		"id": "20",
		"city": "Firozabad",
		"state": "Uttar Pradesh",
		"country": "India"
	},
	{
		"id": "21",
		"city": "Ludhiana",
		"state": "Punjab",
		"country": "India"
	},
	{
		"id": "22",
		"city": "Rajkot",
		"state": "Gujarat",
		"country": "India"
	},
	{
		"id": "23",
		"city": "Agra",
		"state": "Uttar Pradesh",
		"country": "India"
	},
	{
		"id": "24",
		"city": "Siliguri",
		"state": "West Bengal",
		"country": "India"
	},
	{
		"id": "25",
		"city": "Nashik",
		"state": "Maharashtra",
		"country": "India"
	},
	{
		"id": "26",
		"city": "Faridabad",
		"state": "Haryana",
		"country": "India"
	},
	{
		"id": "27",
		"city": "Patiala",
		"state": "Punjab",
		"country": "India"
	},
	{
		"id": "28",
		"city": "Meerut",
		"state": "Uttar Pradesh",
		"country": "India"
	},
	{
		"id": "29",
		"city": "Kalyan-Dombivali",
		"state": "Maharashtra",
		"country": "India"
	},
	{
		"id": "30",
		"city": "Vasai-Virar",
		"state": "Maharashtra",
		"country": "India"
	},
	{
		"id": "31",
		"city": "Varanasi",
		"state": "Uttar Pradesh",
		"country": "India"
	},
	{
		"id": "32",
		"city": "Srinagar",
		"state": "Jammu and Kashmir",
		"country": "India"
	},
	{
		"id": "33",
		"city": "Dhanbad",
		"state": "Jharkhand",
		"country": "India"
	},
	{
		"id": "34",
		"city": "Jodhpur",
		"state": "Rajasthan",
		"country": "India"
	},
	{
		"id": "35",
		"city": "Amritsar",
		"state": "Punjab",
		"country": "India"
	},
	{
		"id": "36",
		"city": "Raipur",
		"state": "Chhattisgarh",
		"country": "India"
	},
	{
		"id": "37",
		"city": "Allahabad",
		"state": "Uttar Pradesh",
		"country": "India"
	},
	{
		"id": "38",
		"city": "Coimbatore",
		"state": "Tamil Nadu",
		"country": "India"
	},
	{
		"id": "39",
		"city": "Jabalpur",
		"state": "Madhya Pradesh",
		"country": "India"
	},
	{
		"id": "40",
		"city": "Gwalior",
		"state": "Madhya Pradesh",
		"country": "India"
	},
	{
		"id": "41",
		"city": "Vijayawada",
		"state": "Andhra Pradesh",
		"country": "India"
	},
	{
		"id": "42",
		"city": "Madurai",
		"state": "Tamil Nadu",
		"country": "India"
	},
	{
		"id": "43",
		"city": "Guwahati",
		"state": "Assam",
		"country": "India"
	},
	{
		"id": "44",
		"city": "Chandigarh",
		"state": "Chandigarh",
		"country": "India"
	},
	{
		"id": "45",
		"city": "Hubli-Dharwad",
		"state": "Karnataka",
		"country": "India"
	},
	{
		"id": "46",
		"city": "Amroha",
		"state": "Uttar Pradesh",
		"country": "India"
	},
	{
		"id": "47",
		"city": "Moradabad",
		"state": "Uttar Pradesh",
		"country": "India"
	},
	{
		"id": "48",
		"city": "Gurgaon",
		"state": "Haryana",
		"country": "India"
	},
	{
		"id": "49",
		"city": "Aligarh",
		"state": "Uttar Pradesh",
		"country": "India"
	},
	{
		"id": "50",
		"city": "Solapur",
		"state": "Maharashtra",
		"country": "India"
	},
	{
		"id": "51",
		"city": "Ranchi",
		"state": "Jharkhand",
		"country": "India"
	},
	{
		"id": "52",
		"city": "Jalandhar",
		"state": "Punjab",
		"country": "India"
	},
	{
		"id": "53",
		"city": "Tiruchirappalli",
		"state": "Tamil Nadu",
		"country": "India"
	},
	{
		"id": "54",
		"city": "Bhubaneswar",
		"state": "Odisha",
		"country": "India"
	},
	{
		"id": "55",
		"city": "Salem",
		"state": "Tamil Nadu",
		"country": "India"
	},
	{
		"id": "56",
		"city": "Warangal",
		"state": "Telangana",
		"country": "India"
	},
	{
		"id": "57",
		"city": "Mira-Bhayandar",
		"state": "Maharashtra",
		"country": "India"
	},
	{
		"id": "58",
		"city": "Thiruvananthapuram",
		"state": "Kerala",
		"country": "India"
	},
	{
		"id": "59",
		"city": "Bhiwandi",
		"state": "Maharashtra",
		"country": "India"
	},
	{
		"id": "60",
		"city": "Saharanpur",
		"state": "Uttar Pradesh",
		"country": "India"
	},
	{
		"id": "61",
		"city": "Guntur",
		"state": "Andhra Pradesh",
		"country": "India"
	},
	{
		"id": "62",
		"city": "Amravati",
		"state": "Maharashtra",
		"country": "India"
	},
	{
		"id": "63",
		"city": "Bikaner",
		"state": "Rajasthan",
		"country": "India"
	},
	{
		"id": "64",
		"city": "Noida",
		"state": "Uttar Pradesh",
		"country": "India"
	},
	{
		"id": "65",
		"city": "Jamshedpur",
		"state": "Jharkhand",
		"country": "India"
	},
	{
		"id": "66",
		"city": "Bhilai Nagar",
		"state": "Chhattisgarh",
		"country": "India"
	},
	{
		"id": "67",
		"city": "Cuttack",
		"state": "Odisha",
		"country": "India"
	},
	{
		"id": "68",
		"city": "Kochi",
		"state": "Kerala",
		"country": "India"
	},
	{
		"id": "69",
		"city": "Udaipur",
		"state": "Rajasthan",
		"country": "India"
	},
	{
		"id": "70",
		"city": "Bhavnagar",
		"state": "Gujarat",
		"country": "India"
	},
	{
		"id": "71",
		"city": "Dehradun",
		"state": "Uttarakhand",
		"country": "India"
	},
	{
		"id": "72",
		"city": "Asansol",
		"state": "West Bengal",
		"country": "India"
	},
	{
		"id": "73",
		"city": "Nanded-Waghala",
		"state": "Maharashtra",
		"country": "India"
	},
	{
		"id": "74",
		"city": "Ajmer",
		"state": "Rajasthan",
		"country": "India"
	},
	{
		"id": "75",
		"city": "Jamnagar",
		"state": "Gujarat",
		"country": "India"
	},
	{
		"id": "76",
		"city": "Ujjain",
		"state": "Madhya Pradesh",
		"country": "India"
	},
	{
		"id": "77",
		"city": "Sangli",
		"state": "Maharashtra",
		"country": "India"
	},
	{
		"id": "78",
		"city": "Loni",
		"state": "Uttar Pradesh",
		"country": "India"
	},
	{
		"id": "79",
		"city": "Jhansi",
		"state": "Uttar Pradesh",
		"country": "India"
	},
	{
		"id": "80",
		"city": "Pondicherry",
		"state": "Puducherry",
		"country": "India"
	},
	{
		"id": "81",
		"city": "Nellore",
		"state": "Andhra Pradesh",
		"country": "India"
	},
	{
		"id": "82",
		"city": "Jammu",
		"state": "Jammu and Kashmir",
		"country": "India"
	},
	{
		"id": "83",
		"city": "Belagavi",
		"state": "Karnataka",
		"country": "India"
	},
	{
		"id": "84",
		"city": "Raurkela",
		"state": "Odisha",
		"country": "India"
	},
	{
		"id": "85",
		"city": "Mangaluru",
		"state": "Karnataka",
		"country": "India"
	},
	{
		"id": "86",
		"city": "Tirunelveli",
		"state": "Tamil Nadu",
		"country": "India"
	},
	{
		"id": "87",
		"city": "Malegaon",
		"state": "Maharashtra",
		"country": "India"
	},
	{
		"id": "88",
		"city": "Gaya",
		"state": "Bihar",
		"country": "India"
	},
	{
		"id": "89",
		"city": "Tiruppur",
		"state": "Tamil Nadu",
		"country": "India"
	},
	{
		"id": "90",
		"city": "Davanagere",
		"state": "Karnataka",
		"country": "India"
	},
	{
		"id": "91",
		"city": "Kozhikode",
		"state": "Kerala",
		"country": "India"
	},
	{
		"id": "92",
		"city": "Akola",
		"state": "Maharashtra",
		"country": "India"
	},
	{
		"id": "93",
		"city": "Kurnool",
		"state": "Andhra Pradesh",
		"country": "India"
	},
	{
		"id": "94",
		"city": "Bokaro Steel City",
		"state": "Jharkhand",
		"country": "India"
	},
	{
		"id": "95",
		"city": "Rajahmundry",
		"state": "Andhra Pradesh",
		"country": "India"
	},
	{
		"id": "96",
		"city": "Ballari",
		"state": "Karnataka",
		"country": "India"
	},
	{
		"id": "97",
		"city": "Agartala",
		"state": "Tripura",
		"country": "India"
	},
	{
		"id": "98",
		"city": "Bhagalpur",
		"state": "Bihar",
		"country": "India"
	},
	{
		"id": "99",
		"city": "Latur",
		"state": "Maharashtra",
		"country": "India"
	},
	{
		"id": "100",
		"city": "Dhule",
		"state": "Maharashtra",
		"country": "India"
	},
	{
		"id": "101",
		"city": "Korba",
		"state": "Chhattisgarh",
		"country": "India"
	},
	{
		"id": "102",
		"city": "Bhilwara",
		"state": "Rajasthan",
		"country": "India"
	},
	{
		"id": "103",
		"city": "Brahmapur",
		"state": "Odisha",
		"country": "India"
	},
	{
		"id": "104",
		"city": "Mysore",
		"state": "Karnataka",
		"country": "India"
	},
	{
		"id": "105",
		"city": "Muzaffarpur",
		"state": "Bihar",
		"country": "India"
	},
	{
		"id": "106",
		"city": "Ahmednagar",
		"state": "Maharashtra",
		"country": "India"
	},
	{
		"id": "107",
		"city": "Kollam",
		"state": "Kerala",
		"country": "India"
	},
	{
		"id": "108",
		"city": "Raghunathganj",
		"state": "West Bengal",
		"country": "India"
	},
	{
		"id": "109",
		"city": "Bilaspur",
		"state": "Chhattisgarh",
		"country": "India"
	},
	{
		"id": "110",
		"city": "Shahjahanpur",
		"state": "Uttar Pradesh",
		"country": "India"
	},
	{
		"id": "111",
		"city": "Thrissur",
		"state": "Kerala",
		"country": "India"
	},
	{
		"id": "112",
		"city": "Alwar",
		"state": "Rajasthan",
		"country": "India"
	},
	{
		"id": "113",
		"city": "Kakinada",
		"state": "Andhra Pradesh",
		"country": "India"
	},
	{
		"id": "114",
		"city": "Nizamabad",
		"state": "Telangana",
		"country": "India"
	},
	{
		"id": "115",
		"city": "Sagar",
		"state": "Madhya Pradesh",
		"country": "India"
	},
	{
		"id": "116",
		"city": "Tumkur",
		"state": "Karnataka",
		"country": "India"
	},
	{
		"id": "117",
		"city": "Hisar",
		"state": "Haryana",
		"country": "India"
	},
	{
		"id": "118",
		"city": "Rohtak",
		"state": "Haryana",
		"country": "India"
	},
	{
		"id": "119",
		"city": "Panipat",
		"state": "Haryana",
		"country": "India"
	},
	{
		"id": "120",
		"city": "Darbhanga",
		"state": "Bihar",
		"country": "India"
	},
	{
		"id": "121",
		"city": "Kharagpur",
		"state": "West Bengal",
		"country": "India"
	},
	{
		"id": "122",
		"city": "Aizawl",
		"state": "Mizoram",
		"country": "India"
	},
	{
		"id": "123",
		"city": "Ichalkaranji",
		"state": "Maharashtra",
		"country": "India"
	},
	{
		"id": "124",
		"city": "Tirupati",
		"state": "Andhra Pradesh",
		"country": "India"
	},
	{
		"id": "125",
		"city": "Karnal",
		"state": "Haryana",
		"country": "India"
	},
	{
		"id": "126",
		"city": "Bathinda",
		"state": "Punjab",
		"country": "India"
	},
	{
		"id": "127",
		"city": "Rampur",
		"state": "Uttar Pradesh",
		"country": "India"
	},
	{
		"id": "128",
		"city": "Shivamogga",
		"state": "Karnataka",
		"country": "India"
	},
	{
		"id": "129",
		"city": "Ratlam",
		"state": "Madhya Pradesh",
		"country": "India"
	},
	{
		"id": "130",
		"city": "Modinagar",
		"state": "Uttar Pradesh",
		"country": "India"
	},
	{
		"id": "131",
		"city": "Durg",
		"state": "Chhattisgarh",
		"country": "India"
	},
	{
		"id": "132",
		"city": "Shillong",
		"state": "Meghalaya",
		"country": "India"
	},
	{
		"id": "133",
		"city": "Imphal",
		"state": "Manipur",
		"country": "India"
	},
	{
		"id": "134",
		"city": "Hapur",
		"state": "Uttar Pradesh",
		"country": "India"
	},
	{
		"id": "135",
		"city": "Ranipet",
		"state": "Tamil Nadu",
		"country": "India"
	},
	{
		"id": "136",
		"city": "Anantapur",
		"state": "Andhra Pradesh",
		"country": "India"
	},
	{
		"id": "137",
		"city": "Arrah",
		"state": "Bihar",
		"country": "India"
	},
	{
		"id": "138",
		"city": "Karimnagar",
		"state": "Telangana",
		"country": "India"
	},
	{
		"id": "139",
		"city": "Parbhani",
		"state": "Maharashtra",
		"country": "India"
	},
	{
		"id": "140",
		"city": "Etawah",
		"state": "Uttar Pradesh",
		"country": "India"
	},
	{
		"id": "141",
		"city": "Bharatpur",
		"state": "Rajasthan",
		"country": "India"
	},
	{
		"id": "142",
		"city": "Begusarai",
		"state": "Bihar",
		"country": "India"
	},
	{
		"id": "143",
		"city": "New Delhi",
		"state": "Delhi",
		"country": "India"
	},
	{
		"id": "144",
		"city": "Chhapra",
		"state": "Bihar",
		"country": "India"
	},
	{
		"id": "145",
		"city": "Kadapa",
		"state": "Andhra Pradesh",
		"country": "India"
	},
	{
		"id": "146",
		"city": "Ramagundam",
		"state": "Telangana",
		"country": "India"
	},
	{
		"id": "147",
		"city": "Pali",
		"state": "Rajasthan",
		"country": "India"
	},
	{
		"id": "148",
		"city": "Satna",
		"state": "Madhya Pradesh",
		"country": "India"
	},
	{
		"id": "149",
		"city": "Vizianagaram",
		"state": "Andhra Pradesh",
		"country": "India"
	},
	{
		"id": "150",
		"city": "Katihar",
		"state": "Bihar",
		"country": "India"
	},
	{
		"id": "151",
		"city": "Hardwar",
		"state": "Uttarakhand",
		"country": "India"
	},
	{
		"id": "152",
		"city": "Sonipat",
		"state": "Haryana",
		"country": "India"
	},
	{
		"id": "153",
		"city": "Nagercoil",
		"state": "Tamil Nadu",
		"country": "India"
	},
	{
		"id": "154",
		"city": "Thanjavur",
		"state": "Tamil Nadu",
		"country": "India"
	},
	{
		"id": "155",
		"city": "Murwara (Katni)",
		"state": "Madhya Pradesh",
		"country": "India"
	},
	{
		"id": "156",
		"city": "Naihati",
		"state": "West Bengal",
		"country": "India"
	},
	{
		"id": "157",
		"city": "Sambhal",
		"state": "Uttar Pradesh",
		"country": "India"
	},
	{
		"id": "158",
		"city": "Nadiad",
		"state": "Gujarat",
		"country": "India"
	},
	{
		"id": "159",
		"city": "Yamunanagar",
		"state": "Haryana",
		"country": "India"
	},
	{
		"id": "160",
		"city": "English Bazar",
		"state": "West Bengal",
		"country": "India"
	},
	{
		"id": "161",
		"city": "Eluru",
		"state": "Andhra Pradesh",
		"country": "India"
	},
	{
		"id": "162",
		"city": "Munger",
		"state": "Bihar",
		"country": "India"
	},
	{
		"id": "163",
		"city": "Panchkula",
		"state": "Haryana",
		"country": "India"
	},
	{
		"id": "164",
		"city": "Raayachuru",
		"state": "Karnataka",
		"country": "India"
	},
	{
		"id": "165",
		"city": "Panvel",
		"state": "Maharashtra",
		"country": "India"
	},
	{
		"id": "166",
		"city": "Deoghar",
		"state": "Jharkhand",
		"country": "India"
	},
	{
		"id": "167",
		"city": "Ongole",
		"state": "Andhra Pradesh",
		"country": "India"
	},
	{
		"id": "168",
		"city": "Nandyal",
		"state": "Andhra Pradesh",
		"country": "India"
	},
	{
		"id": "169",
		"city": "Morena",
		"state": "Madhya Pradesh",
		"country": "India"
	},
	{
		"id": "170",
		"city": "Bhiwani",
		"state": "Haryana",
		"country": "India"
	},
	{
		"id": "171",
		"city": "Porbandar",
		"state": "Gujarat",
		"country": "India"
	},
	{
		"id": "172",
		"city": "Palakkad",
		"state": "Kerala",
		"country": "India"
	},
	{
		"id": "173",
		"city": "Anand",
		"state": "Gujarat",
		"country": "India"
	},
	{
		"id": "174",
		"city": "Purnia",
		"state": "Bihar",
		"country": "India"
	},
	{
		"id": "175",
		"city": "Baharampur",
		"state": "West Bengal",
		"country": "India"
	},
	{
		"id": "176",
		"city": "Barmer",
		"state": "Rajasthan",
		"country": "India"
	},
	{
		"id": "177",
		"city": "Morbi",
		"state": "Gujarat",
		"country": "India"
	},
	{
		"id": "178",
		"city": "Orai",
		"state": "Uttar Pradesh",
		"country": "India"
	},
	{
		"id": "179",
		"city": "Bahraich",
		"state": "Uttar Pradesh",
		"country": "India"
	},
	{
		"id": "180",
		"city": "Sikar",
		"state": "Rajasthan",
		"country": "India"
	},
	{
		"id": "181",
		"city": "Vellore",
		"state": "Tamil Nadu",
		"country": "India"
	},
	{
		"id": "182",
		"city": "Singrauli",
		"state": "Madhya Pradesh",
		"country": "India"
	},
	{
		"id": "183",
		"city": "Khammam",
		"state": "Telangana",
		"country": "India"
	},
	{
		"id": "184",
		"city": "Mahesana",
		"state": "Gujarat",
		"country": "India"
	},
	{
		"id": "185",
		"city": "Silchar",
		"state": "Assam",
		"country": "India"
	},
	{
		"id": "186",
		"city": "Sambalpur",
		"state": "Odisha",
		"country": "India"
	},
	{
		"id": "187",
		"city": "Rewa",
		"state": "Madhya Pradesh",
		"country": "India"
	},
	{
		"id": "188",
		"city": "Unnao",
		"state": "Uttar Pradesh",
		"country": "India"
	},
	{
		"id": "189",
		"city": "Hugli-Chinsurah",
		"state": "West Bengal",
		"country": "India"
	},
	{
		"id": "190",
		"city": "Raiganj",
		"state": "West Bengal",
		"country": "India"
	},
	{
		"id": "191",
		"city": "Phusro",
		"state": "Jharkhand",
		"country": "India"
	},
	{
		"id": "192",
		"city": "Adityapur",
		"state": "Jharkhand",
		"country": "India"
	},
	{
		"id": "193",
		"city": "Alappuzha",
		"state": "Kerala",
		"country": "India"
	},
	{
		"id": "194",
		"city": "Bahadurgarh",
		"state": "Haryana",
		"country": "India"
	},
	{
		"id": "195",
		"city": "Machilipatnam",
		"state": "Andhra Pradesh",
		"country": "India"
	},
	{
		"id": "196",
		"city": "Rae Bareli",
		"state": "Uttar Pradesh",
		"country": "India"
	},
	{
		"id": "197",
		"city": "Jalpaiguri",
		"state": "West Bengal",
		"country": "India"
	},
	{
		"id": "198",
		"city": "Bharuch",
		"state": "Gujarat",
		"country": "India"
	},
	{
		"id": "199",
		"city": "Pathankot",
		"state": "Punjab",
		"country": "India"
	},
	{
		"id": "200",
		"city": "Hoshiarpur",
		"state": "Punjab",
		"country": "India"
	},
	{
		"id": "201",
		"city": "Baramula",
		"state": "Jammu and Kashmir",
		"country": "India"
	},
	{
		"id": "202",
		"city": "Adoni",
		"state": "Andhra Pradesh",
		"country": "India"
	},
	{
		"id": "203",
		"city": "Jind",
		"state": "Haryana",
		"country": "India"
	},
	{
		"id": "204",
		"city": "Tonk",
		"state": "Rajasthan",
		"country": "India"
	},
	{
		"id": "205",
		"city": "Tenali",
		"state": "Andhra Pradesh",
		"country": "India"
	},
	{
		"id": "206",
		"city": "Kancheepuram",
		"state": "Tamil Nadu",
		"country": "India"
	},
	{
		"id": "207",
		"city": "Vapi",
		"state": "Gujarat",
		"country": "India"
	},
	{
		"id": "208",
		"city": "Sirsa",
		"state": "Haryana",
		"country": "India"
	},
	{
		"id": "209",
		"city": "Navsari",
		"state": "Gujarat",
		"country": "India"
	},
	{
		"id": "210",
		"city": "Mahbubnagar",
		"state": "Telangana",
		"country": "India"
	},
	{
		"id": "211",
		"city": "Puri",
		"state": "Odisha",
		"country": "India"
	},
	{
		"id": "212",
		"city": "Robertson Pet",
		"state": "Karnataka",
		"country": "India"
	},
	{
		"id": "213",
		"city": "Erode",
		"state": "Tamil Nadu",
		"country": "India"
	},
	{
		"id": "214",
		"city": "Batala",
		"state": "Punjab",
		"country": "India"
	},
	{
		"id": "215",
		"city": "Haldwani-cum-Kathgodam",
		"state": "Uttarakhand",
		"country": "India"
	},
	{
		"id": "216",
		"city": "Vidisha",
		"state": "Madhya Pradesh",
		"country": "India"
	},
	{
		"id": "217",
		"city": "Saharsa",
		"state": "Bihar",
		"country": "India"
	},
	{
		"id": "218",
		"city": "Thanesar",
		"state": "Haryana",
		"country": "India"
	},
	{
		"id": "219",
		"city": "Chittoor",
		"state": "Andhra Pradesh",
		"country": "India"
	},
	{
		"id": "220",
		"city": "Veraval",
		"state": "Gujarat",
		"country": "India"
	},
	{
		"id": "221",
		"city": "Lakhimpur",
		"state": "Uttar Pradesh",
		"country": "India"
	},
	{
		"id": "222",
		"city": "Sitapur",
		"state": "Uttar Pradesh",
		"country": "India"
	},
	{
		"id": "223",
		"city": "Hindupur",
		"state": "Andhra Pradesh",
		"country": "India"
	},
	{
		"id": "224",
		"city": "Santipur",
		"state": "West Bengal",
		"country": "India"
	},
	{
		"id": "225",
		"city": "Balurghat",
		"state": "West Bengal",
		"country": "India"
	},
	{
		"id": "226",
		"city": "Ganjbasoda",
		"state": "Madhya Pradesh",
		"country": "India"
	},
	{
		"id": "227",
		"city": "Moga",
		"state": "Punjab",
		"country": "India"
	},
	{
		"id": "228",
		"city": "Proddatur",
		"state": "Andhra Pradesh",
		"country": "India"
	},
	{
		"id": "229",
		"city": "Srinagar",
		"state": "Uttarakhand",
		"country": "India"
	},
	{
		"id": "230",
		"city": "Medinipur",
		"state": "West Bengal",
		"country": "India"
	},
	{
		"id": "231",
		"city": "Habra",
		"state": "West Bengal",
		"country": "India"
	},
	{
		"id": "232",
		"city": "Sasaram",
		"state": "Bihar",
		"country": "India"
	},
	{
		"id": "233",
		"city": "Hajipur",
		"state": "Bihar",
		"country": "India"
	},
	{
		"id": "234",
		"city": "Bhuj",
		"state": "Gujarat",
		"country": "India"
	},
	{
		"id": "235",
		"city": "Shivpuri",
		"state": "Madhya Pradesh",
		"country": "India"
	},
	{
		"id": "236",
		"city": "Ranaghat",
		"state": "West Bengal",
		"country": "India"
	},
	{
		"id": "237",
		"city": "Shimla",
		"state": "Himachal Pradesh",
		"country": "India"
	},
	{
		"id": "238",
		"city": "Tiruvannamalai",
		"state": "Tamil Nadu",
		"country": "India"
	},
	{
		"id": "239",
		"city": "Kaithal",
		"state": "Haryana",
		"country": "India"
	},
	{
		"id": "240",
		"city": "Rajnandgaon",
		"state": "Chhattisgarh",
		"country": "India"
	},
	{
		"id": "241",
		"city": "Godhra",
		"state": "Gujarat",
		"country": "India"
	},
	{
		"id": "242",
		"city": "Hazaribag",
		"state": "Jharkhand",
		"country": "India"
	},
	{
		"id": "243",
		"city": "Bhimavaram",
		"state": "Andhra Pradesh",
		"country": "India"
	},
	{
		"id": "244",
		"city": "Mandsaur",
		"state": "Madhya Pradesh",
		"country": "India"
	},
	{
		"id": "245",
		"city": "Dibrugarh",
		"state": "Assam",
		"country": "India"
	},
	{
		"id": "246",
		"city": "Kolar",
		"state": "Karnataka",
		"country": "India"
	},
	{
		"id": "247",
		"city": "Bankura",
		"state": "West Bengal",
		"country": "India"
	},
	{
		"id": "248",
		"city": "Mandya",
		"state": "Karnataka",
		"country": "India"
	},
	{
		"id": "249",
		"city": "Dehri-on-Sone",
		"state": "Bihar",
		"country": "India"
	},
	{
		"id": "250",
		"city": "Madanapalle",
		"state": "Andhra Pradesh",
		"country": "India"
	},
	{
		"id": "251",
		"city": "Malerkotla",
		"state": "Punjab",
		"country": "India"
	},
	{
		"id": "252",
		"city": "Lalitpur",
		"state": "Uttar Pradesh",
		"country": "India"
	},
	{
		"id": "253",
		"city": "Bettiah",
		"state": "Bihar",
		"country": "India"
	},
	{
		"id": "254",
		"city": "Pollachi",
		"state": "Tamil Nadu",
		"country": "India"
	},
	{
		"id": "255",
		"city": "Khanna",
		"state": "Punjab",
		"country": "India"
	},
	{
		"id": "256",
		"city": "Neemuch",
		"state": "Madhya Pradesh",
		"country": "India"
	},
	{
		"id": "257",
		"city": "Palwal",
		"state": "Haryana",
		"country": "India"
	},
	{
		"id": "258",
		"city": "Palanpur",
		"state": "Gujarat",
		"country": "India"
	},
	{
		"id": "259",
		"city": "Guntakal",
		"state": "Andhra Pradesh",
		"country": "India"
	},
	{
		"id": "260",
		"city": "Nabadwip",
		"state": "West Bengal",
		"country": "India"
	},
	{
		"id": "261",
		"city": "Udupi",
		"state": "Karnataka",
		"country": "India"
	},
	{
		"id": "262",
		"city": "Jagdalpur",
		"state": "Chhattisgarh",
		"country": "India"
	},
	{
		"id": "263",
		"city": "Motihari",
		"state": "Bihar",
		"country": "India"
	},
	{
		"id": "264",
		"city": "Pilibhit",
		"state": "Uttar Pradesh",
		"country": "India"
	},
	{
		"id": "265",
		"city": "Dimapur",
		"state": "Nagaland",
		"country": "India"
	},
	{
		"id": "266",
		"city": "Mohali",
		"state": "Punjab",
		"country": "India"
	},
	{
		"id": "267",
		"city": "Sadulpur",
		"state": "Rajasthan",
		"country": "India"
	},
	{
		"id": "268",
		"city": "Rajapalayam",
		"state": "Tamil Nadu",
		"country": "India"
	},
	{
		"id": "269",
		"city": "Dharmavaram",
		"state": "Andhra Pradesh",
		"country": "India"
	},
	{
		"id": "270",
		"city": "Kashipur",
		"state": "Uttarakhand",
		"country": "India"
	},
	{
		"id": "271",
		"city": "Sivakasi",
		"state": "Tamil Nadu",
		"country": "India"
	},
	{
		"id": "272",
		"city": "Darjiling",
		"state": "West Bengal",
		"country": "India"
	},
	{
		"id": "273",
		"city": "Chikkamagaluru",
		"state": "Karnataka",
		"country": "India"
	},
	{
		"id": "274",
		"city": "Gudivada",
		"state": "Andhra Pradesh",
		"country": "India"
	},
	{
		"id": "275",
		"city": "Baleshwar Town",
		"state": "Odisha",
		"country": "India"
	},
	{
		"id": "276",
		"city": "Mancherial",
		"state": "Telangana",
		"country": "India"
	},
	{
		"id": "277",
		"city": "Srikakulam",
		"state": "Andhra Pradesh",
		"country": "India"
	},
	{
		"id": "278",
		"city": "Adilabad",
		"state": "Telangana",
		"country": "India"
	},
	{
		"id": "279",
		"city": "Yavatmal",
		"state": "Maharashtra",
		"country": "India"
	},
	{
		"id": "280",
		"city": "Barnala",
		"state": "Punjab",
		"country": "India"
	},
	{
		"id": "281",
		"city": "Nagaon",
		"state": "Assam",
		"country": "India"
	},
	{
		"id": "282",
		"city": "Narasaraopet",
		"state": "Andhra Pradesh",
		"country": "India"
	},
	{
		"id": "283",
		"city": "Raigarh",
		"state": "Chhattisgarh",
		"country": "India"
	},
	{
		"id": "284",
		"city": "Roorkee",
		"state": "Uttarakhand",
		"country": "India"
	},
	{
		"id": "285",
		"city": "Valsad",
		"state": "Gujarat",
		"country": "India"
	},
	{
		"id": "286",
		"city": "Ambikapur",
		"state": "Chhattisgarh",
		"country": "India"
	},
	{
		"id": "287",
		"city": "Giridih",
		"state": "Jharkhand",
		"country": "India"
	},
	{
		"id": "288",
		"city": "Chandausi",
		"state": "Uttar Pradesh",
		"country": "India"
	},
	{
		"id": "289",
		"city": "Purulia",
		"state": "West Bengal",
		"country": "India"
	},
	{
		"id": "290",
		"city": "Patan",
		"state": "Gujarat",
		"country": "India"
	},
	{
		"id": "291",
		"city": "Bagaha",
		"state": "Bihar",
		"country": "India"
	},
	{
		"id": "292",
		"city": "Hardoi ",
		"state": "Uttar Pradesh",
		"country": "India"
	},
	{
		"id": "293",
		"city": "Achalpur",
		"state": "Maharashtra",
		"country": "India"
	},
	{
		"id": "294",
		"city": "Osmanabad",
		"state": "Maharashtra",
		"country": "India"
	},
	{
		"id": "295",
		"city": "Deesa",
		"state": "Gujarat",
		"country": "India"
	},
	{
		"id": "296",
		"city": "Nandurbar",
		"state": "Maharashtra",
		"country": "India"
	},
	{
		"id": "297",
		"city": "Azamgarh",
		"state": "Uttar Pradesh",
		"country": "India"
	},
	{
		"id": "298",
		"city": "Ramgarh",
		"state": "Jharkhand",
		"country": "India"
	},
	{
		"id": "299",
		"city": "Firozpur",
		"state": "Punjab",
		"country": "India"
	},
	{
		"id": "300",
		"city": "Baripada Town",
		"state": "Odisha",
		"country": "India"
	},
	{
		"id": "301",
		"city": "Karwar",
		"state": "Karnataka",
		"country": "India"
	},
	{
		"id": "302",
		"city": "Siwan",
		"state": "Bihar",
		"country": "India"
	},
	{
		"id": "303",
		"city": "Rajampet",
		"state": "Andhra Pradesh",
		"country": "India"
	},
	{
		"id": "304",
		"city": "Pudukkottai",
		"state": "Tamil Nadu",
		"country": "India"
	},
	{
		"id": "305",
		"city": "Anantnag",
		"state": "Jammu and Kashmir",
		"country": "India"
	},
	{
		"id": "306",
		"city": "Tadpatri",
		"state": "Andhra Pradesh",
		"country": "India"
	},
	{
		"id": "307",
		"city": "Satara",
		"state": "Maharashtra",
		"country": "India"
	},
	{
		"id": "308",
		"city": "Bhadrak",
		"state": "Odisha",
		"country": "India"
	},
	{
		"id": "309",
		"city": "Kishanganj",
		"state": "Bihar",
		"country": "India"
	},
	{
		"id": "310",
		"city": "Suryapet",
		"state": "Telangana",
		"country": "India"
	},
	{
		"id": "311",
		"city": "Wardha",
		"state": "Maharashtra",
		"country": "India"
	},
	{
		"id": "312",
		"city": "Ranebennuru",
		"state": "Karnataka",
		"country": "India"
	},
	{
		"id": "313",
		"city": "Amreli",
		"state": "Gujarat",
		"country": "India"
	},
	{
		"id": "314",
		"city": "Neyveli (TS)",
		"state": "Tamil Nadu",
		"country": "India"
	},
	{
		"id": "315",
		"city": "Jamalpur",
		"state": "Bihar",
		"country": "India"
	},
	{
		"id": "316",
		"city": "Marmagao",
		"state": "Goa",
		"country": "India"
	},
	{
		"id": "317",
		"city": "Udgir",
		"state": "Maharashtra",
		"country": "India"
	},
	{
		"id": "318",
		"city": "Tadepalligudem",
		"state": "Andhra Pradesh",
		"country": "India"
	},
	{
		"id": "319",
		"city": "Nagapattinam",
		"state": "Tamil Nadu",
		"country": "India"
	},
	{
		"id": "320",
		"city": "Buxar",
		"state": "Bihar",
		"country": "India"
	},
	{
		"id": "321",
		"city": "Aurangabad",
		"state": "Maharashtra",
		"country": "India"
	},
	{
		"id": "322",
		"city": "Jehanabad",
		"state": "Bihar",
		"country": "India"
	},
	{
		"id": "323",
		"city": "Phagwara",
		"state": "Punjab",
		"country": "India"
	},
	{
		"id": "324",
		"city": "Khair",
		"state": "Uttar Pradesh",
		"country": "India"
	},
	{
		"id": "325",
		"city": "Sawai Madhopur",
		"state": "Rajasthan",
		"country": "India"
	},
	{
		"id": "326",
		"city": "Kapurthala",
		"state": "Punjab",
		"country": "India"
	},
	{
		"id": "327",
		"city": "Chilakaluripet",
		"state": "Andhra Pradesh",
		"country": "India"
	},
	{
		"id": "328",
		"city": "Aurangabad",
		"state": "Bihar",
		"country": "India"
	},
	{
		"id": "329",
		"city": "Malappuram",
		"state": "Kerala",
		"country": "India"
	},
	{
		"id": "330",
		"city": "Rewari",
		"state": "Haryana",
		"country": "India"
	},
	{
		"id": "331",
		"city": "Nagaur",
		"state": "Rajasthan",
		"country": "India"
	},
	{
		"id": "332",
		"city": "Sultanpur",
		"state": "Uttar Pradesh",
		"country": "India"
	},
	{
		"id": "333",
		"city": "Nagda",
		"state": "Madhya Pradesh",
		"country": "India"
	},
	{
		"id": "334",
		"city": "Port Blair",
		"state": "Andaman and Nicobar Islands",
		"country": "India"
	},
	{
		"id": "335",
		"city": "Lakhisarai",
		"state": "Bihar",
		"country": "India"
	},
	{
		"id": "336",
		"city": "Panaji",
		"state": "Goa",
		"country": "India"
	},
	{
		"id": "337",
		"city": "Tinsukia",
		"state": "Assam",
		"country": "India"
	},
	{
		"id": "338",
		"city": "Itarsi",
		"state": "Madhya Pradesh",
		"country": "India"
	},
	{
		"id": "339",
		"city": "Kohima",
		"state": "Nagaland",
		"country": "India"
	},
	{
		"id": "340",
		"city": "Balangir",
		"state": "Odisha",
		"country": "India"
	},
	{
		"id": "341",
		"city": "Nawada",
		"state": "Bihar",
		"country": "India"
	},
	{
		"id": "342",
		"city": "Jharsuguda",
		"state": "Odisha",
		"country": "India"
	},
	{
		"id": "343",
		"city": "Jagtial",
		"state": "Telangana",
		"country": "India"
	},
	{
		"id": "344",
		"city": "Viluppuram",
		"state": "Tamil Nadu",
		"country": "India"
	},
	{
		"id": "345",
		"city": "Amalner",
		"state": "Maharashtra",
		"country": "India"
	},
	{
		"id": "346",
		"city": "Zirakpur",
		"state": "Punjab",
		"country": "India"
	},
	{
		"id": "347",
		"city": "Tanda",
		"state": "Uttar Pradesh",
		"country": "India"
	},
	{
		"id": "348",
		"city": "Tiruchengode",
		"state": "Tamil Nadu",
		"country": "India"
	},
	{
		"id": "349",
		"city": "Nagina",
		"state": "Uttar Pradesh",
		"country": "India"
	},
	{
		"id": "350",
		"city": "Yemmiganur",
		"state": "Andhra Pradesh",
		"country": "India"
	},
	{
		"id": "351",
		"city": "Vaniyambadi",
		"state": "Tamil Nadu",
		"country": "India"
	},
	{
		"id": "352",
		"city": "Sarni",
		"state": "Madhya Pradesh",
		"country": "India"
	},
	{
		"id": "353",
		"city": "Theni Allinagaram",
		"state": "Tamil Nadu",
		"country": "India"
	},
	{
		"id": "354",
		"city": "Margao",
		"state": "Goa",
		"country": "India"
	},
	{
		"id": "355",
		"city": "Akot",
		"state": "Maharashtra",
		"country": "India"
	},
	{
		"id": "356",
		"city": "Sehore",
		"state": "Madhya Pradesh",
		"country": "India"
	},
	{
		"id": "357",
		"city": "Mhow Cantonment",
		"state": "Madhya Pradesh",
		"country": "India"
	},
	{
		"id": "358",
		"city": "Kot Kapura",
		"state": "Punjab",
		"country": "India"
	},
	{
		"id": "359",
		"city": "Makrana",
		"state": "Rajasthan",
		"country": "India"
	},
	{
		"id": "360",
		"city": "Pandharpur",
		"state": "Maharashtra",
		"country": "India"
	},
	{
		"id": "361",
		"city": "Miryalaguda",
		"state": "Telangana",
		"country": "India"
	},
	{
		"id": "362",
		"city": "Shamli",
		"state": "Uttar Pradesh",
		"country": "India"
	},
	{
		"id": "363",
		"city": "Seoni",
		"state": "Madhya Pradesh",
		"country": "India"
	},
	{
		"id": "364",
		"city": "Ranibennur",
		"state": "Karnataka",
		"country": "India"
	},
	{
		"id": "365",
		"city": "Kadiri",
		"state": "Andhra Pradesh",
		"country": "India"
	},
	{
		"id": "366",
		"city": "Shrirampur",
		"state": "Maharashtra",
		"country": "India"
	},
	{
		"id": "367",
		"city": "Rudrapur",
		"state": "Uttarakhand",
		"country": "India"
	},
	{
		"id": "368",
		"city": "Parli",
		"state": "Maharashtra",
		"country": "India"
	},
	{
		"id": "369",
		"city": "Najibabad",
		"state": "Uttar Pradesh",
		"country": "India"
	},
	{
		"id": "370",
		"city": "Nirmal",
		"state": "Telangana",
		"country": "India"
	},
	{
		"id": "371",
		"city": "Udhagamandalam",
		"state": "Tamil Nadu",
		"country": "India"
	},
	{
		"id": "372",
		"city": "Shikohabad",
		"state": "Uttar Pradesh",
		"country": "India"
	},
	{
		"id": "373",
		"city": "Jhumri Tilaiya",
		"state": "Jharkhand",
		"country": "India"
	},
	{
		"id": "374",
		"city": "Aruppukkottai",
		"state": "Tamil Nadu",
		"country": "India"
	},
	{
		"id": "375",
		"city": "Ponnani",
		"state": "Kerala",
		"country": "India"
	},
	{
		"id": "376",
		"city": "Jamui",
		"state": "Bihar",
		"country": "India"
	},
	{
		"id": "377",
		"city": "Sitamarhi",
		"state": "Bihar",
		"country": "India"
	},
	{
		"id": "378",
		"city": "Chirala",
		"state": "Andhra Pradesh",
		"country": "India"
	},
	{
		"id": "379",
		"city": "Anjar",
		"state": "Gujarat",
		"country": "India"
	},
	{
		"id": "380",
		"city": "Karaikal",
		"state": "Puducherry",
		"country": "India"
	},
	{
		"id": "381",
		"city": "Hansi",
		"state": "Haryana",
		"country": "India"
	},
	{
		"id": "382",
		"city": "Anakapalle",
		"state": "Andhra Pradesh",
		"country": "India"
	},
	{
		"id": "383",
		"city": "Mahasamund",
		"state": "Chhattisgarh",
		"country": "India"
	},
	{
		"id": "384",
		"city": "Faridkot",
		"state": "Punjab",
		"country": "India"
	},
	{
		"id": "385",
		"city": "Saunda",
		"state": "Jharkhand",
		"country": "India"
	},
	{
		"id": "386",
		"city": "Dhoraji",
		"state": "Gujarat",
		"country": "India"
	},
	{
		"id": "387",
		"city": "Paramakudi",
		"state": "Tamil Nadu",
		"country": "India"
	},
	{
		"id": "388",
		"city": "Balaghat",
		"state": "Madhya Pradesh",
		"country": "India"
	},
	{
		"id": "389",
		"city": "Sujangarh",
		"state": "Rajasthan",
		"country": "India"
	},
	{
		"id": "390",
		"city": "Khambhat",
		"state": "Gujarat",
		"country": "India"
	},
	{
		"id": "391",
		"city": "Muktsar",
		"state": "Punjab",
		"country": "India"
	},
	{
		"id": "392",
		"city": "Rajpura",
		"state": "Punjab",
		"country": "India"
	},
	{
		"id": "393",
		"city": "Kavali",
		"state": "Andhra Pradesh",
		"country": "India"
	},
	{
		"id": "394",
		"city": "Dhamtari",
		"state": "Chhattisgarh",
		"country": "India"
	},
	{
		"id": "395",
		"city": "Ashok Nagar",
		"state": "Madhya Pradesh",
		"country": "India"
	},
	{
		"id": "396",
		"city": "Sardarshahar",
		"state": "Rajasthan",
		"country": "India"
	},
	{
		"id": "397",
		"city": "Mahuva",
		"state": "Gujarat",
		"country": "India"
	},
	{
		"id": "398",
		"city": "Bargarh",
		"state": "Odisha",
		"country": "India"
	},
	{
		"id": "399",
		"city": "Kamareddy",
		"state": "Telangana",
		"country": "India"
	},
	{
		"id": "400",
		"city": "Sahibganj",
		"state": "Jharkhand",
		"country": "India"
	},
	{
		"id": "401",
		"city": "Kothagudem",
		"state": "Telangana",
		"country": "India"
	},
	{
		"id": "402",
		"city": "Ramanagaram",
		"state": "Karnataka",
		"country": "India"
	},
	{
		"id": "403",
		"city": "Gokak",
		"state": "Karnataka",
		"country": "India"
	},
	{
		"id": "404",
		"city": "Tikamgarh",
		"state": "Madhya Pradesh",
		"country": "India"
	},
	{
		"id": "405",
		"city": "Araria",
		"state": "Bihar",
		"country": "India"
	},
	{
		"id": "406",
		"city": "Rishikesh",
		"state": "Uttarakhand",
		"country": "India"
	},
	{
		"id": "407",
		"city": "Shahdol",
		"state": "Madhya Pradesh",
		"country": "India"
	},
	{
		"id": "408",
		"city": "Medininagar (Daltonganj)",
		"state": "Jharkhand",
		"country": "India"
	},
	{
		"id": "409",
		"city": "Arakkonam",
		"state": "Tamil Nadu",
		"country": "India"
	},
	{
		"id": "410",
		"city": "Washim",
		"state": "Maharashtra",
		"country": "India"
	},
	{
		"id": "411",
		"city": "Sangrur",
		"state": "Punjab",
		"country": "India"
	},
	{
		"id": "412",
		"city": "Bodhan",
		"state": "Telangana",
		"country": "India"
	},
	{
		"id": "413",
		"city": "Fazilka",
		"state": "Punjab",
		"country": "India"
	},
	{
		"id": "414",
		"city": "Palacole",
		"state": "Andhra Pradesh",
		"country": "India"
	},
	{
		"id": "415",
		"city": "Keshod",
		"state": "Gujarat",
		"country": "India"
	},
	{
		"id": "416",
		"city": "Sullurpeta",
		"state": "Andhra Pradesh",
		"country": "India"
	},
	{
		"id": "417",
		"city": "Wadhwan",
		"state": "Gujarat",
		"country": "India"
	},
	{
		"id": "418",
		"city": "Gurdaspur",
		"state": "Punjab",
		"country": "India"
	},
	{
		"id": "419",
		"city": "Vatakara",
		"state": "Kerala",
		"country": "India"
	},
	{
		"id": "420",
		"city": "Tura",
		"state": "Meghalaya",
		"country": "India"
	},
	{
		"id": "421",
		"city": "Narnaul",
		"state": "Haryana",
		"country": "India"
	},
	{
		"id": "422",
		"city": "Kharar",
		"state": "Punjab",
		"country": "India"
	},
	{
		"id": "423",
		"city": "Yadgir",
		"state": "Karnataka",
		"country": "India"
	},
	{
		"id": "424",
		"city": "Ambejogai",
		"state": "Maharashtra",
		"country": "India"
	},
	{
		"id": "425",
		"city": "Ankleshwar",
		"state": "Gujarat",
		"country": "India"
	},
	{
		"id": "426",
		"city": "Savarkundla",
		"state": "Gujarat",
		"country": "India"
	},
	{
		"id": "427",
		"city": "Paradip",
		"state": "Odisha",
		"country": "India"
	},
	{
		"id": "428",
		"city": "Virudhachalam",
		"state": "Tamil Nadu",
		"country": "India"
	},
	{
		"id": "429",
		"city": "Kanhangad",
		"state": "Kerala",
		"country": "India"
	},
	{
		"id": "430",
		"city": "Kadi",
		"state": "Gujarat",
		"country": "India"
	},
	{
		"id": "431",
		"city": "Srivilliputhur",
		"state": "Tamil Nadu",
		"country": "India"
	},
	{
		"id": "432",
		"city": "Gobindgarh",
		"state": "Punjab",
		"country": "India"
	},
	{
		"id": "433",
		"city": "Tindivanam",
		"state": "Tamil Nadu",
		"country": "India"
	},
	{
		"id": "434",
		"city": "Mansa",
		"state": "Punjab",
		"country": "India"
	},
	{
		"id": "435",
		"city": "Taliparamba",
		"state": "Kerala",
		"country": "India"
	},
	{
		"id": "436",
		"city": "Manmad",
		"state": "Maharashtra",
		"country": "India"
	},
	{
		"id": "437",
		"city": "Tanuku",
		"state": "Andhra Pradesh",
		"country": "India"
	},
	{
		"id": "438",
		"city": "Rayachoti",
		"state": "Andhra Pradesh",
		"country": "India"
	},
	{
		"id": "439",
		"city": "Virudhunagar",
		"state": "Tamil Nadu",
		"country": "India"
	},
	{
		"id": "440",
		"city": "Koyilandy",
		"state": "Kerala",
		"country": "India"
	},
	{
		"id": "441",
		"city": "Jorhat",
		"state": "Assam",
		"country": "India"
	},
	{
		"id": "442",
		"city": "Karur",
		"state": "Tamil Nadu",
		"country": "India"
	},
	{
		"id": "443",
		"city": "Valparai",
		"state": "Tamil Nadu",
		"country": "India"
	},
	{
		"id": "444",
		"city": "Srikalahasti",
		"state": "Andhra Pradesh",
		"country": "India"
	},
	{
		"id": "445",
		"city": "Neyyattinkara",
		"state": "Kerala",
		"country": "India"
	},
	{
		"id": "446",
		"city": "Bapatla",
		"state": "Andhra Pradesh",
		"country": "India"
	},
	{
		"id": "447",
		"city": "Fatehabad",
		"state": "Haryana",
		"country": "India"
	},
	{
		"id": "448",
		"city": "Malout",
		"state": "Punjab",
		"country": "India"
	},
	{
		"id": "449",
		"city": "Sankarankovil",
		"state": "Tamil Nadu",
		"country": "India"
	},
	{
		"id": "450",
		"city": "Tenkasi",
		"state": "Tamil Nadu",
		"country": "India"
	},
	{
		"id": "451",
		"city": "Ratnagiri",
		"state": "Maharashtra",
		"country": "India"
	},
	{
		"id": "452",
		"city": "Rabkavi Banhatti",
		"state": "Karnataka",
		"country": "India"
	},
	{
		"id": "453",
		"city": "Sikandrabad",
		"state": "Uttar Pradesh",
		"country": "India"
	},
	{
		"id": "454",
		"city": "Chaibasa",
		"state": "Jharkhand",
		"country": "India"
	},
	{
		"id": "455",
		"city": "Chirmiri",
		"state": "Chhattisgarh",
		"country": "India"
	},
	{
		"id": "456",
		"city": "Palwancha",
		"state": "Telangana",
		"country": "India"
	},
	{
		"id": "457",
		"city": "Bhawanipatna",
		"state": "Odisha",
		"country": "India"
	},
	{
		"id": "458",
		"city": "Kayamkulam",
		"state": "Kerala",
		"country": "India"
	},
	{
		"id": "459",
		"city": "Pithampur",
		"state": "Madhya Pradesh",
		"country": "India"
	},
	{
		"id": "460",
		"city": "Nabha",
		"state": "Punjab",
		"country": "India"
	},
	{
		"id": "461",
		"city": "Shahabad, Hardoi",
		"state": "Uttar Pradesh",
		"country": "India"
	},
	{
		"id": "462",
		"city": "Dhenkanal",
		"state": "Odisha",
		"country": "India"
	},
	{
		"id": "463",
		"city": "Uran Islampur",
		"state": "Maharashtra",
		"country": "India"
	},
	{
		"id": "464",
		"city": "Gopalganj",
		"state": "Bihar",
		"country": "India"
	},
	{
		"id": "465",
		"city": "Bongaigaon City",
		"state": "Assam",
		"country": "India"
	},
	{
		"id": "466",
		"city": "Palani",
		"state": "Tamil Nadu",
		"country": "India"
	},
	{
		"id": "467",
		"city": "Pusad",
		"state": "Maharashtra",
		"country": "India"
	},
	{
		"id": "468",
		"city": "Sopore",
		"state": "Jammu and Kashmir",
		"country": "India"
	},
	{
		"id": "469",
		"city": "Pilkhuwa",
		"state": "Uttar Pradesh",
		"country": "India"
	},
	{
		"id": "470",
		"city": "Tarn Taran",
		"state": "Punjab",
		"country": "India"
	},
	{
		"id": "471",
		"city": "Renukoot",
		"state": "Uttar Pradesh",
		"country": "India"
	},
	{
		"id": "472",
		"city": "Mandamarri",
		"state": "Telangana",
		"country": "India"
	},
	{
		"id": "473",
		"city": "Shahabad",
		"state": "Karnataka",
		"country": "India"
	},
	{
		"id": "474",
		"city": "Barbil",
		"state": "Odisha",
		"country": "India"
	},
	{
		"id": "475",
		"city": "Koratla",
		"state": "Telangana",
		"country": "India"
	},
	{
		"id": "476",
		"city": "Madhubani",
		"state": "Bihar",
		"country": "India"
	},
	{
		"id": "477",
		"city": "Arambagh",
		"state": "West Bengal",
		"country": "India"
	},
	{
		"id": "478",
		"city": "Gohana",
		"state": "Haryana",
		"country": "India"
	},
	{
		"id": "479",
		"city": "Ladnu",
		"state": "Rajasthan",
		"country": "India"
	},
	{
		"id": "480",
		"city": "Pattukkottai",
		"state": "Tamil Nadu",
		"country": "India"
	},
	{
		"id": "481",
		"city": "Sirsi",
		"state": "Karnataka",
		"country": "India"
	},
	{
		"id": "482",
		"city": "Sircilla",
		"state": "Telangana",
		"country": "India"
	},
	{
		"id": "483",
		"city": "Tamluk",
		"state": "West Bengal",
		"country": "India"
	},
	{
		"id": "484",
		"city": "Jagraon",
		"state": "Punjab",
		"country": "India"
	},
	{
		"id": "485",
		"city": "AlipurdUrban Agglomerationr",
		"state": "West Bengal",
		"country": "India"
	},
	{
		"id": "486",
		"city": "Alirajpur",
		"state": "Madhya Pradesh",
		"country": "India"
	},
	{
		"id": "487",
		"city": "Tandur",
		"state": "Telangana",
		"country": "India"
	},
	{
		"id": "488",
		"city": "Naidupet",
		"state": "Andhra Pradesh",
		"country": "India"
	},
	{
		"id": "489",
		"city": "Tirupathur",
		"state": "Tamil Nadu",
		"country": "India"
	},
	{
		"id": "490",
		"city": "Tohana",
		"state": "Haryana",
		"country": "India"
	},
	{
		"id": "491",
		"city": "Ratangarh",
		"state": "Rajasthan",
		"country": "India"
	},
	{
		"id": "492",
		"city": "Dhubri",
		"state": "Assam",
		"country": "India"
	},
	{
		"id": "493",
		"city": "Masaurhi",
		"state": "Bihar",
		"country": "India"
	},
	{
		"id": "494",
		"city": "Visnagar",
		"state": "Gujarat",
		"country": "India"
	},
	{
		"id": "495",
		"city": "Vrindavan",
		"state": "Uttar Pradesh",
		"country": "India"
	},
	{
		"id": "496",
		"city": "Nokha",
		"state": "Rajasthan",
		"country": "India"
	},
	{
		"id": "497",
		"city": "Nagari",
		"state": "Andhra Pradesh",
		"country": "India"
	},
	{
		"id": "498",
		"city": "Narwana",
		"state": "Haryana",
		"country": "India"
	},
	{
		"id": "499",
		"city": "Ramanathapuram",
		"state": "Tamil Nadu",
		"country": "India"
	},
	{
		"id": "500",
		"city": "Ujhani",
		"state": "Uttar Pradesh",
		"country": "India"
	},
	{
		"id": "501",
		"city": "Samastipur",
		"state": "Bihar",
		"country": "India"
	},
	{
		"id": "502",
		"city": "Laharpur",
		"state": "Uttar Pradesh",
		"country": "India"
	},
	{
		"id": "503",
		"city": "Sangamner",
		"state": "Maharashtra",
		"country": "India"
	},
	{
		"id": "504",
		"city": "Nimbahera",
		"state": "Rajasthan",
		"country": "India"
	},
	{
		"id": "505",
		"city": "Siddipet",
		"state": "Telangana",
		"country": "India"
	},
	{
		"id": "506",
		"city": "Suri",
		"state": "West Bengal",
		"country": "India"
	},
	{
		"id": "507",
		"city": "Diphu",
		"state": "Assam",
		"country": "India"
	},
	{
		"id": "508",
		"city": "Jhargram",
		"state": "West Bengal",
		"country": "India"
	},
	{
		"id": "509",
		"city": "Shirpur-Warwade",
		"state": "Maharashtra",
		"country": "India"
	},
	{
		"id": "510",
		"city": "Tilhar",
		"state": "Uttar Pradesh",
		"country": "India"
	},
	{
		"id": "511",
		"city": "Sindhnur",
		"state": "Karnataka",
		"country": "India"
	},
	{
		"id": "512",
		"city": "Udumalaipettai",
		"state": "Tamil Nadu",
		"country": "India"
	},
	{
		"id": "513",
		"city": "Malkapur",
		"state": "Maharashtra",
		"country": "India"
	},
	{
		"id": "514",
		"city": "Wanaparthy",
		"state": "Telangana",
		"country": "India"
	},
	{
		"id": "515",
		"city": "Gudur",
		"state": "Andhra Pradesh",
		"country": "India"
	},
	{
		"id": "516",
		"city": "Kendujhar",
		"state": "Odisha",
		"country": "India"
	},
	{
		"id": "517",
		"city": "Mandla",
		"state": "Madhya Pradesh",
		"country": "India"
	},
	{
		"id": "518",
		"city": "Mandi",
		"state": "Himachal Pradesh",
		"country": "India"
	},
	{
		"id": "519",
		"city": "Nedumangad",
		"state": "Kerala",
		"country": "India"
	},
	{
		"id": "520",
		"city": "North Lakhimpur",
		"state": "Assam",
		"country": "India"
	},
	{
		"id": "521",
		"city": "Vinukonda",
		"state": "Andhra Pradesh",
		"country": "India"
	},
	{
		"id": "522",
		"city": "Tiptur",
		"state": "Karnataka",
		"country": "India"
	},
	{
		"id": "523",
		"city": "Gobichettipalayam",
		"state": "Tamil Nadu",
		"country": "India"
	},
	{
		"id": "524",
		"city": "Sunabeda",
		"state": "Odisha",
		"country": "India"
	},
	{
		"id": "525",
		"city": "Wani",
		"state": "Maharashtra",
		"country": "India"
	},
	{
		"id": "526",
		"city": "Upleta",
		"state": "Gujarat",
		"country": "India"
	},
	{
		"id": "527",
		"city": "Narasapuram",
		"state": "Andhra Pradesh",
		"country": "India"
	},
	{
		"id": "528",
		"city": "Nuzvid",
		"state": "Andhra Pradesh",
		"country": "India"
	},
	{
		"id": "529",
		"city": "Tezpur",
		"state": "Assam",
		"country": "India"
	},
	{
		"id": "530",
		"city": "Una",
		"state": "Gujarat",
		"country": "India"
	},
	{
		"id": "531",
		"city": "Markapur",
		"state": "Andhra Pradesh",
		"country": "India"
	},
	{
		"id": "532",
		"city": "Sheopur",
		"state": "Madhya Pradesh",
		"country": "India"
	},
	{
		"id": "533",
		"city": "Thiruvarur",
		"state": "Tamil Nadu",
		"country": "India"
	},
	{
		"id": "534",
		"city": "Sidhpur",
		"state": "Gujarat",
		"country": "India"
	},
	{
		"id": "535",
		"city": "Sahaswan",
		"state": "Uttar Pradesh",
		"country": "India"
	},
	{
		"id": "536",
		"city": "Suratgarh",
		"state": "Rajasthan",
		"country": "India"
	},
	{
		"id": "537",
		"city": "Shajapur",
		"state": "Madhya Pradesh",
		"country": "India"
	},
	{
		"id": "538",
		"city": "Rayagada",
		"state": "Odisha",
		"country": "India"
	},
	{
		"id": "539",
		"city": "Lonavla",
		"state": "Maharashtra",
		"country": "India"
	},
	{
		"id": "540",
		"city": "Ponnur",
		"state": "Andhra Pradesh",
		"country": "India"
	},
	{
		"id": "541",
		"city": "Kagaznagar",
		"state": "Telangana",
		"country": "India"
	},
	{
		"id": "542",
		"city": "Gadwal",
		"state": "Telangana",
		"country": "India"
	},
	{
		"id": "543",
		"city": "Bhatapara",
		"state": "Chhattisgarh",
		"country": "India"
	},
	{
		"id": "544",
		"city": "Kandukur",
		"state": "Andhra Pradesh",
		"country": "India"
	},
	{
		"id": "545",
		"city": "Sangareddy",
		"state": "Telangana",
		"country": "India"
	},
	{
		"id": "546",
		"city": "Unjha",
		"state": "Gujarat",
		"country": "India"
	},
	{
		"id": "547",
		"city": "Lunglei",
		"state": "Mizoram",
		"country": "India"
	},
	{
		"id": "548",
		"city": "Karimganj",
		"state": "Assam",
		"country": "India"
	},
	{
		"id": "549",
		"city": "Kannur",
		"state": "Kerala",
		"country": "India"
	},
	{
		"id": "550",
		"city": "Bobbili",
		"state": "Andhra Pradesh",
		"country": "India"
	},
	{
		"id": "551",
		"city": "Mokameh",
		"state": "Bihar",
		"country": "India"
	},
	{
		"id": "552",
		"city": "Talegaon Dabhade",
		"state": "Maharashtra",
		"country": "India"
	},
	{
		"id": "553",
		"city": "Anjangaon",
		"state": "Maharashtra",
		"country": "India"
	},
	{
		"id": "554",
		"city": "Mangrol",
		"state": "Gujarat",
		"country": "India"
	},
	{
		"id": "555",
		"city": "Sunam",
		"state": "Punjab",
		"country": "India"
	},
	{
		"id": "556",
		"city": "Gangarampur",
		"state": "West Bengal",
		"country": "India"
	},
	{
		"id": "557",
		"city": "Thiruvallur",
		"state": "Tamil Nadu",
		"country": "India"
	},
	{
		"id": "558",
		"city": "Tirur",
		"state": "Kerala",
		"country": "India"
	},
	{
		"id": "559",
		"city": "Rath",
		"state": "Uttar Pradesh",
		"country": "India"
	},
	{
		"id": "560",
		"city": "Jatani",
		"state": "Odisha",
		"country": "India"
	},
	{
		"id": "561",
		"city": "Viramgam",
		"state": "Gujarat",
		"country": "India"
	},
	{
		"id": "562",
		"city": "Rajsamand",
		"state": "Rajasthan",
		"country": "India"
	},
	{
		"id": "563",
		"city": "Yanam",
		"state": "Puducherry",
		"country": "India"
	},
	{
		"id": "564",
		"city": "Kottayam",
		"state": "Kerala",
		"country": "India"
	},
	{
		"id": "565",
		"city": "Panruti",
		"state": "Tamil Nadu",
		"country": "India"
	},
	{
		"id": "566",
		"city": "Dhuri",
		"state": "Punjab",
		"country": "India"
	},
	{
		"id": "567",
		"city": "Namakkal",
		"state": "Tamil Nadu",
		"country": "India"
	},
	{
		"id": "568",
		"city": "Kasaragod",
		"state": "Kerala",
		"country": "India"
	},
	{
		"id": "569",
		"city": "Modasa",
		"state": "Gujarat",
		"country": "India"
	},
	{
		"id": "570",
		"city": "Rayadurg",
		"state": "Andhra Pradesh",
		"country": "India"
	},
	{
		"id": "571",
		"city": "Supaul",
		"state": "Bihar",
		"country": "India"
	},
	{
		"id": "572",
		"city": "Kunnamkulam",
		"state": "Kerala",
		"country": "India"
	},
	{
		"id": "573",
		"city": "Umred",
		"state": "Maharashtra",
		"country": "India"
	},
	{
		"id": "574",
		"city": "Bellampalle",
		"state": "Telangana",
		"country": "India"
	},
	{
		"id": "575",
		"city": "Sibsagar",
		"state": "Assam",
		"country": "India"
	},
	{
		"id": "576",
		"city": "Mandi Dabwali",
		"state": "Haryana",
		"country": "India"
	},
	{
		"id": "577",
		"city": "Ottappalam",
		"state": "Kerala",
		"country": "India"
	},
	{
		"id": "578",
		"city": "Dumraon",
		"state": "Bihar",
		"country": "India"
	},
	{
		"id": "579",
		"city": "Samalkot",
		"state": "Andhra Pradesh",
		"country": "India"
	},
	{
		"id": "580",
		"city": "Jaggaiahpet",
		"state": "Andhra Pradesh",
		"country": "India"
	},
	{
		"id": "581",
		"city": "Goalpara",
		"state": "Assam",
		"country": "India"
	},
	{
		"id": "582",
		"city": "Tuni",
		"state": "Andhra Pradesh",
		"country": "India"
	},
	{
		"id": "583",
		"city": "Lachhmangarh",
		"state": "Rajasthan",
		"country": "India"
	},
	{
		"id": "584",
		"city": "Bhongir",
		"state": "Telangana",
		"country": "India"
	},
	{
		"id": "585",
		"city": "Amalapuram",
		"state": "Andhra Pradesh",
		"country": "India"
	},
	{
		"id": "586",
		"city": "Firozpur Cantt.",
		"state": "Punjab",
		"country": "India"
	},
	{
		"id": "587",
		"city": "Vikarabad",
		"state": "Telangana",
		"country": "India"
	},
	{
		"id": "588",
		"city": "Thiruvalla",
		"state": "Kerala",
		"country": "India"
	},
	{
		"id": "589",
		"city": "Sherkot",
		"state": "Uttar Pradesh",
		"country": "India"
	},
	{
		"id": "590",
		"city": "Palghar",
		"state": "Maharashtra",
		"country": "India"
	},
	{
		"id": "591",
		"city": "Shegaon",
		"state": "Maharashtra",
		"country": "India"
	},
	{
		"id": "592",
		"city": "Jangaon",
		"state": "Telangana",
		"country": "India"
	},
	{
		"id": "593",
		"city": "Bheemunipatnam",
		"state": "Andhra Pradesh",
		"country": "India"
	},
	{
		"id": "594",
		"city": "Panna",
		"state": "Madhya Pradesh",
		"country": "India"
	},
	{
		"id": "595",
		"city": "Thodupuzha",
		"state": "Kerala",
		"country": "India"
	},
	{
		"id": "596",
		"city": "KathUrban Agglomeration",
		"state": "Jammu and Kashmir",
		"country": "India"
	},
	{
		"id": "597",
		"city": "Palitana",
		"state": "Gujarat",
		"country": "India"
	},
	{
		"id": "598",
		"city": "Arwal",
		"state": "Bihar",
		"country": "India"
	},
	{
		"id": "599",
		"city": "Venkatagiri",
		"state": "Andhra Pradesh",
		"country": "India"
	},
	{
		"id": "600",
		"city": "Kalpi",
		"state": "Uttar Pradesh",
		"country": "India"
	},
	{
		"id": "601",
		"city": "Rajgarh (Churu)",
		"state": "Rajasthan",
		"country": "India"
	},
	{
		"id": "602",
		"city": "Sattenapalle",
		"state": "Andhra Pradesh",
		"country": "India"
	},
	{
		"id": "603",
		"city": "Arsikere",
		"state": "Karnataka",
		"country": "India"
	},
	{
		"id": "604",
		"city": "Ozar",
		"state": "Maharashtra",
		"country": "India"
	},
	{
		"id": "605",
		"city": "Thirumangalam",
		"state": "Tamil Nadu",
		"country": "India"
	},
	{
		"id": "606",
		"city": "Petlad",
		"state": "Gujarat",
		"country": "India"
	},
	{
		"id": "607",
		"city": "Nasirabad",
		"state": "Rajasthan",
		"country": "India"
	},
	{
		"id": "608",
		"city": "Phaltan",
		"state": "Maharashtra",
		"country": "India"
	},
	{
		"id": "609",
		"city": "Rampurhat",
		"state": "West Bengal",
		"country": "India"
	},
	{
		"id": "610",
		"city": "Nanjangud",
		"state": "Karnataka",
		"country": "India"
	},
	{
		"id": "611",
		"city": "Forbesganj",
		"state": "Bihar",
		"country": "India"
	},
	{
		"id": "612",
		"city": "Tundla",
		"state": "Uttar Pradesh",
		"country": "India"
	},
	{
		"id": "613",
		"city": "BhabUrban Agglomeration",
		"state": "Bihar",
		"country": "India"
	},
	{
		"id": "614",
		"city": "Sagara",
		"state": "Karnataka",
		"country": "India"
	},
	{
		"id": "615",
		"city": "Pithapuram",
		"state": "Andhra Pradesh",
		"country": "India"
	},
	{
		"id": "616",
		"city": "Sira",
		"state": "Karnataka",
		"country": "India"
	},
	{
		"id": "617",
		"city": "Bhadrachalam",
		"state": "Telangana",
		"country": "India"
	},
	{
		"id": "618",
		"city": "Charkhi Dadri",
		"state": "Haryana",
		"country": "India"
	},
	{
		"id": "619",
		"city": "Chatra",
		"state": "Jharkhand",
		"country": "India"
	},
	{
		"id": "620",
		"city": "Palasa Kasibugga",
		"state": "Andhra Pradesh",
		"country": "India"
	},
	{
		"id": "621",
		"city": "Nohar",
		"state": "Rajasthan",
		"country": "India"
	},
	{
		"id": "622",
		"city": "Yevla",
		"state": "Maharashtra",
		"country": "India"
	},
	{
		"id": "623",
		"city": "Sirhind Fatehgarh Sahib",
		"state": "Punjab",
		"country": "India"
	},
	{
		"id": "624",
		"city": "Bhainsa",
		"state": "Telangana",
		"country": "India"
	},
	{
		"id": "625",
		"city": "Parvathipuram",
		"state": "Andhra Pradesh",
		"country": "India"
	},
	{
		"id": "626",
		"city": "Shahade",
		"state": "Maharashtra",
		"country": "India"
	},
	{
		"id": "627",
		"city": "Chalakudy",
		"state": "Kerala",
		"country": "India"
	},
	{
		"id": "628",
		"city": "Narkatiaganj",
		"state": "Bihar",
		"country": "India"
	},
	{
		"id": "629",
		"city": "Kapadvanj",
		"state": "Gujarat",
		"country": "India"
	},
	{
		"id": "630",
		"city": "Macherla",
		"state": "Andhra Pradesh",
		"country": "India"
	},
	{
		"id": "631",
		"city": "Raghogarh-Vijaypur",
		"state": "Madhya Pradesh",
		"country": "India"
	},
	{
		"id": "632",
		"city": "Rupnagar",
		"state": "Punjab",
		"country": "India"
	},
	{
		"id": "633",
		"city": "Naugachhia",
		"state": "Bihar",
		"country": "India"
	},
	{
		"id": "634",
		"city": "Sendhwa",
		"state": "Madhya Pradesh",
		"country": "India"
	},
	{
		"id": "635",
		"city": "Byasanagar",
		"state": "Odisha",
		"country": "India"
	},
	{
		"id": "636",
		"city": "Sandila",
		"state": "Uttar Pradesh",
		"country": "India"
	},
	{
		"id": "637",
		"city": "Gooty",
		"state": "Andhra Pradesh",
		"country": "India"
	},
	{
		"id": "638",
		"city": "Salur",
		"state": "Andhra Pradesh",
		"country": "India"
	},
	{
		"id": "639",
		"city": "Nanpara",
		"state": "Uttar Pradesh",
		"country": "India"
	},
	{
		"id": "640",
		"city": "Sardhana",
		"state": "Uttar Pradesh",
		"country": "India"
	},
	{
		"id": "641",
		"city": "Vita",
		"state": "Maharashtra",
		"country": "India"
	},
	{
		"id": "642",
		"city": "Gumia",
		"state": "Jharkhand",
		"country": "India"
	},
	{
		"id": "643",
		"city": "Puttur",
		"state": "Karnataka",
		"country": "India"
	},
	{
		"id": "644",
		"city": "Jalandhar Cantt.",
		"state": "Punjab",
		"country": "India"
	},
	{
		"id": "645",
		"city": "Nehtaur",
		"state": "Uttar Pradesh",
		"country": "India"
	},
	{
		"id": "646",
		"city": "Changanassery",
		"state": "Kerala",
		"country": "India"
	},
	{
		"id": "647",
		"city": "Mandapeta",
		"state": "Andhra Pradesh",
		"country": "India"
	},
	{
		"id": "648",
		"city": "Dumka",
		"state": "Jharkhand",
		"country": "India"
	},
	{
		"id": "649",
		"city": "Seohara",
		"state": "Uttar Pradesh",
		"country": "India"
	},
	{
		"id": "650",
		"city": "Umarkhed",
		"state": "Maharashtra",
		"country": "India"
	},
	{
		"id": "651",
		"city": "Madhupur",
		"state": "Jharkhand",
		"country": "India"
	},
	{
		"id": "652",
		"city": "Vikramasingapuram",
		"state": "Tamil Nadu",
		"country": "India"
	},
	{
		"id": "653",
		"city": "Punalur",
		"state": "Kerala",
		"country": "India"
	},
	{
		"id": "654",
		"city": "Kendrapara",
		"state": "Odisha",
		"country": "India"
	},
	{
		"id": "655",
		"city": "Sihor",
		"state": "Gujarat",
		"country": "India"
	},
	{
		"id": "656",
		"city": "Nellikuppam",
		"state": "Tamil Nadu",
		"country": "India"
	},
	{
		"id": "657",
		"city": "Samana",
		"state": "Punjab",
		"country": "India"
	},
	{
		"id": "658",
		"city": "Warora",
		"state": "Maharashtra",
		"country": "India"
	},
	{
		"id": "659",
		"city": "Nilambur",
		"state": "Kerala",
		"country": "India"
	},
	{
		"id": "660",
		"city": "Rasipuram",
		"state": "Tamil Nadu",
		"country": "India"
	},
	{
		"id": "661",
		"city": "Ramnagar",
		"state": "Uttarakhand",
		"country": "India"
	},
	{
		"id": "662",
		"city": "Jammalamadugu",
		"state": "Andhra Pradesh",
		"country": "India"
	},
	{
		"id": "663",
		"city": "Nawanshahr",
		"state": "Punjab",
		"country": "India"
	},
	{
		"id": "664",
		"city": "Thoubal",
		"state": "Manipur",
		"country": "India"
	},
	{
		"id": "665",
		"city": "Athni",
		"state": "Karnataka",
		"country": "India"
	},
	{
		"id": "666",
		"city": "Cherthala",
		"state": "Kerala",
		"country": "India"
	},
	{
		"id": "667",
		"city": "Sidhi",
		"state": "Madhya Pradesh",
		"country": "India"
	},
	{
		"id": "668",
		"city": "Farooqnagar",
		"state": "Telangana",
		"country": "India"
	},
	{
		"id": "669",
		"city": "Peddapuram",
		"state": "Andhra Pradesh",
		"country": "India"
	},
	{
		"id": "670",
		"city": "Chirkunda",
		"state": "Jharkhand",
		"country": "India"
	},
	{
		"id": "671",
		"city": "Pachora",
		"state": "Maharashtra",
		"country": "India"
	},
	{
		"id": "672",
		"city": "Madhepura",
		"state": "Bihar",
		"country": "India"
	},
	{
		"id": "673",
		"city": "Pithoragarh",
		"state": "Uttarakhand",
		"country": "India"
	},
	{
		"id": "674",
		"city": "Tumsar",
		"state": "Maharashtra",
		"country": "India"
	},
	{
		"id": "675",
		"city": "Phalodi",
		"state": "Rajasthan",
		"country": "India"
	},
	{
		"id": "676",
		"city": "Tiruttani",
		"state": "Tamil Nadu",
		"country": "India"
	},
	{
		"id": "677",
		"city": "Rampura Phul",
		"state": "Punjab",
		"country": "India"
	},
	{
		"id": "678",
		"city": "Perinthalmanna",
		"state": "Kerala",
		"country": "India"
	},
	{
		"id": "679",
		"city": "Padrauna",
		"state": "Uttar Pradesh",
		"country": "India"
	},
	{
		"id": "680",
		"city": "Pipariya",
		"state": "Madhya Pradesh",
		"country": "India"
	},
	{
		"id": "681",
		"city": "Dalli-Rajhara",
		"state": "Chhattisgarh",
		"country": "India"
	},
	{
		"id": "682",
		"city": "Punganur",
		"state": "Andhra Pradesh",
		"country": "India"
	},
	{
		"id": "683",
		"city": "Mattannur",
		"state": "Kerala",
		"country": "India"
	},
	{
		"id": "684",
		"city": "Mathura",
		"state": "Uttar Pradesh",
		"country": "India"
	},
	{
		"id": "685",
		"city": "Thakurdwara",
		"state": "Uttar Pradesh",
		"country": "India"
	},
	{
		"id": "686",
		"city": "Nandivaram-Guduvancheri",
		"state": "Tamil Nadu",
		"country": "India"
	},
	{
		"id": "687",
		"city": "Mulbagal",
		"state": "Karnataka",
		"country": "India"
	},
	{
		"id": "688",
		"city": "Manjlegaon",
		"state": "Maharashtra",
		"country": "India"
	},
	{
		"id": "689",
		"city": "Wankaner",
		"state": "Gujarat",
		"country": "India"
	},
	{
		"id": "690",
		"city": "Sillod",
		"state": "Maharashtra",
		"country": "India"
	},
	{
		"id": "691",
		"city": "Nidadavole",
		"state": "Andhra Pradesh",
		"country": "India"
	},
	{
		"id": "692",
		"city": "Surapura",
		"state": "Karnataka",
		"country": "India"
	},
	{
		"id": "693",
		"city": "Rajagangapur",
		"state": "Odisha",
		"country": "India"
	},
	{
		"id": "694",
		"city": "Sheikhpura",
		"state": "Bihar",
		"country": "India"
	},
	{
		"id": "695",
		"city": "Parlakhemundi",
		"state": "Odisha",
		"country": "India"
	},
	{
		"id": "696",
		"city": "Kalimpong",
		"state": "West Bengal",
		"country": "India"
	},
	{
		"id": "697",
		"city": "Siruguppa",
		"state": "Karnataka",
		"country": "India"
	},
	{
		"id": "698",
		"city": "Arvi",
		"state": "Maharashtra",
		"country": "India"
	},
	{
		"id": "699",
		"city": "Limbdi",
		"state": "Gujarat",
		"country": "India"
	},
	{
		"id": "700",
		"city": "Barpeta",
		"state": "Assam",
		"country": "India"
	},
	{
		"id": "701",
		"city": "Manglaur",
		"state": "Uttarakhand",
		"country": "India"
	},
	{
		"id": "702",
		"city": "Repalle",
		"state": "Andhra Pradesh",
		"country": "India"
	},
	{
		"id": "703",
		"city": "Mudhol",
		"state": "Karnataka",
		"country": "India"
	},
	{
		"id": "704",
		"city": "Shujalpur",
		"state": "Madhya Pradesh",
		"country": "India"
	},
	{
		"id": "705",
		"city": "Mandvi",
		"state": "Gujarat",
		"country": "India"
	},
	{
		"id": "706",
		"city": "Thangadh",
		"state": "Gujarat",
		"country": "India"
	},
	{
		"id": "707",
		"city": "Sironj",
		"state": "Madhya Pradesh",
		"country": "India"
	},
	{
		"id": "708",
		"city": "Nandura",
		"state": "Maharashtra",
		"country": "India"
	},
	{
		"id": "709",
		"city": "Shoranur",
		"state": "Kerala",
		"country": "India"
	},
	{
		"id": "710",
		"city": "Nathdwara",
		"state": "Rajasthan",
		"country": "India"
	},
	{
		"id": "711",
		"city": "Periyakulam",
		"state": "Tamil Nadu",
		"country": "India"
	},
	{
		"id": "712",
		"city": "Sultanganj",
		"state": "Bihar",
		"country": "India"
	},
	{
		"id": "713",
		"city": "Medak",
		"state": "Telangana",
		"country": "India"
	},
	{
		"id": "714",
		"city": "Narayanpet",
		"state": "Telangana",
		"country": "India"
	},
	{
		"id": "715",
		"city": "Raxaul Bazar",
		"state": "Bihar",
		"country": "India"
	},
	{
		"id": "716",
		"city": "Rajauri",
		"state": "Jammu and Kashmir",
		"country": "India"
	},
	{
		"id": "717",
		"city": "Pernampattu",
		"state": "Tamil Nadu",
		"country": "India"
	},
	{
		"id": "718",
		"city": "Nainital",
		"state": "Uttarakhand",
		"country": "India"
	},
	{
		"id": "719",
		"city": "Ramachandrapuram",
		"state": "Andhra Pradesh",
		"country": "India"
	},
	{
		"id": "720",
		"city": "Vaijapur",
		"state": "Maharashtra",
		"country": "India"
	},
	{
		"id": "721",
		"city": "Nangal",
		"state": "Punjab",
		"country": "India"
	},
	{
		"id": "722",
		"city": "Sidlaghatta",
		"state": "Karnataka",
		"country": "India"
	},
	{
		"id": "723",
		"city": "Punch",
		"state": "Jammu and Kashmir",
		"country": "India"
	},
	{
		"id": "724",
		"city": "Pandhurna",
		"state": "Madhya Pradesh",
		"country": "India"
	},
	{
		"id": "725",
		"city": "Wadgaon Road",
		"state": "Maharashtra",
		"country": "India"
	},
	{
		"id": "726",
		"city": "Talcher",
		"state": "Odisha",
		"country": "India"
	},
	{
		"id": "727",
		"city": "Varkala",
		"state": "Kerala",
		"country": "India"
	},
	{
		"id": "728",
		"city": "Pilani",
		"state": "Rajasthan",
		"country": "India"
	},
	{
		"id": "729",
		"city": "Nowgong",
		"state": "Madhya Pradesh",
		"country": "India"
	},
	{
		"id": "730",
		"city": "Naila Janjgir",
		"state": "Chhattisgarh",
		"country": "India"
	},
	{
		"id": "731",
		"city": "Mapusa",
		"state": "Goa",
		"country": "India"
	},
	{
		"id": "732",
		"city": "Vellakoil",
		"state": "Tamil Nadu",
		"country": "India"
	},
	{
		"id": "733",
		"city": "Merta City",
		"state": "Rajasthan",
		"country": "India"
	},
	{
		"id": "734",
		"city": "Sivaganga",
		"state": "Tamil Nadu",
		"country": "India"
	},
	{
		"id": "735",
		"city": "Mandideep",
		"state": "Madhya Pradesh",
		"country": "India"
	},
	{
		"id": "736",
		"city": "Sailu",
		"state": "Maharashtra",
		"country": "India"
	},
	{
		"id": "737",
		"city": "Vyara",
		"state": "Gujarat",
		"country": "India"
	},
	{
		"id": "738",
		"city": "Kovvur",
		"state": "Andhra Pradesh",
		"country": "India"
	},
	{
		"id": "739",
		"city": "Vadalur",
		"state": "Tamil Nadu",
		"country": "India"
	},
	{
		"id": "740",
		"city": "Nawabganj",
		"state": "Uttar Pradesh",
		"country": "India"
	},
	{
		"id": "741",
		"city": "Padra",
		"state": "Gujarat",
		"country": "India"
	},
	{
		"id": "742",
		"city": "Sainthia",
		"state": "West Bengal",
		"country": "India"
	},
	{
		"id": "743",
		"city": "Siana",
		"state": "Uttar Pradesh",
		"country": "India"
	},
	{
		"id": "744",
		"city": "Shahpur",
		"state": "Karnataka",
		"country": "India"
	},
	{
		"id": "745",
		"city": "Sojat",
		"state": "Rajasthan",
		"country": "India"
	},
	{
		"id": "746",
		"city": "Noorpur",
		"state": "Uttar Pradesh",
		"country": "India"
	},
	{
		"id": "747",
		"city": "Paravoor",
		"state": "Kerala",
		"country": "India"
	},
	{
		"id": "748",
		"city": "Murtijapur",
		"state": "Maharashtra",
		"country": "India"
	},
	{
		"id": "749",
		"city": "Ramnagar",
		"state": "Bihar",
		"country": "India"
	},
	{
		"id": "750",
		"city": "Sundargarh",
		"state": "Odisha",
		"country": "India"
	},
	{
		"id": "751",
		"city": "Taki",
		"state": "West Bengal",
		"country": "India"
	},
	{
		"id": "752",
		"city": "Saundatti-Yellamma",
		"state": "Karnataka",
		"country": "India"
	},
	{
		"id": "753",
		"city": "Pathanamthitta",
		"state": "Kerala",
		"country": "India"
	},
	{
		"id": "754",
		"city": "Wadi",
		"state": "Karnataka",
		"country": "India"
	},
	{
		"id": "755",
		"city": "Rameshwaram",
		"state": "Tamil Nadu",
		"country": "India"
	},
	{
		"id": "756",
		"city": "Tasgaon",
		"state": "Maharashtra",
		"country": "India"
	},
	{
		"id": "757",
		"city": "Sikandra Rao",
		"state": "Uttar Pradesh",
		"country": "India"
	},
	{
		"id": "758",
		"city": "Sihora",
		"state": "Madhya Pradesh",
		"country": "India"
	},
	{
		"id": "759",
		"city": "Tiruvethipuram",
		"state": "Tamil Nadu",
		"country": "India"
	},
	{
		"id": "760",
		"city": "Tiruvuru",
		"state": "Andhra Pradesh",
		"country": "India"
	},
	{
		"id": "761",
		"city": "Mehkar",
		"state": "Maharashtra",
		"country": "India"
	},
	{
		"id": "762",
		"city": "Peringathur",
		"state": "Kerala",
		"country": "India"
	},
	{
		"id": "763",
		"city": "Perambalur",
		"state": "Tamil Nadu",
		"country": "India"
	},
	{
		"id": "764",
		"city": "Manvi",
		"state": "Karnataka",
		"country": "India"
	},
	{
		"id": "765",
		"city": "Zunheboto",
		"state": "Nagaland",
		"country": "India"
	},
	{
		"id": "766",
		"city": "Mahnar Bazar",
		"state": "Bihar",
		"country": "India"
	},
	{
		"id": "767",
		"city": "Attingal",
		"state": "Kerala",
		"country": "India"
	},
	{
		"id": "768",
		"city": "Shahbad",
		"state": "Haryana",
		"country": "India"
	},
	{
		"id": "769",
		"city": "Puranpur",
		"state": "Uttar Pradesh",
		"country": "India"
	},
	{
		"id": "770",
		"city": "Nelamangala",
		"state": "Karnataka",
		"country": "India"
	},
	{
		"id": "771",
		"city": "Nakodar",
		"state": "Punjab",
		"country": "India"
	},
	{
		"id": "772",
		"city": "Lunawada",
		"state": "Gujarat",
		"country": "India"
	},
	{
		"id": "773",
		"city": "Murshidabad",
		"state": "West Bengal",
		"country": "India"
	},
	{
		"id": "774",
		"city": "Mahe",
		"state": "Puducherry",
		"country": "India"
	},
	{
		"id": "775",
		"city": "Lanka",
		"state": "Assam",
		"country": "India"
	},
	{
		"id": "776",
		"city": "Rudauli",
		"state": "Uttar Pradesh",
		"country": "India"
	},
	{
		"id": "777",
		"city": "Tuensang",
		"state": "Nagaland",
		"country": "India"
	},
	{
		"id": "778",
		"city": "Lakshmeshwar",
		"state": "Karnataka",
		"country": "India"
	},
	{
		"id": "779",
		"city": "Zira",
		"state": "Punjab",
		"country": "India"
	},
	{
		"id": "780",
		"city": "Yawal",
		"state": "Maharashtra",
		"country": "India"
	},
	{
		"id": "781",
		"city": "Thana Bhawan",
		"state": "Uttar Pradesh",
		"country": "India"
	},
	{
		"id": "782",
		"city": "Ramdurg",
		"state": "Karnataka",
		"country": "India"
	},
	{
		"id": "783",
		"city": "Pulgaon",
		"state": "Maharashtra",
		"country": "India"
	},
	{
		"id": "784",
		"city": "Sadasivpet",
		"state": "Telangana",
		"country": "India"
	},
	{
		"id": "785",
		"city": "Nargund",
		"state": "Karnataka",
		"country": "India"
	},
	{
		"id": "786",
		"city": "Neem-Ka-Thana",
		"state": "Rajasthan",
		"country": "India"
	},
	{
		"id": "787",
		"city": "Memari",
		"state": "West Bengal",
		"country": "India"
	},
	{
		"id": "788",
		"city": "Nilanga",
		"state": "Maharashtra",
		"country": "India"
	},
	{
		"id": "789",
		"city": "Naharlagun",
		"state": "Arunachal Pradesh",
		"country": "India"
	},
	{
		"id": "790",
		"city": "Pakaur",
		"state": "Jharkhand",
		"country": "India"
	},
	{
		"id": "791",
		"city": "Wai",
		"state": "Maharashtra",
		"country": "India"
	},
	{
		"id": "792",
		"city": "Tarikere",
		"state": "Karnataka",
		"country": "India"
	},
	{
		"id": "793",
		"city": "Malavalli",
		"state": "Karnataka",
		"country": "India"
	},
	{
		"id": "794",
		"city": "Raisen",
		"state": "Madhya Pradesh",
		"country": "India"
	},
	{
		"id": "795",
		"city": "Lahar",
		"state": "Madhya Pradesh",
		"country": "India"
	},
	{
		"id": "796",
		"city": "Uravakonda",
		"state": "Andhra Pradesh",
		"country": "India"
	},
	{
		"id": "797",
		"city": "Savanur",
		"state": "Karnataka",
		"country": "India"
	},
	{
		"id": "798",
		"city": "Sirohi",
		"state": "Rajasthan",
		"country": "India"
	},
	{
		"id": "799",
		"city": "Udhampur",
		"state": "Jammu and Kashmir",
		"country": "India"
	},
	{
		"id": "800",
		"city": "Umarga",
		"state": "Maharashtra",
		"country": "India"
	},
	{
		"id": "801",
		"city": "Pratapgarh",
		"state": "Rajasthan",
		"country": "India"
	},
	{
		"id": "802",
		"city": "Lingsugur",
		"state": "Karnataka",
		"country": "India"
	},
	{
		"id": "803",
		"city": "Usilampatti",
		"state": "Tamil Nadu",
		"country": "India"
	},
	{
		"id": "804",
		"city": "Palia Kalan",
		"state": "Uttar Pradesh",
		"country": "India"
	},
	{
		"id": "805",
		"city": "Wokha",
		"state": "Nagaland",
		"country": "India"
	},
	{
		"id": "806",
		"city": "Rajpipla",
		"state": "Gujarat",
		"country": "India"
	},
	{
		"id": "807",
		"city": "Vijayapura",
		"state": "Karnataka",
		"country": "India"
	},
	{
		"id": "808",
		"city": "Rawatbhata",
		"state": "Rajasthan",
		"country": "India"
	},
	{
		"id": "809",
		"city": "Sangaria",
		"state": "Rajasthan",
		"country": "India"
	},
	{
		"id": "810",
		"city": "Paithan",
		"state": "Maharashtra",
		"country": "India"
	},
	{
		"id": "811",
		"city": "Rahuri",
		"state": "Maharashtra",
		"country": "India"
	},
	{
		"id": "812",
		"city": "Patti",
		"state": "Punjab",
		"country": "India"
	},
	{
		"id": "813",
		"city": "Zaidpur",
		"state": "Uttar Pradesh",
		"country": "India"
	},
	{
		"id": "814",
		"city": "Lalsot",
		"state": "Rajasthan",
		"country": "India"
	},
	{
		"id": "815",
		"city": "Maihar",
		"state": "Madhya Pradesh",
		"country": "India"
	},
	{
		"id": "816",
		"city": "Vedaranyam",
		"state": "Tamil Nadu",
		"country": "India"
	},
	{
		"id": "817",
		"city": "Nawapur",
		"state": "Maharashtra",
		"country": "India"
	},
	{
		"id": "818",
		"city": "Solan",
		"state": "Himachal Pradesh",
		"country": "India"
	},
	{
		"id": "819",
		"city": "Vapi",
		"state": "Gujarat",
		"country": "India"
	},
	{
		"id": "820",
		"city": "Sanawad",
		"state": "Madhya Pradesh",
		"country": "India"
	},
	{
		"id": "821",
		"city": "Warisaliganj",
		"state": "Bihar",
		"country": "India"
	},
	{
		"id": "822",
		"city": "Revelganj",
		"state": "Bihar",
		"country": "India"
	},
	{
		"id": "823",
		"city": "Sabalgarh",
		"state": "Madhya Pradesh",
		"country": "India"
	},
	{
		"id": "824",
		"city": "Tuljapur",
		"state": "Maharashtra",
		"country": "India"
	},
	{
		"id": "825",
		"city": "Simdega",
		"state": "Jharkhand",
		"country": "India"
	},
	{
		"id": "826",
		"city": "Musabani",
		"state": "Jharkhand",
		"country": "India"
	},
	{
		"id": "827",
		"city": "Kodungallur",
		"state": "Kerala",
		"country": "India"
	},
	{
		"id": "828",
		"city": "Phulabani",
		"state": "Odisha",
		"country": "India"
	},
	{
		"id": "829",
		"city": "Umreth",
		"state": "Gujarat",
		"country": "India"
	},
	{
		"id": "830",
		"city": "Narsipatnam",
		"state": "Andhra Pradesh",
		"country": "India"
	},
	{
		"id": "831",
		"city": "Nautanwa",
		"state": "Uttar Pradesh",
		"country": "India"
	},
	{
		"id": "832",
		"city": "Rajgir",
		"state": "Bihar",
		"country": "India"
	},
	{
		"id": "833",
		"city": "Yellandu",
		"state": "Telangana",
		"country": "India"
	},
	{
		"id": "834",
		"city": "Sathyamangalam",
		"state": "Tamil Nadu",
		"country": "India"
	},
	{
		"id": "835",
		"city": "Pilibanga",
		"state": "Rajasthan",
		"country": "India"
	},
	{
		"id": "836",
		"city": "Morshi",
		"state": "Maharashtra",
		"country": "India"
	},
	{
		"id": "837",
		"city": "Pehowa",
		"state": "Haryana",
		"country": "India"
	},
	{
		"id": "838",
		"city": "Sonepur",
		"state": "Bihar",
		"country": "India"
	},
	{
		"id": "839",
		"city": "Pappinisseri",
		"state": "Kerala",
		"country": "India"
	},
	{
		"id": "840",
		"city": "Zamania",
		"state": "Uttar Pradesh",
		"country": "India"
	},
	{
		"id": "841",
		"city": "Mihijam",
		"state": "Jharkhand",
		"country": "India"
	},
	{
		"id": "842",
		"city": "Purna",
		"state": "Maharashtra",
		"country": "India"
	},
	{
		"id": "843",
		"city": "Puliyankudi",
		"state": "Tamil Nadu",
		"country": "India"
	},
	{
		"id": "844",
		"city": "Shikarpur, Bulandshahr",
		"state": "Uttar Pradesh",
		"country": "India"
	},
	{
		"id": "845",
		"city": "Umaria",
		"state": "Madhya Pradesh",
		"country": "India"
	},
	{
		"id": "846",
		"city": "Porsa",
		"state": "Madhya Pradesh",
		"country": "India"
	},
	{
		"id": "847",
		"city": "Naugawan Sadat",
		"state": "Uttar Pradesh",
		"country": "India"
	},
	{
		"id": "848",
		"city": "Fatehpur Sikri",
		"state": "Uttar Pradesh",
		"country": "India"
	},
	{
		"id": "849",
		"city": "Manuguru",
		"state": "Telangana",
		"country": "India"
	},
	{
		"id": "850",
		"city": "Udaipur",
		"state": "Tripura",
		"country": "India"
	},
	{
		"id": "851",
		"city": "Pipar City",
		"state": "Rajasthan",
		"country": "India"
	},
	{
		"id": "852",
		"city": "Pattamundai",
		"state": "Odisha",
		"country": "India"
	},
	{
		"id": "853",
		"city": "Nanjikottai",
		"state": "Tamil Nadu",
		"country": "India"
	},
	{
		"id": "854",
		"city": "Taranagar",
		"state": "Rajasthan",
		"country": "India"
	},
	{
		"id": "855",
		"city": "Yerraguntla",
		"state": "Andhra Pradesh",
		"country": "India"
	},
	{
		"id": "856",
		"city": "Satana",
		"state": "Maharashtra",
		"country": "India"
	},
	{
		"id": "857",
		"city": "Sherghati",
		"state": "Bihar",
		"country": "India"
	},
	{
		"id": "858",
		"city": "Sankeshwara",
		"state": "Karnataka",
		"country": "India"
	},
	{
		"id": "859",
		"city": "Madikeri",
		"state": "Karnataka",
		"country": "India"
	},
	{
		"id": "860",
		"city": "Thuraiyur",
		"state": "Tamil Nadu",
		"country": "India"
	},
	{
		"id": "861",
		"city": "Sanand",
		"state": "Gujarat",
		"country": "India"
	},
	{
		"id": "862",
		"city": "Rajula",
		"state": "Gujarat",
		"country": "India"
	},
	{
		"id": "863",
		"city": "Kyathampalle",
		"state": "Telangana",
		"country": "India"
	},
	{
		"id": "864",
		"city": "Shahabad, Rampur",
		"state": "Uttar Pradesh",
		"country": "India"
	},
	{
		"id": "865",
		"city": "Tilda Newra",
		"state": "Chhattisgarh",
		"country": "India"
	},
	{
		"id": "866",
		"city": "Narsinghgarh",
		"state": "Madhya Pradesh",
		"country": "India"
	},
	{
		"id": "867",
		"city": "Chittur-Thathamangalam",
		"state": "Kerala",
		"country": "India"
	},
	{
		"id": "868",
		"city": "Malaj Khand",
		"state": "Madhya Pradesh",
		"country": "India"
	},
	{
		"id": "869",
		"city": "Sarangpur",
		"state": "Madhya Pradesh",
		"country": "India"
	},
	{
		"id": "870",
		"city": "Robertsganj",
		"state": "Uttar Pradesh",
		"country": "India"
	},
	{
		"id": "871",
		"city": "Sirkali",
		"state": "Tamil Nadu",
		"country": "India"
	},
	{
		"id": "872",
		"city": "Radhanpur",
		"state": "Gujarat",
		"country": "India"
	},
	{
		"id": "873",
		"city": "Tiruchendur",
		"state": "Tamil Nadu",
		"country": "India"
	},
	{
		"id": "874",
		"city": "Utraula",
		"state": "Uttar Pradesh",
		"country": "India"
	},
	{
		"id": "875",
		"city": "Patratu",
		"state": "Jharkhand",
		"country": "India"
	},
	{
		"id": "876",
		"city": "Vijainagar, Ajmer",
		"state": "Rajasthan",
		"country": "India"
	},
	{
		"id": "877",
		"city": "Periyasemur",
		"state": "Tamil Nadu",
		"country": "India"
	},
	{
		"id": "878",
		"city": "Pathri",
		"state": "Maharashtra",
		"country": "India"
	},
	{
		"id": "879",
		"city": "Sadabad",
		"state": "Uttar Pradesh",
		"country": "India"
	},
	{
		"id": "880",
		"city": "Talikota",
		"state": "Karnataka",
		"country": "India"
	},
	{
		"id": "881",
		"city": "Sinnar",
		"state": "Maharashtra",
		"country": "India"
	},
	{
		"id": "882",
		"city": "Mungeli",
		"state": "Chhattisgarh",
		"country": "India"
	},
	{
		"id": "883",
		"city": "Sedam",
		"state": "Karnataka",
		"country": "India"
	},
	{
		"id": "884",
		"city": "Shikaripur",
		"state": "Karnataka",
		"country": "India"
	},
	{
		"id": "885",
		"city": "Sumerpur",
		"state": "Rajasthan",
		"country": "India"
	},
	{
		"id": "886",
		"city": "Sattur",
		"state": "Tamil Nadu",
		"country": "India"
	},
	{
		"id": "887",
		"city": "Sugauli",
		"state": "Bihar",
		"country": "India"
	},
	{
		"id": "888",
		"city": "Lumding",
		"state": "Assam",
		"country": "India"
	},
	{
		"id": "889",
		"city": "Vandavasi",
		"state": "Tamil Nadu",
		"country": "India"
	},
	{
		"id": "890",
		"city": "Titlagarh",
		"state": "Odisha",
		"country": "India"
	},
	{
		"id": "891",
		"city": "Uchgaon",
		"state": "Maharashtra",
		"country": "India"
	},
	{
		"id": "892",
		"city": "Mokokchung",
		"state": "Nagaland",
		"country": "India"
	},
	{
		"id": "893",
		"city": "Paschim Punropara",
		"state": "West Bengal",
		"country": "India"
	},
	{
		"id": "894",
		"city": "Sagwara",
		"state": "Rajasthan",
		"country": "India"
	},
	{
		"id": "895",
		"city": "Ramganj Mandi",
		"state": "Rajasthan",
		"country": "India"
	},
	{
		"id": "896",
		"city": "Tarakeswar",
		"state": "West Bengal",
		"country": "India"
	},
	{
		"id": "897",
		"city": "Mahalingapura",
		"state": "Karnataka",
		"country": "India"
	},
	{
		"id": "898",
		"city": "Dharmanagar",
		"state": "Tripura",
		"country": "India"
	},
	{
		"id": "899",
		"city": "Mahemdabad",
		"state": "Gujarat",
		"country": "India"
	},
	{
		"id": "900",
		"city": "Manendragarh",
		"state": "Chhattisgarh",
		"country": "India"
	},
	{
		"id": "901",
		"city": "Uran",
		"state": "Maharashtra",
		"country": "India"
	},
	{
		"id": "902",
		"city": "Tharamangalam",
		"state": "Tamil Nadu",
		"country": "India"
	},
	{
		"id": "903",
		"city": "Tirukkoyilur",
		"state": "Tamil Nadu",
		"country": "India"
	},
	{
		"id": "904",
		"city": "Pen",
		"state": "Maharashtra",
		"country": "India"
	},
	{
		"id": "905",
		"city": "Makhdumpur",
		"state": "Bihar",
		"country": "India"
	},
	{
		"id": "906",
		"city": "Maner",
		"state": "Bihar",
		"country": "India"
	},
	{
		"id": "907",
		"city": "Oddanchatram",
		"state": "Tamil Nadu",
		"country": "India"
	},
	{
		"id": "908",
		"city": "Palladam",
		"state": "Tamil Nadu",
		"country": "India"
	},
	{
		"id": "909",
		"city": "Mundi",
		"state": "Madhya Pradesh",
		"country": "India"
	},
	{
		"id": "910",
		"city": "Nabarangapur",
		"state": "Odisha",
		"country": "India"
	},
	{
		"id": "911",
		"city": "Mudalagi",
		"state": "Karnataka",
		"country": "India"
	},
	{
		"id": "912",
		"city": "Samalkha",
		"state": "Haryana",
		"country": "India"
	},
	{
		"id": "913",
		"city": "Nepanagar",
		"state": "Madhya Pradesh",
		"country": "India"
	},
	{
		"id": "914",
		"city": "Karjat",
		"state": "Maharashtra",
		"country": "India"
	},
	{
		"id": "915",
		"city": "Ranavav",
		"state": "Gujarat",
		"country": "India"
	},
	{
		"id": "916",
		"city": "Pedana",
		"state": "Andhra Pradesh",
		"country": "India"
	},
	{
		"id": "917",
		"city": "Pinjore",
		"state": "Haryana",
		"country": "India"
	},
	{
		"id": "918",
		"city": "Lakheri",
		"state": "Rajasthan",
		"country": "India"
	},
	{
		"id": "919",
		"city": "Pasan",
		"state": "Madhya Pradesh",
		"country": "India"
	},
	{
		"id": "920",
		"city": "Puttur",
		"state": "Andhra Pradesh",
		"country": "India"
	},
	{
		"id": "921",
		"city": "Vadakkuvalliyur",
		"state": "Tamil Nadu",
		"country": "India"
	},
	{
		"id": "922",
		"city": "Tirukalukundram",
		"state": "Tamil Nadu",
		"country": "India"
	},
	{
		"id": "923",
		"city": "Mahidpur",
		"state": "Madhya Pradesh",
		"country": "India"
	},
	{
		"id": "924",
		"city": "Mussoorie",
		"state": "Uttarakhand",
		"country": "India"
	},
	{
		"id": "925",
		"city": "Muvattupuzha",
		"state": "Kerala",
		"country": "India"
	},
	{
		"id": "926",
		"city": "Rasra",
		"state": "Uttar Pradesh",
		"country": "India"
	},
	{
		"id": "927",
		"city": "Udaipurwati",
		"state": "Rajasthan",
		"country": "India"
	},
	{
		"id": "928",
		"city": "Manwath",
		"state": "Maharashtra",
		"country": "India"
	},
	{
		"id": "929",
		"city": "Adoor",
		"state": "Kerala",
		"country": "India"
	},
	{
		"id": "930",
		"city": "Uthamapalayam",
		"state": "Tamil Nadu",
		"country": "India"
	},
	{
		"id": "931",
		"city": "Partur",
		"state": "Maharashtra",
		"country": "India"
	},
	{
		"id": "932",
		"city": "Nahan",
		"state": "Himachal Pradesh",
		"country": "India"
	},
	{
		"id": "933",
		"city": "Ladwa",
		"state": "Haryana",
		"country": "India"
	},
	{
		"id": "934",
		"city": "Mankachar",
		"state": "Assam",
		"country": "India"
	},
	{
		"id": "935",
		"city": "Nongstoin",
		"state": "Meghalaya",
		"country": "India"
	},
	{
		"id": "936",
		"city": "Losal",
		"state": "Rajasthan",
		"country": "India"
	},
	{
		"id": "937",
		"city": "Sri Madhopur",
		"state": "Rajasthan",
		"country": "India"
	},
	{
		"id": "938",
		"city": "Ramngarh",
		"state": "Rajasthan",
		"country": "India"
	},
	{
		"id": "939",
		"city": "Mavelikkara",
		"state": "Kerala",
		"country": "India"
	},
	{
		"id": "940",
		"city": "Rawatsar",
		"state": "Rajasthan",
		"country": "India"
	},
	{
		"id": "941",
		"city": "Rajakhera",
		"state": "Rajasthan",
		"country": "India"
	},
	{
		"id": "942",
		"city": "Lar",
		"state": "Uttar Pradesh",
		"country": "India"
	},
	{
		"id": "943",
		"city": "Lal Gopalganj Nindaura",
		"state": "Uttar Pradesh",
		"country": "India"
	},
	{
		"id": "944",
		"city": "Muddebihal",
		"state": "Karnataka",
		"country": "India"
	},
	{
		"id": "945",
		"city": "Sirsaganj",
		"state": "Uttar Pradesh",
		"country": "India"
	},
	{
		"id": "946",
		"city": "Shahpura",
		"state": "Rajasthan",
		"country": "India"
	},
	{
		"id": "947",
		"city": "Surandai",
		"state": "Tamil Nadu",
		"country": "India"
	},
	{
		"id": "948",
		"city": "Sangole",
		"state": "Maharashtra",
		"country": "India"
	},
	{
		"id": "949",
		"city": "Pavagada",
		"state": "Karnataka",
		"country": "India"
	},
	{
		"id": "950",
		"city": "Tharad",
		"state": "Gujarat",
		"country": "India"
	},
	{
		"id": "951",
		"city": "Mansa",
		"state": "Gujarat",
		"country": "India"
	},
	{
		"id": "952",
		"city": "Umbergaon",
		"state": "Gujarat",
		"country": "India"
	},
	{
		"id": "953",
		"city": "Mavoor",
		"state": "Kerala",
		"country": "India"
	},
	{
		"id": "954",
		"city": "Nalbari",
		"state": "Assam",
		"country": "India"
	},
	{
		"id": "955",
		"city": "Talaja",
		"state": "Gujarat",
		"country": "India"
	},
	{
		"id": "956",
		"city": "Malur",
		"state": "Karnataka",
		"country": "India"
	},
	{
		"id": "957",
		"city": "Mangrulpir",
		"state": "Maharashtra",
		"country": "India"
	},
	{
		"id": "958",
		"city": "Soro",
		"state": "Odisha",
		"country": "India"
	},
	{
		"id": "959",
		"city": "Shahpura",
		"state": "Rajasthan",
		"country": "India"
	},
	{
		"id": "960",
		"city": "Vadnagar",
		"state": "Gujarat",
		"country": "India"
	},
	{
		"id": "961",
		"city": "Raisinghnagar",
		"state": "Rajasthan",
		"country": "India"
	},
	{
		"id": "962",
		"city": "Sindhagi",
		"state": "Karnataka",
		"country": "India"
	},
	{
		"id": "963",
		"city": "Sanduru",
		"state": "Karnataka",
		"country": "India"
	},
	{
		"id": "964",
		"city": "Sohna",
		"state": "Haryana",
		"country": "India"
	},
	{
		"id": "965",
		"city": "Manavadar",
		"state": "Gujarat",
		"country": "India"
	},
	{
		"id": "966",
		"city": "Pihani",
		"state": "Uttar Pradesh",
		"country": "India"
	},
	{
		"id": "967",
		"city": "Safidon",
		"state": "Haryana",
		"country": "India"
	},
	{
		"id": "968",
		"city": "Risod",
		"state": "Maharashtra",
		"country": "India"
	},
	{
		"id": "969",
		"city": "Rosera",
		"state": "Bihar",
		"country": "India"
	},
	{
		"id": "970",
		"city": "Sankari",
		"state": "Tamil Nadu",
		"country": "India"
	},
	{
		"id": "971",
		"city": "Malpura",
		"state": "Rajasthan",
		"country": "India"
	},
	{
		"id": "972",
		"city": "Sonamukhi",
		"state": "West Bengal",
		"country": "India"
	},
	{
		"id": "973",
		"city": "Shamsabad, Agra",
		"state": "Uttar Pradesh",
		"country": "India"
	},
	{
		"id": "974",
		"city": "Nokha",
		"state": "Bihar",
		"country": "India"
	},
	{
		"id": "975",
		"city": "PandUrban Agglomeration",
		"state": "West Bengal",
		"country": "India"
	},
	{
		"id": "976",
		"city": "Mainaguri",
		"state": "West Bengal",
		"country": "India"
	},
	{
		"id": "977",
		"city": "Afzalpur",
		"state": "Karnataka",
		"country": "India"
	},
	{
		"id": "978",
		"city": "Shirur",
		"state": "Maharashtra",
		"country": "India"
	},
	{
		"id": "979",
		"city": "Salaya",
		"state": "Gujarat",
		"country": "India"
	},
	{
		"id": "980",
		"city": "Shenkottai",
		"state": "Tamil Nadu",
		"country": "India"
	},
	{
		"id": "981",
		"city": "Pratapgarh",
		"state": "Tripura",
		"country": "India"
	},
	{
		"id": "982",
		"city": "Vadipatti",
		"state": "Tamil Nadu",
		"country": "India"
	},
	{
		"id": "983",
		"city": "Nagarkurnool",
		"state": "Telangana",
		"country": "India"
	},
	{
		"id": "984",
		"city": "Savner",
		"state": "Maharashtra",
		"country": "India"
	},
	{
		"id": "985",
		"city": "Sasvad",
		"state": "Maharashtra",
		"country": "India"
	},
	{
		"id": "986",
		"city": "Rudrapur",
		"state": "Uttar Pradesh",
		"country": "India"
	},
	{
		"id": "987",
		"city": "Soron",
		"state": "Uttar Pradesh",
		"country": "India"
	},
	{
		"id": "988",
		"city": "Sholingur",
		"state": "Tamil Nadu",
		"country": "India"
	},
	{
		"id": "989",
		"city": "Pandharkaoda",
		"state": "Maharashtra",
		"country": "India"
	},
	{
		"id": "990",
		"city": "Perumbavoor",
		"state": "Kerala",
		"country": "India"
	},
	{
		"id": "991",
		"city": "Maddur",
		"state": "Karnataka",
		"country": "India"
	},
	{
		"id": "992",
		"city": "Nadbai",
		"state": "Rajasthan",
		"country": "India"
	},
	{
		"id": "993",
		"city": "Talode",
		"state": "Maharashtra",
		"country": "India"
	},
	{
		"id": "994",
		"city": "Shrigonda",
		"state": "Maharashtra",
		"country": "India"
	},
	{
		"id": "995",
		"city": "Madhugiri",
		"state": "Karnataka",
		"country": "India"
	},
	{
		"id": "996",
		"city": "Tekkalakote",
		"state": "Karnataka",
		"country": "India"
	},
	{
		"id": "997",
		"city": "Seoni-Malwa",
		"state": "Madhya Pradesh",
		"country": "India"
	},
	{
		"id": "998",
		"city": "Shirdi",
		"state": "Maharashtra",
		"country": "India"
	},
	{
		"id": "999",
		"city": "SUrban Agglomerationr",
		"state": "Uttar Pradesh",
		"country": "India"
	},
	{
		"id": "1000",
		"city": "Terdal",
		"state": "Karnataka",
		"country": "India"
	},
	{
		"id": "1001",
		"city": "Raver",
		"state": "Maharashtra",
		"country": "India"
	},
	{
		"id": "1002",
		"city": "Tirupathur",
		"state": "Tamil Nadu",
		"country": "India"
	},
	{
		"id": "1003",
		"city": "Taraori",
		"state": "Haryana",
		"country": "India"
	},
	{
		"id": "1004",
		"city": "Mukhed",
		"state": "Maharashtra",
		"country": "India"
	},
	{
		"id": "1005",
		"city": "Manachanallur",
		"state": "Tamil Nadu",
		"country": "India"
	},
	{
		"id": "1006",
		"city": "Rehli",
		"state": "Madhya Pradesh",
		"country": "India"
	},
	{
		"id": "1007",
		"city": "Sanchore",
		"state": "Rajasthan",
		"country": "India"
	},
	{
		"id": "1008",
		"city": "Rajura",
		"state": "Maharashtra",
		"country": "India"
	},
	{
		"id": "1009",
		"city": "Piro",
		"state": "Bihar",
		"country": "India"
	},
	{
		"id": "1010",
		"city": "Mudabidri",
		"state": "Karnataka",
		"country": "India"
	},
	{
		"id": "1011",
		"city": "Vadgaon Kasba",
		"state": "Maharashtra",
		"country": "India"
	},
	{
		"id": "1012",
		"city": "Nagar",
		"state": "Rajasthan",
		"country": "India"
	},
	{
		"id": "1013",
		"city": "Vijapur",
		"state": "Gujarat",
		"country": "India"
	},
	{
		"id": "1014",
		"city": "Viswanatham",
		"state": "Tamil Nadu",
		"country": "India"
	},
	{
		"id": "1015",
		"city": "Polur",
		"state": "Tamil Nadu",
		"country": "India"
	},
	{
		"id": "1016",
		"city": "Panagudi",
		"state": "Tamil Nadu",
		"country": "India"
	},
	{
		"id": "1017",
		"city": "Manawar",
		"state": "Madhya Pradesh",
		"country": "India"
	},
	{
		"id": "1018",
		"city": "Tehri",
		"state": "Uttarakhand",
		"country": "India"
	},
	{
		"id": "1019",
		"city": "Samdhan",
		"state": "Uttar Pradesh",
		"country": "India"
	},
	{
		"id": "1020",
		"city": "Pardi",
		"state": "Gujarat",
		"country": "India"
	},
	{
		"id": "1021",
		"city": "Rahatgarh",
		"state": "Madhya Pradesh",
		"country": "India"
	},
	{
		"id": "1022",
		"city": "Panagar",
		"state": "Madhya Pradesh",
		"country": "India"
	},
	{
		"id": "1023",
		"city": "Uthiramerur",
		"state": "Tamil Nadu",
		"country": "India"
	},
	{
		"id": "1024",
		"city": "Tirora",
		"state": "Maharashtra",
		"country": "India"
	},
	{
		"id": "1025",
		"city": "Rangia",
		"state": "Assam",
		"country": "India"
	},
	{
		"id": "1026",
		"city": "Sahjanwa",
		"state": "Uttar Pradesh",
		"country": "India"
	},
	{
		"id": "1027",
		"city": "Wara Seoni",
		"state": "Madhya Pradesh",
		"country": "India"
	},
	{
		"id": "1028",
		"city": "Magadi",
		"state": "Karnataka",
		"country": "India"
	},
	{
		"id": "1029",
		"city": "Rajgarh (Alwar)",
		"state": "Rajasthan",
		"country": "India"
	},
	{
		"id": "1030",
		"city": "Rafiganj",
		"state": "Bihar",
		"country": "India"
	},
	{
		"id": "1031",
		"city": "Tarana",
		"state": "Madhya Pradesh",
		"country": "India"
	},
	{
		"id": "1032",
		"city": "Rampur Maniharan",
		"state": "Uttar Pradesh",
		"country": "India"
	},
	{
		"id": "1033",
		"city": "Sheoganj",
		"state": "Rajasthan",
		"country": "India"
	},
	{
		"id": "1034",
		"city": "Raikot",
		"state": "Punjab",
		"country": "India"
	},
	{
		"id": "1035",
		"city": "Pauri",
		"state": "Uttarakhand",
		"country": "India"
	},
	{
		"id": "1036",
		"city": "Sumerpur",
		"state": "Uttar Pradesh",
		"country": "India"
	},
	{
		"id": "1037",
		"city": "Navalgund",
		"state": "Karnataka",
		"country": "India"
	},
	{
		"id": "1038",
		"city": "Shahganj",
		"state": "Uttar Pradesh",
		"country": "India"
	},
	{
		"id": "1039",
		"city": "Marhaura",
		"state": "Bihar",
		"country": "India"
	},
	{
		"id": "1040",
		"city": "Tulsipur",
		"state": "Uttar Pradesh",
		"country": "India"
	},
	{
		"id": "1041",
		"city": "Sadri",
		"state": "Rajasthan",
		"country": "India"
	},
	{
		"id": "1042",
		"city": "Thiruthuraipoondi",
		"state": "Tamil Nadu",
		"country": "India"
	},
	{
		"id": "1043",
		"city": "Shiggaon",
		"state": "Karnataka",
		"country": "India"
	},
	{
		"id": "1044",
		"city": "Pallapatti",
		"state": "Tamil Nadu",
		"country": "India"
	},
	{
		"id": "1045",
		"city": "Mahendragarh",
		"state": "Haryana",
		"country": "India"
	},
	{
		"id": "1046",
		"city": "Sausar",
		"state": "Madhya Pradesh",
		"country": "India"
	},
	{
		"id": "1047",
		"city": "Ponneri",
		"state": "Tamil Nadu",
		"country": "India"
	},
	{
		"id": "1048",
		"city": "Mahad",
		"state": "Maharashtra",
		"country": "India"
	},
	{
		"id": "1049",
		"city": "Lohardaga",
		"state": "Jharkhand",
		"country": "India"
	},
	{
		"id": "1050",
		"city": "Tirwaganj",
		"state": "Uttar Pradesh",
		"country": "India"
	},
	{
		"id": "1051",
		"city": "Margherita",
		"state": "Assam",
		"country": "India"
	},
	{
		"id": "1052",
		"city": "Sundarnagar",
		"state": "Himachal Pradesh",
		"country": "India"
	},
	{
		"id": "1053",
		"city": "Rajgarh",
		"state": "Madhya Pradesh",
		"country": "India"
	},
	{
		"id": "1054",
		"city": "Mangaldoi",
		"state": "Assam",
		"country": "India"
	},
	{
		"id": "1055",
		"city": "Renigunta",
		"state": "Andhra Pradesh",
		"country": "India"
	},
	{
		"id": "1056",
		"city": "Longowal",
		"state": "Punjab",
		"country": "India"
	},
	{
		"id": "1057",
		"city": "Ratia",
		"state": "Haryana",
		"country": "India"
	},
	{
		"id": "1058",
		"city": "Lalgudi",
		"state": "Tamil Nadu",
		"country": "India"
	},
	{
		"id": "1059",
		"city": "Shrirangapattana",
		"state": "Karnataka",
		"country": "India"
	},
	{
		"id": "1060",
		"city": "Niwari",
		"state": "Madhya Pradesh",
		"country": "India"
	},
	{
		"id": "1061",
		"city": "Natham",
		"state": "Tamil Nadu",
		"country": "India"
	},
	{
		"id": "1062",
		"city": "Unnamalaikadai",
		"state": "Tamil Nadu",
		"country": "India"
	},
	{
		"id": "1063",
		"city": "PurqUrban Agglomerationzi",
		"state": "Uttar Pradesh",
		"country": "India"
	},
	{
		"id": "1064",
		"city": "Shamsabad, Farrukhabad",
		"state": "Uttar Pradesh",
		"country": "India"
	},
	{
		"id": "1065",
		"city": "Mirganj",
		"state": "Bihar",
		"country": "India"
	},
	{
		"id": "1066",
		"city": "Todaraisingh",
		"state": "Rajasthan",
		"country": "India"
	},
	{
		"id": "1067",
		"city": "Warhapur",
		"state": "Uttar Pradesh",
		"country": "India"
	},
	{
		"id": "1068",
		"city": "Rajam",
		"state": "Andhra Pradesh",
		"country": "India"
	},
	{
		"id": "1069",
		"city": "Urmar Tanda",
		"state": "Punjab",
		"country": "India"
	},
	{
		"id": "1070",
		"city": "Lonar",
		"state": "Maharashtra",
		"country": "India"
	},
	{
		"id": "1071",
		"city": "Powayan",
		"state": "Uttar Pradesh",
		"country": "India"
	},
	{
		"id": "1072",
		"city": "P.N.Patti",
		"state": "Tamil Nadu",
		"country": "India"
	},
	{
		"id": "1073",
		"city": "Palampur",
		"state": "Himachal Pradesh",
		"country": "India"
	},
	{
		"id": "1074",
		"city": "Srisailam Project (Right Flank Colony) Township",
		"state": "Andhra Pradesh",
		"country": "India"
	},
	{
		"id": "1075",
		"city": "Sindagi",
		"state": "Karnataka",
		"country": "India"
	},
	{
		"id": "1076",
		"city": "Sandi",
		"state": "Uttar Pradesh",
		"country": "India"
	},
	{
		"id": "1077",
		"city": "Vaikom",
		"state": "Kerala",
		"country": "India"
	},
	{
		"id": "1078",
		"city": "Malda",
		"state": "West Bengal",
		"country": "India"
	},
	{
		"id": "1079",
		"city": "Tharangambadi",
		"state": "Tamil Nadu",
		"country": "India"
	},
	{
		"id": "1080",
		"city": "Sakaleshapura",
		"state": "Karnataka",
		"country": "India"
	},
	{
		"id": "1081",
		"city": "Lalganj",
		"state": "Bihar",
		"country": "India"
	},
	{
		"id": "1082",
		"city": "Malkangiri",
		"state": "Odisha",
		"country": "India"
	},
	{
		"id": "1083",
		"city": "Rapar",
		"state": "Gujarat",
		"country": "India"
	},
	{
		"id": "1084",
		"city": "Mauganj",
		"state": "Madhya Pradesh",
		"country": "India"
	},
	{
		"id": "1085",
		"city": "Todabhim",
		"state": "Rajasthan",
		"country": "India"
	},
	{
		"id": "1086",
		"city": "Srinivaspur",
		"state": "Karnataka",
		"country": "India"
	},
	{
		"id": "1087",
		"city": "Murliganj",
		"state": "Bihar",
		"country": "India"
	},
	{
		"id": "1088",
		"city": "Reengus",
		"state": "Rajasthan",
		"country": "India"
	},
	{
		"id": "1089",
		"city": "Sawantwadi",
		"state": "Maharashtra",
		"country": "India"
	},
	{
		"id": "1090",
		"city": "Tittakudi",
		"state": "Tamil Nadu",
		"country": "India"
	},
	{
		"id": "1091",
		"city": "Lilong",
		"state": "Manipur",
		"country": "India"
	},
	{
		"id": "1092",
		"city": "Rajaldesar",
		"state": "Rajasthan",
		"country": "India"
	},
	{
		"id": "1093",
		"city": "Pathardi",
		"state": "Maharashtra",
		"country": "India"
	},
	{
		"id": "1094",
		"city": "Achhnera",
		"state": "Uttar Pradesh",
		"country": "India"
	},
	{
		"id": "1095",
		"city": "Pacode",
		"state": "Tamil Nadu",
		"country": "India"
	},
	{
		"id": "1096",
		"city": "Naraura",
		"state": "Uttar Pradesh",
		"country": "India"
	},
	{
		"id": "1097",
		"city": "Nakur",
		"state": "Uttar Pradesh",
		"country": "India"
	},
	{
		"id": "1098",
		"city": "Palai",
		"state": "Kerala",
		"country": "India"
	},
	{
		"id": "1099",
		"city": "Morinda, India",
		"state": "Punjab",
		"country": "India"
	},
	{
		"id": "1100",
		"city": "Manasa",
		"state": "Madhya Pradesh",
		"country": "India"
	},
	{
		"id": "1101",
		"city": "Nainpur",
		"state": "Madhya Pradesh",
		"country": "India"
	},
	{
		"id": "1102",
		"city": "Sahaspur",
		"state": "Uttar Pradesh",
		"country": "India"
	},
	{
		"id": "1103",
		"city": "Pauni",
		"state": "Maharashtra",
		"country": "India"
	},
	{
		"id": "1104",
		"city": "Prithvipur",
		"state": "Madhya Pradesh",
		"country": "India"
	},
	{
		"id": "1105",
		"city": "Ramtek",
		"state": "Maharashtra",
		"country": "India"
	},
	{
		"id": "1106",
		"city": "Silapathar",
		"state": "Assam",
		"country": "India"
	},
	{
		"id": "1107",
		"city": "Songadh",
		"state": "Gujarat",
		"country": "India"
	},
	{
		"id": "1108",
		"city": "Safipur",
		"state": "Uttar Pradesh",
		"country": "India"
	},
	{
		"id": "1109",
		"city": "Sohagpur",
		"state": "Madhya Pradesh",
		"country": "India"
	},
	{
		"id": "1110",
		"city": "Mul",
		"state": "Maharashtra",
		"country": "India"
	},
	{
		"id": "1111",
		"city": "Sadulshahar",
		"state": "Rajasthan",
		"country": "India"
	},
	{
		"id": "1112",
		"city": "Phillaur",
		"state": "Punjab",
		"country": "India"
	},
	{
		"id": "1113",
		"city": "Sambhar",
		"state": "Rajasthan",
		"country": "India"
	},
	{
		"id": "1114",
		"city": "Prantij",
		"state": "Rajasthan",
		"country": "India"
	},
	{
		"id": "1115",
		"city": "Nagla",
		"state": "Uttarakhand",
		"country": "India"
	},
	{
		"id": "1116",
		"city": "Pattran",
		"state": "Punjab",
		"country": "India"
	},
	{
		"id": "1117",
		"city": "Mount Abu",
		"state": "Rajasthan",
		"country": "India"
	},
	{
		"id": "1118",
		"city": "Reoti",
		"state": "Uttar Pradesh",
		"country": "India"
	},
	{
		"id": "1119",
		"city": "Tenu dam-cum-Kathhara",
		"state": "Jharkhand",
		"country": "India"
	},
	{
		"id": "1120",
		"city": "Panchla",
		"state": "West Bengal",
		"country": "India"
	},
	{
		"id": "1121",
		"city": "Sitarganj",
		"state": "Uttarakhand",
		"country": "India"
	},
	{
		"id": "1122",
		"city": "Pasighat",
		"state": "Arunachal Pradesh",
		"country": "India"
	},
	{
		"id": "1123",
		"city": "Motipur",
		"state": "Bihar",
		"country": "India"
	},
	{
		"id": "1124",
		"city": "O' Valley",
		"state": "Tamil Nadu",
		"country": "India"
	},
	{
		"id": "1125",
		"city": "Raghunathpur",
		"state": "West Bengal",
		"country": "India"
	},
	{
		"id": "1126",
		"city": "Suriyampalayam",
		"state": "Tamil Nadu",
		"country": "India"
	},
	{
		"id": "1127",
		"city": "Qadian",
		"state": "Punjab",
		"country": "India"
	},
	{
		"id": "1128",
		"city": "Rairangpur",
		"state": "Odisha",
		"country": "India"
	},
	{
		"id": "1129",
		"city": "Silvassa",
		"state": "Dadra and Nagar Haveli",
		"country": "India"
	},
	{
		"id": "1130",
		"city": "Nowrozabad (Khodargama)",
		"state": "Madhya Pradesh",
		"country": "India"
	},
	{
		"id": "1131",
		"city": "Mangrol",
		"state": "Rajasthan",
		"country": "India"
	},
	{
		"id": "1132",
		"city": "Soyagaon",
		"state": "Maharashtra",
		"country": "India"
	},
	{
		"id": "1133",
		"city": "Sujanpur",
		"state": "Punjab",
		"country": "India"
	},
	{
		"id": "1134",
		"city": "Manihari",
		"state": "Bihar",
		"country": "India"
	},
	{
		"id": "1135",
		"city": "Sikanderpur",
		"state": "Uttar Pradesh",
		"country": "India"
	},
	{
		"id": "1136",
		"city": "Mangalvedhe",
		"state": "Maharashtra",
		"country": "India"
	},
	{
		"id": "1137",
		"city": "Phulera",
		"state": "Rajasthan",
		"country": "India"
	},
	{
		"id": "1138",
		"city": "Ron",
		"state": "Karnataka",
		"country": "India"
	},
	{
		"id": "1139",
		"city": "Sholavandan",
		"state": "Tamil Nadu",
		"country": "India"
	},
	{
		"id": "1140",
		"city": "Saidpur",
		"state": "Uttar Pradesh",
		"country": "India"
	},
	{
		"id": "1141",
		"city": "Shamgarh",
		"state": "Madhya Pradesh",
		"country": "India"
	},
	{
		"id": "1142",
		"city": "Thammampatti",
		"state": "Tamil Nadu",
		"country": "India"
	},
	{
		"id": "1143",
		"city": "Maharajpur",
		"state": "Madhya Pradesh",
		"country": "India"
	},
	{
		"id": "1144",
		"city": "Multai",
		"state": "Madhya Pradesh",
		"country": "India"
	},
	{
		"id": "1145",
		"city": "Mukerian",
		"state": "Punjab",
		"country": "India"
	},
	{
		"id": "1146",
		"city": "Sirsi",
		"state": "Uttar Pradesh",
		"country": "India"
	},
	{
		"id": "1147",
		"city": "Purwa",
		"state": "Uttar Pradesh",
		"country": "India"
	},
	{
		"id": "1148",
		"city": "Sheohar",
		"state": "Bihar",
		"country": "India"
	},
	{
		"id": "1149",
		"city": "Namagiripettai",
		"state": "Tamil Nadu",
		"country": "India"
	},
	{
		"id": "1150",
		"city": "Parasi",
		"state": "Uttar Pradesh",
		"country": "India"
	},
	{
		"id": "1151",
		"city": "Lathi",
		"state": "Gujarat",
		"country": "India"
	},
	{
		"id": "1152",
		"city": "Lalganj",
		"state": "Uttar Pradesh",
		"country": "India"
	},
	{
		"id": "1153",
		"city": "Narkhed",
		"state": "Maharashtra",
		"country": "India"
	},
	{
		"id": "1154",
		"city": "Mathabhanga",
		"state": "West Bengal",
		"country": "India"
	},
	{
		"id": "1155",
		"city": "Shendurjana",
		"state": "Maharashtra",
		"country": "India"
	},
	{
		"id": "1156",
		"city": "Peravurani",
		"state": "Tamil Nadu",
		"country": "India"
	},
	{
		"id": "1157",
		"city": "Mariani",
		"state": "Assam",
		"country": "India"
	},
	{
		"id": "1158",
		"city": "Phulpur",
		"state": "Uttar Pradesh",
		"country": "India"
	},
	{
		"id": "1159",
		"city": "Rania",
		"state": "Haryana",
		"country": "India"
	},
	{
		"id": "1160",
		"city": "Pali",
		"state": "Madhya Pradesh",
		"country": "India"
	},
	{
		"id": "1161",
		"city": "Pachore",
		"state": "Madhya Pradesh",
		"country": "India"
	},
	{
		"id": "1162",
		"city": "Parangipettai",
		"state": "Tamil Nadu",
		"country": "India"
	},
	{
		"id": "1163",
		"city": "Pudupattinam",
		"state": "Tamil Nadu",
		"country": "India"
	},
	{
		"id": "1164",
		"city": "Panniyannur",
		"state": "Kerala",
		"country": "India"
	},
	{
		"id": "1165",
		"city": "Maharajganj",
		"state": "Bihar",
		"country": "India"
	},
	{
		"id": "1166",
		"city": "Rau",
		"state": "Madhya Pradesh",
		"country": "India"
	},
	{
		"id": "1167",
		"city": "Monoharpur",
		"state": "West Bengal",
		"country": "India"
	},
	{
		"id": "1168",
		"city": "Mandawa",
		"state": "Rajasthan",
		"country": "India"
	},
	{
		"id": "1169",
		"city": "Marigaon",
		"state": "Assam",
		"country": "India"
	},
	{
		"id": "1170",
		"city": "Pallikonda",
		"state": "Tamil Nadu",
		"country": "India"
	},
	{
		"id": "1171",
		"city": "Pindwara",
		"state": "Rajasthan",
		"country": "India"
	},
	{
		"id": "1172",
		"city": "Shishgarh",
		"state": "Uttar Pradesh",
		"country": "India"
	},
	{
		"id": "1173",
		"city": "Patur",
		"state": "Maharashtra",
		"country": "India"
	},
	{
		"id": "1174",
		"city": "Mayang Imphal",
		"state": "Manipur",
		"country": "India"
	},
	{
		"id": "1175",
		"city": "Mhowgaon",
		"state": "Madhya Pradesh",
		"country": "India"
	},
	{
		"id": "1176",
		"city": "Guruvayoor",
		"state": "Kerala",
		"country": "India"
	},
	{
		"id": "1177",
		"city": "Mhaswad",
		"state": "Maharashtra",
		"country": "India"
	},
	{
		"id": "1178",
		"city": "Sahawar",
		"state": "Uttar Pradesh",
		"country": "India"
	},
	{
		"id": "1179",
		"city": "Sivagiri",
		"state": "Tamil Nadu",
		"country": "India"
	},
	{
		"id": "1180",
		"city": "Mundargi",
		"state": "Karnataka",
		"country": "India"
	},
	{
		"id": "1181",
		"city": "Punjaipugalur",
		"state": "Tamil Nadu",
		"country": "India"
	},
	{
		"id": "1182",
		"city": "Kailasahar",
		"state": "Tripura",
		"country": "India"
	},
	{
		"id": "1183",
		"city": "Samthar",
		"state": "Uttar Pradesh",
		"country": "India"
	},
	{
		"id": "1184",
		"city": "Sakti",
		"state": "Chhattisgarh",
		"country": "India"
	},
	{
		"id": "1185",
		"city": "Sadalagi",
		"state": "Karnataka",
		"country": "India"
	},
	{
		"id": "1186",
		"city": "Silao",
		"state": "Bihar",
		"country": "India"
	},
	{
		"id": "1187",
		"city": "Mandalgarh",
		"state": "Rajasthan",
		"country": "India"
	},
	{
		"id": "1188",
		"city": "Loha",
		"state": "Maharashtra",
		"country": "India"
	},
	{
		"id": "1189",
		"city": "Pukhrayan",
		"state": "Uttar Pradesh",
		"country": "India"
	},
	{
		"id": "1190",
		"city": "Padmanabhapuram",
		"state": "Tamil Nadu",
		"country": "India"
	},
	{
		"id": "1191",
		"city": "Belonia",
		"state": "Tripura",
		"country": "India"
	},
	{
		"id": "1192",
		"city": "Saiha",
		"state": "Mizoram",
		"country": "India"
	},
	{
		"id": "1193",
		"city": "Srirampore",
		"state": "West Bengal",
		"country": "India"
	},
	{
		"id": "1194",
		"city": "Talwara",
		"state": "Punjab",
		"country": "India"
	},
	{
		"id": "1195",
		"city": "Puthuppally",
		"state": "Kerala",
		"country": "India"
	},
	{
		"id": "1196",
		"city": "Khowai",
		"state": "Tripura",
		"country": "India"
	},
	{
		"id": "1197",
		"city": "Vijaypur",
		"state": "Madhya Pradesh",
		"country": "India"
	},
	{
		"id": "1198",
		"city": "Takhatgarh",
		"state": "Rajasthan",
		"country": "India"
	},
	{
		"id": "1199",
		"city": "Thirupuvanam",
		"state": "Tamil Nadu",
		"country": "India"
	},
	{
		"id": "1200",
		"city": "Adra",
		"state": "West Bengal",
		"country": "India"
	},
	{
		"id": "1201",
		"city": "Piriyapatna",
		"state": "Karnataka",
		"country": "India"
	},
	{
		"id": "1202",
		"city": "Obra",
		"state": "Uttar Pradesh",
		"country": "India"
	},
	{
		"id": "1203",
		"city": "Adalaj",
		"state": "Gujarat",
		"country": "India"
	},
	{
		"id": "1204",
		"city": "Nandgaon",
		"state": "Maharashtra",
		"country": "India"
	},
	{
		"id": "1205",
		"city": "Barh",
		"state": "Bihar",
		"country": "India"
	},
	{
		"id": "1206",
		"city": "Chhapra",
		"state": "Gujarat",
		"country": "India"
	},
	{
		"id": "1207",
		"city": "Panamattom",
		"state": "Kerala",
		"country": "India"
	},
	{
		"id": "1208",
		"city": "Niwai",
		"state": "Uttar Pradesh",
		"country": "India"
	},
	{
		"id": "1209",
		"city": "Bageshwar",
		"state": "Uttarakhand",
		"country": "India"
	},
	{
		"id": "1210",
		"city": "Tarbha",
		"state": "Odisha",
		"country": "India"
	},
	{
		"id": "1211",
		"city": "Adyar",
		"state": "Karnataka",
		"country": "India"
	},
	{
		"id": "1212",
		"city": "Narsinghgarh",
		"state": "Madhya Pradesh",
		"country": "India"
	},
	{
		"id": "1213",
		"city": "Warud",
		"state": "Maharashtra",
		"country": "India"
	},
	{
		"id": "1214",
		"city": "Asarganj",
		"state": "Bihar",
		"country": "India"
	},
	{
		"id": "1215",
		"city": "Sarsod",
		"state": "Haryana",
		"country": "India"
	},
	{
		"id": "1216",
		"city": "Gandhinagar",
		"state": "Gujarat",
		"country": "India"
	},
	{
		"id": "1217",
		"city": "Kullu",
		"state": "Himachal Pradesh",
		"country": "India"
	},
	{
		"id": "1218",
		"city": "Manali",
		"state": "Himachal Praddesh",
		"country": "India"
	},
	{
		"id": "1219",
		"city": "Mirzapur",
		"state": "Uttar Pradesh",
		"country": "India"
	},
	{
		"id": "1220",
		"city": "Kota",
		"state": "Rajasthan",
		"country": "India"
	},
	{
		"id": "1221",
		"city": "Dispur",
		"state": "Assam",
		"country": "India"
	}
]
}""";

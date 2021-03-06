import 'package:flutter/cupertino.dart';
import 'package:jaynetwork/network/dio_client.dart';
import 'package:sizary/utils/helper/pref_manage.dart';
import 'package:toast/toast.dart';
//
final JayNetworkClient networkClient =
JayNetworkClient('https://sizary.app/api/auth/');

final JayNetworkClient tailorNetworkClient =
JayNetworkClient('https://sizary.app/api/tailor/');

final SharedPreferencesHelper preferencesHelper = SharedPreferencesHelper();

void showToast(BuildContext context,
    {@required String message, int gravity = 0}) {
  Toast.show(message, context,
      backgroundRadius: 10, duration: 4, gravity: gravity);
}

List countries = ['	Afghanistan','Albania','Algeria','Andorra','Angola',
  'Antigua and Barbuda','Argentina','Armenia','Australia','Austria',
  'Azerbaijan','Bahamas','Bahrain','Bangladesh','Barbados','Belarus','Belgium',
  'Belize','Benin','Bhutan','Bolivia','Bosnia and Herzegovina','Botswana','Brazil',
  'Brunei','Bulgaria','Burkina Faso','Burundi','Côte d Ivoire','Cabo Verde',
  'Cambodia','Cameroon','Canada','Central African Republic','Chad','Chile',
  'China','Colombia','Comoros','Congo (Congo-Brazzaville)','Costa Rica','Croatia',
  'Cuba','Cyprus','Czechia (Czech Republic)','Democratic Republic of the Congo',
  'Denmark','Djibouti','Dominica','Dominican Republic','Ecuador','Egypt',
  'El Salvador','Equatorial Guinea','Eritrea','Estonia','Eswatini (fmr. "Swaziland")',
  'Ethiopia','Fiji','Finland','France','Gabon','Gambia','Georgia','Ghana','Greece',
  'Grenada','Guatemala','Guinea','Guinea-Bissau','Guyana','Haiti','Holy See',
  'Honduras','Hungary','Iceland','India','Indonesia','Iran','Iraq','Ireland',
  'Israel','Italy','Jamaica','Japan','Jordan','Kazakhstan','Kenya','Kiribati',
  'Kuwait','Kyrgyzstan','Laos','Latvia','Lebanon','Lesotho','Liberia','Libya',
  'Liechtenstein','Lithuania','Luxembourg','Madagascar','Malawi','Malaysia',
  'Maldives','Mali','Malta','Marshall Islands','Mauritania','Mauritius','Mexico',
  'Micronesia','Moldova','Monaco','Mongolia','Montenegro','Morocco','Mozambique',
  'Myanmar (formerly Burma)','Namibia','Nauru','Nepal','Netherlands','New Zealand',
  'Nicaragua','Niger','Nigeria','North Korea','North Macedonia','Norway','Oman',
  'Pakistan','Palau','Palestine State','Panama','Papua New Guinea','Peru',
  'Philippines','Poland','Portugal','Qatar','Romania','Russia','Rwanda',
  'Saint Kitts and Nevis','Saint Lucia','Saint Vincent and the Grenadines','Samoa',
  'San Marino','Sao Tome and Principe','Saudi Arabia','Senegal','Serbia',
  'Seychelles','Sierra Leone','Singapore','Slovakia','Slovenia','Solomon Islands',
  'Somalia','South Africa','South Korea','South Sudan','Spain','Sri Lanka','Sudan'
  ,'Suriname','Sweden','Switzerland','Syria','Tajikistan','Tanzania','Thailand',
  'Timor-Leste','Togo','Tonga','Trinidad and Tobago','Tunisia','Turkey','Turkmenistan',
  'Tuvalu','Uganda','Ukraine','United Arab Emirates','United Kingdom',
  'United States of America','Uruguay','Uzbekistan','Vanuatu','Venezuela',
  'Vietnam','Yemen'	,'Zambia','Zimbabwe'];
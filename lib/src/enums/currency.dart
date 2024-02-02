import 'dart:collection';

import 'package:geos/geos.dart';
import 'package:moneys/src/exceptions/exception_messages.dart';

/// A **currency**.
///
/// {@template moneys.currency.whatis}
/// ## What is a currency
///
/// A currency is a medium of exchange of value, defined by reference to the
/// geographical location of the monetary authorities responsible for it.
/// {@endtemplate}
///
/// {@template moneys.currency.iso4217}
/// ## ISO standard
///
/// The representation of the currency follows the
/// [ISO 4217](https://www.iso.org/iso-4217-currency-codes.html) standard.
///
/// The official website states:
///
/// > “This standard establishes internationally recognized codes for the
/// representation of currencies that enable clarity and reduce errors.
/// Currencies are represented both numerically and alphabetically, using either
/// three digits or three letters”.
/// {@endtemplate}
///
enum Currency implements Comparable<Currency> {
  /// **UAE Dirham**
  ///
  /// * United Arab Emirates (The)
  aed(
    {
      Country.unitedArabEmirates,
    },
    {
      'United Arab Emirates (The)',
    },
    currency: 'UAE Dirham',
    minorUnit: 2,
    numericCode: '784',
    symbol: 'د.إ',
  ),

  /// **Afghani**
  ///
  /// * Afghanistan
  afn(
    {
      Country.afghanistan,
    },
    {
      'Afghanistan',
    },
    currency: 'Afghani',
    minorUnit: 2,
    numericCode: '971',
    symbol: '؋',
  ),

  /// **Lek**
  ///
  /// * Albania
  all(
    {
      Country.albania,
    },
    {
      'Albania',
    },
    currency: 'Lek',
    minorUnit: 2,
    numericCode: '008',
    symbol: 'L',
  ),

  /// **Armenian Dram**
  ///
  /// * Armenia
  amd(
    {
      Country.armenia,
    },
    {
      'Armenia',
    },
    currency: 'Armenian Dram',
    minorUnit: 2,
    numericCode: '051',
    symbol: '֏',
  ),

  /// **Netherlands Antillean Guilder**
  ///
  /// * Curaçao
  /// * Sint Maarten (Dutch Part)
  ang(
    {
      Country.curacao,
      Country.sintMaartenDutchPart,
    },
    {
      'Curaçao',
      'Sint Maarten (Dutch Part)',
    },
    currency: 'Netherlands Antillean Guilder',
    minorUnit: 2,
    numericCode: '532',
    symbol: 'ƒ',
  ),

  /// **Kwanza**
  ///
  /// * Angola
  aoa(
    {
      Country.angola,
    },
    {
      'Angola',
    },
    currency: 'Kwanza',
    minorUnit: 2,
    numericCode: '973',
    symbol: 'Kz',
  ),

  /// **Argentine Peso**
  ///
  /// * Argentina
  ars(
    {
      Country.argentina,
    },
    {
      'Argentina',
    },
    currency: 'Argentine Peso',
    minorUnit: 2,
    numericCode: '032',
    symbol: r'$',
  ),

  /// **Australian Dollar**
  ///
  /// * Australia
  /// * Christmas Island
  /// * Cocos (Keeling) Islands (The)
  /// * Heard Island And McDonald Islands
  /// * Kiribati
  /// * Nauru
  /// * Norfolk Island
  /// * Tuvalu
  aud(
    {
      Country.australia,
      Country.christmasIsland,
      Country.cocosKeelingIslands,
      Country.heardIslandAndMcDonaldIslands,
      Country.kiribati,
      Country.nauru,
      Country.norfolkIsland,
      Country.tuvalu,
    },
    {
      'Australia',
      'Christmas Island',
      'Cocos (Keeling) Islands (The)',
      'Heard Island And McDonald Islands',
      'Kiribati',
      'Nauru',
      'Norfolk Island',
      'Tuvalu',
    },
    currency: 'Australian Dollar',
    minorUnit: 2,
    numericCode: '036',
    symbol: r'$',
  ),

  /// **Aruban Florin**
  ///
  /// * Aruba
  awg(
    {
      Country.aruba,
    },
    {
      'Aruba',
    },
    currency: 'Aruban Florin',
    minorUnit: 2,
    numericCode: '533',
    symbol: 'ƒ',
  ),

  /// **Azerbaijan Manat**
  ///
  /// * Azerbaijan
  azn(
    {
      Country.azerbaijan,
    },
    {
      'Azerbaijan',
    },
    currency: 'Azerbaijan Manat',
    minorUnit: 2,
    numericCode: '944',
    symbol: '₼',
  ),

  /// **Convertible Mark**
  ///
  /// * Bosnia And Herzegovina
  bam(
    {
      Country.bosniaAndHerzegovina,
    },
    {
      'Bosnia And Herzegovina',
    },
    currency: 'Convertible Mark',
    minorUnit: 2,
    numericCode: '977',
    symbol: 'KM',
  ),

  /// **Barbados Dollar**
  ///
  /// * Barbados
  bbd(
    {
      Country.barbados,
    },
    {
      'Barbados',
    },
    currency: 'Barbados Dollar',
    minorUnit: 2,
    numericCode: '052',
    symbol: r'$',
  ),

  /// **Taka**
  ///
  /// * Bangladesh
  bdt(
    {
      Country.bangladesh,
    },
    {
      'Bangladesh',
    },
    currency: 'Taka',
    minorUnit: 2,
    numericCode: '050',
    symbol: '৳',
  ),

  /// **Bulgarian Lev**
  ///
  /// * Bulgaria
  bgn(
    {
      Country.bulgaria,
    },
    {
      'Bulgaria',
    },
    currency: 'Bulgarian Lev',
    minorUnit: 2,
    numericCode: '975',
    symbol: 'лв.',
  ),

  /// **Bahraini Dinar**
  ///
  /// * Bahrain
  bhd(
    {
      Country.bahrain,
    },
    {
      'Bahrain',
    },
    currency: 'Bahraini Dinar',
    minorUnit: 3,
    numericCode: '048',
    symbol: 'د.ب',
  ),

  /// **Burundi Franc**
  ///
  /// * Burundi
  bif(
    {
      Country.burundi,
    },
    {
      'Burundi',
    },
    currency: 'Burundi Franc',
    minorUnit: 0,
    numericCode: '108',
    symbol: 'FBu',
  ),

  /// **Bermudian Dollar**
  ///
  /// * Bermuda
  bmd(
    {
      Country.bermuda,
    },
    {
      'Bermuda',
    },
    currency: 'Bermudian Dollar',
    minorUnit: 2,
    numericCode: '060',
    symbol: r'$',
  ),

  /// **Brunei Darussalam**
  ///
  /// * Brunei Dollar
  bnd(
    {
      Country.bruneiDarussalam,
    },
    {
      'Brunei Darussalam',
    },
    currency: 'Brunei Dollar',
    minorUnit: 2,
    numericCode: '096',
    symbol: r'$',
  ),

  /// **Boliviano**
  ///
  /// * Bolivia (Plurinational State Of)
  bob(
    {
      Country.bolivia,
    },
    {
      'Bolivia (Plurinational State Of)',
    },
    currency: 'Boliviano',
    minorUnit: 2,
    numericCode: '068',
    symbol: 'Bs',
  ),

  /// **Mvdol**
  ///
  /// * Bolivia (Plurinational State Of)
  bov(
    {
      Country.bolivia,
    },
    {
      'Bolivia (Plurinational State Of)',
    },
    currency: 'Mvdol',
    fundDefinition: 'For indexation purposes and denomination of certain'
        ' financial instruments (e.g. treasury bills). The Mvdol is set daily'
        ' by the Central Bank of Bolivia based on the official USD/BOB rate.',
    isFund: true,
    minorUnit: 2,
    numericCode: '984',
    symbol: 'BOV',
  ),

  /// **Brazilian Real**
  ///
  /// * Brazil
  brl(
    {
      Country.brazil,
    },
    {
      'Brazil',
    },
    currency: 'Brazilian Real',
    minorUnit: 2,
    numericCode: '986',
    symbol: r'R$',
  ),

  /// **Bahamian Dollar**
  ///
  /// * Bahamas (The)
  bsd(
    {
      Country.bahamas,
    },
    {
      'Bahamas (The)',
    },
    currency: 'Bahamian Dollar',
    minorUnit: 2,
    numericCode: '044',
    symbol: r'$',
  ),

  /// **Ngultrum**
  ///
  /// * Bhutan
  btn(
    {
      Country.bhutan,
    },
    {
      'Bhutan',
    },
    currency: 'Ngultrum',
    minorUnit: 2,
    numericCode: '064',
    symbol: 'Nu',
  ),

  /// **Pula**
  ///
  /// * Botswana
  bwp(
    {
      Country.botswana,
    },
    {
      'Botswana',
    },
    currency: 'Pula',
    minorUnit: 2,
    numericCode: '072',
    symbol: 'P',
  ),

  /// **Belarusian Ruble**
  ///
  /// * Belarus
  byn(
    {
      Country.belarus,
    },
    {
      'Belarus',
    },
    currency: 'Belarusian Ruble',
    minorUnit: 2,
    numericCode: '933',
    symbol: 'Br',
  ),

  /// **Belize Dollar**
  ///
  /// * Belize
  bzd(
    {
      Country.belize,
    },
    {
      'Belize',
    },
    currency: 'Belize Dollar',
    minorUnit: 2,
    numericCode: '084',
    symbol: r'$',
  ),

  /// **Canadian Dollar**
  ///
  /// * Canada
  cad(
    {
      Country.canada,
    },
    {
      'Canada',
    },
    currency: 'Canadian Dollar',
    minorUnit: 2,
    numericCode: '124',
    symbol: r'$',
  ),

  /// **Congolese Franc**
  ///
  /// * Congo (The Democratic Republic Of The)
  cdf(
    {
      Country.congoDemocraticRepublic,
    },
    {
      'Congo (The Democratic Republic Of The)',
    },
    currency: 'Congolese Franc',
    minorUnit: 2,
    numericCode: '976',
    symbol: 'FC',
  ),

  /// **WIR Euro**
  ///
  /// * Switzerland
  che(
    {
      Country.switzerland,
    },
    {
      'Switzerland',
    },
    currency: 'WIR Euro',
    fundDefinition: 'WIR Euro – WIR Bank for use with the EFTPOS system with'
        ' their own WIR-card and the Electronic Banking Services.',
    isFund: true,
    minorUnit: 2,
    numericCode: '947',
    symbol: 'CHE',
  ),

  /// **Swiss Franc**
  ///
  /// * Liechtenstein
  /// * Switzerland
  chf(
    {
      Country.liechtenstein,
      Country.switzerland,
    },
    {
      'Liechtenstein',
      'Switzerland',
    },
    currency: 'Swiss Franc',
    minorUnit: 2,
    numericCode: '756',
    symbol: 'CHF',
  ),

  /// **WIR Franc**
  ///
  /// * Switzerland
  chw(
    {
      Country.switzerland,
    },
    {
      'Switzerland',
    },
    currency: 'WIR Franc',
    fundDefinition: 'WIR Franc – WIR Bank for use with the EFTPOS system with'
        ' their own WIR-card and the Electronic Banking Services.',
    isFund: true,
    minorUnit: 2,
    numericCode: '948',
    symbol: 'CHW',
  ),

  /// **Unidad de Fomento**
  ///
  /// * Chile
  clf(
    {
      Country.chile,
    },
    {
      'Chile',
    },
    currency: 'Unidad de Fomento',
    fundDefinition: 'The CLF is a daily economically-financial unit calculated'
        ' by the Central Bank of Chile according to inflation (as measured by'
        ' the Chilean Consumer Price Index of the previous month). The value of'
        ' the CLF is expressed in terms of Chilean Pesos per CLF. The use of'
        ' CLF has been widely extended to all types of bank loans, financial'
        ' investments (time deposits, mortgages and other public or private'
        ' indexed instruments), contracts and fees in some cases.',
    isFund: true,
    minorUnit: 4,
    numericCode: '990',
    symbol: 'CLF',
  ),

  /// **Chilean Peso**
  ///
  /// * Chile
  clp(
    {
      Country.chile,
    },
    {
      'Chile',
    },
    currency: 'Chilean Peso',
    minorUnit: 0,
    numericCode: '152',
    symbol: r'$',
  ),

  /// **Yuan Renminbi**
  ///
  /// * China
  cny(
    {
      Country.china,
    },
    {
      'China',
    },
    currency: 'Yuan Renminbi',
    minorUnit: 2,
    numericCode: '156',
    symbol: '¥',
  ),

  /// **Colombian Peso**
  ///
  /// * Colombia
  cop(
    {
      Country.colombia,
    },
    {
      'Colombia',
    },
    currency: 'Colombian Peso',
    minorUnit: 2,
    numericCode: '170',
    symbol: r'$',
  ),

  /// **Unidad de Valor Real**
  ///
  /// * Colombia
  cou(
    {
      Country.colombia,
    },
    {
      'Colombia',
    },
    currency: 'Unidad de Valor Real',
    fundDefinition: 'The UVR is a daily account unit set by the Central Bank of'
        ' Colombia according to the variation in the Consumer Price Index of'
        ' Colombia. The value of UVR is expressed in terms of Colombian Pesos'
        ' per UVR. It is used to denominate and update mortgage loans and some'
        ' public debt bonds.',
    isFund: true,
    minorUnit: 2,
    numericCode: '970',
    symbol: 'UVR',
  ),

  /// **Costa Rican Colon**
  ///
  /// * Costa Rica
  crc(
    {
      Country.costaRica,
    },
    {
      'Costa Rica',
    },
    currency: 'Costa Rican Colon',
    minorUnit: 2,
    numericCode: '188',
    symbol: '₡',
  ),

  /// **Peso Convertible**
  ///
  /// * Cuba
  cuc(
    {
      Country.cuba,
    },
    {
      'Cuba',
    },
    currency: 'Peso Convertible',
    minorUnit: 2,
    numericCode: '931',
    symbol: r'$',
  ),

  /// **Cuban Peso**
  ///
  /// * Cuba
  cup(
    {
      Country.cuba,
    },
    {
      'Cuba',
    },
    currency: 'Cuban Peso',
    minorUnit: 2,
    numericCode: '192',
    symbol: '₱',
  ),

  /// **Cabo Verde Escudo**
  ///
  /// * Cabo Verde
  cve(
    {
      Country.caboVerde,
    },
    {
      'Cabo Verde',
    },
    currency: 'Cabo Verde Escudo',
    minorUnit: 2,
    numericCode: '132',
    symbol: r'$',
  ),

  /// **Czech Koruna**
  ///
  /// * Czechia
  czk(
    {
      Country.czechia,
    },
    {
      'Czechia',
    },
    currency: 'Czech Koruna',
    minorUnit: 2,
    numericCode: '203',
    symbol: 'Kč',
  ),

  /// **Djibouti Franc**
  ///
  /// * Djibouti
  djf(
    {
      Country.djibouti,
    },
    {
      'Djibouti',
    },
    currency: 'Djibouti Franc',
    minorUnit: 0,
    numericCode: '262',
    symbol: 'Fdj',
  ),

  /// **Danish Krone**
  ///
  /// * Denmark
  /// * Faroe Islands (The)
  /// * Greenland
  dkk(
    {
      Country.denmark,
      Country.faroeIslands,
      Country.greenland,
    },
    {
      'Denmark',
      'Faroe Islands (The)',
      'Greenland',
    },
    currency: 'Danish Krone',
    minorUnit: 2,
    numericCode: '208',
    symbol: 'Kr.',
  ),

  /// **Dominican Peso**
  ///
  /// * Dominican Republic (The)
  dop(
    {
      Country.dominicanRepublic,
    },
    {
      'Dominican Republic (The)',
    },
    currency: 'Dominican Peso',
    minorUnit: 2,
    numericCode: '214',
    symbol: r'$',
  ),

  /// **Algerian Dinar**
  ///
  /// * Algeria
  dzd(
    {
      Country.algeria,
    },
    {
      'Algeria',
    },
    currency: 'Algerian Dinar',
    minorUnit: 2,
    numericCode: '012',
    symbol: 'دج',
  ),

  /// **Egyptian Pound**
  ///
  /// * Egypt
  egp(
    {
      Country.egypt,
    },
    {
      'Egypt',
    },
    currency: 'Egyptian Pound',
    minorUnit: 2,
    numericCode: '818',
    symbol: 'E£',
  ),

  /// **Nakfa**
  ///
  /// * Eritrea
  ern(
    {
      Country.eritrea,
    },
    {
      'Eritrea',
    },
    currency: 'Nakfa',
    minorUnit: 2,
    numericCode: '232',
    symbol: 'Nkf',
  ),

  /// **Ethiopian Birr**
  ///
  /// * Ethiopia
  etb(
    {
      Country.ethiopia,
    },
    {
      'Ethiopia',
    },
    currency: 'Ethiopian Birr',
    minorUnit: 2,
    numericCode: '230',
    symbol: 'ብር',
  ),

  /// **Euro**
  ///
  /// * Åland Islands
  /// * Andorra
  /// * Austria
  /// * Belgium
  /// * Croatia
  /// * Cyprus
  /// * Estonia
  /// * European Union
  /// * Finland
  /// * France
  /// * French Guiana
  /// * French Southern Territories (The)
  /// * Germany
  /// * Greece
  /// * Guadeloupe
  /// * Holy See (The)
  /// * Ireland
  /// * Italy
  /// * Latvia
  /// * Lithuania
  /// * Luxembourg
  /// * Malta
  /// * Martinique
  /// * Mayotte
  /// * Monaco
  /// * Montenegro
  /// * Netherlands (The)
  /// * Portugal
  /// * Réunion
  /// * Saint Barthélemy
  /// * Saint Martin (French Part)
  /// * Saint Pierre And Miquelon
  /// * San Marino
  /// * Slovakia
  /// * Slovenia
  /// * Spain
  eur(
    {
      Country.alandIslands,
      Country.andorra,
      Country.austria,
      Country.belgium,
      Country.croatia,
      Country.cyprus,
      Country.estonia,
      Country.finland,
      Country.france,
      Country.frenchGuiana,
      Country.frenchSouthernTerritories,
      Country.germany,
      Country.greece,
      Country.guadeloupe,
      Country.holySee,
      Country.ireland,
      Country.italy,
      Country.latvia,
      Country.lithuania,
      Country.luxembourg,
      Country.malta,
      Country.martinique,
      Country.mayotte,
      Country.monaco,
      Country.montenegro,
      Country.netherlands,
      Country.portugal,
      Country.reunion,
      Country.saintBarthelemy,
      Country.saintMartinFrenchPart,
      Country.saintPierreAndMiquelon,
      Country.sanMarino,
      Country.slovakia,
      Country.slovenia,
      Country.spain,
    },
    {
      'Åland Islands',
      'Andorra',
      'Austria',
      'Belgium',
      'Croatia',
      'Cyprus',
      'Estonia',
      'European Union',
      'Finland',
      'France',
      'French Guiana',
      'French Southern Territories (The)',
      'Germany',
      'Greece',
      'Guadeloupe',
      'Holy See (The)',
      'Ireland',
      'Italy',
      'Latvia',
      'Lithuania',
      'Luxembourg',
      'Malta',
      'Martinique',
      'Mayotte',
      'Monaco',
      'Montenegro',
      'Netherlands (The)',
      'Portugal',
      'Réunion',
      'Saint Barthélemy',
      'Saint Martin (French Part)',
      'Saint Pierre And Miquelon',
      'San Marino',
      'Slovakia',
      'Slovenia',
      'Spain',
    },
    currency: 'Euro',
    minorUnit: 2,
    numericCode: '978',
    symbol: '€',
  ),

  /// **Fiji Dollar**
  ///
  /// * Fiji
  fjd(
    {
      Country.fiji,
    },
    {
      'Fiji',
    },
    currency: 'Fiji Dollar',
    minorUnit: 2,
    numericCode: '242',
    symbol: r'$',
  ),

  /// **Falkland Islands Pound**
  ///
  // ignore: comment_references
  /// * Falkland Islands (The) [Malvinas]
  fkp(
    {
      Country.falklandIslandsMalvinas,
    },
    {
      'Falkland Islands (The) [Malvinas]',
    },
    currency: 'Falkland Islands Pound',
    minorUnit: 2,
    numericCode: '238',
    symbol: '£',
  ),

  /// **Pound Sterling**
  ///
  /// * Guernsey
  /// * Isle Of Man
  /// * Jersey
  /// * United Kingdom Of Great Britain And Northern Ireland (The)
  gbp(
    {
      Country.guernsey,
      Country.isleOfMan,
      Country.jersey,
      Country.unitedKingdomOfGreatBritainAndNorthernIreland,
    },
    {
      'Guernsey',
      'Isle Of Man',
      'Jersey',
      'United Kingdom Of Great Britain And Northern Ireland (The)',
    },
    currency: 'Pound Sterling',
    minorUnit: 2,
    numericCode: '826',
    symbol: '£',
  ),

  /// **Lari**
  ///
  /// * Georgia
  gel(
    {
      Country.georgia,
    },
    {
      'Georgia',
    },
    currency: 'Lari',
    minorUnit: 2,
    numericCode: '981',
    symbol: '₾',
  ),

  /// **Ghana Cedi**
  ///
  /// * Ghana
  ghs(
    {
      Country.ghana,
    },
    {
      'Ghana',
    },
    currency: 'Ghana Cedi',
    minorUnit: 2,
    numericCode: '936',
    symbol: '₵',
  ),

  /// **Gibraltar Pound**
  ///
  /// * Gibraltar
  gip(
    {
      Country.gibraltar,
    },
    {
      'Gibraltar',
    },
    currency: 'Gibraltar Pound',
    minorUnit: 2,
    numericCode: '292',
    symbol: '£',
  ),

  /// **Dalasi**
  ///
  /// * Gambia (The)
  gmd(
    {
      Country.gambia,
    },
    {
      'Gambia (The)',
    },
    currency: 'Dalasi',
    minorUnit: 2,
    numericCode: '270',
    symbol: 'D',
  ),

  /// **Guinean Franc**
  ///
  /// * Guinea
  gnf(
    {
      Country.guinea,
    },
    {
      'Guinea',
    },
    currency: 'Guinean Franc',
    minorUnit: 0,
    numericCode: '324',
    symbol: 'Franc',
  ),

  /// **Quetzal**
  ///
  /// * Guatemala
  gtq(
    {
      Country.guatemala,
    },
    {
      'Guatemala',
    },
    currency: 'Quetzal',
    minorUnit: 2,
    numericCode: '320',
    symbol: 'Q',
  ),

  /// **Guyana Dollar**
  ///
  /// * Guyana
  gyd(
    {
      Country.guyana,
    },
    {
      'Guyana',
    },
    currency: 'Guyana Dollar',
    minorUnit: 2,
    numericCode: '328',
    symbol: r'$',
  ),

  /// **Hong Kong Dollar**
  ///
  /// * Hong Kong
  hkd(
    {
      Country.hongKong,
    },
    {
      'Hong Kong',
    },
    currency: 'Hong Kong Dollar',
    minorUnit: 2,
    numericCode: '344',
    symbol: r'$',
  ),

  /// **Lempira**
  ///
  /// * Honduras
  hnl(
    {
      Country.honduras,
    },
    {
      'Honduras',
    },
    currency: 'Lempira',
    minorUnit: 2,
    numericCode: '340',
    symbol: 'L',
  ),

  /// **Gourde**
  ///
  /// * Haiti
  htg(
    {
      Country.haiti,
    },
    {
      'Haiti',
    },
    currency: 'Gourde',
    minorUnit: 2,
    numericCode: '332',
    symbol: 'G',
  ),

  /// **Forint**
  ///
  /// * Hungary
  huf(
    {
      Country.hungary,
    },
    {
      'Hungary',
    },
    currency: 'Forint',
    minorUnit: 2,
    numericCode: '348',
    symbol: 'Ft',
  ),

  /// **Rupiah**
  ///
  /// * Indonesia
  idr(
    {
      Country.indonesia,
    },
    {
      'Indonesia',
    },
    currency: 'Rupiah',
    minorUnit: 2,
    numericCode: '360',
    symbol: 'Rp',
  ),

  /// **New Israeli Sheqel**
  ///
  /// * Israel
  ils(
    {
      Country.israel,
    },
    {
      'Israel',
    },
    currency: 'New Israeli Sheqel',
    minorUnit: 2,
    numericCode: '376',
    symbol: '₪',
  ),

  /// **Indian Rupee**
  ///
  /// * Bhutan
  /// * India
  inr(
    {
      Country.bhutan,
      Country.india,
    },
    {
      'Bhutan',
      'India',
    },
    currency: 'Indian Rupee',
    minorUnit: 2,
    numericCode: '356',
    symbol: '₹',
  ),

  /// **Iraqi Dinar**
  ///
  /// * Iraq
  iqd(
    {
      Country.iraq,
    },
    {
      'Iraq',
    },
    currency: 'Iraqi Dinar',
    minorUnit: 3,
    numericCode: '368',
    symbol: 'ع.د',
  ),

  /// **Iranian Rial**
  ///
  /// * Iran (Islamic Republic Of)
  irr(
    {
      Country.iran,
    },
    {
      'Iran (Islamic Republic Of)',
    },
    currency: 'Iranian Rial',
    minorUnit: 2,
    numericCode: '364',
    symbol: '﷼',
  ),

  /// **Iceland Krona**
  ///
  /// * Iceland
  isk(
    {
      Country.iceland,
    },
    {
      'Iceland',
    },
    currency: 'Iceland Krona',
    minorUnit: 0,
    numericCode: '352',
    symbol: 'kr',
  ),

  /// **Jamaican Dollar**
  ///
  /// * Jamaica
  jmd(
    {
      Country.jamaica,
    },
    {
      'Jamaica',
    },
    currency: 'Jamaican Dollar',
    minorUnit: 2,
    numericCode: '388',
    symbol: r'$',
  ),

  /// **Jordanian Dinar**
  ///
  /// * Jordan
  jod(
    {
      Country.jordan,
    },
    {
      'Jordan',
    },
    currency: 'Jordanian Dinar',
    minorUnit: 3,
    numericCode: '400',
    symbol: 'د.ا',
  ),

  /// **Yen**
  ///
  /// * Japan
  jpy(
    {
      Country.japan,
    },
    {
      'Japan',
    },
    currency: 'Yen',
    minorUnit: 0,
    numericCode: '392',
    symbol: '¥',
  ),

  /// **Kenyan Shilling**
  ///
  /// * Kenya
  kes(
    {
      Country.kenya,
    },
    {
      'Kenya',
    },
    currency: 'Kenyan Shilling',
    minorUnit: 2,
    numericCode: '404',
    symbol: 'KSh',
  ),

  /// **Som**
  ///
  /// * Kyrgyzstan
  kgs(
    {
      Country.kyrgyzstan,
    },
    {
      'Kyrgyzstan',
    },
    currency: 'Som',
    minorUnit: 2,
    numericCode: '417',
    symbol: '⃀',
  ),

  /// **Riel**
  ///
  /// * Cambodia
  khr(
    {
      Country.cambodia,
    },
    {
      'Cambodia',
    },
    currency: 'Riel',
    minorUnit: 2,
    numericCode: '116',
    symbol: '៛',
  ),

  /// **Comorian Franc**
  ///
  /// * Comoros (The)
  kmf(
    {
      Country.comoros,
    },
    {
      'Comoros (The)',
    },
    currency: 'Comorian Franc',
    minorUnit: 0,
    numericCode: '174',
    symbol: 'FC',
  ),

  /// **North Korean Won**
  ///
  /// * Korea (The Democratic People’s Republic Of)
  kpw(
    {
      Country.koreaDemocraticPeoplesRepublic,
    },
    {
      'Korea (The Democratic People’s Republic Of)',
    },
    currency: 'North Korean Won',
    minorUnit: 2,
    numericCode: '408',
    symbol: '₩',
  ),

  /// **Won**
  ///
  /// * Korea (The Republic Of)
  krw(
    {
      Country.korea,
    },
    {
      'Korea (The Republic Of)',
    },
    currency: 'Won',
    minorUnit: 0,
    numericCode: '410',
    symbol: '₩',
  ),

  /// **Kuwaiti Dinar**
  ///
  /// * Kuwait
  kwd(
    {
      Country.kuwait,
    },
    {
      'Kuwait',
    },
    currency: 'Kuwaiti Dinar',
    minorUnit: 3,
    numericCode: '414',
    symbol: 'د.ك',
  ),

  /// **Cayman Islands Dollar**
  ///
  /// * Cayman Islands (The)
  kyd(
    {
      Country.caymanIslands,
    },
    {
      'Cayman Islands (The)',
    },
    currency: 'Cayman Islands Dollar',
    minorUnit: 2,
    numericCode: '136',
    symbol: r'$',
  ),

  /// **Tenge**
  ///
  /// * Kazakhstan
  kzt(
    {
      Country.kazakhstan,
    },
    {
      'Kazakhstan',
    },
    currency: 'Tenge',
    minorUnit: 2,
    numericCode: '398',
    symbol: '₸',
  ),

  /// **Lao Kip**
  ///
  /// * Lao People’s Democratic Republic (The)
  lak(
    {
      Country.laoPeoplesDemocraticRepublic,
    },
    {
      'Lao People’s Democratic Republic (The)',
    },
    currency: 'Lao Kip',
    minorUnit: 2,
    numericCode: '418',
    symbol: '₭',
  ),

  /// **Lebanese Pound**
  ///
  /// * Lebanon
  lbp(
    {
      Country.lebanon,
    },
    {
      'Lebanon',
    },
    currency: 'Lebanese Pound',
    minorUnit: 2,
    numericCode: '422',
    symbol: 'ل.ل',
  ),

  /// **Sri Lanka Rupee**
  ///
  /// * Sri Lanka
  lkr(
    {
      Country.sriLanka,
    },
    {
      'Sri Lanka',
    },
    currency: 'Sri Lanka Rupee',
    minorUnit: 2,
    numericCode: '144',
    symbol: '₨',
  ),

  /// **Liberian Dollar**
  ///
  /// * Liberia
  lrd(
    {
      Country.liberia,
    },
    {
      'Liberia',
    },
    currency: 'Liberian Dollar',
    minorUnit: 2,
    numericCode: '430',
    symbol: r'$',
  ),

  /// **Loti**
  ///
  /// * Lesotho
  lsl(
    {
      Country.lesotho,
    },
    {
      'Lesotho',
    },
    currency: 'Loti',
    minorUnit: 2,
    numericCode: '426',
    symbol: 'M',
  ),

  /// **Libyan Dinar**
  ///
  /// * Libya
  lyd(
    {
      Country.libya,
    },
    {
      'Libya',
    },
    currency: 'Libyan Dinar',
    minorUnit: 3,
    numericCode: '434',
    symbol: 'ل.د',
  ),

  /// **Moroccan Dirham**
  ///
  /// * Morocco
  /// * Western Sahara
  mad(
    {
      Country.morocco,
      Country.westernSahara,
    },
    {
      'Morocco',
      'Western Sahara',
    },
    currency: 'Moroccan Dirham',
    minorUnit: 2,
    numericCode: '504',
    symbol: 'DH',
  ),

  /// **Moldovan Leu**
  ///
  /// * Moldova (The Republic Of)
  mdl(
    {
      Country.moldova,
    },
    {
      'Moldova (The Republic Of)',
    },
    currency: 'Moldovan Leu',
    minorUnit: 2,
    numericCode: '498',
    symbol: 'L',
  ),

  /// **Malagasy Ariary**
  ///
  /// * Madagascar
  mga(
    {
      Country.madagascar,
    },
    {
      'Madagascar',
    },
    currency: 'Malagasy Ariary',
    minorUnit: 2,
    numericCode: '969',
    symbol: 'Ar',
  ),

  /// **Denar**
  ///
  /// * North Macedonia
  mkd(
    {
      Country.northMacedonia,
    },
    {
      'North Macedonia',
    },
    currency: 'Denar',
    minorUnit: 2,
    numericCode: '807',
    symbol: 'ден',
  ),

  /// **Kyat**
  ///
  /// * Myanmar
  mmk(
    {
      Country.myanmar,
    },
    {
      'Myanmar',
    },
    currency: 'Kyat',
    minorUnit: 2,
    numericCode: '104',
    symbol: 'K',
  ),

  /// **Tugrik**
  ///
  /// * Mongolia
  mnt(
    {
      Country.mongolia,
    },
    {
      'Mongolia',
    },
    currency: 'Tugrik',
    minorUnit: 2,
    numericCode: '496',
    symbol: '₮',
  ),

  /// **Pataca**
  ///
  /// * Macao
  mop(
    {
      Country.macao,
    },
    {
      'Macao',
    },
    currency: 'Pataca',
    minorUnit: 2,
    numericCode: '446',
    symbol: r'$',
  ),

  /// **Ouguiya**
  ///
  /// * Mauritania
  mru(
    {
      Country.mauritania,
    },
    {
      'Mauritania',
    },
    currency: 'Ouguiya',
    minorUnit: 2,
    numericCode: '929',
    symbol: 'UM',
  ),

  /// **Mauritius Rupee**
  ///
  /// * Mauritius
  mur(
    {
      Country.mauritius,
    },
    {
      'Mauritius',
    },
    currency: 'Mauritius Rupee',
    minorUnit: 2,
    numericCode: '480',
    symbol: '₨',
  ),

  /// **Rufiyaa**
  ///
  /// * Maldives
  mvr(
    {
      Country.maldives,
    },
    {
      'Maldives',
    },
    currency: 'Rufiyaa',
    minorUnit: 2,
    numericCode: '462',
    symbol: 'ރ',
  ),

  /// **Malawi Kwacha**
  ///
  /// * Malawi
  mwk(
    {
      Country.malawi,
    },
    {
      'Malawi',
    },
    currency: 'Malawi Kwacha',
    minorUnit: 2,
    numericCode: '454',
    symbol: 'MK',
  ),

  /// **Mexican Peso**
  ///
  /// * Mexico
  mxn(
    {
      Country.mexico,
    },
    {
      'Mexico',
    },
    currency: 'Mexican Peso',
    minorUnit: 2,
    numericCode: '484',
    symbol: r'$',
  ),

  /// **Mexican Unidad de Inversion (UDI)**
  ///
  /// * Mexico
  mxv(
    {
      Country.mexico,
    },
    {
      'Mexico',
    },
    currency: 'Mexican Unidad de Inversion (UDI)',
    fundDefinition: 'The UDI is an inflation adjusted mechanism set by the'
        ' Central Bank of Mexico according to the variation in the Mexican'
        ' Consumer Price Index. The value of the UDI is expressed in terms of'
        ' Mexican Pesos per UDI. It is used to denominate mortgage loans, some'
        ' bank deposits with maturities of 3 month or more and Government bonds'
        ' (UDIBONOS).',
    isFund: true,
    minorUnit: 2,
    numericCode: '979',
  ),

  /// **Malaysian Ringgit**
  ///
  /// * Malaysia
  myr(
    {
      Country.malaysia,
    },
    {
      'Malaysia',
    },
    currency: 'Malaysian Ringgit',
    minorUnit: 2,
    numericCode: '458',
    symbol: 'RM',
  ),

  /// **Mozambique Metical**
  ///
  /// * Mozambique
  mzn(
    {
      Country.mozambique,
    },
    {
      'Mozambique',
    },
    currency: 'Mozambique Metical',
    minorUnit: 2,
    numericCode: '943',
    symbol: 'MT',
  ),

  /// **Namibia Dollar**
  ///
  /// * Namibia
  nad(
    {
      Country.namibia,
    },
    {
      'Namibia',
    },
    currency: 'Namibia Dollar',
    minorUnit: 2,
    numericCode: '516',
    symbol: r'$',
  ),

  /// **Naira**
  ///
  /// * Nigeria
  ngn(
    {
      Country.nigeria,
    },
    {
      'Nigeria',
    },
    currency: 'Naira',
    minorUnit: 2,
    numericCode: '566',
    symbol: '₦',
  ),

  /// **Cordoba Oro**
  ///
  /// * Nicaragua
  nio(
    {
      Country.nicaragua,
    },
    {
      'Nicaragua',
    },
    currency: 'Cordoba Oro',
    minorUnit: 2,
    numericCode: '558',
    symbol: r'C$',
  ),

  /// **Norwegian Krone**
  ///
  /// * Bouvet Island
  /// * Norway
  /// * Svalbard And Jan Mayen
  nok(
    {
      Country.bouvetIsland,
      Country.norway,
      Country.svalbardAndJanMayen,
    },
    {
      'Bouvet Island',
      'Norway',
      'Svalbard And Jan Mayen',
    },
    currency: 'Norwegian Krone',
    minorUnit: 2,
    numericCode: '578',
    symbol: 'kr',
  ),

  /// **Nepalese Rupee**
  ///
  /// * Nepal
  npr(
    {
      Country.nepal,
    },
    {
      'Nepal',
    },
    currency: 'Nepalese Rupee',
    minorUnit: 2,
    numericCode: '524',
    symbol: 'रु',
  ),

  /// **New Zealand Dollar**
  ///
  /// * Cook Islands (The)
  /// * New Zealand
  /// * Niue
  /// * Pitcairn
  /// * Tokelau
  nzd(
    {
      Country.cookIslands,
      Country.newZealand,
      Country.niue,
      Country.pitcairn,
      Country.tokelau,
    },
    {
      'Cook Islands (The)',
      'New Zealand',
      'Niue',
      'Pitcairn',
      'Tokelau',
    },
    currency: 'New Zealand Dollar',
    minorUnit: 2,
    numericCode: '554',
    symbol: r'$',
  ),

  /// **Rial Omani**
  ///
  /// * Oman
  omr(
    {
      Country.oman,
    },
    {
      'Oman',
    },
    currency: 'Rial Omani',
    minorUnit: 3,
    numericCode: '512',
    symbol: 'ر.ع',
  ),

  /// **Balboa**
  ///
  /// * Panama
  pab(
    {
      Country.panama,
    },
    {
      'Panama',
    },
    currency: 'Balboa',
    minorUnit: 2,
    numericCode: '590',
    symbol: 'B/.',
  ),

  /// **Sol**
  ///
  /// * Peru
  pen(
    {
      Country.peru,
    },
    {
      'Peru',
    },
    currency: 'Sol',
    minorUnit: 2,
    numericCode: '604',
    symbol: 'S/.',
  ),

  /// **Kina**
  ///
  /// * Papua New Guinea
  pgk(
    {
      Country.papuaNewGuinea,
    },
    {
      'Papua New Guinea',
    },
    currency: 'Kina',
    minorUnit: 2,
    numericCode: '598',
    symbol: 'K',
  ),

  /// **Philippine Peso**
  ///
  /// * Philippines (The)
  php(
    {
      Country.philippines,
    },
    {
      'Philippines (The)',
    },
    currency: 'Philippine Peso',
    minorUnit: 2,
    numericCode: '608',
    symbol: '₱',
  ),

  /// **Pakistan Rupee**
  ///
  /// * Pakistan
  pkr(
    {
      Country.pakistan,
    },
    {
      'Pakistan',
    },
    currency: 'Pakistan Rupee',
    minorUnit: 2,
    numericCode: '586',
    symbol: '₨',
  ),

  /// **Zloty**
  ///
  /// * Poland
  pln(
    {
      Country.poland,
    },
    {
      'Poland',
    },
    currency: 'Zloty',
    minorUnit: 2,
    numericCode: '985',
    symbol: 'zł',
  ),

  /// **Guarani**
  ///
  /// * Paraguay
  pyg(
    {
      Country.paraguay,
    },
    {
      'Paraguay',
    },
    currency: 'Guarani',
    minorUnit: 0,
    numericCode: '600',
    symbol: '₲',
  ),

  /// **Qatari Rial**
  ///
  /// * Qatar
  qar(
    {
      Country.qatar,
    },
    {
      'Qatar',
    },
    currency: 'Qatari Rial',
    minorUnit: 2,
    numericCode: '634',
    symbol: '﷼',
  ),

  /// **Romanian Leu**
  ///
  /// * Romania
  ron(
    {
      Country.romania,
    },
    {
      'Romania',
    },
    currency: 'Romanian Leu',
    minorUnit: 2,
    numericCode: '946',
    symbol: 'lei',
  ),

  /// **Serbian Dinar**
  ///
  /// * Serbia
  rsd(
    {
      Country.serbia,
    },
    {
      'Serbia',
    },
    currency: 'Serbian Dinar',
    minorUnit: 2,
    numericCode: '941',
    symbol: 'РСД',
  ),

  /// **Russian Ruble**
  ///
  /// * Russian Federation (The)
  rub(
    {
      Country.russianFederation,
    },
    {
      'Russian Federation (The)',
    },
    currency: 'Russian Ruble',
    minorUnit: 2,
    numericCode: '643',
    symbol: '₽',
  ),

  /// **Rwanda Franc**
  ///
  /// * Rwanda
  rwf(
    {
      Country.rwanda,
    },
    {
      'Rwanda',
    },
    currency: 'Rwanda Franc',
    minorUnit: 0,
    numericCode: '646',
    symbol: 'FRw',
  ),

  /// **Saudi Riyal**
  ///
  /// * Saudi Arabia
  sar(
    {
      Country.saudiArabia,
    },
    {
      'Saudi Arabia',
    },
    currency: 'Saudi Riyal',
    minorUnit: 2,
    numericCode: '682',
    symbol: '﷼',
  ),

  /// **Solomon Islands Dollar**
  ///
  /// * Solomon Islands
  sbd(
    {
      Country.solomonIslands,
    },
    {
      'Solomon Islands',
    },
    currency: 'Solomon Islands Dollar',
    minorUnit: 2,
    numericCode: '090',
    symbol: r'$',
  ),

  /// **Seychelles Rupee**
  ///
  /// * Seychelles
  scr(
    {
      Country.seychelles,
    },
    {
      'Seychelles',
    },
    currency: 'Seychelles Rupee',
    minorUnit: 2,
    numericCode: '690',
    symbol: '₨',
  ),

  /// **Sudanese Pound**
  ///
  /// * Sudan (The)
  sdg(
    {
      Country.sudan,
    },
    {
      'Sudan (The)',
    },
    currency: 'Sudanese Pound',
    minorUnit: 2,
    numericCode: '938',
    symbol: 'ج.س',
  ),

  /// **Swedish Krona**
  ///
  /// * Sweden
  sek(
    {
      Country.sweden,
    },
    {
      'Sweden',
    },
    currency: 'Swedish Krona',
    minorUnit: 2,
    numericCode: '752',
    symbol: 'kr',
  ),

  /// **Singapore Dollar**
  ///
  /// * Singapore
  sgd(
    {
      Country.singapore,
    },
    {
      'Singapore',
    },
    currency: 'Singapore Dollar',
    minorUnit: 2,
    numericCode: '702',
    symbol: r'$',
  ),

  /// **Saint Helena Pound**
  ///
  /// * Saint Helena, Ascension And Tristan Da Cunha
  shp(
    {
      Country.saintHelenaAscensionAndTristanDaCunha,
    },
    {
      'Saint Helena, Ascension And Tristan Da Cunha',
    },
    currency: 'Saint Helena Pound',
    minorUnit: 2,
    numericCode: '654',
    symbol: '£',
  ),

  /// **Leone**
  ///
  /// * Sierra Leone
  sle(
    {
      Country.sierraLeone,
    },
    {
      'Sierra Leone',
    },
    currency: 'Leone',
    minorUnit: 2,
    numericCode: '925',
    symbol: 'Le',
  ),

  /// **Leone**
  ///
  /// * Sierra Leone
  sll(
    {
      Country.sierraLeone,
    },
    {
      'Sierra Leone',
    },
    currency: 'Leone',
    minorUnit: 2,
    numericCode: '694',
    symbol: 'Le',
  ),

  /// **Somali Shilling**
  ///
  /// * Somalia
  sos(
    {
      Country.somalia,
    },
    {
      'Somalia',
    },
    currency: 'Somali Shilling',
    minorUnit: 2,
    numericCode: '706',
    symbol: 'Sh.so.',
  ),

  /// **Surinam Dollar**
  ///
  /// * Suriname
  srd(
    {
      Country.suriname,
    },
    {
      'Suriname',
    },
    currency: 'Surinam Dollar',
    minorUnit: 2,
    numericCode: '968',
    symbol: r'$',
  ),

  /// **South Sudanese Pound**
  ///
  /// * South Sudan
  ssp(
    {
      Country.southSudan,
    },
    {
      'South Sudan',
    },
    currency: 'South Sudanese Pound',
    minorUnit: 2,
    numericCode: '728',
    symbol: '£',
  ),

  /// **Dobra**
  ///
  /// * Sao Tome And Principe
  stn(
    {
      Country.saoTomeAndPrincipe,
    },
    {
      'Sao Tome And Principe',
    },
    currency: 'Dobra',
    minorUnit: 2,
    numericCode: '930',
    symbol: 'Db',
  ),

  /// **El Salvador Colon**
  ///
  /// * El Salvador
  svc(
    {
      Country.elSalvador,
    },
    {
      'El Salvador',
    },
    currency: 'El Salvador Colon',
    minorUnit: 2,
    numericCode: '222',
    symbol: '₡',
  ),

  /// **Syrian Pound**
  ///
  /// * Syrian Arab Republic
  syp(
    {
      Country.syrianArabRepublic,
    },
    {
      'Syrian Arab Republic',
    },
    currency: 'Syrian Pound',
    minorUnit: 2,
    numericCode: '760',
    symbol: '£',
  ),

  /// **Lilangeni**
  ///
  /// * Eswatini
  szl(
    {
      Country.eswatini,
    },
    {
      'Eswatini',
    },
    currency: 'Lilangeni',
    minorUnit: 2,
    numericCode: '748',
    symbol: 'L',
  ),

  /// **Baht**
  ///
  /// * Thailand
  thb(
    {
      Country.thailand,
    },
    {
      'Thailand',
    },
    currency: 'Baht',
    minorUnit: 2,
    numericCode: '764',
    symbol: '฿',
  ),

  /// **Somoni**
  ///
  /// * Tajikistan
  tjs(
    {
      Country.tajikistan,
    },
    {
      'Tajikistan',
    },
    currency: 'Somoni',
    minorUnit: 2,
    numericCode: '972',
    symbol: 'SM',
  ),

  /// **Turkmenistan New Manat**
  ///
  /// * Turkmenistan
  tmt(
    {
      Country.turkmenistan,
    },
    {
      'Turkmenistan',
    },
    currency: 'Turkmenistan New Manat',
    minorUnit: 2,
    numericCode: '934',
    symbol: 'm',
  ),

  /// **Tunisian Dinar**
  ///
  /// * Tunisia
  tnd(
    {
      Country.tunisia,
    },
    {
      'Tunisia',
    },
    currency: 'Tunisian Dinar',
    minorUnit: 3,
    numericCode: '788',
    symbol: 'د.ت',
  ),

  /// **Pa’anga**
  ///
  /// * Tonga
  top(
    {
      Country.tonga,
    },
    {
      'Tonga',
    },
    currency: 'Pa’anga',
    minorUnit: 2,
    numericCode: '776',
    symbol: r'T$',
  ),

  /// **Turkish Lira**
  ///
  /// * Türki̇ye
  try_(
    {
      Country.turkiye,
    },
    {
      'Türki̇ye',
    },
    currency: 'Turkish Lira',
    minorUnit: 2,
    numericCode: '949',
    symbol: '₺',
  ),

  /// **Trinidad and Tobago Dollar**
  ///
  /// * Trinidad And Tobago
  ttd(
    {
      Country.trinidadAndTobago,
    },
    {
      'Trinidad And Tobago',
    },
    currency: 'Trinidad and Tobago Dollar',
    minorUnit: 2,
    numericCode: '780',
    symbol: r'$',
  ),

  /// **New Taiwan Dollar**
  ///
  /// * Taiwan (Province Of China)
  twd(
    {
      Country.taiwan,
    },
    {
      'Taiwan (Province Of China)',
    },
    currency: 'New Taiwan Dollar',
    minorUnit: 2,
    numericCode: '901',
    symbol: r'$',
  ),

  /// **Tanzanian Shilling**
  ///
  /// * Tanzania, United Republic Of
  tzs(
    {
      Country.tanzania,
    },
    {
      'Tanzania, United Republic Of',
    },
    currency: 'Tanzanian Shilling',
    minorUnit: 2,
    numericCode: '834',
    symbol: 'TSh',
  ),

  /// **Hryvnia**
  ///
  /// * Ukraine
  uah(
    {
      Country.ukraine,
    },
    {
      'Ukraine',
    },
    currency: 'Hryvnia',
    minorUnit: 2,
    numericCode: '980',
    symbol: '₴',
  ),

  /// **Uganda Shilling**
  ///
  /// * Uganda
  ugx(
    {
      Country.uganda,
    },
    {
      'Uganda',
    },
    currency: 'Uganda Shilling',
    minorUnit: 0,
    numericCode: '800',
    symbol: 'USh',
  ),

  /// **US Dollar**
  ///
  /// * American Samoa
  /// * Bonaire, Sint Eustatius And Saba
  /// * British Indian Ocean Territory (The)
  /// * Ecuador
  /// * El Salvador
  /// * Guam
  /// * Haiti
  /// * Marshall Islands (The)
  /// * Micronesia (Federated States Of)
  /// * Northern Mariana Islands (The)
  /// * Palau
  /// * Panama
  /// * Puerto Rico
  /// * Timor-Leste
  /// * Turks And Caicos Islands (The)
  /// * United States Minor Outlying Islands (The)
  /// * United States Of America (The)
  /// * Virgin Islands (British)
  /// * Virgin Islands (U.S.)
  usd(
    {
      Country.americanSamoa,
      Country.bonaireSintEustatiusAndSaba,
      Country.britishIndianOceanTerritory,
      Country.ecuador,
      Country.elSalvador,
      Country.guam,
      Country.haiti,
      Country.marshallIslands,
      Country.micronesia,
      Country.northernMarianaIslands,
      Country.palau,
      Country.panama,
      Country.puertoRico,
      Country.timorLeste,
      Country.turksAndCaicosIslands,
      Country.unitedStatesMinorOutlyingIslands,
      Country.unitedStatesOfAmerica,
      Country.virginIslandsBritish,
      Country.virginIslandsUS,
    },
    {
      'American Samoa',
      'Bonaire, Sint Eustatius And Saba',
      'British Indian Ocean Territory (The)',
      'Ecuador',
      'El Salvador',
      'Guam',
      'Haiti',
      'Marshall Islands (The)',
      'Micronesia (Federated States Of)',
      'Northern Mariana Islands (The)',
      'Palau',
      'Panama',
      'Puerto Rico',
      'Timor-Leste',
      'Turks And Caicos Islands (The)',
      'United States Minor Outlying Islands (The)',
      'United States Of America (The)',
      'Virgin Islands (British)',
      'Virgin Islands (U.S.)',
    },
    currency: 'US Dollar',
    minorUnit: 2,
    numericCode: '840',
    symbol: r'$',
  ),

  /// **US Dollar (Next day)**
  ///
  /// * United States Of America (The)
  usn(
    {
      Country.unitedStatesOfAmerica,
    },
    {
      'United States Of America (The)',
    },
    currency: 'US Dollar (Next day)',
    fundDefinition: '“Next day” funds are immediately available for transfer in'
        ' like funds, and, subject to settlement, available the next business'
        ' day for same day funds transfer or withdrawal in cash.',
    isFund: true,
    minorUnit: 2,
    numericCode: '997',
  ),

  /// **Uruguay Peso en Unidades Indexadas (UI)**
  ///
  /// * Uruguay
  uyi(
    {
      Country.uruguay,
    },
    {
      'Uruguay',
    },
    currency: 'Uruguay Peso en Unidades Indexadas (UI)',
    fundDefinition: 'The UYI (UI) is used for issuance of debt instruments by'
        ' the Uruguayan government in the international global bond market. It'
        ' is calculated based on an established methodology using underlying'
        ' inflationary statistics in the Uruguayan market. (Introduced in'
        ' 2002).',
    isFund: true,
    minorUnit: 0,
    numericCode: '940',
  ),

  /// **Peso Uruguayo**
  ///
  /// * Uruguay
  uyu(
    {
      Country.uruguay,
    },
    {
      'Uruguay',
    },
    currency: 'Peso Uruguayo',
    minorUnit: 2,
    numericCode: '858',
    symbol: r'$',
  ),

  /// **Unidad Previsional**
  ///
  /// * Uruguay
  uyw(
    {
      Country.uruguay,
    },
    {
      'Uruguay',
    },
    currency: 'Unidad Previsional',
    fundDefinition: 'The Unidad Previsional (UP) is a daily accounting unit'
        ' that tracks changes to the nominal wage index. The value of UP is'
        ' expressed in terms of Uruguayan Pesos per UP, with the initial value'
        ' of one peso (UYU 1.00) on 04/30/2018. The institution responsible for'
        ' the calculation and publication is the Instituto Nacional de'
        ' Estadística (National Bureau of Statistics) according to Law 19,608.',
    isFund: true,
    minorUnit: 4,
    numericCode: '927',
  ),

  /// **Uzbekistan Sum**
  ///
  /// * Uzbekistan
  uzs(
    {
      Country.uzbekistan,
    },
    {
      'Uzbekistan',
    },
    currency: 'Uzbekistan Sum',
    minorUnit: 2,
    numericCode: '860',
    symbol: 'so’m',
  ),

  /// **Bolívar Soberano**
  ///
  /// * Venezuela (Bolivarian Republic Of)
  ved(
    {
      Country.venezuela,
    },
    {
      'Venezuela (Bolivarian Republic Of)',
    },
    currency: 'Bolívar Soberano',
    minorUnit: 2,
    numericCode: '926',
    symbol: 'Bs.D',
  ),

  /// **Bolívar Soberano**
  ///
  /// * Venezuela (Bolivarian Republic Of)
  ves(
    {
      Country.venezuela,
    },
    {
      'Venezuela (Bolivarian Republic Of)',
    },
    currency: 'Bolívar Soberano',
    minorUnit: 2,
    numericCode: '928',
    symbol: 'Bs.S.',
  ),

  /// **Dong**
  ///
  /// * Viet Nam
  vnd(
    {
      Country.vietNam,
    },
    {
      'Viet Nam',
    },
    currency: 'Dong',
    minorUnit: 0,
    numericCode: '704',
    symbol: '₫',
  ),

  /// **Vatu**
  ///
  /// * Vanuatu
  vuv(
    {
      Country.vanuatu,
    },
    {
      'Vanuatu',
    },
    currency: 'Vatu',
    minorUnit: 0,
    numericCode: '548',
    symbol: 'VT',
  ),

  /// **Tala**
  ///
  /// * Samoa
  wst(
    {
      Country.samoa,
    },
    {
      'Samoa',
    },
    currency: 'Tala',
    minorUnit: 2,
    numericCode: '882',
    symbol: r'$',
  ),

  /// **CFA Franc BEAC**
  ///
  /// * Cameroon
  /// * Central African Republic (The)
  /// * Chad
  /// * Congo (The)
  /// * Equatorial Guinea
  /// * Gabon
  xaf(
    {
      Country.cameroon,
      Country.centralAfricanRepublic,
      Country.chad,
      Country.congo,
      Country.equatorialGuinea,
      Country.gabon,
    },
    {
      'Cameroon',
      'Central African Republic (The)',
      'Chad',
      'Congo (The)',
      'Equatorial Guinea',
      'Gabon',
    },
    currency: 'CFA Franc BEAC',
    minorUnit: 0,
    numericCode: '950',
    symbol: 'FCFA',
  ),

  /// **Silver**
  ///
  /// * ZZ11_Silver
  xag(
    {},
    {
      'ZZ11_Silver',
    },
    currency: 'Silver',
    isPreciousMetal: true,
    numericCode: '961',
  ),

  /// **Gold**
  ///
  /// * ZZ08_Gold
  xau(
    {},
    {
      'ZZ08_Gold',
    },
    currency: 'Gold',
    isPreciousMetal: true,
    numericCode: '959',
  ),

  /// **Bond Markets Unit European Composite Unit (EURCO)**
  ///
  /// * ZZ01_Bond Markets Unit European_EURCO
  xba(
    {},
    {
      'ZZ01_Bond Markets Unit European_EURCO',
    },
    currency: 'Bond Markets Unit European Composite Unit (EURCO)',
    numericCode: '955',
  ),

  /// **Bond Markets Unit European Monetary Unit (E.M.U.-6)**
  ///
  /// * ZZ02_Bond Markets Unit European_EMU-6
  xbb(
    {},
    {
      'ZZ02_Bond Markets Unit European_EMU-6',
    },
    currency: 'Bond Markets Unit European Monetary Unit (E.M.U.-6)',
    numericCode: '956',
  ),

  /// **Bond Markets Unit European Unit of Account 9 (E.U.A.-9)**
  ///
  /// * ZZ03_Bond Markets Unit European_EUA-9
  xbc(
    {},
    {
      'ZZ03_Bond Markets Unit European_EUA-9',
    },
    currency: 'Bond Markets Unit European Unit of Account 9 (E.U.A.-9)',
    numericCode: '957',
  ),

  /// **Bond Markets Unit European Unit of Account 17 (E.U.A.-17)**
  ///
  /// * ZZ04_Bond Markets Unit European_EUA-17
  xbd(
    {},
    {
      'ZZ04_Bond Markets Unit European_EUA-17',
    },
    currency: 'Bond Markets Unit European Unit of Account 17 (E.U.A.-17)',
    numericCode: '958',
  ),

  /// **East Caribbean Dollar**
  ///
  /// * Anguilla
  /// * Antigua And Barbuda
  /// * Dominica
  /// * Grenada
  /// * Montserrat
  /// * Saint Kitts And Nevis
  /// * Saint Lucia
  /// * Saint Vincent And The Grenadines
  xcd(
    {
      Country.anguilla,
      Country.antiguaAndBarbuda,
      Country.dominica,
      Country.grenada,
      Country.montserrat,
      Country.saintKittsAndNevis,
      Country.saintLucia,
      Country.saintVincentAndTheGrenadines,
    },
    {
      'Anguilla',
      'Antigua And Barbuda',
      'Dominica',
      'Grenada',
      'Montserrat',
      'Saint Kitts And Nevis',
      'Saint Lucia',
      'Saint Vincent And The Grenadines',
    },
    currency: 'East Caribbean Dollar',
    minorUnit: 2,
    numericCode: '951',
    symbol: r'$',
  ),

  /// **SDR (Special Drawing Right)**
  ///
  /// * International Monetary Fund (IMF)
  xdr(
    {},
    {
      'International Monetary Fund (IMF)',
    },
    currency: 'SDR (Special Drawing Right)',
    numericCode: '960',
  ),

  /// **CFA Franc BCEAO**
  ///
  /// * Benin
  /// * Burkina Faso
  /// * Côte D’Ivoire
  /// * Guinea-Bissau
  /// * Mali
  /// * Niger (The)
  /// * Senegal
  /// * Togo
  xof(
    {
      Country.benin,
      Country.burkinaFaso,
      Country.coteDIvoire,
      Country.guineaBissau,
      Country.mali,
      Country.niger,
      Country.senegal,
      Country.togo,
    },
    {
      'Benin',
      'Burkina Faso',
      'Côte D’Ivoire',
      'Guinea-Bissau',
      'Mali',
      'Niger (The)',
      'Senegal',
      'Togo',
    },
    currency: 'CFA Franc BCEAO',
    minorUnit: 0,
    numericCode: '952',
  ),

  /// **Palladium**
  ///
  /// * ZZ09_Palladium
  xpd(
    {},
    {
      'ZZ09_Palladium',
    },
    currency: 'Palladium',
    isPreciousMetal: true,
    numericCode: '964',
  ),

  /// **CFP Franc**
  ///
  /// * French Polynesia
  /// * New Caledonia
  /// * Wallis And Futuna
  xpf(
    {
      Country.frenchPolynesia,
      Country.newCaledonia,
      Country.wallisAndFutuna,
    },
    {
      'French Polynesia',
      'New Caledonia',
      'Wallis And Futuna',
    },
    currency: 'CFP Franc',
    minorUnit: 0,
    numericCode: '953',
    symbol: '₣',
  ),

  /// **Platinum**
  ///
  /// * ZZ10_Platinum
  xpt(
    {},
    {
      'ZZ10_Platinum',
    },
    currency: 'Platinum',
    numericCode: '962',
  ),

  /// **Sucre**
  ///
  /// * Sistema Unitario De Compensacion Regional De Pagos “SUCRE”
  xsu(
    {},
    {
      'Sistema Unitario De Compensacion Regional De Pagos “SUCRE”',
    },
    currency: 'Sucre',
    numericCode: '994',
  ),

  /// **Codes specifically reserved for testing purposes**
  ///
  /// * ZZ06_Testing_Code
  xts(
    {},
    {
      'ZZ06_Testing_Code',
    },
    currency: 'Codes specifically reserved for testing purposes',
    numericCode: '963',
  ),

  /// **ADB Unit of Account**
  ///
  /// * Member Countries Of The African Development Bank Group
  xua(
    {},
    {
      'Member Countries Of The African Development Bank Group',
    },
    currency: 'ADB Unit of Account',
    numericCode: '965',
  ),

  /// **The codes assigned for transactions where no currency is involved**
  ///
  /// * ZZ07_No_Currency
  xxx(
    {},
    {
      'ZZ07_No_Currency',
    },
    currency:
        'The codes assigned for transactions where no currency is involved',
    numericCode: '999',
  ),

  /// **Yemeni Rial**
  ///
  /// * Yemen
  yer(
    {
      Country.yemen,
    },
    {
      'Yemen',
    },
    currency: 'Yemeni Rial',
    minorUnit: 2,
    numericCode: '886',
    symbol: '﷼',
  ),

  /// **Rand**
  ///
  /// * Lesotho
  /// * Namibia
  /// * South Africa
  zar(
    {},
    {
      'Lesotho',
      'Namibia',
      'South Africa',
    },
    currency: 'Rand',
    minorUnit: 2,
    numericCode: '710',
    symbol: 'R',
  ),

  /// **Zambian Kwacha**
  ///
  /// * Zambia
  zmw(
    {
      Country.zambia,
    },
    {
      'Zambia',
    },
    currency: 'Zambian Kwacha',
    minorUnit: 2,
    numericCode: '967',
    symbol: 'ZK',
  ),

  /// **Zimbabwe Dollar**
  ///
  /// * Zimbabwe
  zwl(
    {
      Country.zimbabwe,
    },
    {
      'Zimbabwe',
    },
    currency: 'Zimbabwe Dollar',
    minorUnit: 2,
    numericCode: '932',
    symbol: r'$',
  );

  /// Constructs a [Currency] instance.
  ///
  /// For example, to create a `Currency` object representing the Euro currency:
  ///
  /// ```dart
  /// final euro = const Currency.eur;
  /// ```
  ///
  /// {@macro moneys.currency.whatis}
  ///
  /// {@macro moneys.currency.iso4217}
  ///
  const Currency(
    this._countries,
    this._entities, {
    required this.currency,
    this.fundDefinition,
    this.isFund = false,
    this.isPreciousMetal = false,
    this.minorUnit,
    required this.numericCode,
    this.symbol = '',
  });

  /// Constructs a [Currency] instance based on [formattedString].
  ///
  /// Throws a [FormatException] if the input string cannot be parsed.
  ///
  /// The accepted inputs are currently:
  ///
  /// * A valid [ISO 4217](https://www.iso.org/iso-4217-currency-codes.html)
  /// alphabetic code.
  /// * A valid [ISO 4217](https://www.iso.org/iso-4217-currency-codes.html)
  /// numeric code.
  /// * The value of the [name] property of an instance of this enum.
  ///
  /// This includes the output of [toString], which will be parsed back into a
  /// [Currency] object.
  ///
  /// This constructor is *not case sensitive* and *does not take into account
  /// leading and trailing white spaces*.
  ///
  /// {@macro moneys.currency.whatis}
  ///
  /// {@macro moneys.currency.iso4217}
  ///
  factory Currency.parse(final String formattedString) {
    final String lowerTrimmed = formattedString.toLowerCase().trim();
    for (final Currency currency in Currency.values) {
      if (lowerTrimmed == currency.alphabeticCode.toLowerCase() ||
          lowerTrimmed == currency.name ||
          lowerTrimmed == currency.numericCode) {
        return currency;
      }
    }
    throw FormatException(
      parseFormatExceptionMessage(formattedString, 'Currency'),
    );
  }

  /// The **alphabetic code** (always in uppercase).
  ///
  /// The alphabetic code is based on another ISO standard,
  /// [ISO 3166](https://www.iso.org/iso-3166-country-codes.html), which lists
  /// the codes for country names. The first 2 letters of the
  /// [ISO 4217](https://www.iso.org/iso-4217-currency-codes.html) 3-letter
  /// code are the same as the code for the country name, and, where possible,
  /// the third letter corresponds to the first letter of the currency name.
  String get alphabeticCode => name.substring(0, 3).toUpperCase();

  /// The **countries** where this currency is used. Here “country” indicates a
  /// country, dependency or other area of particular geopolitical interest.
  final Set<Country> _countries;

  /// A sorted and unique set of all **countries** where this currency is used.
  /// Here “country” indicates a country, dependency or other area of particular
  /// geopolitical interest.
  SplayTreeSet<Country> get countries => SplayTreeSet.from(_countries);

  /// The **name**.
  final String currency;

  /// The **entities** that use this currency.
  final Set<String> _entities;

  /// A sorted and unique set of all **entities** that use this currency.
  SplayTreeSet<String> get entities => SplayTreeSet.from(_entities);

  /// This is the **definition of the fund**.
  final String? fundDefinition;

  /// Whether it is **a fund or not**. A fund is an artificial currency used as
  /// calculation basis for another currency (or currencies) and/or for
  /// accounting purposes.
  final bool isFund;

  /// Whether it is **a precious metal or not**.
  final bool isPreciousMetal;

  /// The **minor unit**. A minor unit is a unit of recorded value (for example
  /// as recorded by banks) which is a division of the respective unit of
  /// currency or fund.
  final int? minorUnit;

  /// The **numerical code**.
  ///
  /// The 3-digit numeric code is useful when currency codes need to be
  /// understood in countries that do not use Latin scripts and for computerized
  /// systems. Where possible, the 3-digit numeric code is the same as the
  /// numeric country code.
  final String numericCode;

  /// The associated **symbol**.
  final String symbol;

  /// The **order of comparison** of the properties of this enum is:
  ///
  /// 1. [alphabeticCode]
  ///
  @override
  int compareTo(covariant final Currency other) =>
      alphabeticCode.compareTo(other.alphabeticCode);

  /// Returns a string representation of this instance.
  ///
  /// This string matches the [alphabeticCode] property, but with lowercase
  /// letters.
  ///
  /// The returned string can be parsed back using [Currency.parse].
  ///
  @override
  String toString() => alphabeticCode.toLowerCase();
}

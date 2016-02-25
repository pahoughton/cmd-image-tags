#!/usr/bin/perl -w

eval 'exec /usr/bin/perl -w -S $0 ${1+"$@"}'
    if 0; # not running under some shell

use strict;

use Image::ExifTool;

# exiftool -overwrite_original \
#     -Keywords=Houghton \
#     -DateTimeOriginal="1999-12-25 01:01:00" \
#     -Location="1326 Canoe Creek Dr. S." \
#     -City="Colorado Springs" -Province-State=CO -PostalCode=80906 \
#     -GPSLatitudeRef=N -GPSLongitudeRef=W \
#     -GPSLatitude=38.771063 \
#     -GPSLongitude=-104.804470 \
#     -ObjectName="Christmas" \
#     -Caption-Abstract="Christmas Tree" \
#     "1999-12-25 04 2 Christmas Tree.jpg"

my $Locs;

$Locs->{ '1326 Canoe Creek' }->{ Location } = '1326 Canoe Creek Dr. S.';
$Locs->{ '1326 Canoe Creek' }->{ City } = "Colorado Springs";
$Locs->{ '1326 Canoe Creek' }->{ 'Province-State' } = "CO";
$Locs->{ '1326 Canoe Creek' }->{ PostalCode } = "80906";
$Locs->{ '1326 Canoe Creek' }->{ GPSLatitudeRef } = 'N';
$Locs->{ '1326 Canoe Creek' }->{ GPSLongitudeRef } = 'W';
$Locs->{ '1326 Canoe Creek' }->{ GPSLatitude } = '38.771063';
$Locs->{ '1326 Canoe Creek' }->{ GPSLongitude } = '-104.804470';

$Locs->{ '1327 Canoe Creek' }->{ Location } = '1327 Canoe Creek Dr. S.';
$Locs->{ '1327 Canoe Creek' }->{ City } = "Colorado Springs";
$Locs->{ '1327 Canoe Creek' }->{ 'Province-State' } = "CO";
$Locs->{ '1327 Canoe Creek' }->{ PostalCode } = "80906";
$Locs->{ '1327 Canoe Creek' }->{ GPSLatitudeRef } = 'N';
$Locs->{ '1327 Canoe Creek' }->{ GPSLongitudeRef } = 'W';
$Locs->{ '1327 Canoe Creek' }->{ GPSLatitude } = '38.770717';
$Locs->{ '1327 Canoe Creek' }->{ GPSLongitude } = '-104.804563';

$Locs->{ '1338 Canoe Creek' }->{ Location } = '1338 Canoe Creek Dr. S.';
$Locs->{ '1338 Canoe Creek' }->{ City } = "Colorado Springs";
$Locs->{ '1338 Canoe Creek' }->{ 'Province-State' } = "CO";
$Locs->{ '1338 Canoe Creek' }->{ PostalCode } = "80906";
$Locs->{ '1338 Canoe Creek' }->{ GPSLatitudeRef } = 'N';
$Locs->{ '1338 Canoe Creek' }->{ GPSLongitudeRef } = 'W';
$Locs->{ '1338 Canoe Creek' }->{ GPSLatitude } = '38.771016';
$Locs->{ '1338 Canoe Creek' }->{ GPSLongitude } = '-104.804265';

$Locs->{ '1426 Canoe Creek' }->{ Location } = 'Haynes Home, 1426 Canoe Creek Dr. S.';
$Locs->{ '1426 Canoe Creek' }->{ City } = "Colorado Springs";
$Locs->{ '1426 Canoe Creek' }->{ 'Province-State' } = "CO";
$Locs->{ '1426 Canoe Creek' }->{ PostalCode } = "80906";
$Locs->{ '1426 Canoe Creek' }->{ GPSLatitudeRef } = 'N';
$Locs->{ '1426 Canoe Creek' }->{ GPSLongitudeRef } = 'W';
$Locs->{ '1426 Canoe Creek' }->{ GPSLatitude } = '38.770388';
$Locs->{ '1426 Canoe Creek' }->{ GPSLongitude } = '-104.803134';

$Locs->{ 'Broadmoor' }->{ Location } = 'Broadmoor Hotel - 1 Lake Ave';
$Locs->{ 'Broadmoor' }->{ City } = "Colorado Springs";
$Locs->{ 'Broadmoor' }->{ 'Province-State' } = "CO";
$Locs->{ 'Broadmoor' }->{ PostalCode } = "80906";
$Locs->{ 'Broadmoor' }->{ GPSLatitudeRef } = 'N';
$Locs->{ 'Broadmoor' }->{ GPSLongitudeRef } = 'W';
$Locs->{ 'Broadmoor' }->{ GPSLatitude } = '38.791368';
$Locs->{ 'Broadmoor' }->{ GPSLongitude } = '-104.848976';

$Locs->{ 'StPauls' }->{ Location } = "St Paul's Church, 9 El Pomar Road";
$Locs->{ 'StPauls' }->{ City } = "Colorado Springs";
$Locs->{ 'StPauls' }->{ 'Province-State' } = "CO";
$Locs->{ 'StPauls' }->{ PostalCode } = "80906";
$Locs->{ 'StPauls' }->{ GPSLatitudeRef } = 'N';
$Locs->{ 'StPauls' }->{ GPSLongitudeRef } = 'W';
$Locs->{ 'StPauls' }->{ GPSLatitude } = '38.790801';
$Locs->{ 'StPauls' }->{ GPSLongitude } = '-104.855435';

$Locs->{ '4x4p' }->{ Location } = "4 Wheel Parts Store, 1749 S Academy Blvd";
$Locs->{ '4x4p' }->{ City } = "Colorado Springs";
$Locs->{ '4x4p' }->{ 'Province-State' } = "CO";
$Locs->{ '4x4p' }->{ PostalCode } = "80916";
$Locs->{ '4x4p' }->{ GPSLatitudeRef } = 'N';
$Locs->{ '4x4p' }->{ GPSLongitudeRef } = 'W';
$Locs->{ '4x4p' }->{ GPSLatitude } = '38.807986';
$Locs->{ '4x4p' }->{ GPSLongitude } = '-104.755919';

$Locs->{ 'TanvirHotel' }->{ Location } = "Tanvir's Hotel";
$Locs->{ 'TanvirHotel' }->{ City } = "Canon City";
$Locs->{ 'TanvirHotel' }->{ 'Province-State' } = "CO";
#$Locs->{ 'TanvirHotel' }->{ PostalCode } = "80916";
$Locs->{ 'TanvirHotel' }->{ GPSLatitudeRef } = 'N';
$Locs->{ 'TanvirHotel' }->{ GPSLongitudeRef } = 'W';
$Locs->{ 'TanvirHotel' }->{ GPSLatitude } = '38.448038';
$Locs->{ 'TanvirHotel' }->{ GPSLongitude } = '-105.181560';

$Locs->{ 'Harrison' }->{ Location } = 'Harrison High School';
$Locs->{ 'Harrison' }->{ City } = "Colorado Springs";
$Locs->{ 'Harrison' }->{ 'Province-State' } = "CO";
$Locs->{ 'Harrison' }->{ PostalCode } = "80906";
$Locs->{ 'Harrison' }->{ GPSLatitudeRef } = 'N';
$Locs->{ 'Harrison' }->{ GPSLongitudeRef } = 'W';
$Locs->{ 'Harrison' }->{ GPSLatitude } = '38.793101';
$Locs->{ 'Harrison' }->{ GPSLongitude } = '-104.793232';

$Locs->{ 'Gorman' }->{ Location } = 'Gorman Middle School';
$Locs->{ 'Gorman' }->{ City } = "Colorado Springs";
$Locs->{ 'Gorman' }->{ 'Province-State' } = "CO";
$Locs->{ 'Gorman' }->{ PostalCode } = "80906";
$Locs->{ 'Gorman' }->{ GPSLatitudeRef } = 'N';
$Locs->{ 'Gorman' }->{ GPSLongitudeRef } = 'W';
$Locs->{ 'Gorman' }->{ GPSLatitude } = '38.795302';
$Locs->{ 'Gorman' }->{ GPSLongitude } = '-104.795253';

$Locs->{ 'WorldArena' }->{ Location } = 'World Arena, 3185 Venetucci Boulevard';
$Locs->{ 'WorldArena' }->{ City } = "Colorado Springs";
$Locs->{ 'WorldArena' }->{ 'Province-State' } = "CO";
$Locs->{ 'WorldArena' }->{ PostalCode } = "80906";
$Locs->{ 'WorldArena' }->{ GPSLatitudeRef } = 'N';
$Locs->{ 'WorldArena' }->{ GPSLongitudeRef } = 'W';
$Locs->{ 'WorldArena' }->{ GPSLatitude } = '38.788238';
$Locs->{ 'WorldArena' }->{ GPSLongitude } = '-104.794131';

#$Locs->{ 'Carol' }->{ Location } = "6888 w. Shaw Butte Dr.";
#$Locs->{ 'Carol' }->{ City } = "Peoria";
$Locs->{ 'Carol' }->{ 'Province-State' } = "AZ";
#$Locs->{ 'Carol' }->{ PostalCode } = "85345";
#$Locs->{ 'Carol' }->{ GPSLatitudeRef } = 'N';
#$Locs->{ 'Carol' }->{ GPSLongitudeRef } = 'W';
#$Locs->{ 'Carol' }->{ GPSLatitude } = '33.595752';
#$Locs->{ 'Carol' }->{ GPSLongitude } = '-112.207005';

$Locs->{ 'Belmont' }->{ Location } = "5047 W Belmont";
$Locs->{ 'Belmont' }->{ City } = "Glendale";
$Locs->{ 'Belmont' }->{ 'Province-State' } = "AZ";
$Locs->{ 'Belmont' }->{ PostalCode } = "85301";
$Locs->{ 'Belmont' }->{ GPSLatitudeRef } = 'N';
$Locs->{ 'Belmont' }->{ GPSLongitudeRef } = 'W';
$Locs->{ 'Belmont' }->{ GPSLatitude } = '33.54770278';
$Locs->{ 'Belmont' }->{ GPSLongitude } = '-112.16833889';

$Locs->{ 'Pike' }->{ Location } = "Pike Ranger District, Pike NF";
$Locs->{ 'Pike' }->{ 'Province-State' } = "CO";
$Locs->{ 'Pike' }->{ GPSLatitudeRef } = 'N';
$Locs->{ 'Pike' }->{ GPSLongitudeRef } = 'W';
$Locs->{ 'Pike' }->{ GPSLatitude } = '39.144952';
$Locs->{ 'Pike' }->{ GPSLongitude } = '-105.181927';

$Locs->{ 'Creede' }->{ Location } = "Creede Area";
$Locs->{ 'Creede' }->{ 'Province-State' } = "CO";
$Locs->{ 'Creede' }->{ GPSLatitudeRef } = 'N';
$Locs->{ 'Creede' }->{ GPSLongitudeRef } = 'W';
$Locs->{ 'Creede' }->{ GPSLatitude } = '37.864873';
$Locs->{ 'Creede' }->{ GPSLongitude } = '-106.925137';

$Locs->{ 'Clear Creek' }->{ Location } = "Clear Creek Area, San Isabel NF";
$Locs->{ 'Clear Creek' }->{ 'Province-State' } = "CO";
$Locs->{ 'Clear Creek' }->{ GPSLatitudeRef } = 'N';
$Locs->{ 'Clear Creek' }->{ GPSLongitudeRef } = 'W';
$Locs->{ 'Clear Creek' }->{ GPSLatitude } = '38.998511';
$Locs->{ 'Clear Creek' }->{ GPSLongitude } = '-106.374319';

$Locs->{ 'Happy Meadows' }->{ Location } = "Happy Meadows Campground, South Park Ranger District, Pike NF";
$Locs->{ 'Happy Meadows' }->{ 'Province-State' } = "CO";
$Locs->{ 'Happy Meadows' }->{ GPSLatitudeRef } = 'N';
$Locs->{ 'Happy Meadows' }->{ GPSLongitudeRef } = 'W';
$Locs->{ 'Happy Meadows' }->{ GPSLatitude } = '39.014001';
$Locs->{ 'Happy Meadows' }->{ GPSLongitude } = '-105.362482';

$Locs->{ 'Mt Baldy' }->{ Location } = "Mt Baldy Road, Pike Park Ranger District, Pike NF";
$Locs->{ 'Mt Baldy' }->{ 'Province-State' } = "CO";
$Locs->{ 'Mt Baldy' }->{ GPSLatitudeRef } = 'N';
$Locs->{ 'Mt Baldy' }->{ GPSLongitudeRef } = 'W';
$Locs->{ 'Mt Baldy' }->{ GPSLatitude } = '38.742360';
$Locs->{ 'Mt Baldy' }->{ GPSLongitude } = '-104.952152';

$Locs->{ 'Red Cone' }->{ Location } = "Red Cone, Pike NF";
$Locs->{ 'Red Cone' }->{ 'Province-State' } = "CO";
$Locs->{ 'Red Cone' }->{ GPSLatitudeRef } = 'N';
$Locs->{ 'Red Cone' }->{ GPSLongitudeRef } = 'W';
$Locs->{ 'Red Cone' }->{ GPSLatitude } = '39.513872';
$Locs->{ 'Red Cone' }->{ GPSLongitude } = '-105.808945';

$Locs->{ 'Twin Cone' }->{ Location } = "Twin Cone, Pike NF";
$Locs->{ 'Twin Cone' }->{ 'Province-State' } = "CO";
$Locs->{ 'Twin Cone' }->{ GPSLatitudeRef } = 'N';
$Locs->{ 'Twin Cone' }->{ GPSLongitudeRef } = 'W';
$Locs->{ 'Twin Cone' }->{ GPSLatitude } = '39.418780';
$Locs->{ 'Twin Cone' }->{ GPSLongitude } = '-105.702689';

$Locs->{ 'Longwater' }->{ Location } = "Long Water Gulch, Pike Park Ranger District, Pike NF";
$Locs->{ 'Longwater' }->{ 'Province-State' } = "CO";
$Locs->{ 'Longwater' }->{ GPSLatitudeRef } = 'N';
$Locs->{ 'Longwater' }->{ GPSLongitudeRef } = 'W';
$Locs->{ 'Longwater' }->{ GPSLatitude } = '39.099104';
$Locs->{ 'Longwater' }->{ GPSLongitude } = '-105.278647';

$Locs->{ 'Hacket' }->{ Location } = "Hacket Gulch, Pike Park Ranger District, Pike NF";
$Locs->{ 'Hacket' }->{ 'Province-State' } = "CO";
$Locs->{ 'Hacket' }->{ GPSLatitudeRef } = 'N';
$Locs->{ 'Hacket' }->{ GPSLongitudeRef } = 'W';
$Locs->{ 'Hacket' }->{ GPSLatitude } = '39.061677';
$Locs->{ 'Hacket' }->{ GPSLongitude } = '-105.309141';

$Locs->{ 'PikeRD' }->{ Location } = "Pike Park Ranger District, Pike NF";
$Locs->{ 'PikeRD' }->{ 'Province-State' } = "CO";
$Locs->{ 'PikeRD' }->{ GPSLatitudeRef } = 'N';
$Locs->{ 'PikeRD' }->{ GPSLongitudeRef } = 'W';
$Locs->{ 'PikeRD' }->{ GPSLatitude } = '39.085755';
$Locs->{ 'PikeRD' }->{ GPSLongitude } = '-105.212141';

$Locs->{ 'China' }->{ Location } = "Chinaman's Gulch, San Isabel NF";
$Locs->{ 'China' }->{ 'Province-State' } = "CO";
$Locs->{ 'China' }->{ GPSLatitudeRef } = 'N';
$Locs->{ 'China' }->{ GPSLongitudeRef } = 'W';
$Locs->{ 'China' }->{ GPSLatitude } = '38.792395';
$Locs->{ 'China' }->{ GPSLongitude } = '-106.082705';

$Locs->{ 'Slaughter' }->{ Location } = "Slaughterhouse Gulch, Pike NF";
$Locs->{ 'Slaughter' }->{ 'Province-State' } = "CO";
$Locs->{ 'Slaughter' }->{ GPSLatitudeRef } = 'N';
$Locs->{ 'Slaughter' }->{ GPSLongitudeRef } = 'W';
$Locs->{ 'Slaughter' }->{ GPSLatitude } = '39.480696';
$Locs->{ 'Slaughter' }->{ GPSLongitude } = '-105.529828';

$Locs->{ 'Tarryall' }->{ Location } = "Lake Tarryall";
$Locs->{ 'Tarryall' }->{ 'Province-State' } = "CO";
$Locs->{ 'Tarryall' }->{ GPSLatitudeRef } = 'N';
$Locs->{ 'Tarryall' }->{ GPSLongitudeRef } = 'W';
$Locs->{ 'Tarryall' }->{ GPSLatitude } = '39.222825';
$Locs->{ 'Tarryall' }->{ GPSLongitude } = '-105.605270';

$Locs->{ 'Sylvan' }->{ Location } = "Sylvan Lake, White River NF";
$Locs->{ 'Sylvan' }->{ 'Province-State' } = "CO";
$Locs->{ 'Sylvan' }->{ GPSLatitudeRef } = 'N';
$Locs->{ 'Sylvan' }->{ GPSLongitudeRef } = 'W';
$Locs->{ 'Sylvan' }->{ GPSLatitude } = '39.480445';
$Locs->{ 'Sylvan' }->{ GPSLongitude } = '-106.735504';

$Locs->{ 'Moab' }->{ Location } = "Moab";
$Locs->{ 'Moab' }->{ 'Province-State' } = "UT";
$Locs->{ 'Moab' }->{ GPSLatitudeRef } = 'N';
$Locs->{ 'Moab' }->{ GPSLongitudeRef } = 'W';
$Locs->{ 'Moab' }->{ GPSLatitude } = '38.571264';
$Locs->{ 'Moab' }->{ GPSLongitude } = '-109.556830';

$Locs->{ 'Lincoln' }->{ Location } = "Mt Lincoln, Pike NF";
$Locs->{ 'Lincoln' }->{ 'Province-State' } = "CO";
$Locs->{ 'Lincoln' }->{ GPSLatitudeRef } = 'N';
$Locs->{ 'Lincoln' }->{ GPSLongitudeRef } = 'W';
$Locs->{ 'Lincoln' }->{ GPSLatitude } = '39.351371';
$Locs->{ 'Lincoln' }->{ GPSLongitude } = '-106.111380';

$Locs->{ 'TwinCone' }->{ Location } = "Twin Cone";
$Locs->{ 'TwinCone' }->{ 'Province-State' } = "CO";
$Locs->{ 'TwinCone' }->{ GPSLatitudeRef } = 'N';
$Locs->{ 'TwinCone' }->{ GPSLongitudeRef } = 'W';
$Locs->{ 'TwinCone' }->{ GPSLatitude } = '39.413702';
$Locs->{ 'TwinCone' }->{ GPSLongitude } = '-105.754633';

$Locs->{ 'Sedona' }->{ Location } = "Sedona";
$Locs->{ 'Sedona' }->{ 'Province-State' } = "AZ";
$Locs->{ 'Sedona' }->{ City } = "Sedona";
$Locs->{ 'Sedona' }->{ GPSLatitudeRef } = 'N';
$Locs->{ 'Sedona' }->{ GPSLongitudeRef } = 'W';
$Locs->{ 'Sedona' }->{ GPSLatitude } = '34.869740';
$Locs->{ 'Sedona' }->{ GPSLongitude } = '-111.760990';

$Locs->{ 'Ouray' }->{ Location } = "Ouray";
$Locs->{ 'Ouray' }->{ 'Province-State' } = "CO";
$Locs->{ 'Ouray' }->{ City } = "Ouray";
$Locs->{ 'Ouray' }->{ GPSLatitudeRef } = 'N';
$Locs->{ 'Ouray' }->{ GPSLongitudeRef } = 'W';
$Locs->{ 'Ouray' }->{ GPSLatitude } = '38.022772';
$Locs->{ 'Ouray' }->{ GPSLongitude } = '-107.671449';

$Locs->{ 'SpringCreek' }->{ Location } = "Spring Creek Trail";
$Locs->{ 'SpringCreek' }->{ 'Province-State' } = "CO";
$Locs->{ 'SpringCreek' }->{ City } = "Lawson";
$Locs->{ 'SpringCreek' }->{ GPSLatitudeRef } = 'N';
$Locs->{ 'SpringCreek' }->{ GPSLongitudeRef } = 'W';
$Locs->{ 'SpringCreek' }->{ GPSLatitude } = '39.763117';
$Locs->{ 'SpringCreek' }->{ GPSLongitude } = '-105.633713';

$Locs->{ 'Camp Hale' }->{ Location } = "Camp Hale, White River NF";
$Locs->{ 'Camp Hale' }->{ 'Province-State' } = "CO";
$Locs->{ 'Camp Hale' }->{ GPSLatitudeRef } = 'N';
$Locs->{ 'Camp Hale' }->{ GPSLongitudeRef } = 'W';
$Locs->{ 'Camp Hale' }->{ GPSLatitude } = '39.431169';
$Locs->{ 'Camp Hale' }->{ GPSLongitude } = '-106.322996';

$Locs->{ 'SDHQ' }->{ Location } = 'SuperDuty Headquarters';
$Locs->{ 'SDHQ' }->{ City } = "Mesa";
$Locs->{ 'SDHQ' }->{ 'Province-State' } = "AZ";
$Locs->{ 'SDHQ' }->{ PostalCode } = "85204";
$Locs->{ 'SDHQ' }->{ GPSLatitudeRef } = 'N';
$Locs->{ 'SDHQ' }->{ GPSLongitudeRef } = 'W';
$Locs->{ 'SDHQ' }->{ GPSLatitude } = '33.388418';
$Locs->{ 'SDHQ' }->{ GPSLongitude } = '-111.789113';

$Locs->{ 'Woodland' }->{ Location } = "Woodland Park";
$Locs->{ 'Woodland' }->{ 'Province-State' } = "CO";
$Locs->{ 'Woodland' }->{ City } = "Woodland Park";
$Locs->{ 'Woodland' }->{ GPSLatitudeRef } = 'N';
$Locs->{ 'Woodland' }->{ GPSLongitudeRef } = 'W';
$Locs->{ 'Woodland' }->{ GPSLatitude } = '38.993878';
$Locs->{ 'Woodland' }->{ GPSLongitude } = '-105.056938';

$Locs->{ 'TexasCreek' }->{ Location } = "Texas Creek";
$Locs->{ 'TexasCreek' }->{ 'Province-State' } = "CO";
$Locs->{ 'TexasCreek' }->{ GPSLatitudeRef } = 'N';
$Locs->{ 'TexasCreek' }->{ GPSLongitudeRef } = 'W';
$Locs->{ 'TexasCreek' }->{ GPSLatitude } = '38.415801';
$Locs->{ 'TexasCreek' }->{ GPSLongitude } = '-105.587244';

$Locs->{ 'SaranWrap' }->{ Location } = "Saran Wrap";
$Locs->{ 'SaranWrap' }->{ 'Province-State' } = "CO";
$Locs->{ 'SaranWrap' }->{ GPSLatitudeRef } = 'N';
$Locs->{ 'SaranWrap' }->{ GPSLongitudeRef } = 'W';
$Locs->{ 'SaranWrap' }->{ GPSLatitude } = '38.737258';
$Locs->{ 'SaranWrap' }->{ GPSLongitude } = '-104.994802';

$Locs->{ 'Rainbow' }->{ Location } = "Rainbow Falls";
$Locs->{ 'Rainbow' }->{ 'Province-State' } = "CO";
$Locs->{ 'Rainbow' }->{ GPSLatitudeRef } = 'N';
$Locs->{ 'Rainbow' }->{ GPSLongitudeRef } = 'W';
$Locs->{ 'Rainbow' }->{ GPSLatitude } = '39.135397';
$Locs->{ 'Rainbow' }->{ GPSLongitude } = '-105.105240';

$Locs->{ 'Hayden' }->{ Location } = "Hayden Creek";
$Locs->{ 'Hayden' }->{ 'Province-State' } = "CO";
$Locs->{ 'Hayden' }->{ GPSLatitudeRef } = 'N';
$Locs->{ 'Hayden' }->{ GPSLongitudeRef } = 'W';
$Locs->{ 'Hayden' }->{ GPSLatitude } = '38.329050';
$Locs->{ 'Hayden' }->{ GPSLongitude } = '-105.824668';

$Locs->{ 'EagleRock' }->{ Location } = "Eagle Rock";
$Locs->{ 'EagleRock' }->{ 'Province-State' } = "CO";
$Locs->{ 'EagleRock' }->{ GPSLatitudeRef } = 'N';
$Locs->{ 'EagleRock' }->{ GPSLongitudeRef } = 'W';
$Locs->{ 'EagleRock' }->{ GPSLatitude } = '38.738744';
$Locs->{ 'EagleRock' }->{ GPSLongitude } = '-104.983584';

$Locs->{ 'LeftHand' }->{ Location } = "Left Hand Canyon";
$Locs->{ 'LeftHand' }->{ 'Province-State' } = "CO";
$Locs->{ 'LeftHand' }->{ GPSLatitudeRef } = 'N';
$Locs->{ 'LeftHand' }->{ GPSLongitudeRef } = 'W';
$Locs->{ 'LeftHand' }->{ GPSLatitude } = '40.106571';
$Locs->{ 'LeftHand' }->{ GPSLongitude } = '-105.322418';

$Locs->{ 'TwinLakes' }->{ Location } = "Twin Lakes";
$Locs->{ 'TwinLakes' }->{ 'Province-State' } = "CO";
$Locs->{ 'TwinLakes' }->{ GPSLatitudeRef } = 'N';
$Locs->{ 'TwinLakes' }->{ GPSLongitudeRef } = 'W';
$Locs->{ 'TwinLakes' }->{ GPSLatitude } = '39.073230';
$Locs->{ 'TwinLakes' }->{ GPSLongitude } = '-106.388813';

$Locs->{ 'HalfMoon' }->{ Location } = "Halfmoon Canyon";
$Locs->{ 'HalfMoon' }->{ 'Province-State' } = "CO";
$Locs->{ 'HalfMoon' }->{ GPSLatitudeRef } = 'N';
$Locs->{ 'HalfMoon' }->{ GPSLongitudeRef } = 'W';
$Locs->{ 'HalfMoon' }->{ GPSLatitude } = '39.162202';
$Locs->{ 'HalfMoon' }->{ GPSLongitude } = '-106.474192';

$Locs->{ 'IronMike' }->{ Location } = "Iron Mike Trail";
$Locs->{ 'IronMike' }->{ 'Province-State' } = "CO";
$Locs->{ 'IronMike' }->{ GPSLatitudeRef } = 'N';
$Locs->{ 'IronMike' }->{ GPSLongitudeRef } = 'W';
$Locs->{ 'IronMike' }->{ GPSLatitude } = '39.151574';
$Locs->{ 'IronMike' }->{ GPSLongitude } = '-106.419921';

$Locs->{ 'ChampMill' }->{ Location } = "Champion Mill";
$Locs->{ 'ChampMill' }->{ 'Province-State' } = "CO";
$Locs->{ 'ChampMill' }->{ GPSLatitudeRef } = 'N';
$Locs->{ 'ChampMill' }->{ GPSLongitudeRef } = 'W';
$Locs->{ 'ChampMill' }->{ GPSLatitude } = '39.137394';
$Locs->{ 'ChampMill' }->{ GPSLongitude } = '-106.504595';

$Locs->{ 'IronCityCem' }->{ Location } = "Iron City Cemetery";
$Locs->{ 'IronCityCem' }->{ 'Province-State' } = "CO";
$Locs->{ 'IronCityCem' }->{ GPSLatitudeRef } = 'N';
$Locs->{ 'IronCityCem' }->{ GPSLongitudeRef } = 'W';
$Locs->{ 'IronCityCem' }->{ GPSLatitude } = '38.707471';
$Locs->{ 'IronCityCem' }->{ GPSLongitude } = '-106.338406';

$Locs->{ 'MtPrince' }->{ Location } = "Mt Princeton Area";
$Locs->{ 'MtPrince' }->{ 'Province-State' } = "CO";
$Locs->{ 'MtPrince' }->{ GPSLatitudeRef } = 'N';
$Locs->{ 'MtPrince' }->{ GPSLongitudeRef } = 'W';
$Locs->{ 'MtPrince' }->{ GPSLatitude } = '38.640443';
$Locs->{ 'MtPrince' }->{ GPSLongitude } = '-106.361259';

$Locs->{ 'MtPrince2' }->{ Location } = "Mt Princeton Area";
$Locs->{ 'MtPrince2' }->{ 'Province-State' } = "CO";
$Locs->{ 'MtPrince2' }->{ GPSLatitudeRef } = 'N';
$Locs->{ 'MtPrince2' }->{ GPSLongitudeRef } = 'W';
$Locs->{ 'MtPrince2' }->{ GPSLatitude } = '38.729835';
$Locs->{ 'MtPrince2' }->{ GPSLongitude } = '-106.154085';

$Locs->{ 'HolyCross' }->{ Location } = "Holy Cross";
$Locs->{ 'HolyCross' }->{ 'Province-State' } = "CO";
$Locs->{ 'HolyCross' }->{ GPSLatitudeRef } = 'N';
$Locs->{ 'HolyCross' }->{ GPSLongitudeRef } = 'W';
$Locs->{ 'HolyCross' }->{ GPSLatitude } = '39.413345';
$Locs->{ 'HolyCross' }->{ GPSLongitude } = '-106.428294';

$Locs->{ 'Crested' }->{ Location } = "Crested Butte";
$Locs->{ 'Crested' }->{ 'Province-State' } = "CO";
$Locs->{ 'Crested' }->{ GPSLatitudeRef } = 'N';
$Locs->{ 'Crested' }->{ GPSLongitudeRef } = 'W';
$Locs->{ 'Crested' }->{ GPSLatitude } = '38.894446';
$Locs->{ 'Crested' }->{ GPSLongitude } = '-106.883122';

$Locs->{ 'Monarch' }->{ Location } = "Monarch Pass";
$Locs->{ 'Monarch' }->{ 'Province-State' } = "CO";
$Locs->{ 'Monarch' }->{ GPSLatitudeRef } = 'N';
$Locs->{ 'Monarch' }->{ GPSLongitudeRef } = 'W';
$Locs->{ 'Monarch' }->{ GPSLatitude } = '38.541337';
$Locs->{ 'Monarch' }->{ GPSLongitude } = '-106.314166';

$Locs->{ 'MtHerman' }->{ Location } = "Mt Herman Road";
$Locs->{ 'MtHerman' }->{ 'Province-State' } = "CO";
$Locs->{ 'MtHerman' }->{ GPSLatitudeRef } = 'N';
$Locs->{ 'MtHerman' }->{ GPSLongitudeRef } = 'W';
$Locs->{ 'MtHerman' }->{ GPSLatitude } = '39.069767';
$Locs->{ 'MtHerman' }->{ GPSLongitude } = '-104.920667';

$Locs->{ 'Sterling' }->{ Location } = "North Sterling Reservoir";
$Locs->{ 'Sterling' }->{ 'Province-State' } = "CO";
$Locs->{ 'Sterling' }->{ GPSLatitudeRef } = 'N';
$Locs->{ 'Sterling' }->{ GPSLongitudeRef } = 'W';
$Locs->{ 'Sterling' }->{ GPSLatitude } = '40.764705';
$Locs->{ 'Sterling' }->{ GPSLongitude } = '-103.275449';

$Locs->{ 'Miramont' }->{ Location } = "Miramont Castle Museum, 9 Capitol Hill Ave.";
$Locs->{ 'Miramont' }->{ City } = "Manitou Springs";
$Locs->{ 'Miramont' }->{ 'Province-State' } = "CO";
$Locs->{ 'Miramont' }->{ PostalCode } = "80829";
$Locs->{ 'Miramont' }->{ GPSLatitudeRef } = 'N';
$Locs->{ 'Miramont' }->{ GPSLongitudeRef } = 'W';
$Locs->{ 'Miramont' }->{ GPSLatitude } = '38.859305';
$Locs->{ 'Miramont' }->{ GPSLongitude } = '-104.922497';

$Locs->{ 'NewLife' }->{ Location } = "New Life Church, 11025 Voyager Pkwy.";
$Locs->{ 'NewLife' }->{ City } = "Colorado Springs";
$Locs->{ 'NewLife' }->{ 'Province-State' } = "CO";
$Locs->{ 'NewLife' }->{ PostalCode } = "80921";
$Locs->{ 'NewLife' }->{ GPSLatitudeRef } = 'N';
$Locs->{ 'NewLife' }->{ GPSLongitudeRef } = 'W';
$Locs->{ 'NewLife' }->{ GPSLatitude } = '38.990098';
$Locs->{ 'NewLife' }->{ GPSLongitude } = '-104.797894';

$Locs->{ 'Independence' }->{ Location } = "Independence";
$Locs->{ 'Independence' }->{ 'Province-State' } = "CO";
$Locs->{ 'Independence' }->{ GPSLatitudeRef } = 'N';
$Locs->{ 'Independence' }->{ GPSLongitudeRef } = 'W';
$Locs->{ 'Independence' }->{ GPSLatitude } = '39.1606685';
$Locs->{ 'Independence' }->{ GPSLongitude } = '-106.606230';


$Locs->{ 'Set' }->{ Location } = "Colorad Springs Fine Arts Center, 30 W Dale St";
$Locs->{ 'Set' }->{ City } = "Colorado Springs";
$Locs->{ 'Set' }->{ 'Province-State' } = "CO";
$Locs->{ 'Set' }->{ PostalCode } = "80903";
$Locs->{ 'Set' }->{ GPSLatitudeRef } = 'N';
$Locs->{ 'Set' }->{ GPSLongitudeRef } = 'W';
$Locs->{ 'Set' }->{ GPSLatitude } = '38.845759';
$Locs->{ 'Set' }->{ GPSLongitude } = '-104.825933';

my $useLoc="1326 Canoe Creek";
#my $useLoc="Set";

my $TimeSeq;
my $doSet = 1;
my $prevTime = 0;
my $prevDate = undef;
my $prevSeq = 0;

foreach my $fn (@ARGV) {
  my $srcExif = new Image::ExifTool;
  my $srcTags = $srcExif->ImageInfo($fn);

  my $origComment=undef;
  my $origDateTime=undef;
  my $origObjName=undef;
  my $fnDateTime=undef;
  my $objName="";
  my $abstract="";
  my $fnames=undef;
  my $fnSeq=undef;
  my $origFnDate=undef;
  if( $fn =~ /(\d\d\d\d-\d\d-\d\d) (\d\d\d\d\d\d) (\d\d\d\d).jpg/ ) {
    $origFnDate=$1;
    $fnSeq=$3;
    $origObjName="";
    $objName=$origObjName;
    $objName =~ s/Heather Haynes/Heather Izzett/;
    $objName =~ s/Eian Haynes/Ian Izzett/;
    $objName =~ s/Eian/Ian/;
    $objName =~ s/Longwater Gulch/Long Water Gulch/;
    $objName =~ s/Harney/Hayden/;
    $objName =~ s/Lefthand/Left Hand/;
    $objName =~ s/Redcone/Red Cone/;
  } else {
    print "ERRORR: FN Format: $fn\n";
    exit 1;
  }

  if( defined( $srcTags->{ XPComment } ) ) {
    $origComment = $srcTags->{ XPComment };
    $abstract=$origComment;
    $abstract =~ s/South Platte River\s+//;
    $abstract =~ s/Mt Baldy Road\s+//;
    $abstract =~ s/Arizona\s+//;
    $abstract =~ s/Arkansas River Colorado\s+//;
    $abstract =~ s/End of Longwater Gulch Trail\s+//;
    $abstract =~ s/Pike Ranger District\s*//;
    $abstract =~ s/Pike National Forest Colorado\s+//;
    $abstract =~ s/Paul Alexander Houghton /Paul A Houghton/;
    $abstract =~ s/Patricia Ann Morris /Patricia Ann Houghton/;
    $abstract =~ s/Robert Edward Houghton /Robert E Houghton/;
    $abstract =~ s/Ryan Allen Houghton /Ryan A Houghton/;
    $abstract =~ s/Jared Lind Kenyon /Jared Lind Kenyon/;
    $abstract =~ s/home @ 1326 Canoe Creek Dr S\s+//;
    $abstract =~ s/Colorado Springs Colorado 80906\s+//;
    $abstract =~ s/Heather Haynes/Heather Izzett/;
    $abstract =~ s/Eian Haynes/Ian Izzett/;
    $abstract =~ s/Brian/Bryan/;
    $abstract =~ s/Longwater Gulch/Long Water Gulch/;
    $abstract =~ s/Harney/Hayden/;
    $abstract =~ s/Lefthand/Left Hand/;
    $abstract =~ s/Redcone/Red Cone/;
    
    my @firstNames=();
    foreach my $ln (split( /\n/,$origComment)) {
      if( $ln =~ /Patricia / ) {
	push( @firstNames, "Patty" );
      }

      if( $ln =~ /Paul / ) {
	push( @firstNames, "Paul" );
      }
      if( $ln =~ /Robert / ) {
	push( @firstNames, "Rob" );
      }
      if( $ln =~ /Ryan / ) {
	push( @firstNames, "Ryan" );
      }
      if( $ln =~ /Jared / ) {
	push( @firstNames, "Jared" );
      }
      if( $ln =~ /Carol / ) {
	push( @firstNames, "Carol" );
      }
      if( $ln =~ /Todd / ) {
	push( @firstNames, "Todd" );
      }
      if( $ln =~ /Megan / ) {
	push( @firstNames, "Megan" );
      }
      if( $ln =~ /Joan / ) {
	push( @firstNames, "Joan" );
      }
      if( $ln =~ /Unknown / ) {
	push( @firstNames, "Unk" );
      }
      if( $ln =~ /Ian / ) {
	push( @firstNames, "Ian" );
      }
      if( $ln =~ /Eian / ) {
	push( @firstNames, "Ian" );
      }
      if( $ln =~ /Bryan / ) {
	push( @firstNames, "Bryan" );
      }
      if( $ln =~ /Brian / ) {
	push( @firstNames, "Bryan" );
      }
      if( $ln =~ /Tammy / ) {
	push( @firstNames, "Tammy" );
      }
      if( $ln =~ /Jurardo */ ) {
	push( @firstNames, "Jurardo" );
      }
      if( $ln =~ /Erica */ ) {
	push( @firstNames, "Erica" );
      }
    }
    print "FNames: ",$#firstNames,@firstNames,"\n";

    if( defined( $firstNames[0] ) ) {
       $fnames = join( ", ", @firstNames, );
       $fnames =~ s/, ([A-Za-z]+)$/ \& $1/;
       $objName = $fnames;
     }
  }

  my ($fYr,$fMon,$fDay) = split(/-/,$origFnDate);

  if( defined( $srcTags->{ DateTimeOriginal } )
    && $srcTags->{ DateTimeOriginal } ne "0000:00:00 00:00:00" ) {
    my ($oDate,$oTime) = split(/ /,$srcTags->{ DateTimeOriginal });
    my ($oYr,$oMon,$oDay) = split( /:/,$oDate);
    my ($oHr,$oMin,$oSec) = split( /:/,$oTime);

    if( $fYr != $oYr || $fMon != $oMon || $fDay != $oDay ) {
      print( "ERROR: Date mismatch: $fn\n",
	     "  $origFnDate != ",$srcTags->{ DateTimeOriginal },"\n" );
      exit 1;
    }
    $origDateTime = $srcTags->{ DateTimeOriginal };
    $fnDateTime = $origDateTime;
    $fnDateTime =~ s/(\d\d\d\d):(\d\d):(\d\d) (\d\d):(\d\d):(\d\d)/$1-$2-$3 $4$5$6/;
    $prevTime = ($oHr * 60 * 60) + ($oMin * 60) + $oSec;
    $prevSeq = $fnSeq;

    my $fnTime = sprintf( "%02d%02d%02d",
			  $prevTime / (60*60),
			  ($prevTime % (60*60)) / 60,
			  ($prevTime % 60) );
    #print "Test fnTime: $fnDateTime $fnTime\n";
  } else {
    my $fnTime = undef;
    $prevTime += ($fnSeq - $prevSeq);

    $fnDateTime = sprintf( "$origFnDate %02d%02d%02d",
			   $prevTime / (60*60),
			   ($prevTime % (60*60)) / 60,
			   ($prevTime % 60) );
    $origDateTime = sprintf( "$origFnDate %02d:%02d:%02d",
			     $prevTime / (60*60),
			     ($prevTime % (60*60)) / 60,
			     ($prevTime % 60) );
    $prevSeq = $fnSeq;
    if( $doSet ) {
      $srcExif->SetNewValue( 'DateTimeOriginal', $origDateTime );
    }
  }
  

  if( ! $objName ) {
    $objName="Home";
  }
  if( ! $abstract && $objName ) {
    $abstract = "$objName";
  }
  #$objName="Rob & Mary's Wedding";
  #$abstract="Robert Houghton & Mary Tuitea's Wedding";
  
  my $destFn="../Test/$fnDateTime $objName.jpg";
     print "FN: $fn\nDEST: $destFn\nOBJ: $objName\nDT: $origDateTime\nXP:$origComment\nCapt:$abstract\n";
  foreach my $fld (keys(%{$Locs->{$useLoc}})) {
    print "$fld: ",$Locs->{$useLoc}->{"$fld"},"\n";
  }

  if( $doSet ) {
    $srcExif->SetNewValue( Keywords => 'Houghton', AddValue => 1 );
    $srcExif->SetNewValue( 'ObjectName',$objName );
    $srcExif->SetNewValue( 'Caption-Abstract', $abstract );

    foreach my $fld (keys(%{$Locs->{$useLoc}})) {
      $srcExif->SetNewValue( $fld, $Locs->{$useLoc}->{"$fld"} );
    }
    if( -f $destFn ) {
      die "Dest exists: $destFn" ;
    }
    $srcExif->WriteInfo( $fn, $destFn );
  }

  print "\n";


}



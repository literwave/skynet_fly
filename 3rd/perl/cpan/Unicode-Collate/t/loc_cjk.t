
BEGIN {
    if ($ENV{PERL_CORE}) {
	chdir('t') if -d 't';
	@INC = $^O eq 'MacOS' ? qw(::lib) : qw(../lib);
    }
}

use strict;
use warnings;
BEGIN { $| = 1; print "1..3589\n"; }
my $count = 0;
sub ok ($;$) {
    my $p = my $r = shift;
    if (@_) {
	my $x = shift;
	$p = !defined $x ? !defined $r : !defined $r ? 0 : $r eq $x;
    }
    print $p ? "ok" : "not ok", ' ', ++$count, "\n";
}

use Unicode::Collate::Locale;

ok(1);

sub _pack_U   { Unicode::Collate::pack_U(@_) }
sub _unpack_U { Unicode::Collate::unpack_U(@_) }

#########################

my $objDefault = Unicode::Collate::Locale->
    new(locale => 'DEFAULT', normalization => undef);

ok($objDefault->getlocale, 'default');

my $objZhP = Unicode::Collate::Locale->
    new(locale => 'ZH__pinyin', normalization => undef);

ok($objZhP->getlocale, 'zh__pinyin');

my $objZhS = Unicode::Collate::Locale->
    new(locale => 'ZH__stroke', normalization => undef);

ok($objZhS->getlocale, 'zh__stroke');

my $objZhZ = Unicode::Collate::Locale->
    new(locale => 'ZH__zhuyin', normalization => undef);

ok($objZhZ->getlocale, 'zh__zhuyin');

for my $obj ($objDefault, $objZhP, $objZhS, $objZhZ) {
    for my $lev (2, 3) {
	$obj->change(level => $lev);
	my $r = $lev == 2 ? 0 : 1;
	ok($obj->cmp("\x{3220}", "\(\x{4E00}\)"), $r);
	ok($obj->cmp("\x{3226}", "\(\x{4E03}\)"), $r);
	ok($obj->cmp("\x{3222}", "\(\x{4E09}\)"), $r);
	ok($obj->cmp("\x{3228}", "\(\x{4E5D}\)"), $r);
	ok($obj->cmp("\x{3221}", "\(\x{4E8C}\)"), $r);
	ok($obj->cmp("\x{3224}", "\(\x{4E94}\)"), $r);
	ok($obj->cmp("\x{3239}", "\(\x{4EE3}\)"), $r);
	ok($obj->cmp("\x{323D}", "\(\x{4F01}\)"), $r);
	ok($obj->cmp("\x{3241}", "\(\x{4F11}\)"), $r);
	ok($obj->cmp("\x{3227}", "\(\x{516B}\)"), $r);
	ok($obj->cmp("\x{3225}", "\(\x{516D}\)"), $r);
	ok($obj->cmp("\x{3238}", "\(\x{52B4}\)"), $r);
	ok($obj->cmp("\x{3229}", "\(\x{5341}\)"), $r);
	ok($obj->cmp("\x{323F}", "\(\x{5354}\)"), $r);
	ok($obj->cmp("\x{3234}", "\(\x{540D}\)"), $r);
	ok($obj->cmp("\x{323A}", "\(\x{547C}\)"), $r);
	ok($obj->cmp("\x{3223}", "\(\x{56DB}\)"), $r);
	ok($obj->cmp("\x{322F}", "\(\x{571F}\)"), $r);
	ok($obj->cmp("\x{323B}", "\(\x{5B66}\)"), $r);
	ok($obj->cmp("\x{3230}", "\(\x{65E5}\)"), $r);
	ok($obj->cmp("\x{322A}", "\(\x{6708}\)"), $r);
	ok($obj->cmp("\x{3232}", "\(\x{6709}\)"), $r);
	ok($obj->cmp("\x{322D}", "\(\x{6728}\)"), $r);
	ok($obj->cmp("\x{3231}", "\(\x{682A}\)"), $r);
	ok($obj->cmp("\x{322C}", "\(\x{6C34}\)"), $r);
	ok($obj->cmp("\x{322B}", "\(\x{706B}\)"), $r);
	ok($obj->cmp("\x{3235}", "\(\x{7279}\)"), $r);
	ok($obj->cmp("\x{323C}", "\(\x{76E3}\)"), $r);
	ok($obj->cmp("\x{3233}", "\(\x{793E}\)"), $r);
	ok($obj->cmp("\x{3237}", "\(\x{795D}\)"), $r);
	ok($obj->cmp("\x{3240}", "\(\x{796D}\)"), $r);
	ok($obj->cmp("\x{3242}", "\(\x{81EA}\)"), $r);
	ok($obj->cmp("\x{3243}", "\(\x{81F3}\)"), $r);
	ok($obj->cmp("\x{3236}", "\(\x{8CA1}\)"), $r);
	ok($obj->cmp("\x{323E}", "\(\x{8CC7}\)"), $r);
	ok($obj->cmp("\x{322E}", "\(\x{91D1}\)"), $r);
	ok($obj->cmp("\x{3358}", "0\x{70B9}"), $r);
	ok($obj->cmp("\x{33E9}", "10\x{65E5}"), $r);
	ok($obj->cmp("\x{32C9}", "10\x{6708}"), $r);
	ok($obj->cmp("\x{3362}", "10\x{70B9}"), $r);
	ok($obj->cmp("\x{33EA}", "11\x{65E5}"), $r);
	ok($obj->cmp("\x{32CA}", "11\x{6708}"), $r);
	ok($obj->cmp("\x{3363}", "11\x{70B9}"), $r);
	ok($obj->cmp("\x{33EB}", "12\x{65E5}"), $r);
	ok($obj->cmp("\x{32CB}", "12\x{6708}"), $r);
	ok($obj->cmp("\x{3364}", "12\x{70B9}"), $r);
	ok($obj->cmp("\x{33EC}", "13\x{65E5}"), $r);
	ok($obj->cmp("\x{3365}", "13\x{70B9}"), $r);
	ok($obj->cmp("\x{33ED}", "14\x{65E5}"), $r);
	ok($obj->cmp("\x{3366}", "14\x{70B9}"), $r);
	ok($obj->cmp("\x{33EE}", "15\x{65E5}"), $r);
	ok($obj->cmp("\x{3367}", "15\x{70B9}"), $r);
	ok($obj->cmp("\x{33EF}", "16\x{65E5}"), $r);
	ok($obj->cmp("\x{3368}", "16\x{70B9}"), $r);
	ok($obj->cmp("\x{33F0}", "17\x{65E5}"), $r);
	ok($obj->cmp("\x{3369}", "17\x{70B9}"), $r);
	ok($obj->cmp("\x{33F1}", "18\x{65E5}"), $r);
	ok($obj->cmp("\x{336A}", "18\x{70B9}"), $r);
	ok($obj->cmp("\x{33F2}", "19\x{65E5}"), $r);
	ok($obj->cmp("\x{336B}", "19\x{70B9}"), $r);
	ok($obj->cmp("\x{33E0}", "1\x{65E5}"), $r);
	ok($obj->cmp("\x{32C0}", "1\x{6708}"), $r);
	ok($obj->cmp("\x{3359}", "1\x{70B9}"), $r);
	ok($obj->cmp("\x{33F3}", "20\x{65E5}"), $r);
	ok($obj->cmp("\x{336C}", "20\x{70B9}"), $r);
	ok($obj->cmp("\x{33F4}", "21\x{65E5}"), $r);
	ok($obj->cmp("\x{336D}", "21\x{70B9}"), $r);
	ok($obj->cmp("\x{33F5}", "22\x{65E5}"), $r);
	ok($obj->cmp("\x{336E}", "22\x{70B9}"), $r);
	ok($obj->cmp("\x{33F6}", "23\x{65E5}"), $r);
	ok($obj->cmp("\x{336F}", "23\x{70B9}"), $r);
	ok($obj->cmp("\x{33F7}", "24\x{65E5}"), $r);
	ok($obj->cmp("\x{3370}", "24\x{70B9}"), $r);
	ok($obj->cmp("\x{33F8}", "25\x{65E5}"), $r);
	ok($obj->cmp("\x{33F9}", "26\x{65E5}"), $r);
	ok($obj->cmp("\x{33FA}", "27\x{65E5}"), $r);
	ok($obj->cmp("\x{33FB}", "28\x{65E5}"), $r);
	ok($obj->cmp("\x{33FC}", "29\x{65E5}"), $r);
	ok($obj->cmp("\x{33E1}", "2\x{65E5}"), $r);
	ok($obj->cmp("\x{32C1}", "2\x{6708}"), $r);
	ok($obj->cmp("\x{335A}", "2\x{70B9}"), $r);
	ok($obj->cmp("\x{33FD}", "30\x{65E5}"), $r);
	ok($obj->cmp("\x{33FE}", "31\x{65E5}"), $r);
	ok($obj->cmp("\x{33E2}", "3\x{65E5}"), $r);
	ok($obj->cmp("\x{32C2}", "3\x{6708}"), $r);
	ok($obj->cmp("\x{335B}", "3\x{70B9}"), $r);
	ok($obj->cmp("\x{33E3}", "4\x{65E5}"), $r);
	ok($obj->cmp("\x{32C3}", "4\x{6708}"), $r);
	ok($obj->cmp("\x{335C}", "4\x{70B9}"), $r);
	ok($obj->cmp("\x{33E4}", "5\x{65E5}"), $r);
	ok($obj->cmp("\x{32C4}", "5\x{6708}"), $r);
	ok($obj->cmp("\x{335D}", "5\x{70B9}"), $r);
	ok($obj->cmp("\x{33E5}", "6\x{65E5}"), $r);
	ok($obj->cmp("\x{32C5}", "6\x{6708}"), $r);
	ok($obj->cmp("\x{335E}", "6\x{70B9}"), $r);
	ok($obj->cmp("\x{33E6}", "7\x{65E5}"), $r);
	ok($obj->cmp("\x{32C6}", "7\x{6708}"), $r);
	ok($obj->cmp("\x{335F}", "7\x{70B9}"), $r);
	ok($obj->cmp("\x{33E7}", "8\x{65E5}"), $r);
	ok($obj->cmp("\x{32C7}", "8\x{6708}"), $r);
	ok($obj->cmp("\x{3360}", "8\x{70B9}"), $r);
	ok($obj->cmp("\x{33E8}", "9\x{65E5}"), $r);
	ok($obj->cmp("\x{32C8}", "9\x{6708}"), $r);
	ok($obj->cmp("\x{3361}", "9\x{70B9}"), $r);
	ok($obj->cmp("\x{1F241}", "\x{3014}\x{4E09}\x{3015}"), $r);
	ok($obj->cmp("\x{1F242}", "\x{3014}\x{4E8C}\x{3015}"), $r);
	ok($obj->cmp("\x{1F247}", "\x{3014}\x{52DD}\x{3015}"), $r);
	ok($obj->cmp("\x{1F243}", "\x{3014}\x{5B89}\x{3015}"), $r);
	ok($obj->cmp("\x{1F245}", "\x{3014}\x{6253}\x{3015}"), $r);
	ok($obj->cmp("\x{1F248}", "\x{3014}\x{6557}\x{3015}"), $r);
	ok($obj->cmp("\x{1F240}", "\x{3014}\x{672C}\x{3015}"), $r);
	ok($obj->cmp("\x{1F244}", "\x{3014}\x{70B9}\x{3015}"), $r);
	ok($obj->cmp("\x{1F246}", "\x{3014}\x{76D7}\x{3015}"), $r);
	ok($obj->cmp("\x{2F00}", "\x{4E00}"), $r);
	ok($obj->cmp("\x{3192}", "\x{4E00}"), $r);
	ok($obj->cmp("\x{3280}", "\x{4E00}"), $r);
	ok($obj->cmp("\x{1F229}", "\x{4E00}"), $r);
	ok($obj->cmp("\x{319C}", "\x{4E01}"), $r);
	ok($obj->cmp("\x{3286}", "\x{4E03}"), $r);
	ok($obj->cmp("\x{3194}", "\x{4E09}"), $r);
	ok($obj->cmp("\x{3282}", "\x{4E09}"), $r);
	ok($obj->cmp("\x{1F22A}", "\x{4E09}"), $r);
	ok($obj->cmp("\x{3196}", "\x{4E0A}"), $r);
	ok($obj->cmp("\x{32A4}", "\x{4E0A}"), $r);
	ok($obj->cmp("\x{3198}", "\x{4E0B}"), $r);
	ok($obj->cmp("\x{32A6}", "\x{4E0B}"), $r);
	ok($obj->cmp("\x{319B}", "\x{4E19}"), $r);
	ok($obj->cmp("\x{2F01}", "\x{4E28}"), $r);
	ok($obj->cmp("\x{3197}", "\x{4E2D}"), $r);
	ok($obj->cmp("\x{32A5}", "\x{4E2D}"), $r);
	ok($obj->cmp("\x{1F22D}", "\x{4E2D}"), $r);
	ok($obj->cmp("\x{2F02}", "\x{4E36}"), $r);
	ok($obj->cmp("\x{2F03}", "\x{4E3F}"), $r);
	ok($obj->cmp("\x{2F04}", "\x{4E59}"), $r);
	ok($obj->cmp("\x{319A}", "\x{4E59}"), $r);
	ok($obj->cmp("\x{3288}", "\x{4E5D}"), $r);
	ok($obj->cmp("\x{2F05}", "\x{4E85}"), $r);
	ok($obj->cmp("\x{2F06}", "\x{4E8C}"), $r);
	ok($obj->cmp("\x{3193}", "\x{4E8C}"), $r);
	ok($obj->cmp("\x{3281}", "\x{4E8C}"), $r);
	ok($obj->cmp("\x{1F214}", "\x{4E8C}"), $r);
	ok($obj->cmp("\x{3284}", "\x{4E94}"), $r);
	ok($obj->cmp("\x{2F07}", "\x{4EA0}"), $r);
	ok($obj->cmp("\x{1F218}", "\x{4EA4}"), $r);
	ok($obj->cmp("\x{2F08}", "\x{4EBA}"), $r);
	ok($obj->cmp("\x{319F}", "\x{4EBA}"), $r);
	ok($obj->cmp("\x{32AD}", "\x{4F01}"), $r);
	ok($obj->cmp("\x{32A1}", "\x{4F11}"), $r);
	ok($obj->cmp("\x{329D}", "\x{512A}"), $r);
	ok($obj->cmp("\x{2F09}", "\x{513F}"), $r);
	ok($obj->cmp("\x{2F0A}", "\x{5165}"), $r);
	ok($obj->cmp("\x{2F0B}", "\x{516B}"), $r);
	ok($obj->cmp("\x{3287}", "\x{516B}"), $r);
	ok($obj->cmp("\x{3285}", "\x{516D}"), $r);
	ok($obj->cmp("\x{2F0C}", "\x{5182}"), $r);
	ok($obj->cmp("\x{1F21E}", "\x{518D}"), $r);
	ok($obj->cmp("\x{2F0D}", "\x{5196}"), $r);
	ok($obj->cmp("\x{32A2}", "\x{5199}"), $r);
	ok($obj->cmp("\x{2F0E}", "\x{51AB}"), $r);
	ok($obj->cmp("\x{2F0F}", "\x{51E0}"), $r);
	ok($obj->cmp("\x{2F10}", "\x{51F5}"), $r);
	ok($obj->cmp("\x{2F11}", "\x{5200}"), $r);
	ok($obj->cmp("\x{1F220}", "\x{521D}"), $r);
	ok($obj->cmp("\x{1F21C}", "\x{524D}"), $r);
	ok($obj->cmp("\x{1F239}", "\x{5272}"), $r);
	ok($obj->cmp("\x{2F12}", "\x{529B}"), $r);
	ok($obj->cmp("\x{3298}", "\x{52B4}"), $r);
	ok($obj->cmp("\x{2F13}", "\x{52F9}"), $r);
	ok($obj->cmp("\x{2F14}", "\x{5315}"), $r);
	ok($obj->cmp("\x{2F15}", "\x{531A}"), $r);
	ok($obj->cmp("\x{2F16}", "\x{5338}"), $r);
	ok($obj->cmp("\x{32A9}", "\x{533B}"), $r);
	ok($obj->cmp("\x{2F17}", "\x{5341}"), $r);
	ok($obj->cmp("\x{3038}", "\x{5341}"), $r);
	ok($obj->cmp("\x{3289}", "\x{5341}"), $r);
	ok($obj->cmp("\x{3039}", "\x{5344}"), $r);
	ok($obj->cmp("\x{303A}", "\x{5345}"), $r);
	ok($obj->cmp("\x{32AF}", "\x{5354}"), $r);
	ok($obj->cmp("\x{2F18}", "\x{535C}"), $r);
	ok($obj->cmp("\x{2F19}", "\x{5369}"), $r);
	ok($obj->cmp("\x{329E}", "\x{5370}"), $r);
	ok($obj->cmp("\x{2F1A}", "\x{5382}"), $r);
	ok($obj->cmp("\x{2F1B}", "\x{53B6}"), $r);
	ok($obj->cmp("\x{2F1C}", "\x{53C8}"), $r);
	ok($obj->cmp("\x{1F212}", "\x{53CC}"), $r);
	ok($obj->cmp("\x{2F1D}", "\x{53E3}"), $r);
	ok($obj->cmp("\x{1F251}", "\x{53EF}"), $r);
	ok($obj->cmp("\x{32A8}", "\x{53F3}"), $r);
	ok($obj->cmp("\x{1F22E}", "\x{53F3}"), $r);
	ok($obj->cmp("\x{1F234}", "\x{5408}"), $r);
	ok($obj->cmp("\x{3294}", "\x{540D}"), $r);
	ok($obj->cmp("\x{1F225}", "\x{5439}"), $r);
	ok($obj->cmp("\x{3244}", "\x{554F}"), $r);
	ok($obj->cmp("\x{1F23A}", "\x{55B6}"), $r);
	ok($obj->cmp("\x{2F1E}", "\x{56D7}"), $r);
	ok($obj->cmp("\x{3195}", "\x{56DB}"), $r);
	ok($obj->cmp("\x{3283}", "\x{56DB}"), $r);
	ok($obj->cmp("\x{2F1F}", "\x{571F}"), $r);
	ok($obj->cmp("\x{328F}", "\x{571F}"), $r);
	ok($obj->cmp("\x{319E}", "\x{5730}"), $r);
	ok($obj->cmp("\x{2F20}", "\x{58EB}"), $r);
	ok($obj->cmp("\x{1F224}", "\x{58F0}"), $r);
	ok($obj->cmp("\x{2F21}", "\x{5902}"), $r);
	ok($obj->cmp("\x{2F22}", "\x{590A}"), $r);
	ok($obj->cmp("\x{2F23}", "\x{5915}"), $r);
	ok($obj->cmp("\x{1F215}", "\x{591A}"), $r);
	ok($obj->cmp("\x{32B0}", "\x{591C}"), $r);
	ok($obj->cmp("\x{2F24}", "\x{5927}"), $r);
	ok($obj->cmp("\x{337D}", "\x{5927}\x{6B63}"), $r);
	ok($obj->cmp("\x{319D}", "\x{5929}"), $r);
	ok($obj->cmp("\x{1F217}", "\x{5929}"), $r);
	ok($obj->cmp("\x{2F25}", "\x{5973}"), $r);
	ok($obj->cmp("\x{329B}", "\x{5973}"), $r);
	ok($obj->cmp("\x{2F26}", "\x{5B50}"), $r);
	ok($obj->cmp("\x{1F211}", "\x{5B57}"), $r);
	ok($obj->cmp("\x{32AB}", "\x{5B66}"), $r);
	ok($obj->cmp("\x{2F27}", "\x{5B80}"), $r);
	ok($obj->cmp("\x{32AA}", "\x{5B97}"), $r);
	ok($obj->cmp("\x{2F28}", "\x{5BF8}"), $r);
	ok($obj->cmp("\x{2F29}", "\x{5C0F}"), $r);
	ok($obj->cmp("\x{2F2A}", "\x{5C22}"), $r);
	ok($obj->cmp("\x{2F2B}", "\x{5C38}"), $r);
	ok($obj->cmp("\x{2F2C}", "\x{5C6E}"), $r);
	ok($obj->cmp("\x{2F2D}", "\x{5C71}"), $r);
	ok($obj->cmp("\x{2F2E}", "\x{5DDB}"), $r);
	ok($obj->cmp("\x{2F2F}", "\x{5DE5}"), $r);
	ok($obj->cmp("\x{32A7}", "\x{5DE6}"), $r);
	ok($obj->cmp("\x{1F22C}", "\x{5DE6}"), $r);
	ok($obj->cmp("\x{2F30}", "\x{5DF1}"), $r);
	ok($obj->cmp("\x{2F31}", "\x{5DFE}"), $r);
	ok($obj->cmp("\x{2F32}", "\x{5E72}"), $r);
	ok($obj->cmp("\x{337B}", "\x{5E73}\x{6210}"), $r);
	ok($obj->cmp("\x{2F33}", "\x{5E7A}"), $r);
	ok($obj->cmp("\x{3245}", "\x{5E7C}"), $r);
	ok($obj->cmp("\x{2F34}", "\x{5E7F}"), $r);
	ok($obj->cmp("\x{2F35}", "\x{5EF4}"), $r);
	ok($obj->cmp("\x{2F36}", "\x{5EFE}"), $r);
	ok($obj->cmp("\x{2F37}", "\x{5F0B}"), $r);
	ok($obj->cmp("\x{2F38}", "\x{5F13}"), $r);
	ok($obj->cmp("\x{2F39}", "\x{5F50}"), $r);
	ok($obj->cmp("\x{2F3A}", "\x{5F61}"), $r);
	ok($obj->cmp("\x{2F3B}", "\x{5F73}"), $r);
	ok($obj->cmp("\x{1F21D}", "\x{5F8C}"), $r);
	ok($obj->cmp("\x{1F250}", "\x{5F97}"), $r);
	ok($obj->cmp("\x{2F3C}", "\x{5FC3}"), $r);
	ok($obj->cmp("\x{2F3D}", "\x{6208}"), $r);
	ok($obj->cmp("\x{2F3E}", "\x{6236}"), $r);
	ok($obj->cmp("\x{2F3F}", "\x{624B}"), $r);
	ok($obj->cmp("\x{1F210}", "\x{624B}"), $r);
	ok($obj->cmp("\x{1F231}", "\x{6253}"), $r);
	ok($obj->cmp("\x{1F227}", "\x{6295}"), $r);
	ok($obj->cmp("\x{1F22F}", "\x{6307}"), $r);
	ok($obj->cmp("\x{1F228}", "\x{6355}"), $r);
	ok($obj->cmp("\x{2F40}", "\x{652F}"), $r);
	ok($obj->cmp("\x{2F41}", "\x{6534}"), $r);
	ok($obj->cmp("\x{2F42}", "\x{6587}"), $r);
	ok($obj->cmp("\x{3246}", "\x{6587}"), $r);
	ok($obj->cmp("\x{2F43}", "\x{6597}"), $r);
	ok($obj->cmp("\x{1F21B}", "\x{6599}"), $r);
	ok($obj->cmp("\x{2F44}", "\x{65A4}"), $r);
	ok($obj->cmp("\x{1F21F}", "\x{65B0}"), $r);
	ok($obj->cmp("\x{2F45}", "\x{65B9}"), $r);
	ok($obj->cmp("\x{2F46}", "\x{65E0}"), $r);
	ok($obj->cmp("\x{2F47}", "\x{65E5}"), $r);
	ok($obj->cmp("\x{3290}", "\x{65E5}"), $r);
	ok($obj->cmp("\x{337E}", "\x{660E}\x{6CBB}"), $r);
	ok($obj->cmp("\x{1F219}", "\x{6620}"), $r);
	ok($obj->cmp("\x{337C}", "\x{662D}\x{548C}"), $r);
	ok($obj->cmp("\x{2F48}", "\x{66F0}"), $r);
	ok($obj->cmp("\x{2F49}", "\x{6708}"), $r);
	ok($obj->cmp("\x{328A}", "\x{6708}"), $r);
	ok($obj->cmp("\x{1F237}", "\x{6708}"), $r);
	ok($obj->cmp("\x{3292}", "\x{6709}"), $r);
	ok($obj->cmp("\x{1F236}", "\x{6709}"), $r);
	ok($obj->cmp("\x{2F4A}", "\x{6728}"), $r);
	ok($obj->cmp("\x{328D}", "\x{6728}"), $r);
	ok($obj->cmp("\x{3291}", "\x{682A}"), $r);
	ok($obj->cmp("\x{337F}", "\x{682A}\x{5F0F}\x{4F1A}\x{793E}"), $r);
	ok($obj->cmp("\x{2F4B}", "\x{6B20}"), $r);
	ok($obj->cmp("\x{2F4C}", "\x{6B62}"), $r);
	ok($obj->cmp("\x{32A3}", "\x{6B63}"), $r);
	ok($obj->cmp("\x{2F4D}", "\x{6B79}"), $r);
	ok($obj->cmp("\x{2F4E}", "\x{6BB3}"), $r);
	ok($obj->cmp("\x{2F4F}", "\x{6BCB}"), $r);
	ok($obj->cmp("\x{2E9F}", "\x{6BCD}"), $r);
	ok($obj->cmp("\x{2F50}", "\x{6BD4}"), $r);
	ok($obj->cmp("\x{2F51}", "\x{6BDB}"), $r);
	ok($obj->cmp("\x{2F52}", "\x{6C0F}"), $r);
	ok($obj->cmp("\x{2F53}", "\x{6C14}"), $r);
	ok($obj->cmp("\x{2F54}", "\x{6C34}"), $r);
	ok($obj->cmp("\x{328C}", "\x{6C34}"), $r);
	ok($obj->cmp("\x{329F}", "\x{6CE8}"), $r);
	ok($obj->cmp("\x{1F235}", "\x{6E80}"), $r);
	ok($obj->cmp("\x{1F226}", "\x{6F14}"), $r);
	ok($obj->cmp("\x{2F55}", "\x{706B}"), $r);
	ok($obj->cmp("\x{328B}", "\x{706B}"), $r);
	ok($obj->cmp("\x{1F21A}", "\x{7121}"), $r);
	ok($obj->cmp("\x{2F56}", "\x{722A}"), $r);
	ok($obj->cmp("\x{2F57}", "\x{7236}"), $r);
	ok($obj->cmp("\x{2F58}", "\x{723B}"), $r);
	ok($obj->cmp("\x{2F59}", "\x{723F}"), $r);
	ok($obj->cmp("\x{2F5A}", "\x{7247}"), $r);
	ok($obj->cmp("\x{2F5B}", "\x{7259}"), $r);
	ok($obj->cmp("\x{2F5C}", "\x{725B}"), $r);
	ok($obj->cmp("\x{3295}", "\x{7279}"), $r);
	ok($obj->cmp("\x{2F5D}", "\x{72AC}"), $r);
	ok($obj->cmp("\x{2F5E}", "\x{7384}"), $r);
	ok($obj->cmp("\x{2F5F}", "\x{7389}"), $r);
	ok($obj->cmp("\x{2F60}", "\x{74DC}"), $r);
	ok($obj->cmp("\x{2F61}", "\x{74E6}"), $r);
	ok($obj->cmp("\x{2F62}", "\x{7518}"), $r);
	ok($obj->cmp("\x{2F63}", "\x{751F}"), $r);
	ok($obj->cmp("\x{1F222}", "\x{751F}"), $r);
	ok($obj->cmp("\x{2F64}", "\x{7528}"), $r);
	ok($obj->cmp("\x{2F65}", "\x{7530}"), $r);
	ok($obj->cmp("\x{3199}", "\x{7532}"), $r);
	ok($obj->cmp("\x{1F238}", "\x{7533}"), $r);
	ok($obj->cmp("\x{329A}", "\x{7537}"), $r);
	ok($obj->cmp("\x{2F66}", "\x{758B}"), $r);
	ok($obj->cmp("\x{2F67}", "\x{7592}"), $r);
	ok($obj->cmp("\x{2F68}", "\x{7676}"), $r);
	ok($obj->cmp("\x{2F69}", "\x{767D}"), $r);
	ok($obj->cmp("\x{2F6A}", "\x{76AE}"), $r);
	ok($obj->cmp("\x{2F6B}", "\x{76BF}"), $r);
	ok($obj->cmp("\x{32AC}", "\x{76E3}"), $r);
	ok($obj->cmp("\x{2F6C}", "\x{76EE}"), $r);
	ok($obj->cmp("\x{2F6D}", "\x{77DB}"), $r);
	ok($obj->cmp("\x{2F6E}", "\x{77E2}"), $r);
	ok($obj->cmp("\x{2F6F}", "\x{77F3}"), $r);
	ok($obj->cmp("\x{2F70}", "\x{793A}"), $r);
	ok($obj->cmp("\x{3293}", "\x{793E}"), $r);
	ok($obj->cmp("\x{3297}", "\x{795D}"), $r);
	ok($obj->cmp("\x{1F232}", "\x{7981}"), $r);
	ok($obj->cmp("\x{2F71}", "\x{79B8}"), $r);
	ok($obj->cmp("\x{2F72}", "\x{79BE}"), $r);
	ok($obj->cmp("\x{3299}", "\x{79D8}"), $r);
	ok($obj->cmp("\x{2F73}", "\x{7A74}"), $r);
	ok($obj->cmp("\x{1F233}", "\x{7A7A}"), $r);
	ok($obj->cmp("\x{2F74}", "\x{7ACB}"), $r);
	ok($obj->cmp("\x{2F75}", "\x{7AF9}"), $r);
	ok($obj->cmp("\x{3247}", "\x{7B8F}"), $r);
	ok($obj->cmp("\x{2F76}", "\x{7C73}"), $r);
	ok($obj->cmp("\x{2F77}", "\x{7CF8}"), $r);
	ok($obj->cmp("\x{1F221}", "\x{7D42}"), $r);
	ok($obj->cmp("\x{2F78}", "\x{7F36}"), $r);
	ok($obj->cmp("\x{2F79}", "\x{7F51}"), $r);
	ok($obj->cmp("\x{2F7A}", "\x{7F8A}"), $r);
	ok($obj->cmp("\x{2F7B}", "\x{7FBD}"), $r);
	ok($obj->cmp("\x{2F7C}", "\x{8001}"), $r);
	ok($obj->cmp("\x{2F7D}", "\x{800C}"), $r);
	ok($obj->cmp("\x{2F7E}", "\x{8012}"), $r);
	ok($obj->cmp("\x{2F7F}", "\x{8033}"), $r);
	ok($obj->cmp("\x{2F80}", "\x{807F}"), $r);
	ok($obj->cmp("\x{2F81}", "\x{8089}"), $r);
	ok($obj->cmp("\x{2F82}", "\x{81E3}"), $r);
	ok($obj->cmp("\x{2F83}", "\x{81EA}"), $r);
	ok($obj->cmp("\x{2F84}", "\x{81F3}"), $r);
	ok($obj->cmp("\x{2F85}", "\x{81FC}"), $r);
	ok($obj->cmp("\x{2F86}", "\x{820C}"), $r);
	ok($obj->cmp("\x{2F87}", "\x{821B}"), $r);
	ok($obj->cmp("\x{2F88}", "\x{821F}"), $r);
	ok($obj->cmp("\x{2F89}", "\x{826E}"), $r);
	ok($obj->cmp("\x{2F8A}", "\x{8272}"), $r);
	ok($obj->cmp("\x{2F8B}", "\x{8278}"), $r);
	ok($obj->cmp("\x{2F8C}", "\x{864D}"), $r);
	ok($obj->cmp("\x{2F8D}", "\x{866B}"), $r);
	ok($obj->cmp("\x{2F8E}", "\x{8840}"), $r);
	ok($obj->cmp("\x{2F8F}", "\x{884C}"), $r);
	ok($obj->cmp("\x{2F90}", "\x{8863}"), $r);
	ok($obj->cmp("\x{2F91}", "\x{897E}"), $r);
	ok($obj->cmp("\x{2F92}", "\x{898B}"), $r);
	ok($obj->cmp("\x{2F93}", "\x{89D2}"), $r);
	ok($obj->cmp("\x{1F216}", "\x{89E3}"), $r);
	ok($obj->cmp("\x{2F94}", "\x{8A00}"), $r);
	ok($obj->cmp("\x{2F95}", "\x{8C37}"), $r);
	ok($obj->cmp("\x{2F96}", "\x{8C46}"), $r);
	ok($obj->cmp("\x{2F97}", "\x{8C55}"), $r);
	ok($obj->cmp("\x{2F98}", "\x{8C78}"), $r);
	ok($obj->cmp("\x{2F99}", "\x{8C9D}"), $r);
	ok($obj->cmp("\x{3296}", "\x{8CA1}"), $r);
	ok($obj->cmp("\x{1F223}", "\x{8CA9}"), $r);
	ok($obj->cmp("\x{32AE}", "\x{8CC7}"), $r);
	ok($obj->cmp("\x{2F9A}", "\x{8D64}"), $r);
	ok($obj->cmp("\x{2F9B}", "\x{8D70}"), $r);
	ok($obj->cmp("\x{1F230}", "\x{8D70}"), $r);
	ok($obj->cmp("\x{2F9C}", "\x{8DB3}"), $r);
	ok($obj->cmp("\x{2F9D}", "\x{8EAB}"), $r);
	ok($obj->cmp("\x{2F9E}", "\x{8ECA}"), $r);
	ok($obj->cmp("\x{2F9F}", "\x{8F9B}"), $r);
	ok($obj->cmp("\x{2FA0}", "\x{8FB0}"), $r);
	ok($obj->cmp("\x{2FA1}", "\x{8FB5}"), $r);
	ok($obj->cmp("\x{1F22B}", "\x{904A}"), $r);
	ok($obj->cmp("\x{329C}", "\x{9069}"), $r);
	ok($obj->cmp("\x{2FA2}", "\x{9091}"), $r);
	ok($obj->cmp("\x{2FA3}", "\x{9149}"), $r);
	ok($obj->cmp("\x{2FA4}", "\x{91C6}"), $r);
	ok($obj->cmp("\x{2FA5}", "\x{91CC}"), $r);
	ok($obj->cmp("\x{2FA6}", "\x{91D1}"), $r);
	ok($obj->cmp("\x{328E}", "\x{91D1}"), $r);
	ok($obj->cmp("\x{2FA7}", "\x{9577}"), $r);
	ok($obj->cmp("\x{2FA8}", "\x{9580}"), $r);
	ok($obj->cmp("\x{2FA9}", "\x{961C}"), $r);
	ok($obj->cmp("\x{2FAA}", "\x{96B6}"), $r);
	ok($obj->cmp("\x{2FAB}", "\x{96B9}"), $r);
	ok($obj->cmp("\x{2FAC}", "\x{96E8}"), $r);
	ok($obj->cmp("\x{2FAD}", "\x{9751}"), $r);
	ok($obj->cmp("\x{2FAE}", "\x{975E}"), $r);
	ok($obj->cmp("\x{2FAF}", "\x{9762}"), $r);
	ok($obj->cmp("\x{2FB0}", "\x{9769}"), $r);
	ok($obj->cmp("\x{2FB1}", "\x{97CB}"), $r);
	ok($obj->cmp("\x{2FB2}", "\x{97ED}"), $r);
	ok($obj->cmp("\x{2FB3}", "\x{97F3}"), $r);
	ok($obj->cmp("\x{2FB4}", "\x{9801}"), $r);
	ok($obj->cmp("\x{32A0}", "\x{9805}"), $r);
	ok($obj->cmp("\x{2FB5}", "\x{98A8}"), $r);
	ok($obj->cmp("\x{2FB6}", "\x{98DB}"), $r);
	ok($obj->cmp("\x{2FB7}", "\x{98DF}"), $r);
	ok($obj->cmp("\x{2FB8}", "\x{9996}"), $r);
	ok($obj->cmp("\x{2FB9}", "\x{9999}"), $r);
	ok($obj->cmp("\x{2FBA}", "\x{99AC}"), $r);
	ok($obj->cmp("\x{2FBB}", "\x{9AA8}"), $r);
	ok($obj->cmp("\x{2FBC}", "\x{9AD8}"), $r);
	ok($obj->cmp("\x{2FBD}", "\x{9ADF}"), $r);
	ok($obj->cmp("\x{2FBE}", "\x{9B25}"), $r);
	ok($obj->cmp("\x{2FBF}", "\x{9B2F}"), $r);
	ok($obj->cmp("\x{2FC0}", "\x{9B32}"), $r);
	ok($obj->cmp("\x{2FC1}", "\x{9B3C}"), $r);
	ok($obj->cmp("\x{2FC2}", "\x{9B5A}"), $r);
	ok($obj->cmp("\x{2FC3}", "\x{9CE5}"), $r);
	ok($obj->cmp("\x{2FC4}", "\x{9E75}"), $r);
	ok($obj->cmp("\x{2FC5}", "\x{9E7F}"), $r);
	ok($obj->cmp("\x{2FC6}", "\x{9EA5}"), $r);
	ok($obj->cmp("\x{2FC7}", "\x{9EBB}"), $r);
	ok($obj->cmp("\x{2FC8}", "\x{9EC3}"), $r);
	ok($obj->cmp("\x{2FC9}", "\x{9ECD}"), $r);
	ok($obj->cmp("\x{2FCA}", "\x{9ED1}"), $r);
	ok($obj->cmp("\x{2FCB}", "\x{9EF9}"), $r);
	ok($obj->cmp("\x{2FCC}", "\x{9EFD}"), $r);
	ok($obj->cmp("\x{2FCD}", "\x{9F0E}"), $r);
	ok($obj->cmp("\x{2FCE}", "\x{9F13}"), $r);
	ok($obj->cmp("\x{2FCF}", "\x{9F20}"), $r);
	ok($obj->cmp("\x{2FD0}", "\x{9F3B}"), $r);
	ok($obj->cmp("\x{2FD1}", "\x{9F4A}"), $r);
	ok($obj->cmp("\x{2FD2}", "\x{9F52}"), $r);
	ok($obj->cmp("\x{2FD3}", "\x{9F8D}"), $r);
	ok($obj->cmp("\x{2FD4}", "\x{9F9C}"), $r);
	ok($obj->cmp("\x{2EF3}", "\x{9F9F}"), $r);
	ok($obj->cmp("\x{2FD5}", "\x{9FA0}"), $r);
    }
}

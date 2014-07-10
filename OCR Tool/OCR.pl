#!/usr/bin/perl

use strict;
use warnings;


chdir('/Users/CoasterK/Desktop/') or die "$!";


# LEAF ERROR CHECKER
    

open (FILE, "<text.xml") or die "Can't open text.xml: $!\n";
my @lines = <FILE>;
close FILE;

my @newlines2;
foreach ( @lines ) {
$_ =~ 
s/\r//ig;
s/\n//ig;
s/\n//ig;
s/<!--(.*?)-->/<!---->/ig;
s/(.*?) (.*?) (.*?) (.*?) (.*?) (.*?) (.*?) (.*?)/\n$1 $2 $3 $4 $5 $6 $7 $8/ig;


push(@newlines2,$_);
}

open(FILE, ">text3.xml") || die "File not found";
print FILE @newlines2;
close(FILE);

open (FILE3, "<text3.xml") or die "Can't open text.xml: $!\n";
my @lines3 = <FILE3>;
close FILE3;

use feature 'switch';

my @patterns1 = (
qr/-->able (?!to)/,
qr/-->ble /,
qr/-->ible /,
qr/-->al /,
qr/-->ial /,
qr/-->ed /,
qr/-->er /,
qr/-->ery /,
qr/-->en /,
qr/-->enue /,
qr/-->est /,
qr/-->ful /,
qr/-->ic /,
qr/-->ing /,
qr/-->ion /,
qr/-->tion /,
qr/-->sion /,
qr/-->ation /,
qr/-->ited /,
qr/-->ition /,
qr/-->ity /,
qr/-->ty /,
qr/-->ive /,
qr/-->ative /,
qr/-->itive /,
qr/-->less /,
qr/-->lessly /,
qr/-->lished /,
qr/-->lish/,
qr/-->ly /,
qr/-->mation /,
qr/-->ment /,
qr/-->ness /,
qr/-->ning /,
qr/-->rie /,
qr/-->tling /,
qr/-->ture/,
qr/-->ous /,
qr/-->eous /,
qr/-->ious /,
qr/-->s /,
qr/-->es /,
qr/-->y /,
qr/-->([bcdfghklmnqrstvwxz]*)ointed /,
qr/-->cially /,
qr/-->ter(?!m)([aeiou]*)([a-z]*)/,
qr/-->per([aeiou]+)([a-z]*)/,
qr/([a-z])<!--(.*?)-->\1 /,
qr/ re <!/,
qr/ anti <!/,
qr/ de <!/,
qr/ dis <!/,
qr/ en <!/,
qr/ em <!/,
qr/ fore <!/,
qr/ im <!/,
qr/ il <!/,
qr/ ir <!/,
qr/ inter <!/,
qr/ mid <!/,
qr/ mis <!/,
qr/ non <!/,
qr/ pre <!/,
qr/ semi <!/,
qr/ sub <!/,
qr/ trans <!/,
qr/ un <!/,
);


open(FILE, ">text3.xml") || die "File not found";
print FILE @newlines2;
close(FILE);


for (@lines3) {
  given ($_ ) {
    when (@patterns1) {
      print "$_\nPossible leaf error: $& \n\n\n";
    }
  }  
  }





# OCR ERROR CHECKER

my @newlines;
foreach ( @lines ) {
$_ =~ 
s/\r//ig;
s/\n//ig;
s/\n//ig;
s/\(pdf:(.*?)\)//ig;
s/type:(.*?)//ig;
s/para:(.*?)//ig;
s/\&#xE1;/a/ig;
s/\&#xE2;/a/ig;
s/\&#xE3;/a/ig;
s/\&#xE4;/a/ig;
s/\&#xE5;/a/ig;
s/\&#xE6;/a/ig;
s/\&#xE7;/e/ig;;
s/\&#xE8;/e/ig;;
s/\&#xE9;/e/ig;;
s/\&#xEA;/e/ig;;
s/\&#xEB;/e/ig;;
s/\&#xEC;/i/ig;
s/\&#xED;/i/ig;
s/\&#xEE;/i/ig;
s/\&#xEF;/i/ig;
s/\&#xF2;/o/ig;
s/\&#xF3;/o/ig;
s/\&#xF4;/o/ig;
s/\&#xF5;/o/ig;
s/\&#xF6;/o/ig;
s/\&#xF8;/o/ig;
s/\&#xF9;/u/ig;
s/\&#xF9;/u/ig;
s/\&#xFA;/u/ig;
s/\&#xFB;/u/ig;
s/\&#xFC;/u/ig;
s/\&#x2014;/ /ig;
s/\&#(.*?);/ /ig;
s/<!--(.*?)-->//ig;
s/<!--leaf(.+?)//ig;
s/(.+?)-->//ig;
s/\<break\/\>/ /ig;
s/<p/\n<p/ig;
s/<(.*?)>//ig;
s/([- a-z])([0-9]*):([ ]+)bold([ ]+)//ig;
s/\( (.*?) \)//g;
s/\((.*?) \)//g;
s/\( (.*?)\)//g;
s/\((.*?)\\(.*?)\)//g;
s/\((^[a-zA-Z])(.*?)\)//g;
s/ bold / /g;
s/(?<![a-z])ent(?![a-z])/ /g;
s/(?<![a-z])ital(?![a-z])/ /g;
s/(.*?) (.*?) (.*?) (.*?) (.*?) (.*?) (.*?) (.*?)/\n$1 $2 $3 $4 $5 $6 $7 $8/ig;
s/\nent(.*?)count//ig;


push(@newlines,$_);
}

open(FILE, ">text2.xml") || die "File not found";
print FILE @newlines;
close(FILE);


open (FILE2, "<text2.xml") or die "Can't open text.xml: $!\n";
my @lines2 = <FILE2>;
close FILE2;

use feature 'switch';

my @patterns = (
qr/ ([a-zA-Z])([a-z]+) 1 (?![A-Zp])/,
qr/([a-z]+). 1 ([a-z]+)/,
qr/1 was/,
qr/1 am /,
qr/ Jr([a-z]+)/,
qr/([lL])itde/,
qr/Vve/,
qr/ ([a-z]+) tion /,
qr/ ([a-z]+) ing /,
qr/ ([a-z]+) hing /,
qr/ ([a-z]+) ment /,
qr/ ([a-z]+) cept /,
qr/ bum([s]*) /,
qr/ 1 he /,
qr/ 1 ve /,
qr/ 1've /,
qr/ 1ve /,
qr/ Erst /,
qr/ lav /,
qr/ ft /,
qr/ peopie /,
qr/ se /,
qr/ Seond /,
qr/ I sec /,
qr/ passace/,
qr/ say si /,
qr/ mv /,
qr/ the([qtupdgjkzx])/,
qr/ the ir ([a-z])/,
qr/ of([qwypdgjkzxch])/,
qr/([qydgjkzxh])to /,
qr/([a-zA-Z]{3, })and /,
qr/ ([a-z])mg /,
qr/ fi rst /,
qr/ fl at /,
qr/ dhe /,
qr/ fingen/,
qr/ moming/,
qr/udery /,
qr/ clcan/,
qr/ closc/,
qr/ ([aA])nest /,
qr/"1 (?![A-Z])/,
qr/ f lour/,
qr/ cffcct/,
qr/([a-z]+)lcs/,
qr/ ([Fl])ie wa/,
qr/ parjumerie/,
qr/ josded/,
qr/ ([a-z]+)sded/,
qr/ Indue /,
qr/ Iam /,
qr/ of eve([s]*) /,
qr/ my eve([s]*) /,
qr/they arc/,
qr/we arc/,
qr/you arc/,
qr/([a-z]+)s arc /,
qr/ re turn /,
qr/elementaiy/,
qr/intemational/,
qr/electritity/,
qr/([a-z]+)onthe /,
qr/ cany /,
qr/Bom /,
qr/aa /,
qr/Bui /,
qr/([a-z]+) s /,
qr/eifect/,
qr/peopie/,
qr/ nioneer/,
qr/solider/,
qr/boquet/,
qr/Engtish/,
qr/mel2odramatic/,
qr/ nf /,
qr/edto /,
qr/([a-z]+) lage /,
qr/([a-z]+) ited/,
qr/([a-z]+) cific/,
qr/Pd /,
qr/cyclinder/,
qr/([a-z]+)U/,
qr/disgused/,
qr/begining/,
qr/alternalive/,
qr/hundreth/,
qr/hopsital/,
qr/ lolar/,
qr/earri /,
qr/([a-z]+)llooking/,
qr/111 ([a-z]+)/,
qr/ bis /,
qr/1ist/,
qr/([a-z]+) dn/,
qr/([a-z]+)t hing/,
qr/enountered/,
qr/assembed/,
qr/ longere /,
qr/([Tt])bey/,
qr/j ust/,
qr/lcently/,
qr/([a-z]+)1([a-z]+)/,
qr/ tahe /,
qr/ Ihave /,
qr/ lust be /,
qr/ np /,
qr/([a-z]+) st /,
qr/ l([0-9]+)/,
qr/([0-9]+)l([0-9]+)/,
qr/([a-z]+)dup ([a-zA-Z]*)/,
qr/([bcdfghjklmnpqrtvwxyz]+)ym(?![s ])([cdfghjklmqrstvwxyz]+)/,
qr/([bcdfghjklmnpqrstvwxyz]+)np([ bcdfghjkmnpqstvwxyz]+)/,
qr/([bcdfghjkmpqrstvwxyz]+)dt([ abcdefgijklmnopqsuvwxyz]+)/,
qr/([bcdfhjklmnpqrvwxyz]+)hd([ acdefgijklmnpqrstuvwxyz]+)/,
qr/([aeiou])fl([bcdfghjkmnpqstvwxz]+)/,
qr/([aeiou])fj([aeiou]+)/,
qr/([aeiou])fl /,
qr/([a-z]+)ing([bcdfghjklmnpqrtvwxz]{2})/,
qr/([a-z]+)ingto /,
qr/(?<![Yy ])aaa(?![ hHYy])/,
qr/(?<! )bbb(?! )/,
qr/(?<! )ccc(?! )/,
qr/(?<! )ddd(?! )/,
qr/(?<! )eee(?! )/,
qr/(?<! )fff(?! )/,
qr/(?<! )ggg(?! )/,
qr/(?<![ OoSsAah])hhh(?! )/,
qr/(?<![ xvl.])iii(?![ xv])/,
qr/(?<! )jjj(?! )/,
qr/(?<! )kkk(?! )/,
qr/(?<! )lll(?! )/,
qr/(?<![ hHmMUu])mmm(?! )/,
qr/(?<! )nnn(?! )/,
qr/(?<![ nNOo])ooo(?![ h])/,
qr/(?<! )ppp(?! )/,
qr/(?<! )qqq(?! )/,
qr/(?<! )rrr(?! )/,
qr/(?<! )sss(?! )/,
qr/(?<! )ttt(?! )/,
qr/(?<! )uuu(?! )/,
qr/(?<! )vvv(?! )/,
qr/([a-z]+)\(([a-z]+)/,
qr/ ([a-z]+)P /,
qr/(?<![Aaw])wwww/,
qr/(?<! )xxx(?![ vi])/,
qr/(?<! )yyy(?! )/,
qr/(?<! )zzz(?! )/,
qr/fshed/,
qr/ dian /,
qr/ lished/,
qr/ lessly/,
qr/ torship/,
qr/ ity/,
qr/ terfer/,
qr/ perature/,
qr/ ter /,
qr/ wnen /,
qr/([a-z]+)ledup/,
qr/([a-z]+)dng/,
qr/ ness([, ])/,
qr/([a-z])-ing([!.,s])/,
qr/([a-z])-ing /,
qr/ ali /,
qr/mvself/,
qr/ nave /,
qr/ Kelp /,
qr/ wc /,
qr/ alwav /,
qr/ voung /,
qr/ reasoa /,
qr/lookd/,
qr/ shoud /,
qr/ i s([n]*)/,
qr/([cdfghjklmnpqrtvxyz]+)endy /,
qr/([bcdfghjklmnpqrtvxyz]+)iendy /,
qr/([bcdfghjklmnpqrtvxyz]+)iedy /,
qr/ toin([bcdfghjklmnpqrtvxyz]+)/,
qr/([aeiou])tty([bcdfghjklmnpqrtvxyz]+)/,
qr/ghdy/,
qr/([a-z]{4,})([i])dy /,
qr/([aeiou])ngsr /,
qr/ anus /,
qr/ bf /,
qr/Plis /,
qr/ itl /,
qr/saueez/,
qr/quendy/,
qr/qiu([a-z]+)/,
qr/([aeiou]+)ilze/,
qr/operadon/,
qr/ ft /,
qr/ fn/,
qr/([bdfghjklmnqrtvxyz])eded /,
qr/ Hp /,
qr/([aeiou])ffc([aeiou])/,
qr/([a-z]+)zd/,
qr/au([aiou]+)/,
qr/([ a-z]*)\$(?=[ a-z])/,
qr/ aD /,
qr/ teD /,
qr/ sb-/,
qr/s tronger/,
qr/([ a-z]*)¿([ a-z]*)/,
qr/embarrasing/,
qr/([a-z]*)dmg /,
qr/beween/,
qr/enouth/,
qr/siure /,
qr/ comer([, ])+/,
qr/ comers([, ])+/,
qr/([a-z]*)-([a-z]) /,
qr/([a-z]*)lv ([A-Za-z])/,
qr/([a-z]*) ([bcdfghjkmnpqrstvwxyz]) ([A-Za-z])/,
qr/([bcdfghjklmnpqrtvxyz]+)alive/,
qr/ unde-([a-z]+)/,
qr/([^o])ncei([a-z]+)/,
qr/ nineteneth /,
qr/([a-z]+)ble([fghjklnpqvwxyz])([a-z]+) /,
);

# CONSONANTS SET
# [bcdfghjklmnpqrstvwxyz]
# VOWEL SET
# [aeiou]





for (@lines2) {
  given ($_ ) {
    when (@patterns) {
      print "$_\nPossible error: $& \n\n\n";
    }
  }
}

unlink "text2.xml";


    
unlink "text3.xml";

use strict;
use warnings;

chdir('/Users/arnoldj/Desktop/') or die "$!";

use File::Find;

my $localdir = '/Users/arnoldj/Desktop/OEBPS';

open (MYFILE, ">OEBPS/text.txt");
 find(
 sub { print MYFILE "$_\n"},
 $localdir);
 
close (MYFILE);



# Making the toc.ncx file

my ($oldfilename, $newfilename);

$oldfilename = <OEBPS/text.txt>;
chomp ($oldfilename) ;
$newfilename = "OEBPS/toc.txt";

open (IN, $oldfilename);
open (OUT, ">$newfilename");

while (<IN>) {
	print OUT $_;
	}
	
	
close (IN) ;
close (OUT) ;



# Making the content.opf file

my ($oldfilename2, $newfilename2);

$oldfilename2 = <OEBPS/text.txt>;
chomp ($oldfilename2) ;
$newfilename2 = "OEBPS/content.opf";

open (IN, $oldfilename2);
open (OUT, ">$newfilename2");

while (<IN>) {
	print OUT $_;
	}
	
	
close (IN) ;
close (OUT) ;




# Formatting the toc.ncx

open (FILE, "<OEBPS/toc.txt") or die "Can't open toc.txt: $!\n";
my @lines = <FILE>;
close FILE;

my @newlines;
foreach ( @lines ) {
$_ =~ 
s/(?<![a-z])text/\n/s;
s/(.*?)Store//s;
s/(?<![a-z])toc\.xhtml//s;
s/(.*?)\.jpeg/ /g;
s/(.*?)\.jpg/ /g;
s/(.*?)\.tif/ /g;
s/(.*?)\.gif/ /g;
s/(.*?)\.png/ /g;
s/(.*?)\.ncx/ /g;
s/(.*?)\.opf/ /g;
s/(.*?).txt/ /g;
s/(.*?)\.otf/ /g;
s/(.*?)\.ttf/ /g;
s/(.*?)\.css/ /g;
s/images/\n/s;
s/image/\n/s;
s/css/\n/s;
s/font/\n/s;
s/fonts//g;
s/([ ]*)\n//g;
s/\.xhtml/\.xhtml\n/g;
s/\.xml/\.xml\n/g;
s/\n(.*?)/\n$1/g;
s/(?<![a-z])master\.//g;
s/\.//g;
s/xhtml/.xhtml/g;
s/xml/.xml/g;


push(@newlines,$_);
}



open(FILE, ">OEBPS/toc.txt") || die "File not found";
print FILE @newlines;
close(FILE);




# Formatting the content.opf

#adding the manifest

open (FILE, "<OEBPS/content.opf") or die "Can't open content.opf: $!\n";
my @lines2 = <FILE>;
close FILE;

my @newlines2;
foreach ( @lines2 ) {
$_ =~ 
s/(.*?)\.jpeg/\t\t\t<item id="x$1\.jpeg" href="image\/$1\.jpeg" media-type="image\/jpeg" \/>/g;
s/(.*?)\.jpg/\t\t\t<item id="x$1\.jpg" href="image\/$1\.jpg" media-type="image\/jpeg" \/>/g;
s/(.*?)\.tif/\t\t\t<item id="x$1\.tif" href="image\/$1\.tif" media-type="image\/tif" \/>/g;
s/(.*?)\.gif/\t\t\t<item id="x$1\.gif" href="image\/$1\.gif" media-type="image\/gif" \/>/g;
s/(.*?)\.png/\t\t\t<item id="x$1\.png" href="image\/$1\.png" media-type="image\/png" \/>/g;
s/(.*?)\.otf/\t\t\t<item id="$1\.otf" href="font\/$1\.otf" media-type="application\/vnd\.ms-opentype" \/>/g;
s/(.*?)\.ttf/\t\t\t<item id="$1\.ttf" href="font\/$1\.ttf" media-type="application\/vnd\.ms-opentype" \/>/g;
s/(?<![\/a-zA-Z])toc\.xhtml/\t\t\t<item id="toc" href="toc" media-type="application\/xhtml+xml" properties="nav" \/>/g;
s/(?<![\/a-zA-Z])(.*?)\.html/\t\t\t<item id="x$1" href="text\/$1\.html" media-type="application\/xhtml+xml" \/>/g;
s/(?<![\/a-zA-Z])(.*?)\.xml/\t\t\t<item id="x$1" href="text\/$1\.xml" media-type="application\/xhtml+xml" \/>/g;
s/(?<![\/a-zA-Z])(.*?)\.xhtml/\t\t\t<item id="x$1" href="text\/$1\.xhtml" media-type="application\/xhtml+xml" \/>/g;
s/(.*?)\.css/\t\t\t<item id="$1\.css" href="css\/$1\.css" media-type="text\/css" \/>/g;
s/href="toc"/href="toc\.xhtml"/g;
s/toc\.ncx/\t\t\t<item id="ncx" href="toc\.ncx" media-type="application\/x-dtbncx+xml" \/>/g;
s/content\.opf\n//g;
s/(.*?)\.txt\n//g;
s/(?<![\/a-zA-Z])text\n/\n/g;
s/(?<![\/a-zA-Z])css\n/\n/g;
s/(?<![\/a-zA-Z])font\n/\n/g;
s/(?<![\/a-zA-Z])image\n/\n/g;
s/(?<![\/a-zA-Z])images\n/\n/g;
s/\.DS_Store\n/\n/g;
s/\.\n/\n/g;
s/metadata\.xml\n//g;

push(@newlines2,$_);
}

open(FILE, ">OEBPS/content.opf") || die "File not found";
print FILE @newlines2;
close(FILE);



#adding the guide start

open(FILE, ">>OEBPS/content.opf") || die "File not found";
print FILE "\t\t<\/manifest>\n\n\t\t\<spine toc=\"ncx\">\n";
close(FILE);




# adding the xhtml docs again for the guide

my ($oldfilename3, $newfilename3);

$oldfilename3 = <OEBPS/toc.txt>;
chomp ($oldfilename3) ;
$newfilename3 = "OEBPS/content_guide.opf";

open (IN, $oldfilename3);
open (OUT, ">$newfilename3");

while (<IN>) {
	print OUT $_;
	}
	
	
close (IN) ;
close (OUT) ;




# formatting the guide

open (FILE, "<OEBPS/content_guide.opf") or die "Can't open content_guide.opf: $!\n";
my @lines3 = <FILE>;
close FILE;

my @newlines3;
foreach ( @lines3 ) {
$_ =~ 
s/([a-zA-Z]*)([0-9]+)(.*?)/$2$3/g;
s/(.*?)\.(.*?)\n/\t\t\t<itemref idref="x$1" \/>\n/g;

push(@newlines3,$_);
}

open(FILE, ">OEBPS/content_guide.opf") || die "File not found";
print FILE @newlines3;
close(FILE);




# adding the formatted guide items to the content.opf

my ($oldfilename4, $newfilename4);

$oldfilename4 = <OEBPS/content_guide.opf>;
chomp ($oldfilename4) ;
$newfilename4 = "OEBPS/content.opf";

open (IN, $oldfilename4);
open (OUT, ">>$newfilename4");

while (<IN>) {
	print OUT $_;
	}
	
	
close (IN) ;
close (OUT) ;




# delete content_guide.opf (unnecessary file)

unlink ("OEBPS/content_guide.opf");
unlink ("OEBPS/toc.txt");



#finishing touches to content.opf


open(FILE, ">>OEBPS/content.opf") || die "File not found";
print FILE "\t\t<\/spine>\n\t<guide>\n\t\t<reference type=\"toc\" title=\"Contents\" href=\"OEBPS\/toc\.xhtml\"\/>\n\t<\/guide>\n<\/package>";
close(FILE);


#add header



open (IN, "<OEBPS/content.opf") or die "Can't read old file: $!";
open (OUT, ">OEBPS/content_final.opf") or die "Can't write new file: $!";

print OUT "\<\?xml version=\"1.0\" encoding=\"UTF-8\" standalone=\"yes\"\?\>\n\t\<package \n\t\txmlns=\"http:\/\/www\.idpf\.org\/2007\/opf\"\n\t\txmlns:epub=\"http:\/\/www\.idpf\.org\/2007\/ops\"\n\t\tprefix=\"ibooks: http:\/\/vocabulary\.itunes\.apple\.com\/rdf\/ibooks\/vocabulary-extensions-1\.0\/\"\n\t\tunique-identifier=\"bookid\"\n\t\tversion=\"3\.0\"\>\n\t\t\<metadata xmlns:dc=\"http:\/\/purl\.org\/dc\/elements\/1\.1\/\"\>\n\n\n";
print OUT "\n\n\n\t\t\</metadata>\n\t\t\<manifest\>";


while( <IN> )
	{
	print OUT $_;
	}

close (OUT);

#delete duplicate

unlink ("OEBPS/content.opf");

#rename file

rename ("OEBPS/content_final.opf", "OEBPS/content.opf");

#take out one extra line

open (FILE, "<OEBPS/content.opf") or die "Can't open content.opf: $!\n";
my @lines4 = <FILE>;
close FILE;

my @newlines4;
foreach ( @lines4 ) {
$_ =~ 
s/content_final\.opf\n//g;

push(@newlines4,$_);
}

open(FILE, ">OEBPS/content.opf") || die "File not found";
print FILE @newlines4;
close(FILE);




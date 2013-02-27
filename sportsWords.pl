#! /usr/bin/perl

use strict;
use warnings;

#Checks if you need help, if not it moves on
if(@ARGV != 0){
    help();
}
else{
    sportsify();
}

#Reads in your base sentance, find the parts that need to
#be replaced and sends them off to do that
sub sportsify{
    my $initString = $_;
    my $finalString = "";
    my $tmp = "";
    my $replace = "";

    banner();
    print "Enter your base sentance: ";
    $initString = <STDIN>;
    for(my $i = 0; $i < length($initString); $i++){
        if(substr($initString, $i, 1) eq "-"){
            $tmp = substr($initString, $i+1, 1);
            $replace = getWord($tmp);
            $finalString = $finalString . $replace;
            $i++;
        }
        else{
            $finalString = $finalString . substr($initString, $i, 1);
        }
    }
    print "$finalString";
}

#Based on the character it's given it searches the appropriate
#word file and returns a word to sportsify
sub getWord{
    my $letter = $_[0];
    my $sportWord = "";
    my $lineNum = 0;

    if($letter eq "f"){
        open FILE, "Football.txt" or die "Could not open Football.txt";
    }

    elsif($letter eq "b"){
        open FILE, "Baseball.txt" or die "Could not open Baseball.txt";
    }
    #I already used b, so deal with that
    elsif($letter eq "k"){
        open FILE, "Basketball.txt" or die "Could not open Basketball.txt";
    }

    elsif($letter eq "s"){
        open FILE, "Swear.txt" or die "Could not open Swear.txt";
    }
    #I already used b, so deal with that
    elsif($letter eq "z"){
        open FILE, "Buzz.txt" or die "Could not open Buzz.txt";
    }

    while(<FILE>){
        $lineNum++;
        if($lineNum == 1){
        $sportWord = $_;
        }
        else{
        if(rand($lineNum) < 1){
        $sportWord = $_;
        }
        }
    }
    #Takes all the newlines out of the sports word before returning
    $sportWord =~ s/\n//g;
    return $sportWord;
    close FILE;
}

#Awesome banners
sub banner{
    my $bannerRand = int(rand(10));

    if($bannerRand == 1){
        print '  _____ _____   ____  _____ _______ _____ _ '; print "\n";
        print ' / ____|  __ \ / __ \|  __ \__   __/ ____| |'; print "\n";
        print '| (___ | |__) | |  | | |__) | | | | (___ | |'; print "\n";
        print ' \___ \|  ___/| |  | |  _  /  | |  \___ \| |'; print "\n";
        print ' ____) | |    | |__| | | \ \  | |  ____) |_|'; print "\n";
        print '|_____/|_|     \____/|_|  \_\ |_| |_____/(_)'; print "\n";
    }
    
    elsif($bannerRand == 2){
        print ' ____  ____  ____  ____  _____  ____  _ '; print "\n";
        print '/ ___\/  __\/  _ \/  __\/__ __\/ ___\/ \ '; print "\n";
        print '|    \|  \/|| / \||  \/|  / \  |    \| | '; print "\n";
        print '\___ ||  __/| \_/||    /  | |  \___ |\_/ '; print "\n";
        print '\____/\_/   \____/\_/\_\  \_/  \____/(_) '; print "\n";
    }

    elsif($bannerRand == 3){
        print ' _______  _______  _______  _______ _________ _______  _ '; print "\n";
        print '(  ____ \(  ____ )(  ___  )(  ____ )\__   __/(  ____ \( )'; print "\n";
        print '| (    \/| (    )|| (   ) || (    )|   ) (   | (    \/| |'; print "\n";
        print '| (_____ | (____)|| |   | || (____)|   | |   | (_____ | |'; print "\n";
        print '(_____  )|  _____)| |   | ||     __)   | |   (_____  )| |'; print "\n";
        print '      ) || (      | |   | || (\ (      | |         ) |(_)'; print "\n";
        print '/\____) || )      | (___) || ) \ \__   | |   /\____) | _ '; print "\n";
        print '\_______)|/       (_______)|/   \__/   )_(   \_______)(_)'; print "\n";
    }

    elsif($bannerRand == 4){
        print ' _______  _______  _______  ______    _______  _______  __  '; print "\n";
        print '|       ||       ||       ||    _ |  |       ||       ||  | '; print "\n";
        print '|  _____||    _  ||   _   ||   | ||  |_     _||  _____||  | '; print "\n";
        print '| |_____ |   |_| ||  | |  ||   |_||_   |   |  | |_____ |  | '; print "\n";
        print '|_____  ||    ___||  |_|  ||    __  |  |   |  |_____  ||__| '; print "\n";
        print ' _____| ||   |    |       ||   |  | |  |   |   _____| | __  '; print "\n";
        print '|_______||___|    |_______||___|  |_|  |___|  |_______||__| '; print "\n";
    }

    elsif($bannerRand == 5){
        print ' ______     ______   ______     ______     ______   ______    '; print "\n";
        print '/\  ___\   /\  == \ /\  __ \   /\  == \   /\__  _\ /\  ___\   '; print "\n";
        print '\ \___  \  \ \  _-/ \ \ \/\ \  \ \  __<   \/_/\ \/ \ \___  \  '; print "\n";
        print ' \/\_____\  \ \_\    \ \_____\  \ \_\ \_\    \ \_\  \/\_____\ '; print "\n";
        print '  \/_____/   \/_/     \/_____/   \/_/ /_/     \/_/   \/_____/ '; print "\n";
    }

    elsif($bannerRand == 6){
        print '  #####                                    ### '; print "\n";
        print ' #     # #####   ####  #####  #####  ####  ### '; print "\n";
        print ' #       #    # #    # #    #   #   #      ### '; print "\n";
        print '  #####  #    # #    # #    #   #    ####   #  '; print "\n";
        print '       # #####  #    # #####    #        #     '; print "\n";
        print ' #     # #      #    # #   #    #   #    # ### '; print "\n";
        print '  #####  #       ####  #    #   #    ####  ### '; print "\n";
    }

    elsif($bannerRand == 7){
        print '   _|_|_|                                  _|                _|  '; print "\n";
        print ' _|        _|_|_|      _|_|    _|  _|_|  _|_|_|_|    _|_|_|  _|  '; print "\n";
        print '   _|_|    _|    _|  _|    _|  _|_|        _|      _|_|      _|  '; print "\n";
        print '       _|  _|    _|  _|    _|  _|          _|          _|_|      '; print "\n";
        print ' _|_|_|    _|_|_|      _|_|    _|            _|_|  _|_|_|    _|  '; print "\n";
        print '           _|                                                    '; print "\n";
        print '           _|  '; print "\n";
    }

    elsif($bannerRand == 8){
        print ' .oooooo..o ooooooooo.     .oooooo.   ooooooooo.   ooooooooooooo  .oooooo..o .o. '; print "\n";  
        print 'd8P\'    `Y8 `888   `Y88.  d8P\'  `Y8b  `888   `Y88. 8\'   888   `8 d8P\'    `Y8 888 '; print "\n";
        print 'Y88bo.       888   .d88\' 888      888  888   .d88\'      888      Y88bo.      888 '; print "\n";
        print ' `"Y8888o.   888ooo88P\'  888      888  888ooo88P\'       888       `"Y8888o.  Y8P '; print "\n";
        print '     `"Y88b  888         888      888  888`88b.         888           `"Y88b `8\' '; print "\n";
        print 'oo     .d8P  888         `88b    d88\'  888  `88b.       888      oo     .d8P .o. '; print "\n";
        print '8""88888P\'  o888o         `Y8bood8P\'  o888o  o888o     o888o     8""88888P\'  Y8P '; print "\n";
    }

    elsif($bannerRand == 9){
        print ' :::===  :::====  :::====  :::====  :::==== :::===  ::= '; print "\n";
        print ' :::     :::  === :::  === :::  === :::==== :::     ::= '; print "\n";
        print '  =====  =======  ===  === =======    ===    =====  === '; print "\n";
        print '     === ===      ===  === === ===    ===       ===     '; print "\n";
        print ' ======  ===       ======  ===  ===   ===   ======  === '; print "\n";
    }

    elsif($bannerRand == 10){
        print '                                                  _'; print "\n";
        print '  _____   _____    _____   _____  _______  _____ (_)'; print "\n";
        print ' (_____) (_____)  (_____) (_____)(__ _ __)(_____)(_)'; print "\n";
        print '(_)___   (_)__(_)(_)   (_)(_)__(_)  (_)  (_)___  (_)'; print "\n";
        print '  (___)_ (_____) (_)   (_)(_____)   (_)    (___)_(_)'; print "\n";
        print '  ____(_)(_)     (_)___(_)( ) ( )   (_)    ____(_)_ '; print "\n";
        print ' (_____) (_)      (_____) (_)  (_)  (_)   (_____)(_)'; print "\n";
    }
}

#For people who don't get it
sub help{
  print "sportsWords.pl 0.1\n";
  print "Usage: perl sportsWords.pl [-h]\n";
  print "\t-h shows this help menu\n\n";
  print "Certain characters can be used to substitute in a random sports\n";
  print "term by sport\n";
  print "Replaceable characters:\n";
  print "\t-f\trandom term from Football.txt\n";
  print "\t-b\trandom term from Baseball.txt\n";
  print "\t-k\trandom term from Basketball.txt\n";
  print "\t-s\trandom term from Swear.txt\n";
  print "\t-z\trandom term from Buzz.txt\n";
}
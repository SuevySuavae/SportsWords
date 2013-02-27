sportsWords.pl was made after I and some friends found far too much humor in
trying to use random sports terms in our everyday conversation.

sportsWords.pl is run with "perl sportsWords.pl". Any command line arguments
are considered an error, and the help info is printed.

After printing its sick ascii art (which I didn't create), it will ask you for
a base sentence. This is where you can enter any string of text you would like,
and it will replace certain specific strings random words from a text list.
For example, putting "-k" (without the quotes) in your sentence will replace
the "-k" with a random word from the supplied Basketball.txt (I already used -b
for baseball).

Wikipedia was used for most of the lists of terms for specific sports.
Most files had some cleaning up done afterwords, so that's something we
have to live with.


Some examples of how words were collected:

Football:
curl http://en.wikipedia.org/wiki/Glossary_of_American_football | grep 'id="' | grep '<dfn>' | awk -F '"' '{print $4}' | sed s/_/" "/g > Football.txt

Baseball:
curl http://en.wikipedia.org/wiki/Glossary_of_baseball | grep 'id="' | grep '<h3>' | awk -F '<|>' '{print $13}' > Baseball.txt

Basketball:
curl http://en.wikipedia.org/wiki/Category:Basketball_terminology | grep '<li>' | awk -F '<|>' '{print $5}' > Basketball.txt


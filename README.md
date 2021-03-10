# fastcity_track

- This project which is an instant search with a given prefix via search bar shows cities to users by clicking can go to the location.
- Searching is more efficient, I am using search and only searching the subsequence when the user adds another character.
- No storyboard and not detailed ui working because the main target was focusing on instant search performance.
- Includes Xcode Unit test for true and false searchings
- I named the project fast city track because, users can instantly search the city and go to the desired city 
- Thanks :)

For instance, assume the following entries:

* Alabama, US
* Albuquerque, US
* Anaheim, US
* Arizona, US
* Sydney, AU

If the given prefix is "A", all cities but Sydney should appear. Contrariwise, if the given prefix is "s", the only result should be "Sydney, AU".
If the given prefix is "Al", "Alabama, US" and "Albuquerque, US" are the only results.
If the prefix given is "Alb" then the only result is "Albuquerque, US"

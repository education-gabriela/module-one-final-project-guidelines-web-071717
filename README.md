# The Simpsons

More than 140,000 lines of episodes available for you.

## Install

1. Clone this repository
2. Inside the project folder run `bundle install`
3. Run `rake db:migrate && rake db:seed`, this step can take several minutes

## Execution

Run `ruby bin/run.rb`:

![Imgur](http://i.imgur.com/zMsQEIp.png)

And execute one of the following to have access to stats and Simpsons characters and episode information:

* `characters`                                                                                   
  * `find_by_name`          finds chracters based on value given                                 
  * `most_popular`          shows the characters with most appearances                           
  * `most_chatty`           shows the characters most chatty                                     
  * `list`                  shows the list of characters                                         
* `episodes`                                                                                     
  * `find_by_name`          find an episode based on value given                                 
  * `most_popular`          gets a list of episodes based in amount of viewers                   
  * `season_info`           shows season information 1 - 28                                      
* `locations`                                                                                    
  `find_by_name`          finds locations based on value given                                 
* `stats`                                                                                        
  * `show_characters_stats` shows the totals for a character                                     
  * `show_episodes_stats`   shows the totals for an episode                                      
  * `show_locations_stats`  shows the totals for a location                                      
* `lines`                                                                                        
  * `find_by_segment`       find a line by some segment of it (will only return up to 50 matches)
  * `find_by_id`            find a line and all its information by database id number            
  * `random`                see a random line from any time in the show                          
* `help`                    show this menu                                                       
* `exit`                    exit the program  

## Examples

Shows characters listing:
```
characters list
```

Shows a list of N characters listing:
```
characters list 15
```

Search by a partial string into lines:
```
lines find_by_segment springfield
```

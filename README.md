# Duelyst Slack Bot
Ruby based custom integration for Slack that retrieves information about Duelyst cards onto chats.

# Installation & Configuration

##### Clone this repository into a folder on a machine that can be accessed from outside world.

IP/Address of this server will from now on be called *SERVER*

##### Review configuration file: `config.json`

 - `refresh_cards_permissions`
 Section describing Slack's user that will have access to command that refreshes local card database with newest ones available
 
 
 - `application_settings` 
    - `port`
    Port on which webserver will listen
    
    - `card_command_endpoint` 
    Address to which Slack will POST data on command that retrieves cards (eg. /card)
    Full path: SERVER/CARD_COMMAND_ENDPOINT
    Default value: `dsb_card`
    
    - `refresh_cards_command_endpoint`
    Address to which Slack will POST data on command that refreshes card database (eg. /refreshcards)
    Full path: SERVER/REFRESH_CARDS_COMMAND_ENDPOINT
    Default value: `dsb_refresh_cards`
 
##### Configure Slack's custom commands for your team.

Usings Slack's web interface add two custom commands that will communicate with Ruby application.
Command names used below are just an example and can be set to whatever suites your team best.
    
 - `/card`
 Used to retrieve data about a particular card.
 
 **URL**: SERVER/CARD_COMMAND_ENDPOINT
 **Method:** POST
 
 - `/refreshcards`
 Used to refresh/populate local database with info about the cards.
 
 **URL**: SERVER/REFRESH_CARDS_COMMAND_ENDPOINT
 **Method:** POST

##### Start application : `ruby bin/dsb.rb`

From now on the process will be running and webserver will start to work on configured port


# Usage

After all the configuration is done (Ruby process running on the server, Slack's commands set up) whole use comes down to two commands:

 - `/refreshcards`
 Refreshes info about the cards. Has to be run at least once before `/card` can be called.

 - `/card PARTIAL_CARDNAME`
 Displays info about cards that match specified pattern.
 In-depth info is displayed only for searches matching one card, for searches that return up to 9 results simple list is displayed, above that more precise query is required.
 
 
 
 




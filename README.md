# Duelyst Slack Bot
Ruby based integration for Slack's slash commands that retrieves information about Duelyst cards onto chats.

# Prerequisites

 - Ruby 2.0.0+  
 - SQLite 3.7+  
 - Bundler `gem install bundler`  
 - All other dependencies will be installed automatically when following steps described below.

# Installation & Configuration

#### Clone this repository into a folder on a machine that can be accessed from outside world.

IP/Address of this server will from now on be called **SERVER**

#### Review configuration file: `config.json`

 - `refresh_cards_permissions`  
 Section describing Slack's user that will have access to command that refreshes local card database with newest ones available
 
 
 - `application_settings`  
    - `port`  
    Port on which webserver will listen to traffic coming from Slack.
    
    - `card_command_endpoint`  
    Address to which Slack will POST data on command that retrieves cards (eg. /card)  
    **Full path:** SERVER/CARD_COMMAND_ENDPOINT  
    **Default value:** `dsb_card`
    
    - `refresh_cards_command_endpoint`  
    Address to which Slack will POST data on command that refreshes card database (eg. /refreshcards)  
    **Full path:** SERVER/REFRESH_CARDS_COMMAND_ENDPOINT  
    **Default value:** `dsb_refresh_cards`
    
    - `emojis`
    List of emojis to be used instead of normal literals.  
    When a particular field has a value different than empty string it will send that emoji instead of usual literal.  
    **Example:** `"rarity_legendary":":dsb_legendary"`
    
 
#### Configure Slack's slash commands for your team.

Usings Slack's web interface add two slash commands that will communicate with Ruby application.  
Command names used below are just an example and can be set to whatever suites your team best.
    
 - `/card`  
 Used to retrieve data about a particular card.
 
 **URL**: SERVER/CARD_COMMAND_ENDPOINT  
 **Method:** POST
 
 - `/refreshcards`  
 Used to refresh/populate local database with info about the cards.
 
 **URL**: SERVER/REFRESH_CARDS_COMMAND_ENDPOINT  
 **Method:** POST

#### Start application

When in application's main directory:

 - `bundle install`  
 Will install required Ruby gems.
 
 - `ruby bin/dsb.rb`  
 Fires up the application that will start webserver that listens on specified port.


# Usage

After all the configuration is done (Ruby process running on the server, Slack's commands set up) whole use comes down to two commands:

 - `/refreshcards`  
 Refreshes info about the cards. Has to be run at least once before `/card` can be called.

 - `/card PARTIAL_CARDNAME`  
 Displays info about cards that match specified pattern.  
 In-depth info is displayed only for searches matching one card, for searches that return up to 9 results simple list is displayed, above that more precise query is required.
 
**Reminder:** Commmands' names are exemplary and can be set, in Slack's custom command configuration, to whatever suits your needs best.
 
 
 
 




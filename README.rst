Tired of having to set up your IRC networks, channels, nicknames etc again
whenever you switch an IRC client? Introducing:

=========
LurkAgain
=========

LurkAgain aims to make it easy to synchronize IRC client configuration,
including:

* networks and servers

* auto-joined channels

* nicknames and NickServ passwords

The plan is to have a module for each supported IRC client which can
extract the client's configuration into a common model, or edit its
configuration to reflect a model. Then the program can coordinate the
modules to perform operations such as merging and listing of client
configurations.

Current Features
----------------
Currently the development has just begun, and the only things working
now are parsers for ChatZilla's network/server list and preference file,
as well as code to locate ChatZilla's default profile.

Dependencies
------------
.. default-role: title-reference
The project requires `Ruby` and the gems `iniparse`, and `treetop`. To
run the test suite you need to install `rake`, `cucumber`, `rspec`, and
`fakefs`, and run ``rake cucumber``.

Author
------
Yaohan Chen (hagabaka) yaohan.chen@gmail.com

The source code includes a copy of Mauricio Fernandez's
``initialized-class.rb``, since it is not released as a gem.


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

.. default-role: title-reference

Currently the development has just begun, and the only thing working
now is a parser for ChatZilla's network/server configuration file. It
requires `Ruby` and the gems `traits`, `iniparse`, and `treetop`.
To run the test suite you need to install `rake`, `cucumber` and
`rspec`, and run ``rake cucumber``.


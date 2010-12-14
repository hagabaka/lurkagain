Feature: ChatZilla preferences file
  Scenario: Parse a preference file
    Given I have the following text:
      """ 
      # ChatZilla preference file
      /* ...
         ... */
      user_pref("extensions.irc.initialURLs", "irc%3A//net1/channel1; irc%3A//net2/channel2");
      user_pref("extensions.irc.networks.net1.autoperform", "msg%20NickServ%20identify%20foo");
      user_pref("extensions.irc.networks.net1.nicknameList", "nick1; nick2");
      user_pref("extensions.irc.nicknameList", "nick3");
      """

    When I use the "chatzilla/preferences" parser to parse the text

    Then I should get the following data:
      """
      extensions.irc.initialURLs:
      - irc://net1/channel1
      - irc://net2/channel2
      extensions.irc.networks.net1.autoperform:
      - msg NickServ identify foo
      extensions.irc.networks.net1.nicknameList:
      - nick1
      - nick2
      extensions.irc.nicknameList:
      - nick3
      """


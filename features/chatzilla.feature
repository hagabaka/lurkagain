Feature: Handle Chatzilla configuration
  Scenario: Load ChatZilla networks.txt file
    Given the file "~/.chatzilla/profiles.ini" contains:
      """
      [Profile0]
      Name=default
      Path=fake-profile-1
      """

    And the file "~/.chatzilla/fake-profile-1/networks.txt" contains:
      """
      START <Array>
        START 0
          "name" "ninjanet"
          "displayName" "ninjanet"
          START <Array> servers
            START 0
              "hostname" "ninjanet.net"
              "port" 1
            END
            START 1
              "hostname" "ninjanet.com"
              "port" 2
              "isSecure" true
            END
          END
        END
        START 1
          "name" "robotnet"
          "displayName" "robotnet"
          START <Array> servers
            START 0
              "hostname" "robotnet.org"
              "port" 101101
              "isSecure" true
            END
            START 1
              "hostname" "robotnet.com"
              "port" 111001
            END
          END
        END
      END
      """ 
   
    And the file "~/.chatzilla/fake-profile-1/prefs.js" contains:
      """ 
      # ChatZilla preference file
      /* ...
         ... */
      user_pref("extensions.irc.initialURLs", "irc%3A//ninjanet/ninjutsu; irc%3A//robotnet/anti-ninja-sequence");
      user_pref("extensions.irc.networks.ninjanet.autoperform", "msg%20NickServ%20identify%20ninpou");
      user_pref("extensions.irc.networks.network1.nicknameList", "shinobi; ninjia");
      user_pref("extensions.irc.nicknameList", "nick3");
      """

    When I load "Chatzilla"'s configuration

    Then I should get the following network configuration:
      """
      networks:
        - name: ninjanet
          servers:
          - hostname: ninjanet.com
            port: 1
          - hostname: ninjanet.net
            port: 2
          channels:
          - '#ninjutsu'
          nickserv:
            name: NickServ
            password: ninpou 
        - name: robotnet
          servers:
          - hostname: robotnet.org
            port: 101101
          - hostname: robotnet.com
            port: 111001
          channels:
          - "#anti-ninja-sequence"
      """


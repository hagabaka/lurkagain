Feature: ChatZilla network file
  Scenario: Parse a network file
    Given I have the following network file:
      """
      START <Array>
        START 0
          "name" "NetworkOne"
          "displayName" "NetworkOne"
          START <Array> servers
            START 0
              "hostname" "server1"
              "port" 1
            END
            START 1
              "hostname" "server2"
              "port" 2
              "isSecure" true
            END
          END
        END
        START 1
          "name" "NetworkTwo"
          "displayName" "NetworkTwo"
          START <Array> servers
            START 0
              "hostname" "server1"
              "port" 3
              "isSecure" true
            END
            START 1
              "hostname" "server2"
              "port" 4
            END
          END
        END
      END
      """ 

    When I parse the file

    Then I should get the following network data:
      """
      - name: NetworkOne
        displayName: NetworkOne
        servers:
        - hostname: server1
          port: 1
        - hostname: server2
          port: 2
          isSecure: yes
      - name: NetworkTwo
        displayName: NetworkTwo
        servers:
        - hostname: server1
          port: 3
          isSecure: yes
        - hostname: server2
          port: 4
      """


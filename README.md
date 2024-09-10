# DNS Changer Script

Simple POSIX shell script to change the DNS for your active connection using NetworkManager.
You select between some dns servers and the script uses nmcli to apply it to your connection.

## Requirements

- POSIX Shell
- NetworkManager

## Available DNS Servers

- Default (No custom DNS)
- Shecan
- Electro
- Begzar
- 403
- Radar
- Google
- CloudFlare

**Note: This list is more useful for Iranians. You can change it Simply
by modify the `dns_servers_name` and `dns_servers` variables in the script.**

## Notes

- It only modifies the DNS for the currently active connection.
- It will restart the connection to apply the changes.

## Contributing
Waiting for your pull requests :)

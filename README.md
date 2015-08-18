# firewalld

#### Table of Contents

1. [Description](#description)
2. [Setup - The basics of getting started with firewalld](#setup)
    * [What firewalld affects](#what-firewalld-affects)
    * [Setup requirements](#setup-requirements)
    * [Beginning with firewalld](#beginning-with-firewalld)
3. [Usage](#usage)
4. [Reference](#reference)
5. [Limitations](#limitations)
6. [Development](#development)
7. [Contact](#contact)

## Description

The Firewalld module is designed to allow admins to easily setup firewall rules for
Firewalld without having to know all the specific firewall-cmd syntax. This module will
be designed to declare new rules however each individual user would prefer.

Initially version 1.0.0 will support declaring the new firewalld resource types within your
various modules.

## Setup

### What firewalld affects

* Installs Firewalld package
* Manages the following files:
  * /etc/firewalld/firewalld.conf
* Manages the following rule types:
  * Port-based rules
  * Service-based rules
  * WARNING: ONLY SUPPORTS DEFAULT ZONE RIGHT NOW.

## Planned Features:
* Declare which zone to apply rules to.
* Create/Destroy new zones
* Create/Destroy custom Services
* Manage lockdown-whitelist file
* Manage firewall rules by XML file
* Manage Masquerade setting
* Manage Forward Ports
* Manage ICMP Blocks
* Support for additional Rule types:
  * Interface-based rules
  * Rich Rules
  * IPTables-based rules (Firewalld version)
    
    

### Beginning with firewalld

#### IN PROGRESS

## Usage

#### IN PROGRESS

## Reference

#### IN PROGRESS

## Limitations

Support for Fedora to start. Planned support for Enterprise Linux-based Distributions (RHEL, CentOS, Oracle), Ubuntu, Debian, and SuSe.

## Development

Feel free to fork this module at your discrestion. If you'd like to contribute, please create an issue on Github and tie any Pull Requests you create to the associated Pull Request.

## Contact

David Hollinger: [david.hollinger@moduletux.com](mailto:david.hollinger@moduletux.com)



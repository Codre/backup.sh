What is ``backup.sh``?
--------------------

It's a simple script for backup site to cloud storage based on
`OpenStack Swift API` http://docs.openstack.org/trunk/openstack-object-storage/developer/content/.

This script is expansion supload script https://github.com/selectel/supload

Installation
------------

For using the script you need installed utilities ``curl``, ``file`` and ``tar``.
Install for debian/ubuntu::

    $ apt-get install curl file tar

Get installing script::

    $ wget https://raw.githubusercontent.com/Codre/backup.sh/master/install.sh && sh install.sh
    # or
    $ curl -Ok https://raw.githubusercontent.com/Codre/backup.sh/master/install.sh && sh install.sh

Install manually::

    $ mkdir /usr/share/codre-backuper/;
    $ cd /usr/share/codre-backuper/;
    $ wget https://raw.githubusercontent.com/Codre/backup.sh/master/config.sh && chmod +x config.sh;
    $ wget https://raw.githubusercontent.com/Codre/backup.sh/master/backup.sh && chmod +x backup.sh;
    $ wget https://raw.github.com/selectel/supload/master/supload.sh && chmod +x supload.sh;
    $ sh config.sh;
    
Usage
-----

Start backup::

    $ sh /usr/share/codre-backuper/backup.sh;
    
Change configuration file::

    $ sh /usr/share/codre-backuper/config.sh;

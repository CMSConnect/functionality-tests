Note: must run on osgconnect to access user's stash

Directory creation
------------------
  $ mkdir /home/jenkins/stash/posix_cms
  $ echo $?
  0

File creation
--------------
  $ echo "foo" > /home/jenkins/stash/posix_cms/test
  $ echo $?
  0

Copy files from stash
---------------------
  $ cp /home/jenkins/stash/posix_cms/test /dev/null
  $ echo $?
  0

Modify directory permissions
-----------------------------
  $ chmod 755 /home/jenkins/stash/posix_cms
  $ echo $?
  0

Modify file permissions
------------------------
  $ chmod 644 /home/jenkins/stash/posix_cms/test
  $ echo $?
  0

Read file
---------
  $ cat /home/jenkins/stash/posix_cms/test
  foo

List files
-----------
  $ ls /home/jenkins/stash/posix_cms
  test

Clean up
--------
  $ rm /home/jenkins/stash/posix_cms/test
  $ ls /home/jenkins/stash/posix_cms/test
  ls: cannot access /home/* (glob)
  [2]
  $ rmdir ~/stash/posix_cms
  $ ls ~/stash/posix_cms
  ls: cannot access /home/* (glob)
  [2]

Setup proxy
-------------------------------
  $ export X509_USER_PROXY="/home/jenkins/.globus/cms_pilotcert/certs/x509_pilot12_cms.proxy"

Copy some extra utilities to the unit test directory
----------------------------------------------------
  $ cp "${TESTDIR}/utilities/get_resources.py" .
  $ cp "${TESTDIR}/utilities/updateSites.sh" .

Run the unit test
-----------------
  $ ./updateSites.sh
  All Done.

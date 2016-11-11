Pull people list from SiteDB
Setup environment
-------------------------------
  $ export X509_USER_PROXY="/home/jenkins/.globus/cms_pilotcert/certs/x509_pilot12_cms.proxy"

Copy some extra utilities to the u
----------------------------------------------------
  $ cp "${TESTDIR}/utilities/http2client_sitedb.py" .

Run the unit test
-----------------
  $ ./http2client_sitedb.py -o /etc/ciconnect/people.list
  All done.

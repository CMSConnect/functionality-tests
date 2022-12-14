Pull people list from SiteDB
Setup environment
-------------------------------
  $ export X509_USER_PROXY="/tmp/x509up_u24239"

Copy some extra utilities to the u
----------------------------------------------------
  $ cp "${TESTDIR}/utilities/http2client_cric.py" .

Run the unit test
-----------------
  $ ./http2client_cric.py -o /home/khurtado/functionality-tests/people.list
  All Done.

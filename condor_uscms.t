Create a simple job file
Submit it to T2/T3 US Sites
-------------------------------
  $ export X509_USER_PROXY="/home/jenkins/.globus/cms_pilotcert/certs/x509_pilot12_cms.proxy"

  $ echo -e ' universe = vanilla \n output=job.output \n error=job.error \n log=job.log \n executable = /bin/echo \n arguments = hello world' > submit_file

  $ echo -e ' \n +ProjectName="cms-org-nd"' >> submit_file

  $ echo -e ' \n queue' >> submit_file

  $ export CONDOR_CMS_DASHBOARD="False"

Copy some extra utilities to the unit test directory
----------------------------------------------------
  $ cp "${TESTDIR}/run_and_wait.sh" .

Run the unit test
-----------------
  $ ./run_and_wait.sh submit_file
  All jobs done.

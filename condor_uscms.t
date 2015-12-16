Create a simple job file
Submit it to T2/T3 US Sites
-------------------------------
  $ echo -e ' universe = vanilla \n output=job.output \n error=job.error \n log=job.log \n executable = /bin/echo \n arguments = hello world' > submit_file

  $ echo -e ' \n +DESIRED_Sites="T2_US_Caltech,T2_US_Florida,T2_US_MIT,T2_US_Nebraska,T2_US_Purdue,T2_US_UCSD,T2_US_Vanderbilt,T2_US_Wisconsin,T3_US_Baylor,T3_US_Colorado,T3_US_Cornell,T3_US_FIT,T3_US_FIU,T3_US_NotreDame,T3_US_Omaha_Long,T3_US_OSU,T3_US_PuertoRico,T3_US_Rutgers,T3_US_TAMU,T3_US_TTU,T3_US_UCD,T3_US_UCR,T3_US_UCSB,T3_US_UMD,T3_US_UMiss"' >> submit_file

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

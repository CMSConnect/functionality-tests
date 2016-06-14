#! /bin/env python

import ConfigParser
import sys

ConfigFile = '/etc/ciconnect/resources.ini'

# Get CMS Sites from SiteDB
# This requires the user to setup CMSSW and CRAB3 or WMCore
# before being able to use the script

from WMCore.Services.SiteDB.SiteDB import SiteDBJSON
db = SiteDBJSON({'cacheduration': 24})
cmsnames = db.getAllCMSNames()
if len(cmsnames) > 10:
    sitelist = ",".join(cmsnames)
else:
    sys.exit("[Error]: Couldn't get a reasonable list of sites")
# print sitelist

cfg = ConfigParser.RawConfigParser()
cfg.read(ConfigFile)
if cfg.has_section('resources'):
    cfg.set('resources', 'ListOfSites', sitelist)

resfile = open(ConfigFile,'w')
cfg.write(resfile)

print "All Done."

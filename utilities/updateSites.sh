#! /bin/bash

mypath=$(pwd)

#CMSSW configuration
export CMS_VERSION=CMSSW_7_4_7
export SCRAM_ARCH=slc6_amd64_gcc491

#CMSSW Setup
export VO_CMS_SW_DIR=/cvmfs/cms.cern.ch
source $VO_CMS_SW_DIR/cmsset_default.sh

if [ -d cmssw-temp ]; then
    rm -rf cmssw-temp
fi


# Setup release
mkdir cmssw-temp
cd cmssw-temp
scramv1 project CMSSW ${CMS_VERSION} > /dev/null 2>&1
cd ${CMS_VERSION}
eval `scram runtime -sh` > /dev/null 2>&1

# Now, setup CRAB so that we can get WMCore
# To do: Build WMCore so I don't need CRAB?
source /cvmfs/cms.cern.ch/crab3/crab.sh

cd "$mypath"
# Call my resources
# python $mypath/get_resources.py
python ./get_resources.py

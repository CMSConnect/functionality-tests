#! /bin/env python

from argparse import ArgumentParser
import httplib2
import os
import sys
import json

def unflattenJSON(data):
    """Tranform input to unflatten JSON format"""
    columns = data['desc']['columns']
    return [row2dict(columns, row) for row in data['result']]

def row2dict(columns, row):
    """Convert rows to dictionaries with column keys from description"""
    robj = {}
    for k, v in zip(columns, row):
        robj.setdefault(k, v)
    return robj

def request(sitedb_url, query):
    # Make requests to SiteDB only using httplib2

    # First, locate CMS proxy
    if 'X509_USER_CERT' in os.environ:
        cert = os.environ['X509_USER_PROXY']
        key = cert
    elif os.path.exists('/tmp/x509up_u' + str(os.getuid())):
        cert = '/tmp/x509up_u' + str(os.getuid())
        key = cert
    else:
        raise RuntimeError("Could not find a valid proxy certificate, aborting.")

    # Now, start httplib2 requst
    h = httplib2.Http(".cache", disable_ssl_certificate_validation=True)
    # Add certificates
    h.add_certificate(key=key, cert=cert, domain='')

    # SiteDB settings
    method = "GET"
    headers = {}
    headers['Content-Type'] = "application/json"
    # headers['User-Agent'] = "WMCore.Services.Requests/v001"
    headers['Accept'] = 'application/json'
    headers['accept-encoding'] = 'gzip,identity'

    # Make request
    resp, content = h.request('{0}{1}'.format(sitedb_url, query), method=method, headers=headers)
    # print resp
    # print content
    return resp, content

if __name__ == "__main__":
    parser = ArgumentParser(description="""
    Retrieve information from SiteDB and unflatten in a list format
    """
    )
    # Default settings
    sitedb_url = "https://cmsweb.cern.ch/sitedb/data/prod/"
    query = "people"

    # Script Arguments
    parser.add_argument('-o', '--output', type=str, help='Write output file name', required=True)
    parser.add_argument('-s', '--sitedb_url', type=str, default=sitedb_url, help="SiteDB URL. Default:{0}".format(sitedb_url))
    parser.add_argument('-q', '--query', type=str, default=query, help='query type. E.g: people(default), sites, etc')
    args = parser.parse_args()

    # Create file to write
    f = open(args.output, 'w')
    # Make request
    # r,content = request(sitedb_url, query)
    r,content = request(args.sitedb_url, args.query)
    # Load json and unflatten
    json_content = json.loads(content)
    people = unflattenJSON(json_content)

    # Dump to a file
    json.dump(people, f)
    #f.write(str(people))

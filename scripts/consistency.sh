#!/bin/bash
function check_sample_code_orgs() {
    # Sample code URLS should be in the following format:
    # Currently: https://your-org.okta.com
    
    local dir=$(pwd)
    local yourOrgUrls=$(grep -EoR "(http|https)://your-org.okta*" --include="*.md" $dir --exclude-dir={node_modules,scripts,tests,dist,_docs/platform-release-notes} | sort | uniq)
    local yourExampleUrls=$(grep -EoR "(http|https)://example.okta*" --include="*.md" $dir --exclude-dir={node_modules,scripts,tests,dist,_docs/platform-release-notes} | sort | uniq)
    local rainUrls=$(grep -EoR "http://rain.okta1.com:1802*" --include="*.md" $dir --exclude-dir={node_modules,scripts,tests,dist,_docs/platform-release-notes} | sort | uniq)
    
    if [ "$yourOrgUrls" ];
    then
        echo "$yourOrgUrls"
        echo "Files contain old URL reference -> https://your-org.okta{preview}.com"
        return 1
    fi

    if [ "$yourExampleUrls" ];
    then
        echo "$yourExampleUrls"
        echo "Files contain old URL reference -> https://example.okta{preview}.com"
        return 1
    fi

    if [ "$rainUrls" ];
    then
        echo "$rainUrls"
        echo "Files contain old URL reference -> http://rain.okta1.com:1802"
        return 1
    fi
}

if ! check_sample_code_orgs ;
then
    echo "Failed URL consistency check. Please use https://your-domain.okta.com."
    exit 1;
fi
exit 0;

---
layout: docs_page
title: Platform Release Notes
excerpt: Summary of changes to the Okta Platform since Release 2017.11
---

## Release 2017.12

### Advance Notice: API Rate Limit Improvements

We are making org-wide rate limits more granular, and treating authenticated end-user interactions
separately. More granular rate limits will further lessen the likelihood of calls to one URI impacting
another. Treating authenticated end-user interactions separately will lessen the chances of one user's
impacting another. We’re also providing a transition period so you can see what these changes will
look like in your Okta system log before enforcing them:

1. Starting in early April, 2017, we'll provide system log alerts to let you know that you
would have exceeded any of these new API rate limits.
2. Starting in early April, 2017, we’ll treat authenticated end-user interactions on a per-user basis.
Interactions like SSO after login won't apply to your org-wide API rate limits.
3. Early in May, 2017, we will enforce the new, more granular rate limits. At that
point, the warnings in the System Log will change to error notifications.

Of course, as each change is released, we'll announce the change here.

For a full description of the rate limit changes, see [API Rate Limit Improvements](https://support.okta.com/help/articles/Knowledge_Article/API-Rate-Limit-Improvements).<!-- OKTA-110472 -->

<!--
### Feature Improvements
 * xxx
-->
<!-- (OKTA-114417) -->

### Platform Bugs Fixed
 * The `/api/v1/apps` API sometimes incorrectly returned `null` for the `realm` or `groupName`
 attribute for a Template WS-Fed application. (OKTA-117274)
 * PUT to the `/api/v1/idps/{idpId}` API sometimes incorrectly returned an HTTP response code of 500
 rather than 400. (OKTA-117691)
 * The `/api/v1/idps` API improperly allowed social identity providers to be created
 when the admin did not have sufficient permissions. Those providers could not be used. (OKTA-118067)
 * The `/api/v1/apps` API returned an incorrect number of app instances when pagination and permissions
 filtering were both in effect. (OKTA-113411)

### Does Your Org Have This Change Yet?

To verify the current release for an org, click the **Admin** button and check the footer of the Dashboard page.

{% img release_notes/version_footer.png alt:"Release Number in Footer" %}

### Looking for Something Else?

* [Platform Release Note Index](platform-release-notes2016-index.html)
* For changes outside the Okta platform, see the [Release Notes Knowledge Hub](https://support.okta.com/help/articles/Knowledge_Article/Release-Notes-Knowledge-Hub).


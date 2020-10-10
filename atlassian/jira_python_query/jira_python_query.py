#!/usr/bin/env python3

from atlassian import Jira

jira_url = os.environ.get('JIRA_URL')
jira_username = os.environ.get('JIRA_USERNAME')
jira_password = os.environ.get('JIRA_PASSWORD')

jira = Jira(
    url=jira_url,
    username=jira_username,
    # the password is the "basic auth token" available from
    # https://id.atlassian.com/manage-profile/security/api-tokens
    password=jira_password)
JQL = 'assignee = \'{}\' AND resolution = Unresolved ORDER BY updated DESC'.format(jira_username)
data = jira.jql(JQL)
print(data)

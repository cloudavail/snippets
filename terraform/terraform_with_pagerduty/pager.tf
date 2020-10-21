resource "pagerduty_user" "user" {
  name  = "new_user"
  email = "user@email.com"
}

resource "pagerduty_escalation_policy" "tfpolicy" {
  name      = "Engineering Escalation Policy"
  num_loops = 2

  rule {
    escalation_delay_in_minutes = 10

    target {
      type = "user"
      id   = pagerduty_user.user.id
    }
  }
}

resource "pagerduty_service" "tfservice" {
  name                    = "service_name"
  auto_resolve_timeout    = 14400
  acknowledgement_timeout = 600
  escalation_policy       = pagerduty_escalation_policy.tfpolicy.id
  alert_creation          = "create_alerts_and_incidents"
}

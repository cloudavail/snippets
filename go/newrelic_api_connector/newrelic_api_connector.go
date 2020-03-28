package main

import (
	"fmt"
	"os"

	"github.com/newrelic/newrelic-client-go/newrelic"
	"github.com/newrelic/newrelic-client-go/pkg/dashboards"
)

func main() {
	apiKey := os.Getenv("NEW_RELIC_API_KEY")
	nr, _ := newrelic.New(newrelic.ConfigAdminAPIKey(apiKey))

	params := dashboards.ListDashboardsParams{
		Title: "Dashboard Title",
	}

	dashboardListResult, err := nr.Dashboards.ListDashboards(&params)

	if err != nil {
		fmt.Print(err)
	}

	fmt.Print(dashboardListResult)

}

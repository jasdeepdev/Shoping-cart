package main

import (
	"fmt"
	"math/rand"
	"os"
	"os/exec"
	"time"
)

func main() {
	makeCommits(100)
}

func makeCommits(n int) {
	if n == 0 {
		return
	}

	// Seed the random number generator
	rand.Seed(time.Now().UnixNano())

	startDate := time.Date(2017, time.September, 23, 0, 0, 0, 0, time.UTC)
	endDate := time.Date(2018, time.December, 23, 0, 0, 0, 0, time.UTC)
	daysBetween := int(endDate.Sub(startDate).Hours() / 24)

	var date time.Time
	for date.Weekday() == time.Saturday || date.Weekday() == time.Sunday || date.IsZero() {
		// Generate a random number of days within the date range
		randomDays := rand.Intn(daysBetween)
		// Calculate the date
		date = startDate.AddDate(0, 0, randomDays)
	}

	// Format the date as a string
	dateStr := date.Format(time.RFC3339)

	// Here you would create your data.json content
	data := fmt.Sprintf("{\"date\": \"%s\"}\n", dateStr)
	err := os.WriteFile("data.json", []byte(data), 0666)
	if err != nil {
		panic(err)
	}

	// Add and commit using git
	gitAdd := exec.Command("git", "add", "data.json")
	gitCommit := exec.Command("git", "commit", "--date", dateStr, "-m", "commit message")

	err = gitAdd.Run()
	if err != nil {
		panic(err)
	}

	err = gitCommit.Run()
	if err != nil {
		panic(err)
	}

	// Recursive call
	makeCommits(n - 1)
}

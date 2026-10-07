Feature: Apply for a job
  As a candidate
  I want to apply for an open job
  So that recruiters can review my profile

  Scenario: Candidate applies to an open job
    Given a job "Backend Developer" with status "Open"
    And I am a registered candidate
    When I submit an application for that job
    Then the application is saved with status "Applied"

  Scenario: Candidate applies to a closed job
    Given a job "QA Engineer" with status "Closed"
    And I am a registered candidate
    When I try to submit an application
    Then I see the message "This job is no longer accepting applications"
    And no application is saved

  Scenario: Candidate applies to the same job twice
    Given I have already applied to the job "Backend Developer"
    When I try to submit another application for it
    Then I see the message "You have already applied to this job"
    
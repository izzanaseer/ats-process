Feature: Schedule an interview
  As a recruiter
  I want to schedule an interview for a shortlisted candidate
  So that the hiring process moves forward

  Scenario: Recruiter schedules an interview for a shortlisted candidate
    Given an application with status "Shortlisted"
    And an available interviewer
    When I schedule an interview for a future date
    Then the interview is saved
    And the application status becomes "Interview Scheduled"

  Scenario: Recruiter schedules an interview in the past
    Given an application with status "Shortlisted"
    When I schedule an interview for a past date
    Then I see the message "Interview date must be in the future"
    And no interview is saved

  Scenario: Recruiter schedules with an unavailable interviewer
    Given an interviewer already booked at "10:00 AM" on a given date
    When I schedule another interview for the same interviewer at "10:00 AM"
    Then I see the message "Interviewer is not available at this time"
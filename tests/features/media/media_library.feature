@api @lightning @media
Feature: Media library CKEditor widget

  @javascript
  Scenario: Opening the media library
    Given I am logged in as a user with the "administrator" role
    When I go to "node/add/page"
    And wait 1 second
    And I execute the "media_library" command in CKEditor "edit-body-0-value"
    Then I should see "Media Library"
    And ".media-library .library ul.collection-view" should have 3 "li" child elements

  @javascript
  Scenario: Filtering the media library by media type
    Given I am logged in as a user with the "administrator" role
    When I go to "/node/add/page"
    And wait 1 second
    And I execute the "media_library" command in CKEditor "edit-body-0-value"
    And I select "image" from ".media-library .library header select"
    And wait 3 seconds
    Then I should see "There are no items to display."

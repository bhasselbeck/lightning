@media @api @javascript
Feature: Media browser

  Scenario: Uploading an image from within the media browser
    Given I am logged in as a user with the media_manager role
    When I visit "/entity-browser/iframe/media_browser"
    And I upload "puppy.jpg"
    And I enter "Foobazzz" for "Media name"
    And I press "Place"
    And I visit "/admin/content/media"
    Then I should see "Foobazzz"
    And I queue the latest media entity for deletion

  Scenario: Uploading a document from within the media browser
    Given I am logged in as a user with the media_manager role
    When I visit "/entity-browser/iframe/media_browser"
    And I upload "internet.pdf"
    And I enter "A rant about the Internet" for "Media name"
    And I press "Place"
    And I visit "/admin/content/media"
    Then I should see "A rant about the Internet"
    And I queue the latest media entity for deletion

  Scenario: Creating a YouTube video from within the media browser
    Given I am logged in as a user with the media_manager role
    When I visit "/entity-browser/iframe/media_browser"
    And I enter embed code "https://www.youtube.com/watch?v=zQ1_IbFFbzA"
    And I enter "The Pill Scene" for "Media name"
    And I press "Place"
    And I visit "/admin/content/media"
    Then I should see "The Pill Scene"
    And I queue the latest media entity for deletion

  Scenario: Creating a Vimeo video from within the media browser
    Given I am logged in as a user with the media_manager role
    When I visit "/entity-browser/iframe/media_browser"
    And I enter embed code "https://vimeo.com/14782834"
    And I enter "Cache Rules Everything Around Me" for "Media name"
    And I press "Place"
    And I visit "/admin/content/media"
    Then I should see "Cache Rules Everything Around Me"
    And I queue the latest media entity for deletion

  Scenario: Creating a tweet from within the media browser
    Given I am logged in as a user with the media_manager role
    When I visit "/entity-browser/iframe/media_browser"
    And I enter embed code "https://twitter.com/AprilTrubody/status/707226928730742784"
    And I enter "chx speaks" for "Media name"
    And I press "Place"
    And I visit "/admin/content/media"
    Then I should see "chx speaks"
    And I queue the latest media entity for deletion

  Scenario: Creating an Instagram post from within the media browser
    Given I am logged in as a user with the media_manager role
    When I visit "/entity-browser/iframe/media_browser"
    And I enter embed code "https://www.instagram.com/p/jAH6MNINJG"
    And I enter "Drupal Does LSD" for "Media name"
    And I press "Place"
    And I visit "/admin/content/media"
    Then I should see "Drupal Does LSD"
    And I queue the latest media entity for deletion

  Scenario: Uploading an image through the image browser
    Given I am logged in as a user with the administrator role
    And I visit "/admin/structure/types/manage/page/fields"
    And I click "Add field"
    And I select "Image" from "new_storage_type"
    And I enter "Hero Image" for "Label"
    And I wait 1 seconds
    And I press "Save and continue"
    And I press "Save field settings"
    And I press "Save settings"
    When I am logged in as a user with the page_creator role
    And I visit "/node/add/page"
    And I press "Select Image(s)"
    And I wait for AJAX to finish
    And I switch to the "entity_browser_iframe_image-browser" frame
    And I wait 10 seconds
    And I click "Upload"
    And I attach the file "puppy.jpg" to "File"
    And I wait for AJAX to finish
    And I enter "Lookit the cutie pie!" for "Media name"
    And I switch to the window
    And I submit the entity browser
    And I wait 10 seconds
    And I wait for AJAX to finish
    Then I should not see a "table[drupal-data-selector='edit-image-current'] td.empty" element
    And I am logged in as a user with the administrator role
    And I visit "admin/structure/types/manage/page/fields/node.page.field_hero_image/delete"
    And I press "Delete"
    And I queue the latest media entity for deletion

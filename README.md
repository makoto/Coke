
# Coke

## Summary

A web application that displays messages that are all about “Coke”

## How to run the app

Run the following commands from your terminal

    git clone REPO_URL
    cd coke
    bundle
    rake db:migrate
    rails s

Go to http://localhost:3000

## How to run your tests

Run the following commands from your terminal

    rake db:test:prepare
    rspec

## How to retrieve the data that the app stores

  Get json data from http://localhost:3000/tweets.json

## Completed features

- DONE: Create / page
- DONE: Create "Fetch more messages"
- DONE: Fetch message (user’s handle, the message text and the sentiment.)
- DONE: Highlight ‘coke’, ‘coca-cola’ and ‘diet cola’.
- DONE: Sorted by sentiment, in descending order
- DONE: Count the number of duplicates
- DONE Handle errors (RestClient::InternalServerError)
- DONE: When page is refreshed, display stored tweets.
- DONE: Write README of how to use, and how to setup.
- DONE: Instead of displaying the sentiment number, display the sentiment as a happy, sad or neutral face using these images:
- When a user clicks on a user handle, another view is displayed, which shows all of the messages from that particular user.

NOTE: There are a few pending specs for testing edge case on highlighting coke related tweets.

## Some considerations

- Was not sure whether I should be filtering out non matching tweets, so did not filter them
- Did not use any JS at all as they were not necessary.
- This page automatically fetches the latest tweets on page load which were not so clearly stated on the spec.
- I thought it would make sense to show time, but did not add because it was not in the spec (I asked questions via email but have not received reply)



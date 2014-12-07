
# Coke

## Summary

A web application that displays messages that are all about “Coke”

## How to run the app

  git clone REPO_URL
  cd coke
  bundle
  rake db:migrate
  rails s
  Go to http://localhost:3000

## How to run your tests

  rake db:test:prepare
  rspec

## How to retrieve the data that the app stores

  Get json data from http://localhost:3000/tweets.json

## TODO

- DONE: Create / page
- DONE: Create "Fetch more messages"
- DONE: Fetch message (user’s handle, the message text and the sentiment.)
- DONE: Highlight ‘coke’, ‘coca-cola’ and ‘diet cola’.
- DONE: Sorted by sentiment, in descending order
- DONE: Count the number of duplicates
- DONE Handle errors (RestClient::InternalServerError)
- DONE: When page is refreshed, display stored tweets.
- DONE: Write README of how to use, and how to setup.
- When a user clicks on a user handle, another view is displayed, which shows all of the messages from that particular user.
- DONE: Instead of displaying the sentiment number, display the sentiment as a happy, sad or neutral face using these images:

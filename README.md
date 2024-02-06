# Turbo-vote-rails
A Rails 7 app to take votes, and show results

# Running locally
In Terminal:
```bash
git clone git@github.com:theSteveMitchell/Turbo-vote-rails.git
cd tubrbo-vote-rails
brew bundle
bundle install
bundle exec rails db:create db:migrate
bundle exec rails s

```

In a browser, navigate to localhost:3000

# Usage
the root of the app shows a dashboard, tallying all votes.
using the "vote" button in the navigation, you can vote for an existing candidate, 
or "write-in" a new candidate.


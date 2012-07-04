# Nezumi Push

**Nezumi Push is currently in private beta and will soon be available as a Heroku add-on**

Nezumi Push allows you to send iOS push notifications from your Heroku app to members on your development team who use Nezumi.

## Installation

Add this line to your application's Gemfile:

    gem 'nezumi', git: "https://github.com/mwhuss/nezumi-gem.git"

## Usage

    Nezumi::Push.notify "New User Signup!"
    
This will send a push notification to all users on your team who have push notifications enabled for your App

## Contributing

1. Fork it
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Added some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create new Pull Request

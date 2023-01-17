- Update version in seatsio.podspec
- Update version in README.md
- Create release on github

If the CocoaPods trunk access token is not valid anymore (i.e. deployment fails), you'll need to refresh it:
1. `pod trunk register dev@seats.io`
2. click on the link in the email
3. `cat ~/.netrc`
4. copy the password for the cocoapods
5. paste it into the COCOAPODS_TRUNK_TOKEN secret in GitHub (https://github.com/seatsio/seatsio-ios/settings/secrets/actions)
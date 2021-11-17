# tex compiler using GitHub actions

Still working this out, but my understanding is that in .github/workflows there is a `.yml` file, which I got from marketplace/actions, and these can do all sorts of things, including "jobs" when a certain condition is met.

As of right now, any push to this repo (ie any edits, commits, or any other related words I might not know about) will run this action, taking about a minute to create a new "release" which can be found at ./releases

Here you can download the compiled pdf as well as the source code; will be interesting to see how that changes when the latex gets more pro. Also, so far I have received an email each time (great etc but could get spammy).

Ideally would like to deploy the compiled pdf straight into the repo to make it easy to see, without bothering with all this stuff about adding releases.

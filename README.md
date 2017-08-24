# team-todos

This is (will be) a todo app featuring:
+ various todo lists with multiple possible users who can edit todos
+ view recently completed todos on the list
+ an archive of all completed todos on each list
+ CI with travis
+ websockets for alterations to todos so that the changes are live for all users viewing the list
+ time management (time estimates on each todo, and a "start", "stop", and "pause" to track how long the task took)
+ hosted on heroku
+ a better name


### This is the whiteboard plan of the features of the app
![Whiteboard plan](https://user-images.githubusercontent.com/22300773/29609471-3bdeb9d0-87ef-11e7-8c37-c8f489e81296.jpg)


### environment variables

You will need to create a config.env file in the root of the project, inside you will need to put:

```
export GITHUB_SECRET=<your secret key here>
export GITHUB_CLIENT_ID=<your client id here>
```

then before you run the code for the first time run `source config.env` in your terminal, and you'll be good to go!

You'll need to generate your own client_id and client_secret on github.

==================
To start your Phoenix server:

  * Install dependencies with `mix deps.get`
  * Create and migrate your database with `mix ecto.create && mix ecto.migrate`
  * Install Node.js dependencies with `cd assets && npm install`
  * Start Phoenix endpoint with `mix phx.server`

Now you can visit [`localhost:4000`](http://localhost:4000) from your browser.

Ready to run in production? Please [check our deployment guides](http://www.phoenixframework.org/docs/deployment).

## Learn more

  * Official website: http://www.phoenixframework.org/
  * Guides: http://phoenixframework.org/docs/overview
  * Docs: https://hexdocs.pm/phoenix
  * Mailing list: http://groups.google.com/group/phoenix-talk
  * Source: https://github.com/phoenixframework/phoenix

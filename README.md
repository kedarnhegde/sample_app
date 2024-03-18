# Welcome to the Tweeter App.

This is a dev-env only application and need to have basic requirements.

- ruby@2.7.4
- rails@5.1.6

## The features in this app are:

- Create a new user.
- Login with that given user.
- Delete a user. 
  - only admin can delete the users (non-admin users only).
- Update personal details (name, email, password).
-  The following are the validations:
  -  Name: Must exist. Max characters - 50.
  -  email: Must exist. Max characters - 255. Should be of a valid pattern.
  -  password: Must exist. Password and password confirmation must match. Min characters - 8. (can be blank when editing details but not while creating a new user).
- Save a session.
  - If you check "Remember Me", even if browser is closed, next time you open, you'll be logged in automatically.
- Account activation.
  - When a new account is created, a mail is sent to the given mail ID and account needs to be activated inorder to login.
  - Since it's a dev-env only app, no real mails are sent. Hence please edit in databse or create a user through seeds. (refer user model to know more).
- Forgot Password
  - When clicked on forgot password, you can enter your mail ID and a mail will be sent to recover the password.
  - Again, since it's a dev-env only app, no real mails are sent. Hence please edit in databse or create a user through seeds. (refer user model to know more).
- Microposts
  - Tweets are named as microposts.
- Following / Followers
  - Users can follow other users and get followed by them as well.
  - You will be seeing the microposts off all the users you follow in your home page (Feed). 
-  i18n
  - App is available in English and Japanese.
  - Language is taken from the locale of the user.
  - Default locale is English.



# How to run this app locally

Run the following commands to set up the environment: 

```
% bundle install
% rails db:migrate:reset
```
I already have some dummy data for the DB. Run the following command to have the seeds.

```
% rails db:seed
```

The setup is now ready. Run the following command to start the server:

```
% rails s
```

You can either create a new user or log-in through an existing user (refer seeds).

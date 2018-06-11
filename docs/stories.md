## User stories and broad tasks

```
AS A Developer
I WANT the platform setup
SO THAT I can do my job
```
* Install rails/db
* Install RSpec + Factory Bot + Shouda(?)

```
AS A Development manager
I WANT a linter added to the platform
SO THAT my developers are less likely to publish rubbish on the interwebs
```
* Install rubocop

```
AS A Person
I WANT to sign-up to the platform
SO THAT I can be part of the community
```
* Devise setup
* Fields - username, email, password
* Has n pictures
* Has n likes

```
AS A User
I WANT to add pictures to Instagram
SO THAT I can share them with my friends
```
* Restful model for post
* Fields - img, description, timestamp
* Has n comments
* Has n likes

```
AS A USER
I WANT to like a picture
SO THAT I can show my appreciation
```
* Simple model for likes
* belongs to user
* belongs to post

```
AS A USER
I WANT to add comments to a picture
SO THAT I can tell the author what I think
```
* Restful model for comments
* Fields - text, timestamp
* belongs to post

```
AS A USER
I WANT the platform to be well designed
SO THAT I’ll come back
```
* Do semantic ui again?
* Views - homepage, login, sign-up, feed, post, header

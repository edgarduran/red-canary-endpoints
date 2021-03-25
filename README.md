# README

This project is the Red Canary engineering HW assignment.

* Ruby (2.6.1)
* Rails (6.1.3)

## Description

I originally created a whole rails project, after which I realized was not necessary. I could have probably just done this with a few PORO ruby files, but here we are.
It's been a bit since I worked on a rails project in a meaningful way. There was a lot of brain refreshing I had to do, a lot of stack overflow, and lots of 'oh, yeah' moments.
Since it is a rails project the command input portion will have to be run from the rails console. The logs are also kept within the project using rails Logger. For the network connection I used the Faraday gem. It's sort of pseudo-coded and commented out so I could stub a connection. You can take a look at it and get the gist.
I also spent way too much time trying to integration test the processes, but I ran into many issues. Issues testing Faraday, issues with Logger, and finally issues with the test suite finding Rails.root where the logs are.
I decided since this has been delayed enough, it would have to do without tests.
If I had more time I would hope to improve this by adding tests, and refactoring a bit, I would also add error handling as well ass expanding the logging capabilities. 

## Actions

From rails console:

Initialize class (ex: `f = FileActions.new`)

| Action | Command | Params | Example |
|--------|:--------|:-------|:--------|
|Create file|create_file()|file path and name of new file|`f.create_file('User/Documents/my-file.txt')`|
|Rename file|rename_file()|path to existing file, new name|`f.rename_file('my-file.txt', 'your-file.txt')`|
|Delete file|delete_file()|file path|`f.delete_file('our-file.txt')`|
|Modify file|modify_file()|file path, content to append|`f.modify_file('our-file.txt', 'this could be our file, but you're too selfish)`|

## Notes
* The important file are in `models/` and `services/`.
* Logs will be created in the `log/my.log` file.
* Sorry for the delay

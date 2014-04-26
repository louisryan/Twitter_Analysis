Twitter-Scraper
==============
A python script to scrape mentions and tweets from Twitter to store in a MySQL database. This script is set up to run on an Amazon EC2 instance, fetching the most recent tweets on a 15 minute interval(adjustable) and storing them in a relational database.


Setup and Installation
----------------------

i). Install Python 2.7 on the computer you use. This should also work in version 3.3 but extensive testing has not being performed. Follow http://ipython.org/install.html instruction guide to install. 

2. Install the dependancies:
```
	pip install mysql-connector-python requests requests-oauthlib
```

3. Using MySQL, create an empty database and run config/schema.sql

4. Add your OAuth credentials to the oauth table. You obtain OAuth credentials by setting up and Application at Twitter's Developer site(https://dev.twitter.com/).

```
INSERT INTO oauth (oauth_id, name, consumer_key, consumer_secret, access_token, access_token_secret) VALUES (1, 'a name you can remember', 'consumer_key', 'consumer_secret', 'access_token', 'access_token_secret');
```

5. To start monitoring mentions or hashtags, insert job row into job table:
	* job_id: an INT you can choose
	* head: an INT, you'll use this to identify the head
	* since_id_str: can be blank for new jobs
	* query: the "q=params" part of a Twitter Search Query (see https://dev.twitter.com/docs/using-search)
	* description: a note to yourself about what this job does. i.e. "Scraping mentions of Boyle Sports"
	* last_count: NULL for new jobs
	* last_run: NULL for new jobs
	* analysis_state: 0 for new jobs
	* oauth_id: set to match the ID of the oauth credentials you just added 

```
INSERT INTO job (job_id, state, zombie_head, since_id_str, query, description, last_count, last_run, analysis_state, oauth_id) VALUES (3, 1, 2, X'30', 
'apple', 'Apple Mentions', NULL, NULL, 0, 1);
```

6. In Twitter_Scrape.py, set database config options in method connect(). 

Usage
------
```
usage: Twitter_Scrape.py [-head]

positional arguments:
  head - Specify the head associated in job table
```

Scheduling Execution
------

Twitter's API returns a window of results when the program executes. To continually have the most recent content, the python script must be scheduled. Unix crons jobs can be created to execute the Twitter_Scrape script at 15 minute intervals. There are checks in place to ensure there are no duplicates result sets returned from Twitters API. 

```
*/15 * * * * /usr/local/bin/python2.7 /louisryan/Twitter/Twitter_Scrape.py 1 
```
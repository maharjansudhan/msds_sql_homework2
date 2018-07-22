# By Sudhan Maharjan

# In this assignment, we’ll practice working with one-to-many relationships in SQL. Suppose you are tasked with keeping
# track of a database that contain the best “how-to” videos on MySQL.
# You may want to first create a new database (schema) for this assignment


/*
1. Videos table. Create one table to keep track of the videos. This table should include a unique ID, the title of the
video, the length in minutes, and the URL. Populate the table with at least three related videos from YouTube or
other publicly available resources.
*/

DROP TABLE IF EXISTS tblVideos;

# create the table
CREATE TABLE tblVideos
(
	video_id int NOT NULL,
    title varchar(50) NOT NULL,
    length float NOT NULL,
    url varchar(80) NOT NULL,
    PRIMARY KEY (video_id)
);

INSERT INTO tblVideos (video_id, title, length, url) VALUES (1, 'Introducing New York City', 2.43, 'https://www.youtube.com/watch?v=AUuHyXguUsg');
INSERT INTO tblVideos (video_id, title, length, url) VALUES (2, 'New York: Americas MEGACITY', 13.32, 'https://www.youtube.com/watch?v=dzjQ-akB3BI');
INSERT INTO tblVideos (video_id, title, length, url) VALUES (3, 'New York City Travel Guide', 17.21, 'https://www.youtube.com/watch?v=JtfZPgWxlMI');
INSERT INTO tblVideos (video_id, title, length, url) VALUES (4, 'Visit New York City Guide', 41.51, 'https://www.youtube.com/watch?v=h3lBFKjnEV8');
INSERT INTO tblVideos (video_id, title, length, url) VALUES (5, 'New York City Skyline in 4K (Ultra HD)', 8.10, 'https://www.youtube.com/watch?v=yKk3WDSFOos');


select * from tblVideos;


/*
2. Create and populate Reviewers table. Create a second table that provides at least two user reviews for each of
at least two of the videos. These should be imaginary reviews that include columns for the user’s name
(“Asher”, “Cyd”, etc.), the rating (which could be NULL, or a number between 0 and 5), and a short text review
(“Loved it!”). There should be a column that links back to the ID column in the table of videos.
*/

DROP TABLE IF EXISTS tblReviews;

# create the table
CREATE TABLE tblReviews
(
	review_id int NOT NULL,
    video_id int NOT NULL REFERENCES tblVideos,
    username varchar(25),
    rating int,
    review varchar(100)
);

show create table tblReviews;
ALTER TABLE tblReviews CONVERT TO CHARACTER SET utf8;
# this alter option fixes the issue of lengthy characterset.

INSERT INTO tblReviews (review_id, video_id, username, rating, review) VALUES (1, 1, 'Gislaine Bonilha', 1, 'What song is that in the background (first 40 seconds)?﻿');
INSERT INTO tblReviews (review_id, video_id, username, rating, review) VALUES (2, 1, 'Rooh A', 5, 'Wow thanks! Appreciate my hometown more:)');
INSERT INTO tblReviews (review_id, video_id, username, rating, review) VALUES (2, 2, 'George White', 5, 'You should make a video about the history (rise and fall) of Detroit﻿');
INSERT INTO tblReviews (review_id, video_id, username, rating, review) VALUES (3, 3, 'GFUNK PRO', 4, 'This show is so underrated﻿');
INSERT INTO tblReviews (review_id, video_id, username, rating, review) VALUES (2, 5, 'daintellekt', 4, 'Brilliant work ! Clear blue sky, sharp focus, great visuals !﻿');


select * from tblReviews;


/*
3. Report on Video Reviews. Write a JOIN statement that shows information from both tables.
*/

SELECT tblVideos.video_id as 'Video_ID', tblVideos.title As 'Title', tblVideos.length AS 'Length', tblVideos.url AS 'URL',
tblReviews.username As 'Username', tblReviews.rating As 'Rating', tblReviews.review AS 'Review'
FROM tblVideos JOIN tblReviews 
ON tblVideos.video_id = tblReviews.video_id;




DELETE FROM User;
DELETE FROM Channel;
DELETE FROM StoryEntity;
DELETE FROM CommentEntity;
DELETE FROM Save;
DELETE FROM Vote;
DELETE FROM Subscribe;

/**
 * USER
 * ID USERNAMES  PASSWORDS
 * 0  admin      admin
 * 1  Emanuel    123456
 * 2  David      qwerty
 * 3  Tiago      password
 * 4  Sofia      12121212
 * 5  Bruno      bruno
 * 6  Amadeu     amadeu
 * 7  Nuno       nuno
 */
INSERT INTO User(userid, username, email, hash, admin, imageid) VALUES
    (0, 'admin', 'admin@feupnews.com', '$2y$10$p2It7atX5xmjgOCj1ueLLOO9ImNkg5jC/O84yu9yU/578RekCoY62', 1, DEFAULT),
    (1, 'Emanuel', 'emanuel@gmail.com', '$2y$10$xCpKMa8XygdBr3VOxsIOhOyl9HLzw8WgmxCdAs4rhEsjcQsMW87hO', 0, 3),
    (2, 'David', 'david.andrade@gmail.com', '$2y$10$xesrOHbPqklXV1I7FNfERuA37Indy1PJBIrxqqZ7tY7/qIJOxb5Ge', 0, 2),
    (3, 'Tiago', 'tiago@live.com.pt', '$2y$10$raS40nxOFgUViuNF61HRMOn6bDrJIobJM7TXsWyp0RXNuTtdEOTS.', 0, 1),
    (4, 'Sofia', 'sofia@hotmail.com', '$2y$10$ysl//9wSz70ld77ke0l2lOUd9H3lxzOH.ogY6gezjGl9y1xCK4pxO', 0, DEFAULT),
    (5, 'Bruno', 'bruno@gmail.com', '$2y$10$iDV2CXM5NbVVGphWIqQ73.Shl.xBrtO.QS2laFNPy7ojSMBKFfeUa', 0, DEFAULT),
    (6, 'Amadeu', 'amadeu@gmail.com', '$2y$10$CAEOQq547goKiJN3KzwSjus1kbdcchrGtSSW2g5v.zkll88Xbquse', 0, 4),
    (7, 'Nuno', 'nuno.lopes@gmail.com', '$2y$10$gPB0nQ76r4AzqKupnVGf3edvlgHBqB2EkAQQ5SrQ23yDl9D5CnaA6', 0, DEFAULT);

/**
 * CHANNEL
 * ID NAME            CREATOR
 * 1  showerthoughts  Amadeu
 * 2  philosophy      Sofia
 * 3  jokes           Nuno
 * 4  askscience      Emanuel
 */
INSERT INTO Channel(channelid, channelname, creatorid, imageid) VALUES
    (1, 'showerthoughts', 6, 5),
    (2, 'philosophy', 4, 6),
    (3, 'jokes', 7),
    (4, 'askscience', 1);

/**
 * STORY
 */
INSERT INTO StoryEntity(channelid, authorid, storyTitle, storyType, content) VALUES
    (1, 6, 'The number 5 feels like the most even odd number', 'title', ''),

    (2, 1, 'Suicide', 'text', 'What are your personal beliefs on suicide as it relates to stoicism?'),

    (3, 2, 'Epileptic Santa!', 'text', '"He seizures when you''re sleeping."'),
    (3, 4, 'I thought getting a vasectomy would keep my wife from getting pregnant....', 'text', 'but apparently it just changes the color of the baby.'),

    (4, 4, 'Could a really long straw going into space drain the oceans?', 'text', 'My friend is convinced that if you put one end of a straw in the ocean, and the other into the vacuum of space, that it would drain the ocean. He thinks capillary action, space being a vacuum, and siphoning, would be able to drain the ocean into space. Am I wrong saying this wouldn''t work, at least in any reasonable time frame (Quadrillions of years)?'),
    (4, 6, 'Can donated organs be re-donated?', 'text', 'Once the person receiving the transplant passes, can those same organs be donated again if that person signs up as an organ donor?');

/**
 * COMMENT
 */
INSERT INTO CommentEntity(parentid, authorid, content) VALUES
    ((SELECT entityid FROM StoryEntity WHERE channelid = 1 AND authorid = 6),
        5, '7 feels like the most odd odd number'),
    ((SELECT entityid FROM StoryEntity WHERE channelid = 2 AND authorid = 1),
        5, '"As I was jumping off, I suddenly realized all of my problems were fixable, except the one of just jumping."'),
    ((SELECT entityid FROM StoryEntity WHERE channelid = 3 AND authorid = 2),
        5, '"He foams when you are wak"'),
    ((SELECT entityid FROM StoryEntity WHERE channelid = 3 AND authorid = 2),
        4, '"Santa Claus is swallowing his tongu"'),
    ((SELECT entityid FROM StoryEntity WHERE channelid = 4 AND authorid = 6),
        2, 'Organs have a "shelf life" so to speak. The original organs from someone whose 40 planted into a 20 year old, means that they stay at "40 years of age" in terms of dna degradation, wear etc. The organ might have to undergo processes its not used too and this can cause premature failure. (a 40 year old non alcoholics liver would function better than one that one thats riddled with cirrhosis.');

INSERT INTO CommentEntity(parentid, authorid, content) VALUES
    ((SELECT entityid FROM CommentEntity WHERE content = '7 feels like the most odd odd number'),
        1, 'I say 13'),
    ((SELECT entityid FROM CommentEntity WHERE content = '7 feels like the most odd odd number'),
        6, 'Somehow, it''s 1 for me'),
    ((SELECT entityid FROM CommentEntity WHERE content LIKE '%As I was jumping off%'),
        1, 'Aaaaah the good old myth of jumpers regret, made up to discourage people from doing it.'),
    ((SELECT entityid FROM CommentEntity WHERE content LIKE '%when you are wak%'),
        3, '"He hates all blinking light effects so be still for stillness sake"');

INSERT INTO CommentEntity(parentid, authorid, content) VALUES
    ((SELECT entityid FROM CommentEntity WHERE content = 'I say 13'),
        2, 'I say 11'),
    ((SELECT entityid FROM CommentEntity WHERE content LIKE 'Aaaaa%'),
        3, 'Research doesn''t agree with your opinion.'),
    ((SELECT entityid FROM CommentEntity WHERE content LIKE '%He hates all blinking%'),
        3, 'Someone please call a docter');

/**
 * SAVE
 */
INSERT INTO Save(entityid, userid) VALUES
    ((SELECT entityid FROM StoryEntity WHERE channelid = 3 AND authorid = 2), 1),
    ((SELECT entityid FROM StoryEntity WHERE channelid = 3 AND authorid = 2), 4),
    ((SELECT entityid FROM StoryEntity WHERE channelid = 3 AND authorid = 2), 5),
    ((SELECT entityid FROM StoryEntity WHERE channelid = 1 AND authorid = 6), 1),
    ((SELECT entityid FROM StoryEntity WHERE channelid = 1 AND authorid = 6), 2);

/**
 * VOTE
 */
INSERT INTO Vote(entityid, userid, vote) VALUES
    ((SELECT entityid FROM StoryEntity WHERE channelid = 3 AND authorid = 2), 1, '+'),
    ((SELECT entityid FROM StoryEntity WHERE channelid = 3 AND authorid = 2), 5, '+'),
    ((SELECT entityid FROM StoryEntity WHERE channelid = 3 AND authorid = 2), 6, '-'),

    ((SELECT entityid FROM StoryEntity WHERE channelid = 1 AND authorid = 6), 1, '+'),
    ((SELECT entityid FROM StoryEntity WHERE channelid = 1 AND authorid = 6), 2, '-'),

    ((SELECT entityid FROM StoryEntity WHERE channelid = 2 AND authorid = 1), 5, '-'),
    ((SELECT entityid FROM StoryEntity WHERE channelid = 2 AND authorid = 1), 3, '-'),
    ((SELECT entityid FROM StoryEntity WHERE channelid = 2 AND authorid = 1), 4, '+');

/**
 * SUBSCRIBE
 */
INSERT INTO Subscribe(channelid, userid) VALUES
    (1, 1), (1, 2), (1, 5), (1, 6), (1, 7),
    (2, 1), (2, 3), (2, 4), (2, 5),
    (3, 5), (3, 6),
    (4, 1), (4, 2), (4, 3), (4, 4), (4, 6);

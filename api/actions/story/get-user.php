<?php
$action = 'get-user';

$auth = Auth::demandLevel('free');

$authorid = (int)$args['authorid'];

if (!User::read($authorid)) {
    HTTPResponse::adjacentNotFound("User with id $authorid");
}

$stories = Story::getUser($authorid);

HTTPResponse::ok("Stories of user $authorid", $stories);
?>
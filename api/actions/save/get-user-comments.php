<?php
$userid = $auth['userid'];

if (!User::read($userid)) {
    HTTPRequest::notFound("User with id $userid");
}

$auth = Auth::demandLevel('authid', $userid);

$comments = Save::getUserComments($userid);

HTTPResponse::ok("All comment saves of user $userid", $comments);
?>

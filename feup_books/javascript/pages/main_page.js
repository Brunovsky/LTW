let main_page_posts = document.querySelector('#main_page_posts');

getContent(document.querySelector("#dropdown_selection").getAttribute("selectionid"));

function getContent(sort) {
    api.story.get("all&order="+sort, [200])
    .then(response => response.json())
    .then(json => getStories(json.data));
}

function getStories(data) {
    for(let story in data) {

        let a1 =
        `<article class="post_preview">
            <header>Posted by ${data[story].authorname} ${timeDifference(data[story].createdat)}</header>
            <a href="post.php?id=${data[story].entityid}">
            <h1>${data[story].storyTitle}</h1>`;
        
        let a2 = "";
        switch(data[story].storyType) {
            case "image":
                a2 = `<src src="${data[story].content}" alt="post image">`;
                break;
            case "text":
                a2 = `<p>${data[story].content}</p>`;
                break;
            default:
                break;
        }
    
        let a3 = `</a>
            <footer>
                <button class="post_button" onclick="upvote()"><i class='fas fa-arrow-up'></i> ${data[story].upvotes} Upvotes</button>
                <button class="post_button" onclick="downvote()"><i class='fas fa-arrow-down'></i> ${data[story].downvotes} Downvotes</button>
                <button class="post_button" onclick="comments()"><i class="fa fa-comment"></i> ${data[story].count} Comments</button>
                <button class="post_button" onclick="save()"><i class="fa fa-bookmark"></i> Save</button>
                <button class="post_button" onclick="share()"><i class="fa fa-share-alt"></i> Share</button>
            </footer>
        </article>`;

        main_page_posts.innerHTML += a1 + a2 + a3;   
    }
}

document.querySelectorAll("#dropdown_options > *").forEach(element => {
    element.addEventListener('click', () => {
        main_page_posts.innerHTML = "";
        getContent(element.getAttribute("id"));
    });
})

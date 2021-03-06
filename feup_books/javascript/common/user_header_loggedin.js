let user_dropdown = document.querySelector("#user-dropdown");

const picturefile = auth.picturefile || defaultPicture(auth.userid);
const picturesrc = api.imagelink('thumbnail', picturefile);
document.querySelector("#client_image").setAttribute('src', picturesrc);

document.querySelector("#profile_button").addEventListener('click', () => {
    if(user_dropdown.style.display == "block") {
        user_dropdown.style.display = "none";
    }
    else {
        user_dropdown.style.display = "block";
}
})

document.querySelector(".createpost_user_dropdown").addEventListener("click", function(){
    window.location.replace("create_post.php");
});

document.querySelector(".createchannel_user_dropdown").addEventListener("click", function(){
    window.location.replace("create_channel.php");
});

document.querySelector(".viewprofile_user_dropdown").addEventListener("click", function(){
    window.location.replace("profile.php?id=" + auth.userid);
});

document.querySelector(".logout_user_dropdown").addEventListener("click", function(){
    api.logout().then(function(response) {
        window.location.reload(true);
    });
});

window.onclick = function(event) {
    if (!event.target.matches('#profile_button') && !event.target.matches('#client_image') && !event.target.matches('#client_name')) {
        user_dropdown.style.display = "none";
    }
}
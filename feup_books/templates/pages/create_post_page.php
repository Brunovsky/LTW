<div id="create_post" class="page">

    <div id="create_post_main">
        <h1>Create a Post</h1>
        <div class="default_dropdown selectable-dropdown" id="channel_select">
            <header>Channel</header>
            <div class="dropdown_selection">Select a Channel</div>
            <div class="triangle_down"></div>
            <div class="dropdown_options default-dropdown-content">
            </div>
        </div>

        <div class="tab">
            <button class="tablinks" onclick="tab_option(event, 'new_post_post')" id="tab_default">Post</button>
            <button class="tablinks" onclick="tab_option(event, 'new_post_image')">Image</button>
            <button class="tablinks" onclick="tab_option(event, 'new_post_title')">Title</button>
        </div>

        <div id="new_post_post" class="tabcontent">
            <form>
                <input type="text" name="post_title" placeholder="Title"/>
                <textarea name="post_text" placeholder="Text"></textarea>
                <input type="submit" name="post_submission" value="Post"/>
            </form>
        </div>

        <div id="new_post_image" class="tabcontent">
            <form>
                <input type="text" name="post_title" placeholder="Title"/>
                <input type="file" name="upload-file" accept="image/*"/>
                <input type="submit" name="post_submission" value="Post"/>
            </form>
        </div>

        <div id="new_post_title" class="tabcontent">
            <form>
                <input type="text" name="post_title" placeholder="Title"/>
                <input type="submit" name="post_submission" value="Post"/>
            </form>
        </div>
    </div>

    <script src="javascript/pages/create_post_page.js" defer></script>
    <script src="javascript/utils/tab.js" defer></script>
    <script src="javascript/utils/dropdown.js" defer></script>

    <div id="create_page_aside">
        <div id="rules" class="aside_div">
            <h1>Posting rules</h1>
            <ul>
                <li>1. Be attractive</li>
                <li>2. Don't be unattractive</li>
            </ul>
        </div>

        <div id="aside_footer" class="aside_div">
            <?php require_once __DIR__ . '/../common/footer.php' ?>
        </div>

    </div>
</div>
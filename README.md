# PersonalBlog

### About
#### This is the repository for my personal blog at oscarthf.com. Anyone can use this code to create their own website.

## Stack:

```
Multi-Stage Dockerfile containing React (frontend) and Express (backend) servers
Notion CMS for blog posts
WebGL for background animation
```

## To do:

```
0. Add AWS Deployment instructions.
```

## Environment Variables needed:

```
NOTION_TOKEN=<NOTION_TOKEN>
NOTION_POSTS_DATABASE_ID=<NOTION_POSTS_DATABASE_ID>
NOTION_SECTIONS_DATABASE_ID=<NOTION_SECTIONS_DATABASE_ID>
VITE_API_BASE_URL="/api"
PRODUCTION_URL=<PRODUCTION_URL (not needed for described deployments)>
```

## To create .env file

```
0. Create a blank text file called ".env" with no other extension.
1. Copy the above environment variables and remove the place holders.
2. Follow the steps below to obtain the above environment variables.
```

## To create Notion API Token and Database ID:

```
0. Create a Notion account.
1. Create a Notion integration and obtain the API token.
2. Create a Notion database for blog posts and obtain the database ID.
    * Select new blank page.
    * Type /database and select Database (full page).
    * Select the new table and rename it to Posts.
    * Add the following properties (and types):
        * Name (title)
        * Slug (text)
        * Published (checkbox)
        * Date (date)
        * Content (text)
3. Create a Notion database for sections and obtain the database ID.
    * Select new blank page.
    * Type /database and select Database (full page).
    * Select the new table and rename it to Sections.
    * Add the following properties (and types):
        * Name (title)
        * HTMLContent (text)
        * Section (text)
    * Currently the sections are hardcoded in the frontend (["home", "blog", "about"]), but this will be changed in the future.
4. Make sure to remove any smart links in the Notion database. Links will work as long as you select the text in Notion and click "Remove link" in the menu. You should not be able to click the link when editing in Notion.
```

## For Local Deployment (With Docker):

```
0. Install Docker Desktop.
1. Clone this repository using the command:
    git clone --recurse-submodules https://github.com/oscarthf/PersonalBlog
2. Navigate to the root directory of the repository.
3. Run the command:
    docker-compose up --build
```

## For Local Deployment (No Docker):

```
0. Install Node.js and npm.
1. Clone this repository using the command:
    git clone --recurse-submodules
2. Navigate to the root directory of the repository.
3. ...
```

## For render.com deployment:

```
0. Create a render.com account.
1. Create a new web service.
2. Fork this repository.
2. Connect using GitHub and allow render.com to access this repository and its submodules (https://github.com/oscarthf/PersonalBlogBackend, https://github.com/oscarthf/PersonalBlogFrontend).
3. Set the environment variables in the render.com dashboard.
4. Select Docker as the build method (this uses Dockerfile, not docker-compose.yml).
5. (Optional) Set a custom domain.
```

## Image sources:

```
The following images were modified and used in the WebGL background animation.
    * moon.png: https://www.goodfreephotos.com/astrophotography/close-up-of-the-moon-detail.jpg.php
    * opal.png: https://www.publicdomainpictures.net/en/view-image.php?image=627379&picture=opal-gemstone-stone-clipart-png
```
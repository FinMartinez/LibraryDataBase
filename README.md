# Library network program v4

This is the fourth iteration of the library network application, adding a Vue.js SPA into the front end. As of this current version, this is a barebones web application that performs CRUD operations on a database containing books, people, libraries, and counties and view operations via the auxiliary SPA.

This application requires Ruby 3.0.6 and Rails 7.0.

# Dependencies

If you have not installed Ruby on Rails on your device, ensure that you have done so prior to cloning this repository.

To clone from terminal/command line:
```
$git clone cs3710-fall-2023-002-assignment-3-FinMartinez
```
```
$cd cs3710-fall-2023-002-assignment-3-FinMartinez
```
Install dependencies:
```
$gem install faker
```
```
$bundle add faker
```
Generate/Seed database:
```
$rails db:migrate
```
```
$rails db:seed
```
Once this is done, your database will be set up and seeded with faker values.

# Usage

## Vue.js SPA
Once you've successfully cloned the repository and seeded the database, you'll be ready to run the server and use the SPA.
To run the rails server type the following command into your terminal inside the repository folder:
```
$rails server
```
Once the server is running, open your preferred web browser and navigate to ```localhost:3000/index.html```.
The resulting page is the Vue.js SPA to view the books' titles, authors, and ISBNs in the library database and authors' names, email, telephone number, and books they've authored.

Using the SPA is fairly straighforward. There are two buttons: "Show Books" and "Show People". Clicking either of these buttons will populate the lists of books and/or authors. When the lists are open, but buttons will change to "Hide Books" and "Hide People", respectively.
And that's that!

## Rails Application
After cloning this repository, it's important to run the command ```$rails routes``` to obtain the url paths. Running the server can by done with the terminal command:

```
$rails server
```
You can then open your preferred web browser and nagivate to ```localhost:3000/``` appending one of the rails routes to the url:
```
localhost:3000/libraries
```
From this page, you will be able to perform the CRUD operations.

# Citations

All code contributions were made by @FinMartinez, Dr. Stephen Beaty, and Github Copilot.

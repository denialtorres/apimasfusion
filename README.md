Bienvenido al codechallenge para MasFusion

To get started, just do the following:

## Install Gems
    run `bundle install`

## Create Database
    You need to have a Postgress database installed in your machine
    
    1. run `rake db:create`
    2. run `rake db:migrate`
    3. run `rake db:seed`
## Test the Files
    Just run `rake`
    
## Run Project
    run `rails s`


## Test from heroku


to GET all the files use

method: GET, url: https://masfusion-api.herokuapp.com/properties

and you will get
![alt tag](http://i.imgur.com/NJXenL6.png)

to GET an individual file

method: GET, url: https://masfusion-api.herokuapp.com/properties/:id

and you will get
![alt tag](http://i.imgur.com/VLYlTAn.png)

to POST a new file

method: POST, url: https://masfusion-api.herokuapp.com/properties/
<br /><br />
body: {"property" : {"type": "house",
                     "title": "casa por la guadalajara",
                     "address": "Calle Siempre,Alegre 213, por donde venden naranjas",
                     "zipcode": "12345",
                     "country": "mx",
                     "notes": "Casi llegando a la esquina"}}

and you will get 
![alt tag](http://i.imgur.com/BhY1KgN.png)

you will get custom errors if the params were incorrect
![alt tag](http://i.imgur.com/KnhFSQs.png)

you can delete a record with the following method
method: DELETE, url: https://masfusion-api.herokuapp.com/properties/:id
and you will get 
![alt tag](http://i.imgur.com/xETtJJJ.png)

you can modify a record with the following method
method: PATCH, url: https://masfusion-api.herokuapp.com/properties/:id
and you will get 
![alt tag](http://i.imgur.com/UnthLxr.png)

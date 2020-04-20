# Dog Running S.A API

This API is using Rails and postgresql 

# Dependencies?

- [DOCKER](https://docs.docker.com/v17.12/docker-for-mac/install/)

# How to run it?

```sh
docker-compose build
docker-compose up
```

# Authentication

The app uses an access token to authenticate API calls, in order to generate the token do the following
1 - open the rails console
```sh
docker-compose run app rails console 
```
2- Create an API key
```sh
ApiKey.create!
```
3- Copy the access_token in previous step and add it in the authorization tab in Postman, on the category bearer token

# DOGS
##### Headers
Content-Typeapplication/json

##### Params: One of the following can be used this way:
    
    name
    age
    weight
    
    localhost:3000/dogs?name=asteroide
    localhost:3000/dogs?age=20
    localhost:3000/dogs?weight=10
    
###### sort:
    DEFAULT SORT name DESC 
    
    localhost:3000/dogs?sort=age (asc) NOTE: no need to add extra symbols to this
    localhost:3000/dogs?sort=-age (desc)
###### page
    default 0
    localhost:3000/dogs?page=0
###### limit
    default 10
    localhost:3000/dogs?limit=3
    
#### GET /dogs/:id
#### POST /dogs
#### PUT /dogs/:id
#### DELETE /dogs/:id

##### Body form data

```sh
{
 "dog":
 {
 "name":"",
 "age":"",
 "weight":"",
 "breed_id":""
 }
}
```

# BREEDS

##### Headers
Content-Typeapplication/json
##### Params
N/A
##### Body form data
N/A

#### GET /breeds/

# RESERVATION

##### Headers
Content-Typeapplication/json

##### Params

N/A

#### GET /reservations/:id
#### POST /reservations


##### Body form data
```sh
    {
     "reservation":
     {
     "rescuer_name":"2123",
     "dog_id":"1"
     }
    }
```





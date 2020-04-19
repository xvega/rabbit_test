# Dog Running S.A API

This API is using Rails and postgresql 

# Dependencies?

- [DOCKER](https://docs.docker.com/v17.12/docker-for-mac/install/)

# How to run it?

```sh
docker-compose build
docker-compose up
```

# DOGS
##### Headers
Content-Typeapplication/json

##### Params

###### sort:
    name ASC
    localhost:3000/dogs?sort=+age (asc)
    localhost:3000/dogs?sort=-age (desc)
###### page
    default 0

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

#### GET /dogs/

# RESERVATION

##### Headers
Content-Typeapplication/json

##### Params
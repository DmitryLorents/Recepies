// CategoryDTO.swift
// Copyright © RoadMap. All rights reserved.

import Foundation

// MARK: - CategoryDTO

/// DTO for search by category
struct CategoryDTO: Codable {
    /// Array of recipesDTO containers
    let hits: [Hit]
}

// MARK: - Hit

/// RecipeDTO container
struct Hit: Codable {
    /// Recipe
    let recipe: RecipeDTO
}

// MARK: - Recipe

/// DTO for recipe
struct RecipeDTO: Codable {
    /// Base link for detailed search
    let uri: String
    /// Recipe name
    let label: String
    /// Recipe image url
    let image: String
    /// Calories amount
    let calories: Double
    /// Cooking time
    let totalTime: Int
}

/*
 {
     "from": 1,
     "to": 20,
     "count": 10000,
     "_links": {},
     "hits": [
         {
             "recipe": {
                 "uri": "http://www.edamam.com/ontologies/edamam.owl#recipe_df7e374bcdecdf6617691644c3482475",
                 "label": "Chicken & Mushrooms With Rice",
                 "image": "https://edamam-product-images.s3.amazonaws.com/web-img/702/70272c60dfe0a6e3ae58c2d0614d3f90.jpg?X-Amz-Security-Token=IQoJb3JpZ2luX2VjED0aCXVzLWVhc3QtMSJHMEUCIGiUORTPpjaFUKKe8ixCvMfV9dn7i8aau9qXN9a04BWTAiEAraLTnFHE8xMM7Tmj84s20nvYKBanT%2FhK5FFhNg76p74quQUIRhAAGgwxODcwMTcxNTA5ODYiDBGf35bP84m5p%2Fb8YSqWBb3ialcIsjhGRYbgT%2BSxxTEFySEgiUHavfSQtL4bXpzH1499R8BkZSpnQVxvtMnBhTcb8iRED%2BovGZHmn7qEO1T5%2BXicXuDUHTDQO8RWCmjAb61iSWTUJr5LAA3%2FGWBqLnac4SB4JfSR4s3EO5NzAqFOCgBUYxjyWG8AHmlBt5%2BQSZOKynOUGsv5XR03ZA9TSnAfnqQZgL68hiEZsYUv13aqVnEp1WTGe9md6obXPr0EZLUmvk3KrNkSo0hkJwHop8126XksXBWMl1en%2FZMk%2B%2BMj%2FQCERhO%2F%2F6KjMJG6J%2FA%2BiWpoJ6BvzKmYCSrG2xq%2BAKNxjDPAWJa2cdHUiDzAHzxPvFb%2F6MEJFHjwSb8C6IILHj3623MG0fZEfNEdtmEmQi%2FCf9VGRZ1%2B2ZHz2C3dwwe3Nek%2FgyN9%2BlQly6PmrrIRyKs%2F0RlLfkgOih0W3tsqAV%2BxjF9GA4U0NqnXck5s90SCHrrIMQolGENSANFbYlW6h5mfSUrmC0hlTLViPR0slFk64wAXu3JvyeFTVJQt8jw5ShsOnq0Kcak9B2yYHcefjOX%2FhEu7dD4u7UjKfZ4qeGwiJDfnQb7vx4BpwL%2BfGlt520BgGNbHeyUgENxbugzJW1ofClDO64eC5MVxDgYh8oLgj56wps5n70jFGg%2Bo%2B%2FF0szQp8C1mCK5TjRiYSP%2BDWSrJgBgdg%2FPh0Kg%2Bk42loVbqSxu%2B1raCnW%2FNVT2NPmUhlAhxLnZ%2FjSDqMi1aCtDxtxgVUcnWR%2F3gULtbWNaG247d%2FmKM3kQcFFPOpgtZNZ5u6mhP9zH1k%2FaMZoqJQS9Amr1m7U5cWqZmbl0ilYtoz7jyVpnyZVqba6o96SCuWkS5n51by6rTd%2BycCPAhXpg1aiv3BK%2F%2FMKqXwa8GOrEB21y2QcpWEfKwQqpn9nEj8FIJJ4zaE7tf%2Bvfi5iTrZczS%2Buq66xAW9CKaTdAkIPYDzKgrJavexkPMzpGkgbrwjvYAJnEGMMVk3JRGKauRU7G9azxXC2IgzQG6jC1b7QhIbAQbuGOwrHBBHhouykiHHarVpNuszasyGEvyrpuDYIO5le4d%2BVCgj2kEPjGu69W%2F9SyzQZVAs%2B%2B4%2F5dWaulB9nVZKP3QJzHgicSS9gfG8z68&X-Amz-Algorithm=AWS4-HMAC-SHA256&X-Amz-Date=20240312T134632Z&X-Amz-SignedHeaders=host&X-Amz-Expires=3600&X-Amz-Credential=ASIASXCYXIIFIALL2LNA%2F20240312%2Fus-east-1%2Fs3%2Faws4_request&X-Amz-Signature=f2b6affc9a163fbd9c0210c10fd01ba7357801976ddf642200c70266a67b2c8b",
                 "calories": 2953.0050102499995,
                 "totalTime": 0.0
             },
             "_links": {
                 "self": {
                     "title": "Self",
                     "href": "https://api.edamam.com/api/recipes/v2/df7e374bcdecdf6617691644c3482475?type=public&app_id=cb462440&app_key=7e02a24790f9c127571b1a3bad7028d5"
                 }
             }
         },
         {
             "recipe": {
                 "uri": "http://www.edamam.com/ontologies/edamam.owl#recipe_cffaccbf27c7d6dc0ef0e625e3835996",
                 "label": "Chicken Pasta Stuffed Bell Peppers recipes",
                 "image": "https://edamam-product-images.s3.amazonaws.com/web-img/428/428314fd5c31fce0ed6f57594f7f39ae?X-Amz-Security-Token=IQoJb3JpZ2luX2VjED0aCXVzLWVhc3QtMSJHMEUCIGiUORTPpjaFUKKe8ixCvMfV9dn7i8aau9qXN9a04BWTAiEAraLTnFHE8xMM7Tmj84s20nvYKBanT%2FhK5FFhNg76p74quQUIRhAAGgwxODcwMTcxNTA5ODYiDBGf35bP84m5p%2Fb8YSqWBb3ialcIsjhGRYbgT%2BSxxTEFySEgiUHavfSQtL4bXpzH1499R8BkZSpnQVxvtMnBhTcb8iRED%2BovGZHmn7qEO1T5%2BXicXuDUHTDQO8RWCmjAb61iSWTUJr5LAA3%2FGWBqLnac4SB4JfSR4s3EO5NzAqFOCgBUYxjyWG8AHmlBt5%2BQSZOKynOUGsv5XR03ZA9TSnAfnqQZgL68hiEZsYUv13aqVnEp1WTGe9md6obXPr0EZLUmvk3KrNkSo0hkJwHop8126XksXBWMl1en%2FZMk%2B%2BMj%2FQCERhO%2F%2F6KjMJG6J%2FA%2BiWpoJ6BvzKmYCSrG2xq%2BAKNxjDPAWJa2cdHUiDzAHzxPvFb%2F6MEJFHjwSb8C6IILHj3623MG0fZEfNEdtmEmQi%2FCf9VGRZ1%2B2ZHz2C3dwwe3Nek%2FgyN9%2BlQly6PmrrIRyKs%2F0RlLfkgOih0W3tsqAV%2BxjF9GA4U0NqnXck5s90SCHrrIMQolGENSANFbYlW6h5mfSUrmC0hlTLViPR0slFk64wAXu3JvyeFTVJQt8jw5ShsOnq0Kcak9B2yYHcefjOX%2FhEu7dD4u7UjKfZ4qeGwiJDfnQb7vx4BpwL%2BfGlt520BgGNbHeyUgENxbugzJW1ofClDO64eC5MVxDgYh8oLgj56wps5n70jFGg%2Bo%2B%2FF0szQp8C1mCK5TjRiYSP%2BDWSrJgBgdg%2FPh0Kg%2Bk42loVbqSxu%2B1raCnW%2FNVT2NPmUhlAhxLnZ%2FjSDqMi1aCtDxtxgVUcnWR%2F3gULtbWNaG247d%2FmKM3kQcFFPOpgtZNZ5u6mhP9zH1k%2FaMZoqJQS9Amr1m7U5cWqZmbl0ilYtoz7jyVpnyZVqba6o96SCuWkS5n51by6rTd%2BycCPAhXpg1aiv3BK%2F%2FMKqXwa8GOrEB21y2QcpWEfKwQqpn9nEj8FIJJ4zaE7tf%2Bvfi5iTrZczS%2Buq66xAW9CKaTdAkIPYDzKgrJavexkPMzpGkgbrwjvYAJnEGMMVk3JRGKauRU7G9azxXC2IgzQG6jC1b7QhIbAQbuGOwrHBBHhouykiHHarVpNuszasyGEvyrpuDYIO5le4d%2BVCgj2kEPjGu69W%2F9SyzQZVAs%2B%2B4%2F5dWaulB9nVZKP3QJzHgicSS9gfG8z68&X-Amz-Algorithm=AWS4-HMAC-SHA256&X-Amz-Date=20240312T134632Z&X-Amz-SignedHeaders=host&X-Amz-Expires=3600&X-Amz-Credential=ASIASXCYXIIFIALL2LNA%2F20240312%2Fus-east-1%2Fs3%2Faws4_request&X-Amz-Signature=6ebb6e4c4883e3e88b1e9077bee9d0cdfffee25664b62011ad5642015a4e8b85",
                 "calories": 3084.4562695249997,
                 "totalTime": 14.0
             },
             "_links": {
                 "self": {
                     "title": "Self",
                     "href": "https://api.edamam.com/api/recipes/v2/cffaccbf27c7d6dc0ef0e625e3835996?type=public&app_id=cb462440&app_key=7e02a24790f9c127571b1a3bad7028d5"
                 }
             }
         },
         {
             "recipe": {
                 "uri": "http://www.edamam.com/ontologies/edamam.owl#recipe_52bf89a3fe708871c9b0794a1f262d5f",
                 "label": "Spicy Shrimp and Ramen Soup",
                 "image": "https://edamam-product-images.s3.amazonaws.com/web-img/238/2381942bbfc6cd610a346072218b4fb4.jpg?X-Amz-Security-Token=IQoJb3JpZ2luX2VjED0aCXVzLWVhc3QtMSJHMEUCIGiUORTPpjaFUKKe8ixCvMfV9dn7i8aau9qXN9a04BWTAiEAraLTnFHE8xMM7Tmj84s20nvYKBanT%2FhK5FFhNg76p74quQUIRhAAGgwxODcwMTcxNTA5ODYiDBGf35bP84m5p%2Fb8YSqWBb3ialcIsjhGRYbgT%2BSxxTEFySEgiUHavfSQtL4bXpzH1499R8BkZSpnQVxvtMnBhTcb8iRED%2BovGZHmn7qEO1T5%2BXicXuDUHTDQO8RWCmjAb61iSWTUJr5LAA3%2FGWBqLnac4SB4JfSR4s3EO5NzAqFOCgBUYxjyWG8AHmlBt5%2BQSZOKynOUGsv5XR03ZA9TSnAfnqQZgL68hiEZsYUv13aqVnEp1WTGe9md6obXPr0EZLUmvk3KrNkSo0hkJwHop8126XksXBWMl1en%2FZMk%2B%2BMj%2FQCERhO%2F%2F6KjMJG6J%2FA%2BiWpoJ6BvzKmYCSrG2xq%2BAKNxjDPAWJa2cdHUiDzAHzxPvFb%2F6MEJFHjwSb8C6IILHj3623MG0fZEfNEdtmEmQi%2FCf9VGRZ1%2B2ZHz2C3dwwe3Nek%2FgyN9%2BlQly6PmrrIRyKs%2F0RlLfkgOih0W3tsqAV%2BxjF9GA4U0NqnXck5s90SCHrrIMQolGENSANFbYlW6h5mfSUrmC0hlTLViPR0slFk64wAXu3JvyeFTVJQt8jw5ShsOnq0Kcak9B2yYHcefjOX%2FhEu7dD4u7UjKfZ4qeGwiJDfnQb7vx4BpwL%2BfGlt520BgGNbHeyUgENxbugzJW1ofClDO64eC5MVxDgYh8oLgj56wps5n70jFGg%2Bo%2B%2FF0szQp8C1mCK5TjRiYSP%2BDWSrJgBgdg%2FPh0Kg%2Bk42loVbqSxu%2B1raCnW%2FNVT2NPmUhlAhxLnZ%2FjSDqMi1aCtDxtxgVUcnWR%2F3gULtbWNaG247d%2FmKM3kQcFFPOpgtZNZ5u6mhP9zH1k%2FaMZoqJQS9Amr1m7U5cWqZmbl0ilYtoz7jyVpnyZVqba6o96SCuWkS5n51by6rTd%2BycCPAhXpg1aiv3BK%2F%2FMKqXwa8GOrEB21y2QcpWEfKwQqpn9nEj8FIJJ4zaE7tf%2Bvfi5iTrZczS%2Buq66xAW9CKaTdAkIPYDzKgrJavexkPMzpGkgbrwjvYAJnEGMMVk3JRGKauRU7G9azxXC2IgzQG6jC1b7QhIbAQbuGOwrHBBHhouykiHHarVpNuszasyGEvyrpuDYIO5le4d%2BVCgj2kEPjGu69W%2F9SyzQZVAs%2B%2B4%2F5dWaulB9nVZKP3QJzHgicSS9gfG8z68&X-Amz-Algorithm=AWS4-HMAC-SHA256&X-Amz-Date=20240312T134632Z&X-Amz-SignedHeaders=host&X-Amz-Expires=3600&X-Amz-Credential=ASIASXCYXIIFIALL2LNA%2F20240312%2Fus-east-1%2Fs3%2Faws4_request&X-Amz-Signature=b3ddc68c4ced50b35956ed268a98d9f8dcfdabd48236bddfbcf400664a072a82",
                 "calories": 2303.210791882079,
                 "totalTime": 0.0
             },
             "_links": {
                 "self": {
                     "title": "Self",
                     "href": "https://api.edamam.com/api/recipes/v2/52bf89a3fe708871c9b0794a1f262d5f?type=public&app_id=cb462440&app_key=7e02a24790f9c127571b1a3bad7028d5"
                 }
             }
         },
         {
             "recipe": {
                 "uri": "http://www.edamam.com/ontologies/edamam.owl#recipe_8c3cab71068873a319655941c886dc03",
                 "label": "Paella with Chicken",
                 "image": "https://edamam-product-images.s3.amazonaws.com/web-img/8d9/8d9fe690c42d1602c156bcc106589751.jpg?X-Amz-Security-Token=IQoJb3JpZ2luX2VjED0aCXVzLWVhc3QtMSJHMEUCIGiUORTPpjaFUKKe8ixCvMfV9dn7i8aau9qXN9a04BWTAiEAraLTnFHE8xMM7Tmj84s20nvYKBanT%2FhK5FFhNg76p74quQUIRhAAGgwxODcwMTcxNTA5ODYiDBGf35bP84m5p%2Fb8YSqWBb3ialcIsjhGRYbgT%2BSxxTEFySEgiUHavfSQtL4bXpzH1499R8BkZSpnQVxvtMnBhTcb8iRED%2BovGZHmn7qEO1T5%2BXicXuDUHTDQO8RWCmjAb61iSWTUJr5LAA3%2FGWBqLnac4SB4JfSR4s3EO5NzAqFOCgBUYxjyWG8AHmlBt5%2BQSZOKynOUGsv5XR03ZA9TSnAfnqQZgL68hiEZsYUv13aqVnEp1WTGe9md6obXPr0EZLUmvk3KrNkSo0hkJwHop8126XksXBWMl1en%2FZMk%2B%2BMj%2FQCERhO%2F%2F6KjMJG6J%2FA%2BiWpoJ6BvzKmYCSrG2xq%2BAKNxjDPAWJa2cdHUiDzAHzxPvFb%2F6MEJFHjwSb8C6IILHj3623MG0fZEfNEdtmEmQi%2FCf9VGRZ1%2B2ZHz2C3dwwe3Nek%2FgyN9%2BlQly6PmrrIRyKs%2F0RlLfkgOih0W3tsqAV%2BxjF9GA4U0NqnXck5s90SCHrrIMQolGENSANFbYlW6h5mfSUrmC0hlTLViPR0slFk64wAXu3JvyeFTVJQt8jw5ShsOnq0Kcak9B2yYHcefjOX%2FhEu7dD4u7UjKfZ4qeGwiJDfnQb7vx4BpwL%2BfGlt520BgGNbHeyUgENxbugzJW1ofClDO64eC5MVxDgYh8oLgj56wps5n70jFGg%2Bo%2B%2FF0szQp8C1mCK5TjRiYSP%2BDWSrJgBgdg%2FPh0Kg%2Bk42loVbqSxu%2B1raCnW%2FNVT2NPmUhlAhxLnZ%2FjSDqMi1aCtDxtxgVUcnWR%2F3gULtbWNaG247d%2FmKM3kQcFFPOpgtZNZ5u6mhP9zH1k%2FaMZoqJQS9Amr1m7U5cWqZmbl0ilYtoz7jyVpnyZVqba6o96SCuWkS5n51by6rTd%2BycCPAhXpg1aiv3BK%2F%2FMKqXwa8GOrEB21y2QcpWEfKwQqpn9nEj8FIJJ4zaE7tf%2Bvfi5iTrZczS%2Buq66xAW9CKaTdAkIPYDzKgrJavexkPMzpGkgbrwjvYAJnEGMMVk3JRGKauRU7G9azxXC2IgzQG6jC1b7QhIbAQbuGOwrHBBHhouykiHHarVpNuszasyGEvyrpuDYIO5le4d%2BVCgj2kEPjGu69W%2F9SyzQZVAs%2B%2B4%2F5dWaulB9nVZKP3QJzHgicSS9gfG8z68&X-Amz-Algorithm=AWS4-HMAC-SHA256&X-Amz-Date=20240312T134632Z&X-Amz-SignedHeaders=host&X-Amz-Expires=3600&X-Amz-Credential=ASIASXCYXIIFIALL2LNA%2F20240312%2Fus-east-1%2Fs3%2Faws4_request&X-Amz-Signature=8064bd53886d0d7931ded6b0028b66caca54749e8eac83f6a74d76be4348bfb5",
                 "calories": 3171.1251219389233,
                 "totalTime": 40.0
             },
             "_links": {
                 "self": {
                     "title": "Self",
                     "href": "https://api.edamam.com/api/recipes/v2/8c3cab71068873a319655941c886dc03?type=public&app_id=cb462440&app_key=7e02a24790f9c127571b1a3bad7028d5"
                 }
             }
         },
         {
             "recipe": {
                 "uri": "http://www.edamam.com/ontologies/edamam.owl#recipe_1aa10f4e3f1ecbb5d448517c8f3bd1a7",
                 "label": "Sriracha Chicken Pillows",
                 "image": "https://edamam-product-images.s3.amazonaws.com/web-img/b57/b574a8608f6b005fae6f74f8f2d38f0f.jpg?X-Amz-Security-Token=IQoJb3JpZ2luX2VjED0aCXVzLWVhc3QtMSJHMEUCIGiUORTPpjaFUKKe8ixCvMfV9dn7i8aau9qXN9a04BWTAiEAraLTnFHE8xMM7Tmj84s20nvYKBanT%2FhK5FFhNg76p74quQUIRhAAGgwxODcwMTcxNTA5ODYiDBGf35bP84m5p%2Fb8YSqWBb3ialcIsjhGRYbgT%2BSxxTEFySEgiUHavfSQtL4bXpzH1499R8BkZSpnQVxvtMnBhTcb8iRED%2BovGZHmn7qEO1T5%2BXicXuDUHTDQO8RWCmjAb61iSWTUJr5LAA3%2FGWBqLnac4SB4JfSR4s3EO5NzAqFOCgBUYxjyWG8AHmlBt5%2BQSZOKynOUGsv5XR03ZA9TSnAfnqQZgL68hiEZsYUv13aqVnEp1WTGe9md6obXPr0EZLUmvk3KrNkSo0hkJwHop8126XksXBWMl1en%2FZMk%2B%2BMj%2FQCERhO%2F%2F6KjMJG6J%2FA%2BiWpoJ6BvzKmYCSrG2xq%2BAKNxjDPAWJa2cdHUiDzAHzxPvFb%2F6MEJFHjwSb8C6IILHj3623MG0fZEfNEdtmEmQi%2FCf9VGRZ1%2B2ZHz2C3dwwe3Nek%2FgyN9%2BlQly6PmrrIRyKs%2F0RlLfkgOih0W3tsqAV%2BxjF9GA4U0NqnXck5s90SCHrrIMQolGENSANFbYlW6h5mfSUrmC0hlTLViPR0slFk64wAXu3JvyeFTVJQt8jw5ShsOnq0Kcak9B2yYHcefjOX%2FhEu7dD4u7UjKfZ4qeGwiJDfnQb7vx4BpwL%2BfGlt520BgGNbHeyUgENxbugzJW1ofClDO64eC5MVxDgYh8oLgj56wps5n70jFGg%2Bo%2B%2FF0szQp8C1mCK5TjRiYSP%2BDWSrJgBgdg%2FPh0Kg%2Bk42loVbqSxu%2B1raCnW%2FNVT2NPmUhlAhxLnZ%2FjSDqMi1aCtDxtxgVUcnWR%2F3gULtbWNaG247d%2FmKM3kQcFFPOpgtZNZ5u6mhP9zH1k%2FaMZoqJQS9Amr1m7U5cWqZmbl0ilYtoz7jyVpnyZVqba6o96SCuWkS5n51by6rTd%2BycCPAhXpg1aiv3BK%2F%2FMKqXwa8GOrEB21y2QcpWEfKwQqpn9nEj8FIJJ4zaE7tf%2Bvfi5iTrZczS%2Buq66xAW9CKaTdAkIPYDzKgrJavexkPMzpGkgbrwjvYAJnEGMMVk3JRGKauRU7G9azxXC2IgzQG6jC1b7QhIbAQbuGOwrHBBHhouykiHHarVpNuszasyGEvyrpuDYIO5le4d%2BVCgj2kEPjGu69W%2F9SyzQZVAs%2B%2B4%2F5dWaulB9nVZKP3QJzHgicSS9gfG8z68&X-Amz-Algorithm=AWS4-HMAC-SHA256&X-Amz-Date=20240312T134632Z&X-Amz-SignedHeaders=host&X-Amz-Expires=3600&X-Amz-Credential=ASIASXCYXIIFIALL2LNA%2F20240312%2Fus-east-1%2Fs3%2Faws4_request&X-Amz-Signature=cb86a424627b6110521555873c4a950d0af497f026f37e343000cd4e5f6bc8ba",
                 "calories": 7293.877919249943,
                 "totalTime": 0.0
             },
             "_links": {
                 "self": {
                     "title": "Self",
                     "href": "https://api.edamam.com/api/recipes/v2/1aa10f4e3f1ecbb5d448517c8f3bd1a7?type=public&app_id=cb462440&app_key=7e02a24790f9c127571b1a3bad7028d5"
                 }
             }
         },
         {
             "recipe": {
                 "uri": "http://www.edamam.com/ontologies/edamam.owl#recipe_7f4365188f7383fc02daf7a35d7905fa",
                 "label": "House Special Fried Rice",
                 "image": "https://edamam-product-images.s3.amazonaws.com/web-img/2c3/2c3549d53b7e6fe2afa5d33e7f41905b.jpg?X-Amz-Security-Token=IQoJb3JpZ2luX2VjED0aCXVzLWVhc3QtMSJHMEUCIGiUORTPpjaFUKKe8ixCvMfV9dn7i8aau9qXN9a04BWTAiEAraLTnFHE8xMM7Tmj84s20nvYKBanT%2FhK5FFhNg76p74quQUIRhAAGgwxODcwMTcxNTA5ODYiDBGf35bP84m5p%2Fb8YSqWBb3ialcIsjhGRYbgT%2BSxxTEFySEgiUHavfSQtL4bXpzH1499R8BkZSpnQVxvtMnBhTcb8iRED%2BovGZHmn7qEO1T5%2BXicXuDUHTDQO8RWCmjAb61iSWTUJr5LAA3%2FGWBqLnac4SB4JfSR4s3EO5NzAqFOCgBUYxjyWG8AHmlBt5%2BQSZOKynOUGsv5XR03ZA9TSnAfnqQZgL68hiEZsYUv13aqVnEp1WTGe9md6obXPr0EZLUmvk3KrNkSo0hkJwHop8126XksXBWMl1en%2FZMk%2B%2BMj%2FQCERhO%2F%2F6KjMJG6J%2FA%2BiWpoJ6BvzKmYCSrG2xq%2BAKNxjDPAWJa2cdHUiDzAHzxPvFb%2F6MEJFHjwSb8C6IILHj3623MG0fZEfNEdtmEmQi%2FCf9VGRZ1%2B2ZHz2C3dwwe3Nek%2FgyN9%2BlQly6PmrrIRyKs%2F0RlLfkgOih0W3tsqAV%2BxjF9GA4U0NqnXck5s90SCHrrIMQolGENSANFbYlW6h5mfSUrmC0hlTLViPR0slFk64wAXu3JvyeFTVJQt8jw5ShsOnq0Kcak9B2yYHcefjOX%2FhEu7dD4u7UjKfZ4qeGwiJDfnQb7vx4BpwL%2BfGlt520BgGNbHeyUgENxbugzJW1ofClDO64eC5MVxDgYh8oLgj56wps5n70jFGg%2Bo%2B%2FF0szQp8C1mCK5TjRiYSP%2BDWSrJgBgdg%2FPh0Kg%2Bk42loVbqSxu%2B1raCnW%2FNVT2NPmUhlAhxLnZ%2FjSDqMi1aCtDxtxgVUcnWR%2F3gULtbWNaG247d%2FmKM3kQcFFPOpgtZNZ5u6mhP9zH1k%2FaMZoqJQS9Amr1m7U5cWqZmbl0ilYtoz7jyVpnyZVqba6o96SCuWkS5n51by6rTd%2BycCPAhXpg1aiv3BK%2F%2FMKqXwa8GOrEB21y2QcpWEfKwQqpn9nEj8FIJJ4zaE7tf%2Bvfi5iTrZczS%2Buq66xAW9CKaTdAkIPYDzKgrJavexkPMzpGkgbrwjvYAJnEGMMVk3JRGKauRU7G9azxXC2IgzQG6jC1b7QhIbAQbuGOwrHBBHhouykiHHarVpNuszasyGEvyrpuDYIO5le4d%2BVCgj2kEPjGu69W%2F9SyzQZVAs%2B%2B4%2F5dWaulB9nVZKP3QJzHgicSS9gfG8z68&X-Amz-Algorithm=AWS4-HMAC-SHA256&X-Amz-Date=20240312T134632Z&X-Amz-SignedHeaders=host&X-Amz-Expires=3600&X-Amz-Credential=ASIASXCYXIIFIALL2LNA%2F20240312%2Fus-east-1%2Fs3%2Faws4_request&X-Amz-Signature=cecf9174179a6449a5d6edb37895237a950f779d4e0dad3b94344452c1f4254f",
                 "calories": 4066.368539356459,
                 "totalTime": 0.0
             },
             "_links": {
                 "self": {
                     "title": "Self",
                     "href": "https://api.edamam.com/api/recipes/v2/7f4365188f7383fc02daf7a35d7905fa?type=public&app_id=cb462440&app_key=7e02a24790f9c127571b1a3bad7028d5"
                 }
             }
         },
         {
             "recipe": {
                 "uri": "http://www.edamam.com/ontologies/edamam.owl#recipe_af5830278f32679602b054c79ca97e40",
                 "label": "Chicken Alfredo Lasagna Roll Ups",
                 "image": "https://edamam-product-images.s3.amazonaws.com/web-img/d58/d588e3437146e51a0e40baebad5e5c1e.jpg?X-Amz-Security-Token=IQoJb3JpZ2luX2VjED0aCXVzLWVhc3QtMSJHMEUCIGiUORTPpjaFUKKe8ixCvMfV9dn7i8aau9qXN9a04BWTAiEAraLTnFHE8xMM7Tmj84s20nvYKBanT%2FhK5FFhNg76p74quQUIRhAAGgwxODcwMTcxNTA5ODYiDBGf35bP84m5p%2Fb8YSqWBb3ialcIsjhGRYbgT%2BSxxTEFySEgiUHavfSQtL4bXpzH1499R8BkZSpnQVxvtMnBhTcb8iRED%2BovGZHmn7qEO1T5%2BXicXuDUHTDQO8RWCmjAb61iSWTUJr5LAA3%2FGWBqLnac4SB4JfSR4s3EO5NzAqFOCgBUYxjyWG8AHmlBt5%2BQSZOKynOUGsv5XR03ZA9TSnAfnqQZgL68hiEZsYUv13aqVnEp1WTGe9md6obXPr0EZLUmvk3KrNkSo0hkJwHop8126XksXBWMl1en%2FZMk%2B%2BMj%2FQCERhO%2F%2F6KjMJG6J%2FA%2BiWpoJ6BvzKmYCSrG2xq%2BAKNxjDPAWJa2cdHUiDzAHzxPvFb%2F6MEJFHjwSb8C6IILHj3623MG0fZEfNEdtmEmQi%2FCf9VGRZ1%2B2ZHz2C3dwwe3Nek%2FgyN9%2BlQly6PmrrIRyKs%2F0RlLfkgOih0W3tsqAV%2BxjF9GA4U0NqnXck5s90SCHrrIMQolGENSANFbYlW6h5mfSUrmC0hlTLViPR0slFk64wAXu3JvyeFTVJQt8jw5ShsOnq0Kcak9B2yYHcefjOX%2FhEu7dD4u7UjKfZ4qeGwiJDfnQb7vx4BpwL%2BfGlt520BgGNbHeyUgENxbugzJW1ofClDO64eC5MVxDgYh8oLgj56wps5n70jFGg%2Bo%2B%2FF0szQp8C1mCK5TjRiYSP%2BDWSrJgBgdg%2FPh0Kg%2Bk42loVbqSxu%2B1raCnW%2FNVT2NPmUhlAhxLnZ%2FjSDqMi1aCtDxtxgVUcnWR%2F3gULtbWNaG247d%2FmKM3kQcFFPOpgtZNZ5u6mhP9zH1k%2FaMZoqJQS9Amr1m7U5cWqZmbl0ilYtoz7jyVpnyZVqba6o96SCuWkS5n51by6rTd%2BycCPAhXpg1aiv3BK%2F%2FMKqXwa8GOrEB21y2QcpWEfKwQqpn9nEj8FIJJ4zaE7tf%2Bvfi5iTrZczS%2Buq66xAW9CKaTdAkIPYDzKgrJavexkPMzpGkgbrwjvYAJnEGMMVk3JRGKauRU7G9azxXC2IgzQG6jC1b7QhIbAQbuGOwrHBBHhouykiHHarVpNuszasyGEvyrpuDYIO5le4d%2BVCgj2kEPjGu69W%2F9SyzQZVAs%2B%2B4%2F5dWaulB9nVZKP3QJzHgicSS9gfG8z68&X-Amz-Algorithm=AWS4-HMAC-SHA256&X-Amz-Date=20240312T134632Z&X-Amz-SignedHeaders=host&X-Amz-Expires=3600&X-Amz-Credential=ASIASXCYXIIFIALL2LNA%2F20240312%2Fus-east-1%2Fs3%2Faws4_request&X-Amz-Signature=880a7f19ae09f773dc4c8ef4eea91c8337f0a95b7dc430665b4d0d8fe99f149a",
                 "calories": 5195.996499999038,
                 "totalTime": 0.0
             },
             "_links": {
                 "self": {
                     "title": "Self",
                     "href": "https://api.edamam.com/api/recipes/v2/af5830278f32679602b054c79ca97e40?type=public&app_id=cb462440&app_key=7e02a24790f9c127571b1a3bad7028d5"
                 }
             }
         },
         {
             "recipe": {
                 "uri": "http://www.edamam.com/ontologies/edamam.owl#recipe_34cd3f4de8b067e19ae0eaaecd935979",
                 "label": "Scalloped Potato Casserole",
                 "image": "https://edamam-product-images.s3.amazonaws.com/web-img/234/234a7f2c1fcce44f2bd5b26395a49eff.jpg?X-Amz-Security-Token=IQoJb3JpZ2luX2VjED0aCXVzLWVhc3QtMSJHMEUCIGiUORTPpjaFUKKe8ixCvMfV9dn7i8aau9qXN9a04BWTAiEAraLTnFHE8xMM7Tmj84s20nvYKBanT%2FhK5FFhNg76p74quQUIRhAAGgwxODcwMTcxNTA5ODYiDBGf35bP84m5p%2Fb8YSqWBb3ialcIsjhGRYbgT%2BSxxTEFySEgiUHavfSQtL4bXpzH1499R8BkZSpnQVxvtMnBhTcb8iRED%2BovGZHmn7qEO1T5%2BXicXuDUHTDQO8RWCmjAb61iSWTUJr5LAA3%2FGWBqLnac4SB4JfSR4s3EO5NzAqFOCgBUYxjyWG8AHmlBt5%2BQSZOKynOUGsv5XR03ZA9TSnAfnqQZgL68hiEZsYUv13aqVnEp1WTGe9md6obXPr0EZLUmvk3KrNkSo0hkJwHop8126XksXBWMl1en%2FZMk%2B%2BMj%2FQCERhO%2F%2F6KjMJG6J%2FA%2BiWpoJ6BvzKmYCSrG2xq%2BAKNxjDPAWJa2cdHUiDzAHzxPvFb%2F6MEJFHjwSb8C6IILHj3623MG0fZEfNEdtmEmQi%2FCf9VGRZ1%2B2ZHz2C3dwwe3Nek%2FgyN9%2BlQly6PmrrIRyKs%2F0RlLfkgOih0W3tsqAV%2BxjF9GA4U0NqnXck5s90SCHrrIMQolGENSANFbYlW6h5mfSUrmC0hlTLViPR0slFk64wAXu3JvyeFTVJQt8jw5ShsOnq0Kcak9B2yYHcefjOX%2FhEu7dD4u7UjKfZ4qeGwiJDfnQb7vx4BpwL%2BfGlt520BgGNbHeyUgENxbugzJW1ofClDO64eC5MVxDgYh8oLgj56wps5n70jFGg%2Bo%2B%2FF0szQp8C1mCK5TjRiYSP%2BDWSrJgBgdg%2FPh0Kg%2Bk42loVbqSxu%2B1raCnW%2FNVT2NPmUhlAhxLnZ%2FjSDqMi1aCtDxtxgVUcnWR%2F3gULtbWNaG247d%2FmKM3kQcFFPOpgtZNZ5u6mhP9zH1k%2FaMZoqJQS9Amr1m7U5cWqZmbl0ilYtoz7jyVpnyZVqba6o96SCuWkS5n51by6rTd%2BycCPAhXpg1aiv3BK%2F%2FMKqXwa8GOrEB21y2QcpWEfKwQqpn9nEj8FIJJ4zaE7tf%2Bvfi5iTrZczS%2Buq66xAW9CKaTdAkIPYDzKgrJavexkPMzpGkgbrwjvYAJnEGMMVk3JRGKauRU7G9azxXC2IgzQG6jC1b7QhIbAQbuGOwrHBBHhouykiHHarVpNuszasyGEvyrpuDYIO5le4d%2BVCgj2kEPjGu69W%2F9SyzQZVAs%2B%2B4%2F5dWaulB9nVZKP3QJzHgicSS9gfG8z68&X-Amz-Algorithm=AWS4-HMAC-SHA256&X-Amz-Date=20240312T134632Z&X-Amz-SignedHeaders=host&X-Amz-Expires=3600&X-Amz-Credential=ASIASXCYXIIFIALL2LNA%2F20240312%2Fus-east-1%2Fs3%2Faws4_request&X-Amz-Signature=07f2bc2b694cfc223411abdb8b522c2ff49a2124d5f20b7a506cafe068ae9703",
                 "calories": 3790.0869307500006,
                 "totalTime": 0.0
             },
             "_links": {
                 "self": {
                     "title": "Self",
                     "href": "https://api.edamam.com/api/recipes/v2/34cd3f4de8b067e19ae0eaaecd935979?type=public&app_id=cb462440&app_key=7e02a24790f9c127571b1a3bad7028d5"
                 }
             }
         },
         {
             "recipe": {
                 "uri": "http://www.edamam.com/ontologies/edamam.owl#recipe_0f59d45e8d04c50b366a226822252024",
                 "label": "Aneheim Chicken Recipe",
                 "image": "https://edamam-product-images.s3.amazonaws.com/web-img/bc7/bc70ed196663620a6080d4a9547961a1.jpg?X-Amz-Security-Token=IQoJb3JpZ2luX2VjED0aCXVzLWVhc3QtMSJHMEUCIGiUORTPpjaFUKKe8ixCvMfV9dn7i8aau9qXN9a04BWTAiEAraLTnFHE8xMM7Tmj84s20nvYKBanT%2FhK5FFhNg76p74quQUIRhAAGgwxODcwMTcxNTA5ODYiDBGf35bP84m5p%2Fb8YSqWBb3ialcIsjhGRYbgT%2BSxxTEFySEgiUHavfSQtL4bXpzH1499R8BkZSpnQVxvtMnBhTcb8iRED%2BovGZHmn7qEO1T5%2BXicXuDUHTDQO8RWCmjAb61iSWTUJr5LAA3%2FGWBqLnac4SB4JfSR4s3EO5NzAqFOCgBUYxjyWG8AHmlBt5%2BQSZOKynOUGsv5XR03ZA9TSnAfnqQZgL68hiEZsYUv13aqVnEp1WTGe9md6obXPr0EZLUmvk3KrNkSo0hkJwHop8126XksXBWMl1en%2FZMk%2B%2BMj%2FQCERhO%2F%2F6KjMJG6J%2FA%2BiWpoJ6BvzKmYCSrG2xq%2BAKNxjDPAWJa2cdHUiDzAHzxPvFb%2F6MEJFHjwSb8C6IILHj3623MG0fZEfNEdtmEmQi%2FCf9VGRZ1%2B2ZHz2C3dwwe3Nek%2FgyN9%2BlQly6PmrrIRyKs%2F0RlLfkgOih0W3tsqAV%2BxjF9GA4U0NqnXck5s90SCHrrIMQolGENSANFbYlW6h5mfSUrmC0hlTLViPR0slFk64wAXu3JvyeFTVJQt8jw5ShsOnq0Kcak9B2yYHcefjOX%2FhEu7dD4u7UjKfZ4qeGwiJDfnQb7vx4BpwL%2BfGlt520BgGNbHeyUgENxbugzJW1ofClDO64eC5MVxDgYh8oLgj56wps5n70jFGg%2Bo%2B%2FF0szQp8C1mCK5TjRiYSP%2BDWSrJgBgdg%2FPh0Kg%2Bk42loVbqSxu%2B1raCnW%2FNVT2NPmUhlAhxLnZ%2FjSDqMi1aCtDxtxgVUcnWR%2F3gULtbWNaG247d%2FmKM3kQcFFPOpgtZNZ5u6mhP9zH1k%2FaMZoqJQS9Amr1m7U5cWqZmbl0ilYtoz7jyVpnyZVqba6o96SCuWkS5n51by6rTd%2BycCPAhXpg1aiv3BK%2F%2FMKqXwa8GOrEB21y2QcpWEfKwQqpn9nEj8FIJJ4zaE7tf%2Bvfi5iTrZczS%2Buq66xAW9CKaTdAkIPYDzKgrJavexkPMzpGkgbrwjvYAJnEGMMVk3JRGKauRU7G9azxXC2IgzQG6jC1b7QhIbAQbuGOwrHBBHhouykiHHarVpNuszasyGEvyrpuDYIO5le4d%2BVCgj2kEPjGu69W%2F9SyzQZVAs%2B%2B4%2F5dWaulB9nVZKP3QJzHgicSS9gfG8z68&X-Amz-Algorithm=AWS4-HMAC-SHA256&X-Amz-Date=20240312T134632Z&X-Amz-SignedHeaders=host&X-Amz-Expires=3600&X-Amz-Credential=ASIASXCYXIIFIALL2LNA%2F20240312%2Fus-east-1%2Fs3%2Faws4_request&X-Amz-Signature=7b803a93f2291e5f2ab3eea1a08908bcd02e26cdff4079fe2a647f0955887755",
                 "calories": 2538.3154278513334,
                 "totalTime": 60.0
             },
             "_links": {
                 "self": {
                     "title": "Self",
                     "href": "https://api.edamam.com/api/recipes/v2/0f59d45e8d04c50b366a226822252024?type=public&app_id=cb462440&app_key=7e02a24790f9c127571b1a3bad7028d5"
                 }
             }
         },
         {
             "recipe": {
                 "uri": "http://www.edamam.com/ontologies/edamam.owl#recipe_d81eeb15bdfeb782e9d1f5c8393d6ba7",
                 "label": "Cornmeal-Crusted Chicken Breasts",
                 "image": "https://edamam-product-images.s3.amazonaws.com/web-img/f57/f57f032f777210883a8e7b01094664c5.jpg?X-Amz-Security-Token=IQoJb3JpZ2luX2VjED0aCXVzLWVhc3QtMSJHMEUCIGiUORTPpjaFUKKe8ixCvMfV9dn7i8aau9qXN9a04BWTAiEAraLTnFHE8xMM7Tmj84s20nvYKBanT%2FhK5FFhNg76p74quQUIRhAAGgwxODcwMTcxNTA5ODYiDBGf35bP84m5p%2Fb8YSqWBb3ialcIsjhGRYbgT%2BSxxTEFySEgiUHavfSQtL4bXpzH1499R8BkZSpnQVxvtMnBhTcb8iRED%2BovGZHmn7qEO1T5%2BXicXuDUHTDQO8RWCmjAb61iSWTUJr5LAA3%2FGWBqLnac4SB4JfSR4s3EO5NzAqFOCgBUYxjyWG8AHmlBt5%2BQSZOKynOUGsv5XR03ZA9TSnAfnqQZgL68hiEZsYUv13aqVnEp1WTGe9md6obXPr0EZLUmvk3KrNkSo0hkJwHop8126XksXBWMl1en%2FZMk%2B%2BMj%2FQCERhO%2F%2F6KjMJG6J%2FA%2BiWpoJ6BvzKmYCSrG2xq%2BAKNxjDPAWJa2cdHUiDzAHzxPvFb%2F6MEJFHjwSb8C6IILHj3623MG0fZEfNEdtmEmQi%2FCf9VGRZ1%2B2ZHz2C3dwwe3Nek%2FgyN9%2BlQly6PmrrIRyKs%2F0RlLfkgOih0W3tsqAV%2BxjF9GA4U0NqnXck5s90SCHrrIMQolGENSANFbYlW6h5mfSUrmC0hlTLViPR0slFk64wAXu3JvyeFTVJQt8jw5ShsOnq0Kcak9B2yYHcefjOX%2FhEu7dD4u7UjKfZ4qeGwiJDfnQb7vx4BpwL%2BfGlt520BgGNbHeyUgENxbugzJW1ofClDO64eC5MVxDgYh8oLgj56wps5n70jFGg%2Bo%2B%2FF0szQp8C1mCK5TjRiYSP%2BDWSrJgBgdg%2FPh0Kg%2Bk42loVbqSxu%2B1raCnW%2FNVT2NPmUhlAhxLnZ%2FjSDqMi1aCtDxtxgVUcnWR%2F3gULtbWNaG247d%2FmKM3kQcFFPOpgtZNZ5u6mhP9zH1k%2FaMZoqJQS9Amr1m7U5cWqZmbl0ilYtoz7jyVpnyZVqba6o96SCuWkS5n51by6rTd%2BycCPAhXpg1aiv3BK%2F%2FMKqXwa8GOrEB21y2QcpWEfKwQqpn9nEj8FIJJ4zaE7tf%2Bvfi5iTrZczS%2Buq66xAW9CKaTdAkIPYDzKgrJavexkPMzpGkgbrwjvYAJnEGMMVk3JRGKauRU7G9azxXC2IgzQG6jC1b7QhIbAQbuGOwrHBBHhouykiHHarVpNuszasyGEvyrpuDYIO5le4d%2BVCgj2kEPjGu69W%2F9SyzQZVAs%2B%2B4%2F5dWaulB9nVZKP3QJzHgicSS9gfG8z68&X-Amz-Algorithm=AWS4-HMAC-SHA256&X-Amz-Date=20240312T134632Z&X-Amz-SignedHeaders=host&X-Amz-Expires=3600&X-Amz-Credential=ASIASXCYXIIFIALL2LNA%2F20240312%2Fus-east-1%2Fs3%2Faws4_request&X-Amz-Signature=ed5c324a6184b8645815a7cd0bd760cd38d20ca4eab0cbf4e62e8ac279c3cef3",
                 "calories": 2748.716499999672,
                 "totalTime": 0.0
             },
             "_links": {
                 "self": {
                     "title": "Self",
                     "href": "https://api.edamam.com/api/recipes/v2/d81eeb15bdfeb782e9d1f5c8393d6ba7?type=public&app_id=cb462440&app_key=7e02a24790f9c127571b1a3bad7028d5"
                 }
             }
         },
         {
             "recipe": {
                 "uri": "http://www.edamam.com/ontologies/edamam.owl#recipe_935adce38d821276aa4de25f6bbc90dd",
                 "label": "Low Carb Green Bean Casserole",
                 "image": "https://edamam-product-images.s3.amazonaws.com/web-img/209/209e98fdb02458539ad3df19a3101ca5.jpg?X-Amz-Security-Token=IQoJb3JpZ2luX2VjED0aCXVzLWVhc3QtMSJHMEUCIGiUORTPpjaFUKKe8ixCvMfV9dn7i8aau9qXN9a04BWTAiEAraLTnFHE8xMM7Tmj84s20nvYKBanT%2FhK5FFhNg76p74quQUIRhAAGgwxODcwMTcxNTA5ODYiDBGf35bP84m5p%2Fb8YSqWBb3ialcIsjhGRYbgT%2BSxxTEFySEgiUHavfSQtL4bXpzH1499R8BkZSpnQVxvtMnBhTcb8iRED%2BovGZHmn7qEO1T5%2BXicXuDUHTDQO8RWCmjAb61iSWTUJr5LAA3%2FGWBqLnac4SB4JfSR4s3EO5NzAqFOCgBUYxjyWG8AHmlBt5%2BQSZOKynOUGsv5XR03ZA9TSnAfnqQZgL68hiEZsYUv13aqVnEp1WTGe9md6obXPr0EZLUmvk3KrNkSo0hkJwHop8126XksXBWMl1en%2FZMk%2B%2BMj%2FQCERhO%2F%2F6KjMJG6J%2FA%2BiWpoJ6BvzKmYCSrG2xq%2BAKNxjDPAWJa2cdHUiDzAHzxPvFb%2F6MEJFHjwSb8C6IILHj3623MG0fZEfNEdtmEmQi%2FCf9VGRZ1%2B2ZHz2C3dwwe3Nek%2FgyN9%2BlQly6PmrrIRyKs%2F0RlLfkgOih0W3tsqAV%2BxjF9GA4U0NqnXck5s90SCHrrIMQolGENSANFbYlW6h5mfSUrmC0hlTLViPR0slFk64wAXu3JvyeFTVJQt8jw5ShsOnq0Kcak9B2yYHcefjOX%2FhEu7dD4u7UjKfZ4qeGwiJDfnQb7vx4BpwL%2BfGlt520BgGNbHeyUgENxbugzJW1ofClDO64eC5MVxDgYh8oLgj56wps5n70jFGg%2Bo%2B%2FF0szQp8C1mCK5TjRiYSP%2BDWSrJgBgdg%2FPh0Kg%2Bk42loVbqSxu%2B1raCnW%2FNVT2NPmUhlAhxLnZ%2FjSDqMi1aCtDxtxgVUcnWR%2F3gULtbWNaG247d%2FmKM3kQcFFPOpgtZNZ5u6mhP9zH1k%2FaMZoqJQS9Amr1m7U5cWqZmbl0ilYtoz7jyVpnyZVqba6o96SCuWkS5n51by6rTd%2BycCPAhXpg1aiv3BK%2F%2FMKqXwa8GOrEB21y2QcpWEfKwQqpn9nEj8FIJJ4zaE7tf%2Bvfi5iTrZczS%2Buq66xAW9CKaTdAkIPYDzKgrJavexkPMzpGkgbrwjvYAJnEGMMVk3JRGKauRU7G9azxXC2IgzQG6jC1b7QhIbAQbuGOwrHBBHhouykiHHarVpNuszasyGEvyrpuDYIO5le4d%2BVCgj2kEPjGu69W%2F9SyzQZVAs%2B%2B4%2F5dWaulB9nVZKP3QJzHgicSS9gfG8z68&X-Amz-Algorithm=AWS4-HMAC-SHA256&X-Amz-Date=20240312T134632Z&X-Amz-SignedHeaders=host&X-Amz-Expires=3600&X-Amz-Credential=ASIASXCYXIIFIALL2LNA%2F20240312%2Fus-east-1%2Fs3%2Faws4_request&X-Amz-Signature=1a9a91dd45eae24fa7e97a7f500c49216383963ab90f2a0dfbb16d64f57f37a3",
                 "calories": 1991.3067693986147,
                 "totalTime": 0.0
             },
             "_links": {
                 "self": {
                     "title": "Self",
                     "href": "https://api.edamam.com/api/recipes/v2/935adce38d821276aa4de25f6bbc90dd?type=public&app_id=cb462440&app_key=7e02a24790f9c127571b1a3bad7028d5"
                 }
             }
         },
         {
             "recipe": {
                 "uri": "http://www.edamam.com/ontologies/edamam.owl#recipe_a7f02241e5e6736cc327e4086210c36f",
                 "label": "Smoked Kransky and Sweet Potato Stew with Red Sauerkraut Recipe",
                 "image": "https://edamam-product-images.s3.amazonaws.com/web-img/da5/da5ac35e6e005fe875a3b73bfbb3cf78.png?X-Amz-Security-Token=IQoJb3JpZ2luX2VjED0aCXVzLWVhc3QtMSJHMEUCIGiUORTPpjaFUKKe8ixCvMfV9dn7i8aau9qXN9a04BWTAiEAraLTnFHE8xMM7Tmj84s20nvYKBanT%2FhK5FFhNg76p74quQUIRhAAGgwxODcwMTcxNTA5ODYiDBGf35bP84m5p%2Fb8YSqWBb3ialcIsjhGRYbgT%2BSxxTEFySEgiUHavfSQtL4bXpzH1499R8BkZSpnQVxvtMnBhTcb8iRED%2BovGZHmn7qEO1T5%2BXicXuDUHTDQO8RWCmjAb61iSWTUJr5LAA3%2FGWBqLnac4SB4JfSR4s3EO5NzAqFOCgBUYxjyWG8AHmlBt5%2BQSZOKynOUGsv5XR03ZA9TSnAfnqQZgL68hiEZsYUv13aqVnEp1WTGe9md6obXPr0EZLUmvk3KrNkSo0hkJwHop8126XksXBWMl1en%2FZMk%2B%2BMj%2FQCERhO%2F%2F6KjMJG6J%2FA%2BiWpoJ6BvzKmYCSrG2xq%2BAKNxjDPAWJa2cdHUiDzAHzxPvFb%2F6MEJFHjwSb8C6IILHj3623MG0fZEfNEdtmEmQi%2FCf9VGRZ1%2B2ZHz2C3dwwe3Nek%2FgyN9%2BlQly6PmrrIRyKs%2F0RlLfkgOih0W3tsqAV%2BxjF9GA4U0NqnXck5s90SCHrrIMQolGENSANFbYlW6h5mfSUrmC0hlTLViPR0slFk64wAXu3JvyeFTVJQt8jw5ShsOnq0Kcak9B2yYHcefjOX%2FhEu7dD4u7UjKfZ4qeGwiJDfnQb7vx4BpwL%2BfGlt520BgGNbHeyUgENxbugzJW1ofClDO64eC5MVxDgYh8oLgj56wps5n70jFGg%2Bo%2B%2FF0szQp8C1mCK5TjRiYSP%2BDWSrJgBgdg%2FPh0Kg%2Bk42loVbqSxu%2B1raCnW%2FNVT2NPmUhlAhxLnZ%2FjSDqMi1aCtDxtxgVUcnWR%2F3gULtbWNaG247d%2FmKM3kQcFFPOpgtZNZ5u6mhP9zH1k%2FaMZoqJQS9Amr1m7U5cWqZmbl0ilYtoz7jyVpnyZVqba6o96SCuWkS5n51by6rTd%2BycCPAhXpg1aiv3BK%2F%2FMKqXwa8GOrEB21y2QcpWEfKwQqpn9nEj8FIJJ4zaE7tf%2Bvfi5iTrZczS%2Buq66xAW9CKaTdAkIPYDzKgrJavexkPMzpGkgbrwjvYAJnEGMMVk3JRGKauRU7G9azxXC2IgzQG6jC1b7QhIbAQbuGOwrHBBHhouykiHHarVpNuszasyGEvyrpuDYIO5le4d%2BVCgj2kEPjGu69W%2F9SyzQZVAs%2B%2B4%2F5dWaulB9nVZKP3QJzHgicSS9gfG8z68&X-Amz-Algorithm=AWS4-HMAC-SHA256&X-Amz-Date=20240312T134632Z&X-Amz-SignedHeaders=host&X-Amz-Expires=3599&X-Amz-Credential=ASIASXCYXIIFIALL2LNA%2F20240312%2Fus-east-1%2Fs3%2Faws4_request&X-Amz-Signature=e84e85eba09c4a6ecbb36c87199aae42223a90d28917a0a0e7a000e8f5e495db",
                 "calories": 624.5693671078286,
                 "totalTime": 0.0
             },
             "_links": {
                 "self": {
                     "title": "Self",
                     "href": "https://api.edamam.com/api/recipes/v2/a7f02241e5e6736cc327e4086210c36f?type=public&app_id=cb462440&app_key=7e02a24790f9c127571b1a3bad7028d5"
                 }
             }
         },
         {
             "recipe": {
                 "uri": "http://www.edamam.com/ontologies/edamam.owl#recipe_49a84c67a06f543225fb2ab389223da2",
                 "label": "Chicken Fettuccine Alfredo recipes",
                 "image": "https://edamam-product-images.s3.amazonaws.com/web-img/bc5/bc5fdcf075ace7209873a74940f39e23?X-Amz-Security-Token=IQoJb3JpZ2luX2VjED0aCXVzLWVhc3QtMSJHMEUCIGiUORTPpjaFUKKe8ixCvMfV9dn7i8aau9qXN9a04BWTAiEAraLTnFHE8xMM7Tmj84s20nvYKBanT%2FhK5FFhNg76p74quQUIRhAAGgwxODcwMTcxNTA5ODYiDBGf35bP84m5p%2Fb8YSqWBb3ialcIsjhGRYbgT%2BSxxTEFySEgiUHavfSQtL4bXpzH1499R8BkZSpnQVxvtMnBhTcb8iRED%2BovGZHmn7qEO1T5%2BXicXuDUHTDQO8RWCmjAb61iSWTUJr5LAA3%2FGWBqLnac4SB4JfSR4s3EO5NzAqFOCgBUYxjyWG8AHmlBt5%2BQSZOKynOUGsv5XR03ZA9TSnAfnqQZgL68hiEZsYUv13aqVnEp1WTGe9md6obXPr0EZLUmvk3KrNkSo0hkJwHop8126XksXBWMl1en%2FZMk%2B%2BMj%2FQCERhO%2F%2F6KjMJG6J%2FA%2BiWpoJ6BvzKmYCSrG2xq%2BAKNxjDPAWJa2cdHUiDzAHzxPvFb%2F6MEJFHjwSb8C6IILHj3623MG0fZEfNEdtmEmQi%2FCf9VGRZ1%2B2ZHz2C3dwwe3Nek%2FgyN9%2BlQly6PmrrIRyKs%2F0RlLfkgOih0W3tsqAV%2BxjF9GA4U0NqnXck5s90SCHrrIMQolGENSANFbYlW6h5mfSUrmC0hlTLViPR0slFk64wAXu3JvyeFTVJQt8jw5ShsOnq0Kcak9B2yYHcefjOX%2FhEu7dD4u7UjKfZ4qeGwiJDfnQb7vx4BpwL%2BfGlt520BgGNbHeyUgENxbugzJW1ofClDO64eC5MVxDgYh8oLgj56wps5n70jFGg%2Bo%2B%2FF0szQp8C1mCK5TjRiYSP%2BDWSrJgBgdg%2FPh0Kg%2Bk42loVbqSxu%2B1raCnW%2FNVT2NPmUhlAhxLnZ%2FjSDqMi1aCtDxtxgVUcnWR%2F3gULtbWNaG247d%2FmKM3kQcFFPOpgtZNZ5u6mhP9zH1k%2FaMZoqJQS9Amr1m7U5cWqZmbl0ilYtoz7jyVpnyZVqba6o96SCuWkS5n51by6rTd%2BycCPAhXpg1aiv3BK%2F%2FMKqXwa8GOrEB21y2QcpWEfKwQqpn9nEj8FIJJ4zaE7tf%2Bvfi5iTrZczS%2Buq66xAW9CKaTdAkIPYDzKgrJavexkPMzpGkgbrwjvYAJnEGMMVk3JRGKauRU7G9azxXC2IgzQG6jC1b7QhIbAQbuGOwrHBBHhouykiHHarVpNuszasyGEvyrpuDYIO5le4d%2BVCgj2kEPjGu69W%2F9SyzQZVAs%2B%2B4%2F5dWaulB9nVZKP3QJzHgicSS9gfG8z68&X-Amz-Algorithm=AWS4-HMAC-SHA256&X-Amz-Date=20240312T134632Z&X-Amz-SignedHeaders=host&X-Amz-Expires=3600&X-Amz-Credential=ASIASXCYXIIFIALL2LNA%2F20240312%2Fus-east-1%2Fs3%2Faws4_request&X-Amz-Signature=774a698e4b914e6d01f1b881c7e82ea3adda227bc90f0280db0467e25b8d8081",
                 "calories": 5155.491269891561,
                 "totalTime": 25.0
             },
             "_links": {
                 "self": {
                     "title": "Self",
                     "href": "https://api.edamam.com/api/recipes/v2/49a84c67a06f543225fb2ab389223da2?type=public&app_id=cb462440&app_key=7e02a24790f9c127571b1a3bad7028d5"
                 }
             }
         },
         {
             "recipe": {
                 "uri": "http://www.edamam.com/ontologies/edamam.owl#recipe_e5c97b9cde989f514eb5c809d20c32d7",
                 "label": "Chicken and Veggie Tortellini Casserole recipes",
                 "image": "https://edamam-product-images.s3.amazonaws.com/web-img/5cb/5cbc1144ec1f3352e8a33cab32818dfd?X-Amz-Security-Token=IQoJb3JpZ2luX2VjED0aCXVzLWVhc3QtMSJHMEUCIGiUORTPpjaFUKKe8ixCvMfV9dn7i8aau9qXN9a04BWTAiEAraLTnFHE8xMM7Tmj84s20nvYKBanT%2FhK5FFhNg76p74quQUIRhAAGgwxODcwMTcxNTA5ODYiDBGf35bP84m5p%2Fb8YSqWBb3ialcIsjhGRYbgT%2BSxxTEFySEgiUHavfSQtL4bXpzH1499R8BkZSpnQVxvtMnBhTcb8iRED%2BovGZHmn7qEO1T5%2BXicXuDUHTDQO8RWCmjAb61iSWTUJr5LAA3%2FGWBqLnac4SB4JfSR4s3EO5NzAqFOCgBUYxjyWG8AHmlBt5%2BQSZOKynOUGsv5XR03ZA9TSnAfnqQZgL68hiEZsYUv13aqVnEp1WTGe9md6obXPr0EZLUmvk3KrNkSo0hkJwHop8126XksXBWMl1en%2FZMk%2B%2BMj%2FQCERhO%2F%2F6KjMJG6J%2FA%2BiWpoJ6BvzKmYCSrG2xq%2BAKNxjDPAWJa2cdHUiDzAHzxPvFb%2F6MEJFHjwSb8C6IILHj3623MG0fZEfNEdtmEmQi%2FCf9VGRZ1%2B2ZHz2C3dwwe3Nek%2FgyN9%2BlQly6PmrrIRyKs%2F0RlLfkgOih0W3tsqAV%2BxjF9GA4U0NqnXck5s90SCHrrIMQolGENSANFbYlW6h5mfSUrmC0hlTLViPR0slFk64wAXu3JvyeFTVJQt8jw5ShsOnq0Kcak9B2yYHcefjOX%2FhEu7dD4u7UjKfZ4qeGwiJDfnQb7vx4BpwL%2BfGlt520BgGNbHeyUgENxbugzJW1ofClDO64eC5MVxDgYh8oLgj56wps5n70jFGg%2Bo%2B%2FF0szQp8C1mCK5TjRiYSP%2BDWSrJgBgdg%2FPh0Kg%2Bk42loVbqSxu%2B1raCnW%2FNVT2NPmUhlAhxLnZ%2FjSDqMi1aCtDxtxgVUcnWR%2F3gULtbWNaG247d%2FmKM3kQcFFPOpgtZNZ5u6mhP9zH1k%2FaMZoqJQS9Amr1m7U5cWqZmbl0ilYtoz7jyVpnyZVqba6o96SCuWkS5n51by6rTd%2BycCPAhXpg1aiv3BK%2F%2FMKqXwa8GOrEB21y2QcpWEfKwQqpn9nEj8FIJJ4zaE7tf%2Bvfi5iTrZczS%2Buq66xAW9CKaTdAkIPYDzKgrJavexkPMzpGkgbrwjvYAJnEGMMVk3JRGKauRU7G9azxXC2IgzQG6jC1b7QhIbAQbuGOwrHBBHhouykiHHarVpNuszasyGEvyrpuDYIO5le4d%2BVCgj2kEPjGu69W%2F9SyzQZVAs%2B%2B4%2F5dWaulB9nVZKP3QJzHgicSS9gfG8z68&X-Amz-Algorithm=AWS4-HMAC-SHA256&X-Amz-Date=20240312T134632Z&X-Amz-SignedHeaders=host&X-Amz-Expires=3600&X-Amz-Credential=ASIASXCYXIIFIALL2LNA%2F20240312%2Fus-east-1%2Fs3%2Faws4_request&X-Amz-Signature=608d9f172aaf02f8e4ec988839a706a58aa653fec732a41e3c7da47d739cda1f",
                 "calories": 4022.8696422145836,
                 "totalTime": 40.0
             },
             "_links": {
                 "self": {
                     "title": "Self",
                     "href": "https://api.edamam.com/api/recipes/v2/e5c97b9cde989f514eb5c809d20c32d7?type=public&app_id=cb462440&app_key=7e02a24790f9c127571b1a3bad7028d5"
                 }
             }
         },
         {
             "recipe": {
                 "uri": "http://www.edamam.com/ontologies/edamam.owl#recipe_74889e6b31e625af9400ec850840665a",
                 "label": "Wild Rice Casserole",
                 "image": "https://edamam-product-images.s3.amazonaws.com/web-img/3cb/3cb41a2fd2b75f20aa885eb6c2e319fa.jpg?X-Amz-Security-Token=IQoJb3JpZ2luX2VjED0aCXVzLWVhc3QtMSJHMEUCIGiUORTPpjaFUKKe8ixCvMfV9dn7i8aau9qXN9a04BWTAiEAraLTnFHE8xMM7Tmj84s20nvYKBanT%2FhK5FFhNg76p74quQUIRhAAGgwxODcwMTcxNTA5ODYiDBGf35bP84m5p%2Fb8YSqWBb3ialcIsjhGRYbgT%2BSxxTEFySEgiUHavfSQtL4bXpzH1499R8BkZSpnQVxvtMnBhTcb8iRED%2BovGZHmn7qEO1T5%2BXicXuDUHTDQO8RWCmjAb61iSWTUJr5LAA3%2FGWBqLnac4SB4JfSR4s3EO5NzAqFOCgBUYxjyWG8AHmlBt5%2BQSZOKynOUGsv5XR03ZA9TSnAfnqQZgL68hiEZsYUv13aqVnEp1WTGe9md6obXPr0EZLUmvk3KrNkSo0hkJwHop8126XksXBWMl1en%2FZMk%2B%2BMj%2FQCERhO%2F%2F6KjMJG6J%2FA%2BiWpoJ6BvzKmYCSrG2xq%2BAKNxjDPAWJa2cdHUiDzAHzxPvFb%2F6MEJFHjwSb8C6IILHj3623MG0fZEfNEdtmEmQi%2FCf9VGRZ1%2B2ZHz2C3dwwe3Nek%2FgyN9%2BlQly6PmrrIRyKs%2F0RlLfkgOih0W3tsqAV%2BxjF9GA4U0NqnXck5s90SCHrrIMQolGENSANFbYlW6h5mfSUrmC0hlTLViPR0slFk64wAXu3JvyeFTVJQt8jw5ShsOnq0Kcak9B2yYHcefjOX%2FhEu7dD4u7UjKfZ4qeGwiJDfnQb7vx4BpwL%2BfGlt520BgGNbHeyUgENxbugzJW1ofClDO64eC5MVxDgYh8oLgj56wps5n70jFGg%2Bo%2B%2FF0szQp8C1mCK5TjRiYSP%2BDWSrJgBgdg%2FPh0Kg%2Bk42loVbqSxu%2B1raCnW%2FNVT2NPmUhlAhxLnZ%2FjSDqMi1aCtDxtxgVUcnWR%2F3gULtbWNaG247d%2FmKM3kQcFFPOpgtZNZ5u6mhP9zH1k%2FaMZoqJQS9Amr1m7U5cWqZmbl0ilYtoz7jyVpnyZVqba6o96SCuWkS5n51by6rTd%2BycCPAhXpg1aiv3BK%2F%2FMKqXwa8GOrEB21y2QcpWEfKwQqpn9nEj8FIJJ4zaE7tf%2Bvfi5iTrZczS%2Buq66xAW9CKaTdAkIPYDzKgrJavexkPMzpGkgbrwjvYAJnEGMMVk3JRGKauRU7G9azxXC2IgzQG6jC1b7QhIbAQbuGOwrHBBHhouykiHHarVpNuszasyGEvyrpuDYIO5le4d%2BVCgj2kEPjGu69W%2F9SyzQZVAs%2B%2B4%2F5dWaulB9nVZKP3QJzHgicSS9gfG8z68&X-Amz-Algorithm=AWS4-HMAC-SHA256&X-Amz-Date=20240312T134632Z&X-Amz-SignedHeaders=host&X-Amz-Expires=3600&X-Amz-Credential=ASIASXCYXIIFIALL2LNA%2F20240312%2Fus-east-1%2Fs3%2Faws4_request&X-Amz-Signature=93b1bab8e4fb998c95a2cb09754f09ce4165472b55462b81ba8fb717913ba430",
                 "calories": 1439.170798275,
                 "totalTime": 95.0
             },
             "_links": {
                 "self": {
                     "title": "Self",
                     "href": "https://api.edamam.com/api/recipes/v2/74889e6b31e625af9400ec850840665a?type=public&app_id=cb462440&app_key=7e02a24790f9c127571b1a3bad7028d5"
                 }
             }
         },
         {
             "recipe": {
                 "uri": "http://www.edamam.com/ontologies/edamam.owl#recipe_ea29f920d22f43af3401e57b31764ed4",
                 "label": "Cheese and Chicken Enchiladas Recipe 4",
                 "image": "https://edamam-product-images.s3.amazonaws.com/web-img/127/127181609aca6d521f8f0bc7afa6ff1e.jpg?X-Amz-Security-Token=IQoJb3JpZ2luX2VjED0aCXVzLWVhc3QtMSJHMEUCIGiUORTPpjaFUKKe8ixCvMfV9dn7i8aau9qXN9a04BWTAiEAraLTnFHE8xMM7Tmj84s20nvYKBanT%2FhK5FFhNg76p74quQUIRhAAGgwxODcwMTcxNTA5ODYiDBGf35bP84m5p%2Fb8YSqWBb3ialcIsjhGRYbgT%2BSxxTEFySEgiUHavfSQtL4bXpzH1499R8BkZSpnQVxvtMnBhTcb8iRED%2BovGZHmn7qEO1T5%2BXicXuDUHTDQO8RWCmjAb61iSWTUJr5LAA3%2FGWBqLnac4SB4JfSR4s3EO5NzAqFOCgBUYxjyWG8AHmlBt5%2BQSZOKynOUGsv5XR03ZA9TSnAfnqQZgL68hiEZsYUv13aqVnEp1WTGe9md6obXPr0EZLUmvk3KrNkSo0hkJwHop8126XksXBWMl1en%2FZMk%2B%2BMj%2FQCERhO%2F%2F6KjMJG6J%2FA%2BiWpoJ6BvzKmYCSrG2xq%2BAKNxjDPAWJa2cdHUiDzAHzxPvFb%2F6MEJFHjwSb8C6IILHj3623MG0fZEfNEdtmEmQi%2FCf9VGRZ1%2B2ZHz2C3dwwe3Nek%2FgyN9%2BlQly6PmrrIRyKs%2F0RlLfkgOih0W3tsqAV%2BxjF9GA4U0NqnXck5s90SCHrrIMQolGENSANFbYlW6h5mfSUrmC0hlTLViPR0slFk64wAXu3JvyeFTVJQt8jw5ShsOnq0Kcak9B2yYHcefjOX%2FhEu7dD4u7UjKfZ4qeGwiJDfnQb7vx4BpwL%2BfGlt520BgGNbHeyUgENxbugzJW1ofClDO64eC5MVxDgYh8oLgj56wps5n70jFGg%2Bo%2B%2FF0szQp8C1mCK5TjRiYSP%2BDWSrJgBgdg%2FPh0Kg%2Bk42loVbqSxu%2B1raCnW%2FNVT2NPmUhlAhxLnZ%2FjSDqMi1aCtDxtxgVUcnWR%2F3gULtbWNaG247d%2FmKM3kQcFFPOpgtZNZ5u6mhP9zH1k%2FaMZoqJQS9Amr1m7U5cWqZmbl0ilYtoz7jyVpnyZVqba6o96SCuWkS5n51by6rTd%2BycCPAhXpg1aiv3BK%2F%2FMKqXwa8GOrEB21y2QcpWEfKwQqpn9nEj8FIJJ4zaE7tf%2Bvfi5iTrZczS%2Buq66xAW9CKaTdAkIPYDzKgrJavexkPMzpGkgbrwjvYAJnEGMMVk3JRGKauRU7G9azxXC2IgzQG6jC1b7QhIbAQbuGOwrHBBHhouykiHHarVpNuszasyGEvyrpuDYIO5le4d%2BVCgj2kEPjGu69W%2F9SyzQZVAs%2B%2B4%2F5dWaulB9nVZKP3QJzHgicSS9gfG8z68&X-Amz-Algorithm=AWS4-HMAC-SHA256&X-Amz-Date=20240312T134632Z&X-Amz-SignedHeaders=host&X-Amz-Expires=3600&X-Amz-Credential=ASIASXCYXIIFIALL2LNA%2F20240312%2Fus-east-1%2Fs3%2Faws4_request&X-Amz-Signature=7b6dbf96671951a4559943c87618a061e9561533c3b7b276dcd276c942501e49",
                 "calories": 2278.4331543562503,
                 "totalTime": 20.0
             },
             "_links": {
                 "self": {
                     "title": "Self",
                     "href": "https://api.edamam.com/api/recipes/v2/ea29f920d22f43af3401e57b31764ed4?type=public&app_id=cb462440&app_key=7e02a24790f9c127571b1a3bad7028d5"
                 }
             }
         },
         {
             "recipe": {
                 "uri": "http://www.edamam.com/ontologies/edamam.owl#recipe_a4da4ed2c751f540f0e8aded95470f7e",
                 "label": "Keto Cauliflower Rice Stuffing",
                 "image": "https://edamam-product-images.s3.amazonaws.com/web-img/978/978117ed21b7c9902b6383e6e4464748.jpg?X-Amz-Security-Token=IQoJb3JpZ2luX2VjED0aCXVzLWVhc3QtMSJHMEUCIGiUORTPpjaFUKKe8ixCvMfV9dn7i8aau9qXN9a04BWTAiEAraLTnFHE8xMM7Tmj84s20nvYKBanT%2FhK5FFhNg76p74quQUIRhAAGgwxODcwMTcxNTA5ODYiDBGf35bP84m5p%2Fb8YSqWBb3ialcIsjhGRYbgT%2BSxxTEFySEgiUHavfSQtL4bXpzH1499R8BkZSpnQVxvtMnBhTcb8iRED%2BovGZHmn7qEO1T5%2BXicXuDUHTDQO8RWCmjAb61iSWTUJr5LAA3%2FGWBqLnac4SB4JfSR4s3EO5NzAqFOCgBUYxjyWG8AHmlBt5%2BQSZOKynOUGsv5XR03ZA9TSnAfnqQZgL68hiEZsYUv13aqVnEp1WTGe9md6obXPr0EZLUmvk3KrNkSo0hkJwHop8126XksXBWMl1en%2FZMk%2B%2BMj%2FQCERhO%2F%2F6KjMJG6J%2FA%2BiWpoJ6BvzKmYCSrG2xq%2BAKNxjDPAWJa2cdHUiDzAHzxPvFb%2F6MEJFHjwSb8C6IILHj3623MG0fZEfNEdtmEmQi%2FCf9VGRZ1%2B2ZHz2C3dwwe3Nek%2FgyN9%2BlQly6PmrrIRyKs%2F0RlLfkgOih0W3tsqAV%2BxjF9GA4U0NqnXck5s90SCHrrIMQolGENSANFbYlW6h5mfSUrmC0hlTLViPR0slFk64wAXu3JvyeFTVJQt8jw5ShsOnq0Kcak9B2yYHcefjOX%2FhEu7dD4u7UjKfZ4qeGwiJDfnQb7vx4BpwL%2BfGlt520BgGNbHeyUgENxbugzJW1ofClDO64eC5MVxDgYh8oLgj56wps5n70jFGg%2Bo%2B%2FF0szQp8C1mCK5TjRiYSP%2BDWSrJgBgdg%2FPh0Kg%2Bk42loVbqSxu%2B1raCnW%2FNVT2NPmUhlAhxLnZ%2FjSDqMi1aCtDxtxgVUcnWR%2F3gULtbWNaG247d%2FmKM3kQcFFPOpgtZNZ5u6mhP9zH1k%2FaMZoqJQS9Amr1m7U5cWqZmbl0ilYtoz7jyVpnyZVqba6o96SCuWkS5n51by6rTd%2BycCPAhXpg1aiv3BK%2F%2FMKqXwa8GOrEB21y2QcpWEfKwQqpn9nEj8FIJJ4zaE7tf%2Bvfi5iTrZczS%2Buq66xAW9CKaTdAkIPYDzKgrJavexkPMzpGkgbrwjvYAJnEGMMVk3JRGKauRU7G9azxXC2IgzQG6jC1b7QhIbAQbuGOwrHBBHhouykiHHarVpNuszasyGEvyrpuDYIO5le4d%2BVCgj2kEPjGu69W%2F9SyzQZVAs%2B%2B4%2F5dWaulB9nVZKP3QJzHgicSS9gfG8z68&X-Amz-Algorithm=AWS4-HMAC-SHA256&X-Amz-Date=20240312T134632Z&X-Amz-SignedHeaders=host&X-Amz-Expires=3600&X-Amz-Credential=ASIASXCYXIIFIALL2LNA%2F20240312%2Fus-east-1%2Fs3%2Faws4_request&X-Amz-Signature=d84e27d6f38212d6c0a200115ba4bf0fea35a506421f0a0c9e2807132f5c2d15",
                 "calories": 1051.1445128000635,
                 "totalTime": 25.0
             },
             "_links": {
                 "self": {
                     "title": "Self",
                     "href": "https://api.edamam.com/api/recipes/v2/a4da4ed2c751f540f0e8aded95470f7e?type=public&app_id=cb462440&app_key=7e02a24790f9c127571b1a3bad7028d5"
                 }
             }
         },
         {
             "recipe": {
                 "uri": "http://www.edamam.com/ontologies/edamam.owl#recipe_a8bb759ecccadf95ebc40157a875ccef",
                 "label": "Herb Roasted Turkey",
                 "image": "https://edamam-product-images.s3.amazonaws.com/web-img/510/510fcbc7a88195e5dd25ed3eea3336bb.jpg?X-Amz-Security-Token=IQoJb3JpZ2luX2VjED0aCXVzLWVhc3QtMSJHMEUCIGiUORTPpjaFUKKe8ixCvMfV9dn7i8aau9qXN9a04BWTAiEAraLTnFHE8xMM7Tmj84s20nvYKBanT%2FhK5FFhNg76p74quQUIRhAAGgwxODcwMTcxNTA5ODYiDBGf35bP84m5p%2Fb8YSqWBb3ialcIsjhGRYbgT%2BSxxTEFySEgiUHavfSQtL4bXpzH1499R8BkZSpnQVxvtMnBhTcb8iRED%2BovGZHmn7qEO1T5%2BXicXuDUHTDQO8RWCmjAb61iSWTUJr5LAA3%2FGWBqLnac4SB4JfSR4s3EO5NzAqFOCgBUYxjyWG8AHmlBt5%2BQSZOKynOUGsv5XR03ZA9TSnAfnqQZgL68hiEZsYUv13aqVnEp1WTGe9md6obXPr0EZLUmvk3KrNkSo0hkJwHop8126XksXBWMl1en%2FZMk%2B%2BMj%2FQCERhO%2F%2F6KjMJG6J%2FA%2BiWpoJ6BvzKmYCSrG2xq%2BAKNxjDPAWJa2cdHUiDzAHzxPvFb%2F6MEJFHjwSb8C6IILHj3623MG0fZEfNEdtmEmQi%2FCf9VGRZ1%2B2ZHz2C3dwwe3Nek%2FgyN9%2BlQly6PmrrIRyKs%2F0RlLfkgOih0W3tsqAV%2BxjF9GA4U0NqnXck5s90SCHrrIMQolGENSANFbYlW6h5mfSUrmC0hlTLViPR0slFk64wAXu3JvyeFTVJQt8jw5ShsOnq0Kcak9B2yYHcefjOX%2FhEu7dD4u7UjKfZ4qeGwiJDfnQb7vx4BpwL%2BfGlt520BgGNbHeyUgENxbugzJW1ofClDO64eC5MVxDgYh8oLgj56wps5n70jFGg%2Bo%2B%2FF0szQp8C1mCK5TjRiYSP%2BDWSrJgBgdg%2FPh0Kg%2Bk42loVbqSxu%2B1raCnW%2FNVT2NPmUhlAhxLnZ%2FjSDqMi1aCtDxtxgVUcnWR%2F3gULtbWNaG247d%2FmKM3kQcFFPOpgtZNZ5u6mhP9zH1k%2FaMZoqJQS9Amr1m7U5cWqZmbl0ilYtoz7jyVpnyZVqba6o96SCuWkS5n51by6rTd%2BycCPAhXpg1aiv3BK%2F%2FMKqXwa8GOrEB21y2QcpWEfKwQqpn9nEj8FIJJ4zaE7tf%2Bvfi5iTrZczS%2Buq66xAW9CKaTdAkIPYDzKgrJavexkPMzpGkgbrwjvYAJnEGMMVk3JRGKauRU7G9azxXC2IgzQG6jC1b7QhIbAQbuGOwrHBBHhouykiHHarVpNuszasyGEvyrpuDYIO5le4d%2BVCgj2kEPjGu69W%2F9SyzQZVAs%2B%2B4%2F5dWaulB9nVZKP3QJzHgicSS9gfG8z68&X-Amz-Algorithm=AWS4-HMAC-SHA256&X-Amz-Date=20240312T134632Z&X-Amz-SignedHeaders=host&X-Amz-Expires=3600&X-Amz-Credential=ASIASXCYXIIFIALL2LNA%2F20240312%2Fus-east-1%2Fs3%2Faws4_request&X-Amz-Signature=2f71b7880b13b80d16178cef99c7a2d8e3194ca1adcb10a1968c1c76b8510ff7",
                 "calories": 9916.94775939097,
                 "totalTime": 0.0
             },
             "_links": {
                 "self": {
                     "title": "Self",
                     "href": "https://api.edamam.com/api/recipes/v2/a8bb759ecccadf95ebc40157a875ccef?type=public&app_id=cb462440&app_key=7e02a24790f9c127571b1a3bad7028d5"
                 }
             }
         },
         {
             "recipe": {
                 "uri": "http://www.edamam.com/ontologies/edamam.owl#recipe_d7bdb28322f28107deb83848bbbd1094",
                 "label": "Healthy Carbonara With Veggies and Chicken",
                 "image": "https://edamam-product-images.s3.amazonaws.com/web-img/b0b/b0b5eb10de4722c4bb9b466b99a98baf.jpg?X-Amz-Security-Token=IQoJb3JpZ2luX2VjED0aCXVzLWVhc3QtMSJHMEUCIGiUORTPpjaFUKKe8ixCvMfV9dn7i8aau9qXN9a04BWTAiEAraLTnFHE8xMM7Tmj84s20nvYKBanT%2FhK5FFhNg76p74quQUIRhAAGgwxODcwMTcxNTA5ODYiDBGf35bP84m5p%2Fb8YSqWBb3ialcIsjhGRYbgT%2BSxxTEFySEgiUHavfSQtL4bXpzH1499R8BkZSpnQVxvtMnBhTcb8iRED%2BovGZHmn7qEO1T5%2BXicXuDUHTDQO8RWCmjAb61iSWTUJr5LAA3%2FGWBqLnac4SB4JfSR4s3EO5NzAqFOCgBUYxjyWG8AHmlBt5%2BQSZOKynOUGsv5XR03ZA9TSnAfnqQZgL68hiEZsYUv13aqVnEp1WTGe9md6obXPr0EZLUmvk3KrNkSo0hkJwHop8126XksXBWMl1en%2FZMk%2B%2BMj%2FQCERhO%2F%2F6KjMJG6J%2FA%2BiWpoJ6BvzKmYCSrG2xq%2BAKNxjDPAWJa2cdHUiDzAHzxPvFb%2F6MEJFHjwSb8C6IILHj3623MG0fZEfNEdtmEmQi%2FCf9VGRZ1%2B2ZHz2C3dwwe3Nek%2FgyN9%2BlQly6PmrrIRyKs%2F0RlLfkgOih0W3tsqAV%2BxjF9GA4U0NqnXck5s90SCHrrIMQolGENSANFbYlW6h5mfSUrmC0hlTLViPR0slFk64wAXu3JvyeFTVJQt8jw5ShsOnq0Kcak9B2yYHcefjOX%2FhEu7dD4u7UjKfZ4qeGwiJDfnQb7vx4BpwL%2BfGlt520BgGNbHeyUgENxbugzJW1ofClDO64eC5MVxDgYh8oLgj56wps5n70jFGg%2Bo%2B%2FF0szQp8C1mCK5TjRiYSP%2BDWSrJgBgdg%2FPh0Kg%2Bk42loVbqSxu%2B1raCnW%2FNVT2NPmUhlAhxLnZ%2FjSDqMi1aCtDxtxgVUcnWR%2F3gULtbWNaG247d%2FmKM3kQcFFPOpgtZNZ5u6mhP9zH1k%2FaMZoqJQS9Amr1m7U5cWqZmbl0ilYtoz7jyVpnyZVqba6o96SCuWkS5n51by6rTd%2BycCPAhXpg1aiv3BK%2F%2FMKqXwa8GOrEB21y2QcpWEfKwQqpn9nEj8FIJJ4zaE7tf%2Bvfi5iTrZczS%2Buq66xAW9CKaTdAkIPYDzKgrJavexkPMzpGkgbrwjvYAJnEGMMVk3JRGKauRU7G9azxXC2IgzQG6jC1b7QhIbAQbuGOwrHBBHhouykiHHarVpNuszasyGEvyrpuDYIO5le4d%2BVCgj2kEPjGu69W%2F9SyzQZVAs%2B%2B4%2F5dWaulB9nVZKP3QJzHgicSS9gfG8z68&X-Amz-Algorithm=AWS4-HMAC-SHA256&X-Amz-Date=20240312T134632Z&X-Amz-SignedHeaders=host&X-Amz-Expires=3600&X-Amz-Credential=ASIASXCYXIIFIALL2LNA%2F20240312%2Fus-east-1%2Fs3%2Faws4_request&X-Amz-Signature=f7d92b673298a46d83af15fffe33bcfe37e0702c893f02fea14f8d5f5914a7b3",
                 "calories": 2720.637426303273,
                 "totalTime": 0.0
             },
             "_links": {
                 "self": {
                     "title": "Self",
                     "href": "https://api.edamam.com/api/recipes/v2/d7bdb28322f28107deb83848bbbd1094?type=public&app_id=cb462440&app_key=7e02a24790f9c127571b1a3bad7028d5"
                 }
             }
         },
         {
             "recipe": {
                 "uri": "http://www.edamam.com/ontologies/edamam.owl#recipe_a60fc338c1ccbc4616ddcb4fb4042886",
                 "label": "Asian Pork Wraps",
                 "image": "https://edamam-product-images.s3.amazonaws.com/web-img/72f/72fef559b57a8cdb6e5d02f6556088d4.jpg?X-Amz-Security-Token=IQoJb3JpZ2luX2VjED0aCXVzLWVhc3QtMSJHMEUCIGiUORTPpjaFUKKe8ixCvMfV9dn7i8aau9qXN9a04BWTAiEAraLTnFHE8xMM7Tmj84s20nvYKBanT%2FhK5FFhNg76p74quQUIRhAAGgwxODcwMTcxNTA5ODYiDBGf35bP84m5p%2Fb8YSqWBb3ialcIsjhGRYbgT%2BSxxTEFySEgiUHavfSQtL4bXpzH1499R8BkZSpnQVxvtMnBhTcb8iRED%2BovGZHmn7qEO1T5%2BXicXuDUHTDQO8RWCmjAb61iSWTUJr5LAA3%2FGWBqLnac4SB4JfSR4s3EO5NzAqFOCgBUYxjyWG8AHmlBt5%2BQSZOKynOUGsv5XR03ZA9TSnAfnqQZgL68hiEZsYUv13aqVnEp1WTGe9md6obXPr0EZLUmvk3KrNkSo0hkJwHop8126XksXBWMl1en%2FZMk%2B%2BMj%2FQCERhO%2F%2F6KjMJG6J%2FA%2BiWpoJ6BvzKmYCSrG2xq%2BAKNxjDPAWJa2cdHUiDzAHzxPvFb%2F6MEJFHjwSb8C6IILHj3623MG0fZEfNEdtmEmQi%2FCf9VGRZ1%2B2ZHz2C3dwwe3Nek%2FgyN9%2BlQly6PmrrIRyKs%2F0RlLfkgOih0W3tsqAV%2BxjF9GA4U0NqnXck5s90SCHrrIMQolGENSANFbYlW6h5mfSUrmC0hlTLViPR0slFk64wAXu3JvyeFTVJQt8jw5ShsOnq0Kcak9B2yYHcefjOX%2FhEu7dD4u7UjKfZ4qeGwiJDfnQb7vx4BpwL%2BfGlt520BgGNbHeyUgENxbugzJW1ofClDO64eC5MVxDgYh8oLgj56wps5n70jFGg%2Bo%2B%2FF0szQp8C1mCK5TjRiYSP%2BDWSrJgBgdg%2FPh0Kg%2Bk42loVbqSxu%2B1raCnW%2FNVT2NPmUhlAhxLnZ%2FjSDqMi1aCtDxtxgVUcnWR%2F3gULtbWNaG247d%2FmKM3kQcFFPOpgtZNZ5u6mhP9zH1k%2FaMZoqJQS9Amr1m7U5cWqZmbl0ilYtoz7jyVpnyZVqba6o96SCuWkS5n51by6rTd%2BycCPAhXpg1aiv3BK%2F%2FMKqXwa8GOrEB21y2QcpWEfKwQqpn9nEj8FIJJ4zaE7tf%2Bvfi5iTrZczS%2Buq66xAW9CKaTdAkIPYDzKgrJavexkPMzpGkgbrwjvYAJnEGMMVk3JRGKauRU7G9azxXC2IgzQG6jC1b7QhIbAQbuGOwrHBBHhouykiHHarVpNuszasyGEvyrpuDYIO5le4d%2BVCgj2kEPjGu69W%2F9SyzQZVAs%2B%2B4%2F5dWaulB9nVZKP3QJzHgicSS9gfG8z68&X-Amz-Algorithm=AWS4-HMAC-SHA256&X-Amz-Date=20240312T134632Z&X-Amz-SignedHeaders=host&X-Amz-Expires=3600&X-Amz-Credential=ASIASXCYXIIFIALL2LNA%2F20240312%2Fus-east-1%2Fs3%2Faws4_request&X-Amz-Signature=e3c506bd67a1b2145085243012e1d840b0cc28ac21b4efea48b5d2aef96f9d65",
                 "calories": 1896.5055954987974,
                 "totalTime": 0.0
             },
             "_links": {
                 "self": {
                     "title": "Self",
                     "href": "https://api.edamam.com/api/recipes/v2/a60fc338c1ccbc4616ddcb4fb4042886?type=public&app_id=cb462440&app_key=7e02a24790f9c127571b1a3bad7028d5"
                 }
             }
         }
     ]
 }
 */

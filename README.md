# NNChallenge
Cocoapods installation is necessary to run the project

Key points:
- MVVM + Clean arquitecture
- Responsive UI

## Main features
* The app communicates with the REST API endpoints.
* The app shows a list of favourite stocks.
* The app allows a stock to be removed from favourites.
* The app allows to search and filter local stocks.
* The app allows to reload favourites.
* The app allows to visualize the detail of each stock.
* The app implements a local persistent database to use as fallback if the main call issues an error.
* All operations are async. 
* The app features a design as close as possible as the Ninety Nine main App

## The app is made up of two screens
### 1. Favourite Page:
This page features a search bar and list of stocks that can be interacted with.
Once the user searches by a keyword the search is done. User can remove favourited stocks by tapping on the heart
![image](https://user-images.githubusercontent.com/25639697/125332931-e9d37800-e349-11eb-9d6c-e4f78a87890b.png)
![image](https://user-images.githubusercontent.com/25639697/125332959-f1931c80-e349-11eb-8243-17f7f1b60635.png)
![image](https://user-images.githubusercontent.com/25639697/125332987-fb1c8480-e349-11eb-8b28-b996c6f2ff0d.png)


### 2. Detail Favourite Page:
This page visualizes the detail that the user has selected in the previous page.
![image](https://user-images.githubusercontent.com/25639697/125333047-112a4500-e34a-11eb-8dd6-2e36b02aefd3.png)

![image](https://user-images.githubusercontent.com/25639697/125332795-c3154180-e349-11eb-857e-808cea8cc378.png)

# MealPlanner-iOS
swift project - meal planner </br>
Environment:</br>
Programmed by Xcode 7.3.1 </br>
How to run: </br>
Use MealPlan.xcodeproj to launch </br>

Description: </br>
1.     Application overview and screenshots </br>
		 	 	 							
The meal planner application is going to help people to have an idea about what to eat for their daily meals. People usually have a situation like spending a long time digging what to eat and how to make delicious food, but ultimately end up with have nothing to do. What we are going to do is building a meal planner app to recommend a healthy, delicious menu, after users picked their meal, the app will record the ingredients of the meal you picked and show them up in Grocery interface. This feature could save a lot of time in your daily shopping, and you do not have to force yourself to remember every ingredients at once, and the only thing you need to do is bring your phone and open this app. 

Screenshots:
run this app, and first showed is lanch screen </br>
![test.jpg](https://github.com/jasonoochen/MealPlanner-iOS/blob/master/Screenshots/0.jpg) </br>
After that, goes into menu interface, you could drag this page down to refresh menu, or hit the top right button to refresh. 
![test.jpg](https://github.com/jasonoochen/MealPlanner-iOS/blob/master/Screenshots/1.jpg) </br>
Pick your favourite meal and click, goes to DetailViewController page, you can click save to save this meal into Plan. 
![test.jpg](https://github.com/jasonoochen/MealPlanner-iOS/blob/master/Screenshots/2.jpg) </br>
Then, you can go to Grocery interface, and check the ingredients of the meal you just added.
![test.jpg](https://github.com/jasonoochen/MealPlanner-iOS/blob/master/Screenshots/3.jpg) </br>
2.     The Model-View-Controller architecture. </br>
The Model component corresponds to all the data-related logic that the user works with.In this application, the Model part include item.swift, itemStore.swift, ItemCell.swift, GroceryItem.swift and GroceryCell.swif. Objects and object functions used in the application defined in model. Controller can initialize objects and use functions defined in model through APIs offered by model. The View component is used for all the UI logic of the application. In this application, basically the view component is the storyboard. The storyboard defines appearance of each page. The controller can send data to storyboard and storyboard may send message to the controller like button clicked. The controller component uses model and communicates with view. In the application, MealPlanViewController initialized Item and ItemStore, and send show data to MealPlanView. MealDetailViewController initialized ItemCell and send data to MealDetailView. TabBarController received data from ItemView and send data to MealPlanView. </br>
3.     Technical details </br>
	This Application built based on MVC module. The appliatioon has thress main parts, controller and switch by tab bar. The interface includes scrollView, stackView, TableView, TableCell, segmented controller and navigation bar. Using segue passing data between TableView and TableCell. Passing data through tabBarController between two TableViews. The application uses thes APIs: UIControlEvents, NSThread, UIImageView, UIColor, segue, segmentedController, UIAlertController, UITabBarController and so on. </br>
4.     Summary and Future Work. </br>
Once again, this app is created base on making people’s lives become more easier. This app can recomend meal and save ingredients of the meal you picked. In the future, we think there are a lot of ways to improve this app. For instance, we can add a function that provide users a chance to make their own meal and help them to calculate food calorie. In addition, we can build a function to connect local market to implement online shopping. 

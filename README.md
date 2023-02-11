# iMemory
Assignment 2 of iOS Development course at RMIT University


1.	Introduction
In modern life, many card games have been created. They are more than just a fun way to pass time, card games also provide mental health benefits as well, alleviating stress and especially improving your memory skills.

The memorization strategy helps to process and retain information that can be useful for people in different situations. Therefore, the spark of an idea to design a card game that embraces users-friendliness, minimalistic and intuitive design that allows the user to improve memory and enhance concentration as well as entertain along the way. Introducing iMemory, a card game that enables users to gradually strengthen their memory with lots of fun. 

2.	How to play
iMemory was created with simple gameplay for everyone to play. Users randomly pick 2 cards, if they are similar, users will have a score and these 2 cards will disappear. In contrast, people have to continue to choose other ones. The game ended when all the cards vanished and the score was at the top of the screen.

The user will select a game mode before playing the game. There are three modes with their scoring method and a different number of cards. 
-	Easy levels contain five similar pairs in which each pair will be rewarded with 10 points. 
-	Medium mode will have two more pairs compared to the easy one; in addition, it has bonus points for users who select cards quickly, with the maximum bonus point being five. 
-	The last level is hard, requiring players to find ten similar pairs and bonus points the same as the medium one; however, it will be minus 5 points if the players choose the wrong cards. There will be no minus if players do not have any scores (score=0). 

Specifically, the scores will be displayed on the leaderboard with the player’s name. If the user exits the game before completing the game, the current score will be saved, and the player cannot edit the score.

3.	Main function:

Home view: 
This is the first view that the user is greeted with when first opening the application. iMemory main view functionalities to navigate to another view. If users wish to play the game, the user will first have to choose the game mode with easy, medium, and hard. Furthermore, a button called “how to play” will show the guidelines for the player as well as selecting the Leaderboard button to see the past score of prior users. 
For this view, I will be using the standard button that holds the navigation link and pressing a button will play a pop-up sound.
<img width="175" alt="image" src="https://user-images.githubusercontent.com/71892904/218258153-7c653fe8-adab-4d5c-b0b0-c2c421823d76.png">
 
Figure 1: Main home screen

Game mode:
The application will show the user different game views and game mechanics according to the user's choice from the main view.
This view will be using animation and a background sound as well as an action sound. When the user clicks on a card, the card will rotate and reveal the content. If chosen two cards that are identical, a matching sound will play to notify the user, otherwise, an unmatched sound will play instead, and the score will be updated accordingly. If the user has chosen all of the cards and wins the game, the application will display a popup view with a winning sound to prompt the user to have won this game. This view will be in the extra feature section mentioned below.
<img width="152" alt="image" src="https://user-images.githubusercontent.com/71892904/218258163-d0fcc81a-5464-48e7-8b89-f789ce87143e.png">
<img width="152" alt="image" src="https://user-images.githubusercontent.com/71892904/218258165-54f4d42e-c0d2-4ba0-8723-8fdf413a4495.png">
<img width="152" alt="image" src="https://user-images.githubusercontent.com/71892904/218258167-76899824-83d8-4943-8f2b-b07731db11df.png">

Figure 2: Easy, Medium, Hard mode from left to right

How to play view:
How to play view shows how the user can play this game. By describing how the game works and how they count user scores. This view will use the basic List function that is available in SwiftUI to utilize consistency with the Apple system and will be offered with a background sound.
<img width="187" alt="image" src="https://user-images.githubusercontent.com/71892904/218258187-0db4a6d2-23b7-402d-a2fb-11bada6b6d2a.png">

Figure 3: How to play view

Leaderboard:
Players can be able to see the scores and names of previous users when selecting the “Leaderboard” button. This view will not rank the user score from highest to lowest, instead, the list will show the order of the most recent user at the bottom. All scores will be registered based on different scoring mechanics in different game modes. If the user cannot finish the whole game and exit during gameplay, the score will be recorded at that moment except for the last attempt score and the user will not be able to edit the score in the future.
This view will have a background sound when opening and will take all of the databases that the application has recorded and render the view accordingly.
<img width="316" alt="image" src="https://user-images.githubusercontent.com/71892904/218258203-cd5024ce-f897-4432-a453-7f970ce16296.png">
 
Figure 4: Leaderboard view
4.	Extra features:
Registration View:
User registration: Before playing the game, iMemory requires players to register their names so the user can view their scores or others' scores on Leaderboard. Once the name is given, the user selects the “Play Game” button to start playing. If the username exists in the app or has been taken by the previous user, the application will prompt the user to choose a different name.
The registration view will be an overlay will on top of the game view. When the user first navigates to the game. The application will first prompt the user with a popup that will ask the user for a username. If the user entered their name and clicks enter, if the username is not already used, the user will hide this popup view. Otherwise, this view will ask the user to enter a different username.

Figure 5: Register view

Setting menu for different game modes:
This function will be available on the main view of the application. User can choose between Easy, Medium and Hard button to be able to navigate to a different game mechanics that will increase the game difficulty.
<img width="191" alt="image" src="https://user-images.githubusercontent.com/71892904/218258194-96c1144f-aed6-4a8a-b07a-fbef0bedcc29.png">

Figure 6: Game mode Setting

Works on iPadOS and MacOS:
This application is designed to be able to work on iPadOS and MacOS:

Figure 7: iMemory on iPad vertical view
<img width="267" alt="image" src="https://user-images.githubusercontent.com/71892904/218258246-b9184485-bc06-40df-9a9c-5cd9c004e283.png">

Figure 8: iMemory on iPad horizontal view
<img width="117" alt="image" src="https://user-images.githubusercontent.com/71892904/218258252-272781a9-e237-4b4a-940c-da937620636d.png">

 
Figure 9: iMemory on MacOS

Works with Dark mode and light mode:

 
Figure 10: iMemory with light mode

 
Figure 11: iMemory with light mode

 
Figure 12: iMemory with light mode

Shuffle game button:
	Users when playing the game will have the opportunity to shuffle the card on the screen. Upon selecting, the application will generate animation and will position the card to the new position randomly.
<img width="468" alt="image" src="https://user-images.githubusercontent.com/71892904/218258211-cf04e416-96da-45c2-a0bf-77717325da39.png">

 
Restart game button:
	Users will have the ability to restart their game session if they want to improve their score. Simply by pressing the “Restart” button, all of the cards that have been matched will reset and all the cards will face down and shuffle to their new location.

 
Hard mode having a bonus time for bonus score:
	When user choosing the hard game mode, besides when selecting the wrong pair of cards will have the scores deducted, the application will offer the user when select a pair of cards that is identical and it is within the bonus time, the game will add more bonus points according to the bonus time remaining. Meaning that the faster the user choose a matching pair, the higher the bonus point the user will gain. The time remaining will be display once the card have been selected.

Condition to register new username:
	Users cannot register for a username that has been taken by the previous player. The list of the username will be available in the leaderboard view and the application will prompt the user to use a different username if that username has existed. Furthermore, the application will not allow a blank username.
<img width="468" alt="image" src="https://user-images.githubusercontent.com/71892904/218258264-2fa52093-1366-4b11-a576-25926ff6b815.png">

 

Winning view:
	After the user has matched all pairs in the game, this will pop up to prompt the user that they have won, and a sound will notify the user of this view.
![Uploading image.png…]()

Link to demo video: https://youtu.be/tmtoa5NwIW0
Link to GitHub repository: https://github.com/PhiThai1309/iMemory


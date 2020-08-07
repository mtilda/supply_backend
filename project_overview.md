# Project Overview

### Description:

A comfortable-to-use inventory management system for small and medium scale groups, such as a household sharing groceries, a small company sharing office supplies, or a community sharing tools.

### User Stories

- As a user, I should be able to know what items are in stock, and what we need more of.
- As a user, when I am out shopping, the app should provide useful statistics to help me make better informed purchases.
- As a user, I should not have to input a lot of precise data to make the app work.
- As a group of users, we should all be able to interact with the app independently without breaking the tracking system.
- As a group of users, it should be easy to add and remove users to/from our group.

### [Wireframes](https://miro.com/app/board/o9J_koemixg=/)

#### MVP
- Deploy backend on Heroku
- Users can access a group and its supplies
- Users can create, edit, and delete supplies
- Users can create, edit, and delete items in the supply
- Users can report that an item is depleted, almost depleted, or replenished
- Users can specify the appropriate unit type and unit (e.g. mass and grams) when inputing and reading data
- Users can view a feed of supply activity
- Users can view a live, sorted inventory that helps with shopping
- Users can normalize the inventory to a specified period of time
- Users can view statistical information about any item in the supply
- Item quantities are continually estimated based on agrigate data, and items are flagged as almost depleted

### Post MVP
- User can recieve push notifications alerting them of changes to the supply
- User can add, edit, and remove users (including themself) from a group
- Users have different permissions within a group
- User can track and split costs, track debts, and make payments to other users to settle debts (Splitwise functionality)
- Users can sign in with passwords using third party authentication
- Deplot to the app store & play store

### Components

- App
- Layout
- GroupTitle
- FooterButtonsContainer
- CreateGroup
- GroupSearch
- SignIn
- Home
- SupplyGrid
- SupplyTile
- Activity
- EventFeed
- Event
- Inventory
- InventoryFeed
- InventoryFeedSection
- InventoryItem
- ItemDetails
- ItemStatistics
- ReplenishButton
- AlmostDepleteButton
- DepleteButton
- ItemForm
- SearchBar

### Additional Libraries
- React Native
- Expo
- React Native Elements
- Bootstrap
- Axios
- FontAwesome

### Code Snippets

```
// awesome code goes here
```
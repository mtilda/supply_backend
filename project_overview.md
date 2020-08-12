# Project Overview

### Description:

An inventory management system for small and medium scale groups, such as a household sharing groceries, a small company sharing office supplies, or a community sharing tools. This app favors user comfort over rigorous data entry, so users can use this app casually and only when they need something from it.

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

### Timetable

##### MVP
|  Task  |  Estimated Time  |  Actual Time  |
|---|---|---|
|  Build basic backend                  |  8 h  |    |
|  Host backend on Heroku               |  1 h  |    |
|  Add data analysis to backend         |  6 h  |    |
|  Build sign-in pages                  |  3 h  |    |
|  Build layout component               |  3 h  |    |
|  Add navigation buttons               |  3 h  |    |
|  Build Home page                      |  1 h  |    |
|  Build event feed components          |  4 h  |    |
|  Build Activity page                  |  1 h  |    |
|  Build ActivitySearchbar component    |  1 h  |    |
|  Build ItemDetails page               |  4 h  |    |
|  Build ItemForm component             |  3 h  |    |
|  Build EditItem page                  |  1 h  |    |
|  Build CreateItem page                |  1 h  |    |
|  Build Inventory feed components      |  5 h  |    |
|  Build Inventory page                 |  2 h  |    |
|  Build InventorySearchbar component   |  4 h  |    |
|  Add normalization to Inventory       |  3 h  |    |
|  Style layout                         |  2 h  |    |
|  Style Activity                       |  2 h  |    |
|  Style Inventory                      |  2 h  |    |
|  Style ItemDetails                    |  2 h  |    |
|  Style ItemForm                       |  2 h  |    |
| Total                                 |  64 h  |    |

### Timeline

Tuesday
- Build basic backend
- Host backend on Heroku
- Analysis to backend

Wednesday
- Build sign-in pages
- Build layout component
- Add navigation buttons
- Build Home page

Thursday
- Build event feed components
- Build Activity page

Friday
- Build ActivitySearchbar component
- Build ItemDetails page
- Build ItemForm component
- Build EditItem page
- Build CreateItem page

Saturday
- Build Inventory feed components
- Build Inventory page

Sunday
- Build InventorySearchbar component
- Add normalization to Inventory

Monday
- Style layout
- Style Activity
- Style Inventory
- Style ItemDetails
- Style ItemForm

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
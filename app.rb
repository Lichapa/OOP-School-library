require './person'
require './student'
require './teacher'
require './book'
require './classroom'
require './rental'
require './modules/input'
require './modules/app_books'
require './modules/app_people'
require './modules/app_rentals'

class App
  include Input
  include AppBooks
  include AppPeople
  include AppRentals
end

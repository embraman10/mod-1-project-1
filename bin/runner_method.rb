def welcome
  puts `clear`
  puts "Welcome, weary traveler. All may enter our homely inn."
  puts <<-'EOF'
   ____||____
  ///////////\
 ///////////  \
 |    _    |  |
 |[] | | []|[]|
 |   | |   |  |                  
EOF
  puts "\n\n\n\n"
  puts "Who are you? Write your name in our ledger."
  gets.chomp
end

def greeting(username)
  puts `clear`
  puts "Welcome #{username}, what would you like to do?"
end

def departing(username)
  puts `clear`
  puts "I hope you are safe, #{username}."
end

def menu
  puts `clear`
  puts "\n"
  puts "
  1. Review all Knights that came before \n
  2. Add Knight\n
  3. Edit your Knight\n
  4. Report a fallen Knight 💔\n
  5. Go on Journey with your Knight\n
  6. Go back home\n
  "
  gets.chomp
end

def all_knights
  #$my_buddy = []
  puts `clear`
  puts "Kings Among Men:"
  puts Knight.all.map { |u| u.name }
  #Journey.all.map {|journey| journey.outcome.count }
  #puts "Knight: #{knights_names}, Outcome: #{knights_outcome}"
  sleep(1)
  puts "\n\n\n"
  puts "Please press enter."
  gets.chomp
  #puts "Select a knight."
  #knight_name = gets.chomp
  #$my_buddy << Knight.find_by(name: knight_name)
  #$my_buddy.last
end

def add_knight
  puts `clear`
  puts "What is the name of the knight?"
  name = gets.chomp
  puts "What is their weapon?"
  weapon = gets.chomp
  puts "What is their family color?"
  color = gets.chomp
  final_knight = Knight.create(name: name, weapon: weapon, color: color)
  puts ""
  puts "You have created #{final_knight.name}, their weapon is #{final_knight.weapon}, their family color is #{final_knight.color}"
  puts "Hit enter to continue."
  gets.chomp
  puts `clear`
end

def delete_knight
  puts `clear`
  puts "Kings Among Men:"
  all_knights
  sleep(1)
  puts "\n\n\n"
  puts "What is the name of the dead knight?"
  dead_knight = gets.chomp
  puts "And so rest the brave knight #{dead_knight}, may our hearts be the home of his final adventures"
  Knight.find_by(name: dead_knight).delete
  puts "Hit enter to continue."
  gets.chomp
  puts `clear`
end


def edit_knight
  puts `clear`
  puts "What is the name of the knight you would like to adjust?"
  original_name = gets.chomp
  puts "What is their new name?"
  name = gets.chomp
  puts "What is their weapon?"
  weapon = gets.chomp
  puts "What is their family color?"
  color = gets.chomp
  edit_knight = Knight.find_by(name: original_name)
  edit_knight.update(name: name, weapon: weapon, color: color)
  puts "#{original_name}'s name is now #{edit_knight.name}, their weapon is #{edit_knight.weapon}, their family color is #{edit_knight.color}"
  puts "Hit enter to continue."
  gets.chomp
  puts `clear`
end



def travel_knight
  #if $my_buddy.any?
  #  $my_buddy.last.name
  #elsif $my_buddy.any?!
  #  $my_buddy << Knight.all.last.name
  #  $my_buddy.last.name
  #end
  Knight.all.last.name
end 

def travel_knight_weapon
  #if $my_buddy.any?
  #  $my_buddy.last.weapon
  #  else
  #    Knight.all.last.weapon
  #  end
  Knight.all.last.weapon
end

def hit_the_road
  puts `clear`
  puts "#{travel_knight}: 'Where shall we go?'"
  sleep(0.5)
  puts "\n"
  puts "
  1. Travel to a town.\n
  2. Travel to the mountains.\n
  3. Travel to the river.\n
  4. Talk to that weird old man.\n
  5. Travel to the sea.\n
  6. Leave the road.\n
  7. Give up and go home.\n
  "
  gets.chomp
end


def trial_select_1
  puts `clear`
  puts "Oh no! The town is full of hungry orphans. It seems the townsfold need some herioc help."
  sleep(1)
  puts Trial.all.first.title
  sleep(0.5)
  puts "
  1. Feed them fish.
  2. Feed them bacon.
  "  
  first_choice = gets.chomp
  if first_choice == "1"
    puts `clear`
    puts "Oh no! They hated it and would not eat the fish.\nThe quest was a failure..."
    Journey.create(knight: Knight.all.last, trial: Trial.all.fifth, outcome: "Failure")
    sleep(4)
  elsif first_choice == "2"
    puts `clear`
    puts "Huzzah! Everyone loves bacon. The children ate ferociously.\nThe quest was a success!"
    Journey.create(knight: Knight.all.last, trial: Trial.all.fifth, outcome: "Pass!!")
    sleep(4)
  else
    puts `clear`
    puts "That is not an appropriate response! The children cried and you left town ashamed."
    Journey.create(knight: Knight.all.last, trial: Trial.all.fifth, outcome: "Failure")
    sleep(4)
  end

  puts `clear`
end

def trial_select_2
  puts `clear`
  puts "The One Ring has returned, you must go swiftly!"
  sleep(1)
  puts Trial.all.second.title
  sleep(0.5)
  puts "
  1. Bring your trusty gardener.
  2. You got this. All you need is your knight's trusty weapon, the #{travel_knight_weapon}.
  "  
  first_choice = gets.chomp
  if first_choice == "1"
    puts `clear`
    puts "Huzzah! Your trusty gardener came in handy.\nThe quest was a success!"
    Journey.create(knight: Knight.all.last, trial: Trial.all.fifth, outcome: "Pass!!")
    sleep(4)
  elsif first_choice == "2"
    puts `clear`
    puts "Oh no! #{travel_knight}'s weapon was not strong enough to get through Mordor.\nThe quest was a failure..."
    Journey.create(knight: Knight.all.last, trial: Trial.all.fifth, outcome: "Failure")
    sleep(4)
  else
    puts `clear`
    puts "That is not an appropriate response! The orcs laughed and chased you back to the road."
    Journey.create(knight: Knight.all.last, trial: Trial.all.fifth, outcome: "Failure")
    sleep(4)
  end
  puts `clear`
end

def trial_select_3
  puts `clear`
  puts "A dragon is terrorizing this poor river town! What will you and #{travel_knight} do?"
  sleep(1)
  puts Trial.all.third.title
  sleep(0.5)
  puts "
  1. Stab his heart!
  2. Get him drunk and THEN stab his heart!
  "  
  first_choice = gets.chomp
  if first_choice == "1"
    puts `clear`
    puts "Oh no! You were too close to the dragon and he ate #{travel_knight}'s #{travel_knight_weapon}.\nThe quest was a failure..."
    Journey.create(knight: Knight.all.last, trial: Trial.all.fifth, outcome: "Failure")
    sleep(2)
  elsif first_choice == "2"
    puts `clear`
    puts "Huzzah! You and #{travel_knight} had an awesome party with a dragon and stabbed him in his sleep."
    sleep(2)
    puts "How cold-blooded."
    sleep(1)
    puts "..."
    sleep(2)
    puts "The quest was a success!"
    Journey.create(knight: Knight.all.last, trial: Trial.all.fifth, outcome: "Pass!!")
    sleep(4)
    else
      puts `clear`
      puts "That is not an appropriate response! The villagers are mad and chase you out of town."
      Journey.create(knight: Knight.all.last, trial: Trial.all.fifth, outcome: "Failure")
      sleep(4)
  end
  puts `clear`
end

def trial_select_4
  puts `clear`
  puts "There's a creepy old man guarding a bridge you must cross. He asks you a question..."
  sleep(1)
  puts Trial.all.fourth.title
  sleep(0.5)
  puts "
  1. Is it blue?
  2. Is it red?
  "  
  first_choice = gets.chomp
  if first_choice == "1"
    puts `clear`
    puts "Oh no! You guessed blue and both of you were magically knocked off the bridge!\nThe quest was a failure..."
    Journey.create(knight: Knight.all.last, trial: Trial.all.fifth, outcome: "Failure")
    sleep(3)
  elsif first_choice == "2"
    puts `clear`
    puts "Oh no! #{travel_knight} guessed red and both of you were magically knocked off the bridge!\nThe quest was a failure..."
    Journey.create(knight: Knight.all.last, trial: Trial.all.fifth, outcome: "Failure")
    sleep(3)
    else
    puts `clear`
    puts "That is not an appropriate response! Off the bridge with you!"
    Journey.create(knight: Knight.all.last, trial: Trial.all.fifth, outcome: "Failure")
    sleep(3)
  end
  puts `clear`
end

def trial_select_5
  puts `clear`
  puts "You travel to a gloomy beach. My god, some poor woman is held captive!"
  sleep(1)
  puts Trial.all.fifth.title
  sleep(0.5)
  puts "
  1. Save the maiden, kill the beast!
  2. Kill the beast, save the maiden!
  "  
  first_choice = gets.chomp
  if first_choice == "1"
    puts `clear`
    puts "Oh no! During the fight with the beast, the poor maiden perished. Oops.\nThe quest was a failure..."
    Journey.create(knight: Knight.all.last, trial: Trial.all.fifth, outcome: "Failure")
    sleep(4)
  elsif first_choice == "2"
    puts `clear`
    puts "Huzzah! Together with #{travel_knight}, you defeated to beast and untied the poor maiden. Pretty easy, huh?\nThe quest was a success!"
    Journey.create(knight: Knight.all.last, trial: Trial.all.fifth, outcome: "Pass!!")
    sleep(4)
    else
    puts `clear`
    puts "That is not an appropriate response! The maiden was dragged into the sea and you both leave feeling sullen."
    Journey.create(knight: Knight.all.last, trial: Trial.all.fifth, outcome: "Failure")
    sleep(4)
  end
  puts `clear`
end

def departing_road
  puts `clear`
  puts "#{travel_knight}: Time to head back home. I'm exhausted"
end

def welcome_back(username)
  puts `clear`
  puts "Welcome back, #{username} and #{travel_knight}."
  sleep(1)
  puts "What would you like to do?"
  puts "
  1. Check your Knight's trial outcome\n
  2. Boast of your acclaim\n
  3. Go home and relax\n
  "
  gets.chomp
end

def trial_list
  puts `clear`
  outings = Journey.select {|journey| journey.outcome }
  puts "You have and your knight have experienced\n #{outings}"
end

def trial_tally
  puts `clear`
  success_outing = Journey.select {|journey| journey.outcome }
  puts "Number of successful trials: #{outings}"
end
def the_end
  puts `clear`
  puts "You went home and settled back into a comfortable bed."
end
require 'canva-api'
require 'date'

# Log in to Canva
client = CanvaAPI::Client.new(email: "jess.crodrigues@gmail.com", password: "895154JessHey")

# Get the template design
template_id = "DAFbJtzLWGc"
template = client.designs.find(template_id)

# Prompt the user for the start date and end date
puts "Enter the start date (YYYY-MM-DD): "
start_date_str = gets.chomp
puts "Enter the end date (YYYY-MM-DD): "
end_date_str = gets.chomp
start_date = Date.parse(start_date_str)
end_date = Date.parse(end_date_str)

# Prompt the user for the day of the week to use
puts "Enter the day of the week to use (Monday, Tuesday, etc.): "
day_of_week = gets.chomp

# Loop through each day between the start date and end date
current_date = start_date
while current_date <= end_date do
    # Add a new page to the template design
    new_page = template.add_page(name: current_date.strftime("%Y-%m-%d"))

    # Find and update the day of the year and day of the week text elements on the new page
    new_page.elements.each do |element|
        if element['type'] == "text"
            if element['text'].include?("day of the year")
                new_text = element['text'].sub("day of the year", current_date.yday.to_s)
                element['text'] = new_text
                new_page.update_element(element)
            elsif element['text'].include?("day of the week")
                new_text = element['text'].sub("day of the week", current_date.strftime("%A"))
                new_text = new_text.sub("Monday", day_of_week)
                element['text'] = new_text
                new_page.update_element(element)
            end
        end
    end

    # Save the updated design
    template.save

    # Move on to the next day
    current_date = current_date.next_day
end
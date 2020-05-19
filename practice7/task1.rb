require 'erb'

def hello_erb(name, surname)
    text="Hello my friend, <%=name%> <%=surname%>! "
    rebderer=ERB.new(text)
    context=binding
    puts rebderer.result(context)
end

def hello(name,surname)
    puts "Hello my friend, #{name} #{surname} !"
end

def hello_erb_short(name, surname)
    puts ERB.new('Hello my friend, <%= name%> <%= surname %> !').result(binding)
end

hello_erb('Viki','Smit')
hello('Viki','Smit')
hello_erb_short('Viki','Smit')

def invitation( name,event, text, host_name)
    message = 'Dear <%= name %>, you are invited to <%= event%>
    <%= text %>
    Your lovely, <%= host_name %>'
    puts ERB.new(message).result(binding)
end
  
invitation('New Year', 'Viki','I want to see you','Nike')

def online_shop(product_name, cost, category)
    message = '
    Buy amazing<% if category == :dress %> dress<% end %><% if category == :shoes%> shoes<% end %><% if category == :tools%> instrument<% end %>!
    Name: <%= product_name %>
    Its just <%= cost %>!!!'
    puts ERB.new(message).result(binding)
end

online_shop('Mango', 1500, :dress)
  
def time_table
    schedule = [
        {name: "Теормех", audience: 112, when: :numerator},
        {name: "Мат. ан.", audience: 205},
        {name: "Теор. игр", audience: 108},
        {name: "Ин. яз.", audience: 507, when: :denomitanor},
    ]
    schedule
end
  
def get_timetable(table, weak)
    message = 'Schedule for the week:
    <% table.each do |subject| %>
    <% if subject[:when] == nil || subject[:when] == weak %> <%=subject[:name]%> <%= subject[:audience]%><% end %><% end %>'
    puts ERB.new(message).result(binding)
end

get_timetable(time_table, :numerator)
get_timetable(time_table, :denomitanor)
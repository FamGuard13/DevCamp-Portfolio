User.create!(
    email: "test@test.com",
    password: "Penis69",
    password_confirmation: "Penis69",
    name: "Admin User",
    roles: "site_admin",
    )
puts "1 Admin User Created"

User.create!(
    email: "test2@test.com",
    password: "Penis69",
    password_confirmation: "Penis69",
    name: "Regular User",
    )
puts "1 Regular User Created"

puts "10 blog posts created"

['Ruby on Rails', 'Ruby', 'HTML', 'CSS', 'Javascript'].each_with_index do |skill, index|
    Skill.create!(
        title: skill,
        percent_utilized: ((index + 1) * 6.667).round,
        ) 
end

puts "5 skills created"


8.times do |portfolio_item|
    Portfolio.create!(
        title: "Portfolio Title: #{portfolio_item}",
        subtitle: "Ruby on Rails",
        link: '',
        body: "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.",
        main_image: "http://via.placeholder.com/600x400",
        thumb_image: "http://via.placeholder.com/350x200",
        )
end        

1.times do |portfolio_item|
    Portfolio.create!(
        title: "Portfolio Title: #{portfolio_item}",
        subtitle: "Angular",
        link: '',
        body: "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.",
        main_image: "https://source.unsplash.com/random",
        thumb_image: "https://source.unsplash.com/random",
        )
end 

puts "9 portfolio's created"

3.times do |technology|
   Portfolio.last.technologies.create!(
       name: "Technology #{technology}",
       ) 
end

puts "3 tech's Created!"

['Botegga', 'The Odin Project'].each do |school|
    School.create!(
        name: "#{school}",
        logo: 'https://source.unsplash.com/random',
        img: 'https://source.unsplash.com/random',
        status: 'Currently Attending'
        link: '',
        location: 'Online',
        description: 'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.',
        start_date: '2007-11-19',
        end_date: '2007-11-19',
    )
end

puts "Created 3 Schools"

5.times do |job|
    Job.create!(
        name: "Job: #{job}",
        logo: 'https://source.unsplash.com/random',
        img: 'https://source.unsplash.com/random',
        link: '',
        location: 'Online',
        description: 'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.',
        title: "Title: #{job}",
        start_date: '2007-11-19',
        end_date: '2007-11-19',
    )
end

puts "Created 5 Jobs"
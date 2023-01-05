require "csv"
puts "Starting the seed process"

puts '-------------------------------'

puts "Creating first User."
User.create!(email: 'sophia@benmoussa.me', password: '123456')
puts "First User created successfully."

puts '-------------------------------'

csv_text = File.read(Rails.root.join('lib', 'seeds', 'pokemon.csv'))
csv_file = CSV.parse(csv_text, :headers => true, :encoding => 'ISO-8859-1')

n = 1
csv_file.each do |row|
  puts "#{n} - Creating Pokemon #{row['Name']}."
  Pokemon.create!(
    file_id: row['Id'],
    name: row['Name'],
    type_1: row['Type_1'],
    type_2: row['Type_2'],
    total: row['Total'],
    hp: row['HP'],
    attack: row['Attack'],
    defense: row['Defense'],
    sp_atk: row['Sp_Atk'],
    sp_def: row['Sp_Def'],
    speed: row['Speed'],
    generation: row['Generation'],
    legendary: row['Legendary'],
    user_id: User.last.id
  )
  puts "#{n} - Pokemon #{row['Name']} created successfully"
  n += 1
end

puts "Seed process done successfully."

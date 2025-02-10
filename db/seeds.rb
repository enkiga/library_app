require 'faker'

# Create test user
User.create!(
  name: "Test User",
  email: "user@example.com",
  password: "password",
  password_confirmation: "password"
)

# Create 20 books
20.times do
  Book.create!(
    title: Faker::Book.title,
    author: Faker::Book.author,
    isbn: Faker::Code.isbn(base: 13)
  )
end

# Create some borrowings
user = User.first
books = Book.limit(5)

books.each do |book|
  Borrowing.create!(
    user: user,
    book: book,
    due_date: 2.weeks.from_now,
    returned_at: rand(2).zero? ? Time.current : nil
  )
end

puts "Created #{User.count} users"
puts "Created #{Book.count} books"
puts "Created #{Borrowing.count} borrowings"

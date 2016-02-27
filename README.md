# Setup

1. `$ bundle install`
2. `$ rails db:create && rails db:migrate`

# Usage

1. Run the server with `rails s`
2. Open http://localhost:3000/announcements/new¬
3. Fill up announcement details (for now lets set the key to 'company')
4. Submit the form, it would be directed to the announcment show page¬
5. Open http://localhost:3000/announcements/company/edit in another tab
6. When we submit the edit form, the previous tab gets updated!

Here's how it would look like:
![Final output](https://drive.google.com/uc?export=view&id=0BzzUFuhnnJrWTlJUUHVSbU9RTzQ)¬


Psyquiz
App built on Ruby on Rails to enable psychiatrists to interact with their
clients through quizzes, as well as set goals for them to adhere to.

Prerequisites
Ruby ruby 3.1.2p20
Rails Rails 7.0.7
PostgreSQL
Bundler 2.4.5
Yarn 1.22.19

Setup & Installation
Clone the repository
git clone https://github.com/your-username/Psyquiz.git
cd Psyquiz
Install dependencies
Bundle install
Yarn install

Setup Database
rails db:create db:migrate db:seed (if data is wanted)

Start the server rails s

User admin (psychiatrist) login is:
email: bob@gmail.com
password: p123456

To create another admin, use rails c and set it manually


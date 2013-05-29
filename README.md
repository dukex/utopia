# UtopiaData Documentation

## About
uData is a (easy)way to expose your data, and open data. Using Rails in the top of system, only connect in database and configure the resources than will be exposed.

UtopiaData will create a read-only REST API (with **hypermedia**) to exposed resource

## Install
The UtopiaData work with rails app, before all create a small rails app, run:

	gem install rails # install rails
	rails new project_name # create a rails app
	cd project_name # enter in created project
	bundle istall # install the dependencies

Now add UtopiaData as a dependencies, in your **Gemfile** add:

	gem 'utopia_data'
	gem "inherited_resources"
	gem "roar-rails"

And run bundle to install it:

	bundle install

Install UtopiaData

	bundle exec rails g utopia_data:install

## Configure
UtopiaData will connect to database and search the resource, the configure is very simple, on *config/database.yml* please tell database info, to test your project in development is very recommended create a mirror of your database and configure development environment:

	development:
		adapter: sqlite3
		database: db/development.sqlite3
		pool: 5
		timeout: 5000

	production:
		adapter: sqlite3
		database: db/production.sqlite3
		pool: 5
		timeout: 5000

UtopiaData **DON'T WRITES** in database, but many people think is better create a read-only mirror database. The UtopiaData expects only than the database is accessible.

## Create a Resource
Attention! When you create a resource, this *DON'T* touch on database, the database should exist:

In the example *station* will be my resource.

First let's go create this resource, We need run:
	bundle exec rails g utopia_data:resource station

It will create app/resource/station.rb, like it:
	UtopiaData.register :station do
	end

### Changing default
#### Database Table Name
To change the database table name you can change *table_name* config
	UtopiaData.register :station do
		table_name "S1A24"
	end

#### Attributes
To change what attribute you want to expose, you can use *attributes* config
	UtopiaData.register :station do
		attributes do
			set :number
			set :author
		end
	end

All other attributes will be protected and won't exposed

#### Class Name (model)
To change the model name, you can use *class_name* config
	UtopiaData.register : station do
		class_name "TrainStation"
	end

#### Model config
To add behavior to you model, you can use *model* config
  
	UtopiaData.register :station do
		model do
			default_scoped order('created_at')
		end
	end

In the *model* you can use any Active Record(Rails) config, to learn more about it follow links 

[Validations and Callbacks](http://guides.rubyonrails.org/active_record_validations_callbacks.html)
[Associations](http://guides.rubyonrails.org/association_basics.html)
[Query Interface](http://guides.rubyonrails.org/active_record_querying.html)

## Running Server
	bundle exec rails s # run server

## License
See COPYING file

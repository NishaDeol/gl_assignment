class PeopleController < ApplicationController
	require 'csv'
  def form
  	if request.get?
  		@persons_array = JSON.parse(cookies[:all_persons]) unless cookies[:all_persons].nil?
  	end
  	if request.post?
  		cookies[:all_persons] = nil
  		@persons_array = []
  	  CSV.foreach(params[:file].path, headers: true) do |row|
        person = Person.create(first_name: row["First"], last_name: row["Last"], email: row["Email"], phone: row["Phone"])
        person_hash = {}
        person_hash["person_object"] = person
        person_hash["error_object"] = person.errors
        @persons_array << person_hash
      end
      cookies[:all_persons] = @persons_array.to_json
      redirect_to root_path
  	end
  end

  def update_details
  	person = Person.create(first_name: params[:first_name], last_name: params[:last_name], email: params[:email], phone: params[:phone])
  	persons_object = JSON.parse(cookies[:all_persons])
  	persons_object[params[:index].to_i]["person_object"] = person
  	persons_object[params[:index].to_i]["error_object"] = person.errors
  	cookies[:all_persons] = persons_object.to_json
  	redirect_to root_path
  end

end

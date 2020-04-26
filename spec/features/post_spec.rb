require 'rails_helper'

describe 'navigate' do
  describe 'index' do
    before do
      user1 = User.create(email: "jonsnow@test.com", password: "123abc", password_confirmation: "123abc", first_name: "Jon", last_name: "Snow")
      login_as(user1, :scope => :user)
      visit posts_path
    end
  	it 'can be reached successfully' do
  		expect(page.status_code).to eq(200)
  	end

  	it 'has a title of Posts' do
  		expect(page).to have_content(/Posts/)
    end
    
    it 'has a list of posts' do
      user2 = User.create(email: "test2@test.com", password: "abc123", password_confirmation: "abc123", first_name: "Arya", last_name: "Stark")
      post1 = Post.create!(date: Date.today, rationale: 'Post1', user_id: user2.id)
      post2 = Post.create!(date: Date.today, rationale: 'Post2', user_id: user2.id)
      visit posts_path
      expect(page).to have_content(/Post1|Post2/)
    end
  end

  describe 'creation' do
    before do
      user3 = User.create(email: "test3@test.com", password: "abc123", password_confirmation: "abc123", first_name: "Brandon", last_name: "Stark")
      login_as(user3, :scope => :user)
  		visit new_post_path
  	end

  	it 'has a new form that can be reached' do
  		expect(page.status_code).to eq(200)
  	end

  	it 'can be created from new form page' do
      fill_in 'post[date]', with: Date.today
      fill_in 'post[rationale]', with: "Some rationale"
      click_on "Save"

      expect(page).to have_content("Some rationale")
  	end

    it 'will have a user associated with it' do
      fill_in 'post[date]', with: Date.today
      fill_in 'post[rationale]', with: "User Association"
      click_on "Save"

      expect(User.last.posts.last.rationale).to eq("User Association")
    end
  end
end
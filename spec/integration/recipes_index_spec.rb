require 'rails_helper'

describe 'Recipe Index Page', type: :feature do
  before(:each) do
    visit user_session_path
    @mike = User.create!(
      name: 'mike', email: 'mike@test.com', password: 'mike123'
    )
    fill_in 'Email', with: 'mike@test.com'
    fill_in 'Password', with: 'mike123'
    click_button 'Log in'

    @recipe = @mike.recipes.create!(
      name: 'Hawaiian Pizza', preparation_time: 25,
      cooking_time: 120,
      description: 'Classic Hawaiian Pizza combines pizza sauce, cheese, cooked ham, and pineapple.',
      public: true
    )

    # post = @mike.posts.create!(
    #   title: 'Cats and Dogs', text: 'this is first post about cats and dogs!',
    #   comments_counter: 0, likes_counter: 0
    # )
    # lucy = User.create!(
    #   name: 'lucy', bio: 'this is my bio',
    #   photo: 'test_image1', email: 'lucy@gmail.com',
    #   password: 'lucylucy', confirmed_at: Time.now
    # )
    # lucy.comments.create!(text: 'really nice post Michael', post: post)
    # lucy.comments.create!(text: 'Great', post: post)
    # lucy.comments.create!(text: 'fantastic', post: post)
    visit recipes_path
  end

  describe 'I can see' do
    it 'a recipe\'s title.' do
      expect(page).to have_content 'Hawaiian Pizza'
    end

    it 'a recipe\'s description' do
      expect(page).to have_content 'Classic Hawaiian Pizza combines pizza sauce, cheese, cooked ham, and pineapple.'
    end

    it 'the REMOVE recipe button' do
      expect(page).to have_link 'REMOVE'
    end

    it 'when I click on a recipe, it redirects me to that recipe\'s show page.' do
      click_link 'Hawaiian Pizza'
      expect(page).to have_current_path(recipe_path(@recipe))
    end
  end
end

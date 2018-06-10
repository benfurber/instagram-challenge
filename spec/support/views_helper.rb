def assign_post
  @user = create(:user)
  image_file = fixture_file_upload(Rails.root.join('spec', 'support', 'test.jpg'), 'image/jpeg')
  @post = assign(:post, Post.create!(
    :description => @post_description,
    :image => image_file,
    :user => @user
  ))
end

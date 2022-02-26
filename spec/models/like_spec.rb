require 'rails_helper'

RSpec.describe Like, type: :model do
  subject do
    @user = User.new(name: 'Lenny', photo: 'image', bio: 'bio', posts_counter: 0)
    Post.new(title: 'To Be', text: 'The big question is?', comments_counter: 1, likes_counter: 1, author: @user, id: 3)
  end

  before { subject.save }

  it 'should return the number of likes' do
    subject.likes.new(author: @user, post: subject)
    expect(subject.likes_counter).to eql 1
  end
end
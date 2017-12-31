require 'faker'

Message.destroy_all
User.destroy_all
Channel.destroy_all

general = Channel.create(name: 'general')
paris = Channel.create(name: 'paris')
react = Channel.create(name: 'react')


kevin = User.create(email: 'kevin@chat.com', password: '1234')
ed = User.create(email: 'ed@chat.com', password: '1234')
seb = User.create(email: 'seb@chat.com', password: '1234')

Channel.find_each do |chan|
  10.times do
    user = User.all.sample
    Message.create(channel: chan, user: user, content: Faker::Simpsons.quote)
  end
end



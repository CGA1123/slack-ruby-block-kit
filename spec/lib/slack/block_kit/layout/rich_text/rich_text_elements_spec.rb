# frozen_string_literal: true

require 'spec_helper'

RSpec.shared_examples 'rich text element: channel' do |klass|
  describe '#channel' do
    it 'correctly serializes' do
      expected_json = [{ type: 'channel', channel_id: 'AAAAAAAAA' }]
      elements = klass.channel(channel_id: 'AAAAAAAAA').as_json[:elements]

      expect(elements).to match(expected_json)
    end
  end
end

RSpec.shared_examples 'rich text element: emoji' do |klass|
  describe '#emoji' do
    it 'correctly serializes' do
      expected_json = [{ type: 'emoji', name: 'wave' }]
      elements = klass.emoji(name: 'wave').as_json[:elements]

      expect(elements).to match(expected_json)
    end
  end
end

RSpec.shared_examples 'rich text element: link' do |klass|
  describe '#link' do
    it 'correctly serializes' do
      expected_json = [{ type: 'link', url: 'https://github.com' }]
      elements = klass.link(url: 'https://github.com').as_json[:elements]

      expect(elements).to match(expected_json)
    end
  end
end

RSpec.shared_examples 'rich text element: text' do |klass|
  describe '#text' do
    it 'correctly serializes' do
      expected_json = [{ type: 'text', text: 'Some text' }]
      elements = klass.text(text: 'Some text').as_json[:elements]

      expect(elements).to match(expected_json)
    end
  end
end

RSpec.shared_examples 'rich text element: user' do |klass|
  describe '#user' do
    it 'correctly serializes' do
      expected_json = [{ type: 'user', user_id: 'AAAAAAAAA' }]
      elements = klass.user(user_id: 'AAAAAAAAA').as_json[:elements]

      expect(elements).to match(expected_json)
    end
  end
end

RSpec.shared_examples 'rich text element: usergroup' do |klass|
  describe '#usergroup' do
    it 'correctly serializes' do
      expected_json = [{ type: 'usergroup', usergroup_id: 'AAAAAAAAA' }]
      elements = klass.usergroup(usergroup_id: 'AAAAAAAAA').as_json[:elements]

      expect(elements).to match(expected_json)
    end
  end
end

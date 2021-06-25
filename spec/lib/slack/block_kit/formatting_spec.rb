# frozen_string_literal: true

require 'spec_helper'

RSpec.describe Slack::BlockKit::Formatting do
  shared_examples 'formatting helpers' do |klass|
    describe '#link' do
      context 'with no link_text' do
        subject { klass.link('https://github.com') }

        it { is_expected.to eq('<https://github.com>') }
      end

      context 'with link_text' do
        subject { klass.link('https://github.com', link_text: 'GitHub') }

        it { is_expected.to eq('<https://github.com|GitHub>') }
      end
    end

    describe '#mailto' do
      context 'with no link_text' do
        subject { klass.mailto('foo@bar.com') }

        it { is_expected.to eq('<mailto:foo@bar.com>') }
      end

      context 'with link_text' do
        subject { klass.mailto('foo@bar.com', link_text: 'Email Foo Bar') }

        it { is_expected.to eq('<mailto:foo@bar.com|Email Foo Bar>') }
      end
    end

    describe '#channel' do
      subject { klass.channel('C024BE7LR') }

      it { is_expected.to eq('<#C024BE7LR>') }
    end

    describe '#user' do
      subject { klass.user('U024BE7LH') }

      it { is_expected.to eq('<@U024BE7LH>') }
    end

    describe '#group' do
      subject { klass.group('SAZ94GDB8') }

      it { is_expected.to eq('<!subteam^SAZ94GDB8>') }
    end

    describe '#at_here' do
      subject { klass.at_here }

      it { is_expected.to eq('<!here|here>') }
    end

    describe '#at_channel' do
      subject { klass.at_channel }

      it { is_expected.to eq('<!channel>') }
    end

    describe '#at_everyone' do
      subject { klass.at_everyone }

      it { is_expected.to eq('<!everyone>') }
    end

    describe '#date' do
      let(:timestamp) { 1_392_734_382 }
      let(:token_string) { 'Posted {date_num} {time_secs}' }
      let(:fallback_text) { 'Posted 2014-02-18 6:39:42 AM PST' }

      context 'with no link' do
        subject do
          klass.date(
            timestamp,
            token_string: token_string,
            fallback_text: fallback_text
          )
        end

        it { is_expected.to eq('<!date^1392734382^Posted {date_num} {time_secs}|Posted 2014-02-18 6:39:42 AM PST>') }
      end

      context 'with a link' do
        subject do
          klass.date(
            timestamp,
            token_string: token_string,
            fallback_text: fallback_text,
            link: 'https://example.com/'
          )
        end

        let(:expected) do
          '<!date^1392734382^Posted {date_num} {time_secs}^https://example.com/|Posted 2014-02-18 6:39:42 AM PST>'
        end

        it { is_expected.to eq(expected) }
      end
    end

    describe '#escape' do
      subject { klass.escape(text) }

      let(:text) { '<span>hello</span> these should be escaped & this as well!' }
      let(:expected) { '&lt;span&gt;hello&lt;/span&gt; these should be escaped &amp; this as well!' }

      it { is_expected.to eq(expected) }
    end
  end

  describe 'when extendind a class' do
    include_examples 'formatting helpers', Class.new.extend(described_class)
  end

  describe 'when calling directly' do
    include_examples 'formatting helpers', described_class
  end
end

require 'rails_helper'

RSpec.describe TweetsHelper, :type => :helper do
  context 'highlight' do
    context 'coke' do
      it "highlights" do
        expect(
          helper.highlight("Coke is great")
        ).to eq('<mark>Coke</mark> is great')

        expect(
          helper.highlight("Coke coke")
        ).to eq('<mark>Coke</mark> <mark>coke</mark>')

        expect(
          helper.highlight("#coke_lovers")
        ).to eq('#<mark>coke</mark>_lovers')
      end

      it "does not highlight" do
        expect(
          helper.highlight("Cooooooooooooooookkkkkeee")
        ).to eq('Cooooooooooooooookkkkkeee')
      end
    end

    context 'coca-cola' do
      it "highlights" do
        expect(
          helper.highlight("Who likes coca-cola?")
        ).to eq('Who likes <mark>coca-cola</mark>?')

        expect(
          helper.highlight("Who likes Coca-cola?")
        ).to eq('Who likes <mark>Coca-cola</mark>?')
      end

      it "does not highlight" do
        pending("TOD: Fix when there is enough time")
        expect(
          helper.highlight("Who likes Coca\-cola?")
        ).to eq('Who likes Coca\-cola?')
      end
    end

    context 'diet cola' do
      it "highlights" do
        expect(
          helper.highlight("Who likes diet cola?")
        ).to eq('Who likes <mark>diet cola</mark>?')
      end

      it "does not highlight" do
        expect(
          helper.highlight("Who likes diet  cola?")
        ).to eq('Who likes diet  cola?')
      end
    end

    context 'combined' do
      it "highlights" do
        pending("TOD: Fix when there is enough time")

        highlighted = 'Who likes <mark>diet cola</mark> '
        highlighted+= 'and <mark>diet coke</mark> and <mark>coca-cola</mark>'

        expect(
          helper.highlight("Who likes diet cola and diet coke and coca-cola")
        ).to eq(highlighted)
      end
    end
  end
end

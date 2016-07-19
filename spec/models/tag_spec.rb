require 'spec_helper'

describe Tag do
  describe 'validations' do
    subject(:tag) { Tag.new }
    before { tag.valid? }

    [:name].each do |attribute|
      it "should validate presence of #{attribute}" do
        expect(tag).to have_at_least(1).error_on(attribute)
        expect(tag.errors.messages[attribute]).to include "can't be blank"
      end
    end
  end
end

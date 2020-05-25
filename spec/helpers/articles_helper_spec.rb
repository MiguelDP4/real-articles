require "rails_helper"

RSpec.describe ArticlesHelper, :type => :helper do
  describe "text reduction" do
    it "returns the text reduced to the indicated number of characters, plus 3 dots at the end" do
      text = "this text is 31 characters long"
      expect(text_reductor(text, 8)).to eq("this text...")
    end
  end
end
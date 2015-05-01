require 'rspec'
require 'arrays'
describe Array do
  subject(:arr) { [5, 12, 6, 5, -2, -8, -5, -12, 12] }

  describe "#my_uniq" do
    let(:uniq_arr) { [5, 12, 3] }
    it "returns only unique elements" do
      expect(arr.my_uniq).to eq( [5, 12, 6, -2, -8, -5, -12])
    end

    it "returns the elements in the right order" do
      expect(arr.my_uniq).not_to eq( [5, 6, -2, 12, -8, -5, -12])
    end

    it "returns a copy rather than the original" do
      expect(uniq_arr.my_uniq).not_to be(uniq_arr)
    end
  end

  describe "#two_sum" do
    subject(:two_arr) { [-3, 1, 3, 2, -1] }
    it "should return indices of any two elements that add to zero" do
      expect(two_arr.two_sum).to eq( [[0, 2], [1, 4]])
    end
  end

  describe "#my_transpose" do
    subject(:transpose) { [[0,1,2],[3,4,5],[6,7,8]] }
    it "should return transposed array" do
      expect(transpose.my_transpose).to eq( [
                                [0, 3, 6],
                                [1, 4, 7],
                                [2, 5, 8]
                              ])

    end
  end

  describe "#stock_picker" do
    subject(:stocks) { [13,7,4,2,8,6,2] }
    it "should return array of indices of most profitable days" do
      expect(stocks.stock_picker).to eq( [3, 4])
    end
  end
end

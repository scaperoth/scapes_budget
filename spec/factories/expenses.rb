FactoryGirl.define do
  factory :expense do
    frequency "MyString"
    name "MyString"
    amount "9.99"
    notes "MyText"
    budget nil
    user nil
  end
end
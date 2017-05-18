FactoryGirl.define do
  factory :artist do
    sequence :name do |n|
      "#{n}Amanda Palmer"
    end
    image_path "http://www.thatericalper.com/wp-content/uploads/2017/03/amanda-palmer-1.jpg"
  end

  factory :song do
    sequence :title do |n|
      "#{n}Coin Operated Boy"
    end
    artist
  end
end

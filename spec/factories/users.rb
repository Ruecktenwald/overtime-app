FactoryGirl.define do
  sequence :email do |n|
    "test#{n}@example.com"
  end

  factory :user do
    first_name "pete"
    last_name "smith"
    email { generate :email }
    password "secret"
    password_confirmation "secret"
    phone "1231234567"
  end

   factory :admin_user, class: "AdminUser" do
    first_name "Admin"
    last_name "smith"
    email { generate :email }
    password "secret"
    password_confirmation "secret"
    phone "1231234567"
  end

  factory :non_authorized_user, class: "User" do
    first_name "non"
    last_name "authorized"
    email { generate :email }
    password "secret"
    password_confirmation "secret"
    phone "1231234567"
  end

end
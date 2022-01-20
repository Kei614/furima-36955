FactoryBot.define do
  factory :purchase_record_destination do
    zip_code            { "111-1111" }
    prefecture_id       { 2 }
    city                { "あい市" }
    address             { "うえお町1-2-3" }
    building            { "かきくビル"}
    telephone_number    { "09012345678" }
    token               { "tok_abcdefghijk00000000000000000" }
  end
end

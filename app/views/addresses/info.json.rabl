object @address

attributes :balance,
           :currency,
           :is_valid

node(:shortname) do |address|
 address.get_currency.short_name
end

node(:currency_image_path) do |address|
  image_path "currencies/#{address.currency.downcase}@2x.png"
end
require 'pry'

def find_item_by_name_in_collection(name, collection)
  # Implement me first!
  item_h = 0 
  while item_h < collection.length do 
    g_hash = collection[item_h]
  if g_hash[:item] == name
   return g_hash
else 
  nil
end
   item_h += 1
end
end 
  
  #
  # Consult README for inputs and outputs

def consolidate_cart(cart)
 final_cart = []
 i = 0 
 while i < cart.length do 
  item_name = cart[i][:item]
 new_item = find_item_by_name_in_collection(item_name, final_cart)
  if !new_item
    cart[i][:count] = 1 
 final_cart << cart[i]
 else 
   cart[i][:count] += 1 
  end 
  i += 1 
end 
final_cart
end 











# item = cart[i]
#     item_n = cart[i][:item]
#     if new_cart[i][:item] = item_n
#       new_cart[i][:count] += 1
#     else 
#       new_cart[i] = cart[i]
#       new_cart[i][:count] = 1 
#     end 
#     i+=1
#   end 
#   new_cart
# end    
 
    

 
 
 
 
 
 
 
 
 
 
 
 
  # new_cart = []
  # i = 0 
  # while i < cart.length do 
    
  
  
#   cart.each do |items_array|
#     items_array[:count] = 1
#   items_array.each do |key, value|
#   # item_names = items_array.values[0]
#   if cart.has_key?(key) == false
#     new_cart[key] = value 
#     new_cart[key][:count] = 1 
#   elsif cart.has_key?(key)
#   new_cart[key][:count] += 1 
# end 
# end 
# end 
# new_cart
# end
  # new_cart << items_array
  
#   end
#   new_cart
  
# end 






#    

#   if item[:item]
#     new_cart[i][:count] += 1 
#   else 
#     new_cart[i] = cart[i]
#     new_cart[i][:count] = 1
# end
# i +=1 
# end
# new_cart
 
 
  
  
  
  
  
  
  #
  # REMEMBER: This returns a new Array that represents the cart. Don't merely
  # change `cart` (i.e. mutate) it. It's easier to return a new thing.


def apply_coupons(cart, coupons)
  # Consult README for inputs and outputs
  i = 0 
  while i < coupons.length do 
    coupon_name = coupons[i][:item]
    couponed_item = find_item_by_name_in_collection(coupon_name, cart)
    w_coupon = "#{coupons[i][:item]} W/COUPON"
    item_two = find_item_by_name_in_collection(w_coupon, cart)
    if couponed_item && couponed_item[:count] >= coupons[i][:num]
      if item_two
        item_two[:count] += coupons[i][:num]
        couponed_item[:count] -= coupons[i][:num]
      else item_two = {
        :item => w_coupon,
        :price => coupons[i][:cost] / coupons[i][:num],
        :count => coupons[i][:num],
        :clearance => couponed_item[:clearance]
      }
      cart << item_two
      couponed_item[:count] -= coupons[i][:num]
        
        
        end
    end
    i += 1 
  end
  #
  cart
  # REMEMBER: This method **should** update cart
end


def apply_clearance(cart)
  # Consult README for inputs and outputs
  #
  # REMEMBER: This method **should** update cart
  i = 0 
  while i < cart.length do 
   if cart[i][:clearance] 
    cart[i][:price] = (cart[i][:price] - (cart[i][:price] * 0.2)).round(2)
    end 
  i += 1
  end 
  cart
end

def checkout(cart, coupons)
  grouped_cart = consolidate_cart(cart)
  discounted_cart = apply_coupons(grouped_cart, coupons)
  final = apply_clearance(discounted_cart)
  
  total = 0 
  i = 0 
  while i < final.length
  total += final[i][:price] * final[i][:count]
  i += 1 
  end 
  if total > 100 
    total -= (total * 0.10)
end
total
end
    

  # Consult README for inputs and outputs
  #
  # This method should call
  # * consolidate_cart
  # * apply_coupons
  # * apply_clearance
  #
  # BEFORE it begins the work of calculating the total (or else you might have
  # some irritated customers
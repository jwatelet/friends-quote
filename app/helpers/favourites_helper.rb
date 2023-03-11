module FavouritesHelper
  def fave_or_unfave_button(quote)
    favourite = quote.favourites.find_by(user_id: current_user)

    if favourite
      link_to(quote_favourite_path(quote, favourite),
              data: { 'turbo-method': :delete }, class: "tag") do
        content_tag(:span, "", class: "fa-solid fa-heart")
      end
    else
      link_to(quote_favourites_path(quote), data: { 'turbo-method': :post }, class: "tag") do
        content_tag(:span, "", class: "fa-regular fa-heart")
      end
    end
  end
end
module Sortable
  extend ActiveSupport::Concern

  included do
    before_create :set_sort_order
  end


  private

  # this class as an association from the sortable_parent
  # for example, RentalPicture is Sortable, & it's sortable_parent is Rental, so
  #   content_module.sortable_parent == rental
  #   content_module.sortable_items => :rental_pictures
  #   content_module.sortable_parent.sortable_items == rental_picture.rental.rental_pictures
  def sortable_items
    self.class.model_name.plural.to_sym
  end

  def max_sort_order
    return unless sortable_parent
    return unless sortable_parent.respond_to?(sortable_items)
    sortable_parent.send(sortable_items).maximum(:sort_order)
  end

  def set_sort_order
    if max_sort_order
      self.sort_order = max_sort_order.to_i
    end
  end
end

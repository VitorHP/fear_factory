module Filters
  class TagFilter
    def filter collection, params
      term = params.delete(:tag)

      if term.present?
        collection.tagged_with term
      else
        collection
      end
    end
  end
end

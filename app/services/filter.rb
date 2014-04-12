class Filter
  def initialize collection, params
    @collection = collection
    @params = params
  end

  def filter
    registered_filters.each do |f|
      @collection = f.new.filter @collection, @params
    end

    @collection
  end

  private

  def registered_filters
    [Filters::TagFilter]
    # Filters.constants.select do |c|
    #   c.const_get(c).is_a? Class
    # end
  end
end

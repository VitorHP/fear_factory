class TagCloudBuilder
  def initialize( controller, klass )
    @controller = controller
    @klass = klass
  end

  def build_for tagging
    @klass.tag_counts_on(tagging).map do |t|
      { text: t.name, weight: t.count, link: @controller.house_rules_path( tag: t.name ) }
    end
  end
end

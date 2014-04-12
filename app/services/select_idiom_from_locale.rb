class SelectIdiomFromLocale

  def perform
    locale_to_idiom[I18n.locale]
  end

  private

  def locale_to_idiom
    {
      :en => 'English',
      :'pt-BR' => 'Portuguese'
    }
  end
end

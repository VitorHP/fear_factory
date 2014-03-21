class Ladder
  def to_h options = {}
    from = options.fetch(:from){ :legendary }
    to   = options.fetch(:to){ :terrible }

    ladder.select do |key, value|
      value <= ladder[from] && value >= ladder[to]
    end
  end

  private

  def ladder
    {
      legendary:  8,
      epic:       7,
      fantastic:  6,
      suberb:     5,
      great:      4,
      good:       3,
      fair:       2,
      average:    1,
      mediocre:   0,
      poor:      -1,
      terrible:  -2
    }
  end
end

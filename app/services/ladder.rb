class Ladder
  def to_h options = {}
    from = extract_ladder_range(options.fetch(:from){ :legendary })
    to   = extract_ladder_range(options.fetch(:to){ :terrible })

    ladder.select do |key, value|
      value <= ladder[from] && value >= ladder[to]
    end
  end

  def all
    ladder
  end

  private

  def extract_ladder_range option
    if option.is_a? Fixnum
      ladder.key option
    else
      option
    end
  end

  def ladder
    {
      legendary:  8,
      epic:       7,
      fantastic:  6,
      suberb:     5,
      great:      4,
      good:       3,
      fair:       2,
      averag:     1,
      mediocre:   0,
      poor:      -1,
      terrible:  -2
    }
  end
end

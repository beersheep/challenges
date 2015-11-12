class Series
  
  def initialize(series)
    @series = series
  end

  def slices(num)
    if @series.size < num
      raise ArgumentError.new("The series number must be longer than the piece of slices!")
    end

    result = []
    spliting = @series.split('')
    spliting.map! {|s| s.to_i}
    
    loop do 
      break if spliting.size < num
      result.push(spliting.take(num))
      spliting.shift
      break if spliting.size == 0 
    end
    result
  end

end


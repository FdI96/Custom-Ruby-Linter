class Test
  def initialize(fake_var)
    @fake_var = fake_var
  end

  def fake_method
    return unless fake_var == 3

    puts 'this is funny'
  end
end

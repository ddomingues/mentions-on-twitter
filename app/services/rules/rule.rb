module Rules
  class Rule

    def apply!(tweets)
      run!(tweets)
    end

    protected

    def run!(tweets)
      raise 'Rule not implemented!'
    end

  end
end
module Rules
  class ClassificationRule < Rule
    def run!(tweets)
      tweets.sort! {|x, y| y <=> x }
    end
  end
end
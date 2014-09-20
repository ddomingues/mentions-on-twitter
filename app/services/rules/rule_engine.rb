module Rules
  class RuleEngine

    @@rules = [
        UserRule.new,
        NoRepliesRule.new,
        ClassificationRule.new
    ]

    def self.process!(tweets)
      @@rules.each {|rule| rule.apply!(tweets)}
    end

  end
end


module Rules
  class RuleEngine

    ID_USER_LOCAWEB = '42'

    @@rules = [
      UserRule.new(ID_USER_LOCAWEB),
      NoRepliesRule.new(ID_USER_LOCAWEB),
      ClassificationRule.new
    ]

    def self.process!(tweets)
      @@rules.each {|rule| rule.apply!(tweets)}
    end

  end
end


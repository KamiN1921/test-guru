class AchivmentsService

    def initialize(result)
      @result = result
      @test = result.test
      @user = result.user
      @badges = []
    end

    def call
      Badge.where.not(param: nil).each do |badge|
        @badges.push(badge) if send(badge.rule, badge.param)
      end
      @badges
    end

    private

    def completed_first_try(_params)
      @result.success? && (Result.where(user: @user, test: @test).count == 1)
    end

    def completed_category(category)
      tests = Test.test_categories(category).pluck(:id)

      tests.count == user_success_results(tests)
    end

    def completed_level(test_level)
      tests = Test.where(level: test_level).pluck(:id)

      tests.count == user_success_results(tests)
    end

    def user_success_results(tests)
      @user_success_results ||= Result.where(user: @user, test_id: tests, clear: true)
                 .pluck(:test_id).uniq.count
    end
end

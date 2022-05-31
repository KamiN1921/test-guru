class AchivmentsService

    def initialize(result)
      @result = result
      @test = result.test
      @user = result.user
      @badges = []
    end

    def call
      Badge.where.not(param: 0).select do |badge|
        @badges.push(badge) if send(badge.rule, badge.param)
      end
      @user.badges.push(@badges) if @badges.any?
      @badges.any?
    end

    private

    def completed_first_try(_params)
      @result.completed? && (Result.where(user: @user, test: @test).count <= 1)
    end

    def completed_category(category_level)
      tests = Test.tests_by_category(category_level).pluck(:id)

      tests.count == user_successfylly_completed_results(tests)
    end

    def completed_level(test_level)
      tests = Test.where(level: test_level).pluck(:id)

      tests.count == user_success_results(tests)
    end

    def user_success_results(tests)
      Result.where(user: @user, test_id: tests, completed: true)
                 .pluck(:test_id).uniq.count
    end
end

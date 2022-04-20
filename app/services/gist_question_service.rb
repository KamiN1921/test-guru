class GistQuestionService

  ACCESS_TOKEN = ENV['ACCESS_TOKEN']


  def initialize(question, client = client_octokit)
    @question = question
    @test = @question.test
    @client = client
  end

  def call
    @client.create_gist(gist_params)
  end

  private

  def gist_params
    {
      description: "#{I18n::t(".description",title: @test.title)}",
      files: {
        'test-guru-question.txt' => {
          content: gist_content
        }
      }
    }
  end

  def gist_content
    content = [@question.body]
    content += @question.answers.pluck(:body)
    content.join("\n")
  end

  def client_octokit
    Octokit::Client.new(access_token: ACCESS_TOKEN)
  end
end

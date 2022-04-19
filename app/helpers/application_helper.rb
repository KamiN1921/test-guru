module ApplicationHelper
  def year
    Time.current.year
  end

  def github_url(author, repo)
    ("#{author}, " + link_to('Test Guru', repo)).html_safe
  end
end

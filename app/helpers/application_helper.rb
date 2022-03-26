module ApplicationHelper
  def year
    Time.current.year
  end

  def github_url(author, repo)
    url = "#{author}, " + link_to("Test Guru", repo)
    render inline: url
  end
end

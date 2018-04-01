module IssuesHelper
  def finished_issues(issues)
    issues.select do |issue|
      issue.done?
    end
  end
end

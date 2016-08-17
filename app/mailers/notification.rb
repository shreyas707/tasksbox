class Notification < ActionMailer::Base
  default from: "from@example.com"

  # Subject can be set in your I18n file at config/locales/en.yml
  # with the following lookup:
  #
  #   en.notification.completed.subject
  #
  def completed(task, user)
    @task = task
    @user = user

    mail to: "#{task.project.client.email}", cc: "#{user.email}", subject: "#{task.title} has been completed."
  end

  def incompleted(task, user)
    @task = task
    @user = user

    mail to: "#{task.project.client.email}", cc: "#{user.email}", subject: "#{task.title} is yet to be completed."
  end

  def announce(announcement, user)
    @announcement = announcement
    @user = user
    mail to: "hello@shreyas.im", cc: "#{user.email}", subject: "#{announcement.title}"
  end

end

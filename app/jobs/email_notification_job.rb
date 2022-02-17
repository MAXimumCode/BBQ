class EmailNotificationJob < ApplicationJob
  queue_as :default

  def perform(object)
    event = object.event

    all_emails = (event.subscriptions.map(&:user_email) + [event.user.email] - [object&.user&.email]).uniq

    case object
    when Comment
      all_emails.each { |mail| EventMailer.comment(object, mail).deliver_later }
    when Photo
      all_emails.each { |mail| EventMailer.photo(object, mail).deliver_later }
    end
  end
end

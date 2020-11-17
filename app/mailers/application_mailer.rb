class ApplicationMailer < ActionMailer::Base
  default to: "info@twerterbook.com", from: "info@twerterbook.com"
  layout 'mailer'


end

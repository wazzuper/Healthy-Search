class ApplicationMailer < ActionMailer::Base
  default from: I18n.t('mailer.default')
  layout 'mailer'
end

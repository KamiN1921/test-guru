class FeedbackMailer < ApplicationMailer

  def contact_me(form_hash,admin)
    @name = form_hash[:name]
    @subj = form_hash[:subj]
    @email = form_hash[:email]

    mail to: admin.email, subject: 'Wants to contact'
  end
end

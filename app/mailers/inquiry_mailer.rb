class InquiryMailer < ApplicationMailer
  def received_email(inquiry)
    @inquiry = inquiry
    mail(:to => 'example@gmail.com', :subject => 'お問い合わせを承りました')
  end
end

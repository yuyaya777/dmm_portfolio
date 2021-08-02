class InquiryMailer < ApplicationMailer
  default from: "example@example.com"

  def received_email(inquiry)
    @inquiry = inquiry
    mail(:to => inquiry.email, :subject => '問い合わせを承りました')
  end
end

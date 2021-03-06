class Member::InquiryController < ApplicationController
  
  # 入力画面
  def index
    @inquiry = Inquiry.new
    render :index
  end
  
  # 確認画面
  def conform
    @inquiry = Inquiry.new(params[:inquiry].permit(:name, :email, :message))
    if @inquiry.valid?
      # 確認画面を表示
      render :conform
    else
      # NG発生、入力画面に戻る
      render :index
    end
  end
　
  # メール送信
  def thanks
    @inquiry =Inquiry.new(params[:inquiry].permit(:name, :email, :message))
    InquiryMailer.received_email(@inquiry).deliver
    render :thanks
  end
end

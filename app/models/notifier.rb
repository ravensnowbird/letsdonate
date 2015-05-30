class Notifier < ActiveRecord::Base
  belongs_to :ngo

  def incomplete?
    self.name.blank? && self.phone.blank? && self.email.blank?
  end

end

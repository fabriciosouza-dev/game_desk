class UserBackoffice::Yield < ApplicationRecord
  self.table_name = "gamedesk.yields"
  belongs_to :requester, class_name: "Requester", foreign_key: :requester_id, primary_key: :requester_id
end

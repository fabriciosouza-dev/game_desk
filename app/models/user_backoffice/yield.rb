class UserBackoffice::Yield < ApplicationRecord
  self.table_name = "gamedesk.yields"
  belongs_to :submitter, class_name: "Submitter", foreign_key: :submitter_id, primary_key: :submitter_id
end

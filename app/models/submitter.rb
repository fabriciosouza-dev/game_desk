class Submitter < ApplicationRecord
  self.table_name = "gamedesk.submitters"

  has_many :tickets, class_name: "Ticket", foreign_key: :submitter_id
end

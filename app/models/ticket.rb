class Ticket < ApplicationRecord
  self.table_name = "gamedesk.tickets"

  has_many :comments, class_name: "Comment", foreign_key: :ticket_id
  belongs_to :submitter, class_name: "Submitter", foreign_key: :submitter_id, primary_key: :submitter_id
end

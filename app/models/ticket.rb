class Ticket < ApplicationRecord
  self.table_name = "gamedesk.tickets"

  has_many :comments, class_name: "Comment", foreign_key: :ticket_id
  belongs_to :requester, class_name: "Requester", foreign_key: :requester_id, primary_key: :requester_id
end

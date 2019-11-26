class SessionAnswer < ApplicationRecord
  belongs_to :revision_session
  belongs_to :concept
end

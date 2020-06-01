class Sheep < ApplicationRecord
  self.table_name = "sheep"
end

class LegacyBook < ApplicationRecord
  self.primary_key = "isbn"
end

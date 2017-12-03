require 'elasticsearch/model'
class Note < ApplicationRecord
    belongs_to :user

    validates :subject, presence: true

    include Elasticsearch::Model
    include Elasticsearch::Model::Callbacks

end

# Note.import

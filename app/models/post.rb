class Post < ApplicationRecord
  has_many_attached :documents

  scope :with_eager_loaded_documents, -> { eager_load(documents_attachments: :blob) }
end

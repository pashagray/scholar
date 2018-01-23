class Attachment < ApplicationRecord
  belongs_to :attachmentable, polymorphic: true

  mount_uploader :doc, AttachmentUploader

  def word?
    %(doc docx).include?(doc.file.extension)
  end

  def excel?
    %(xls xlsx).include?(doc.file.extension)
  end
end

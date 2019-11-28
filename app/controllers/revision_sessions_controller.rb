class RevisionSessionsController < ApplicationController
  def index

  end

  def create_from_doc
    # RevisionSessionGenerator.generate_from_document(Document.find())
  end

  def create_from_tag
  end
end

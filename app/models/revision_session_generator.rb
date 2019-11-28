class RevisionSessionGenerator
  def self.generate_from_tags(tag_array)
    concepts = Concept.where(document: document)
    revision_session = RevisionSession.create(user: current_user, scheduled_at: scheduled_at)
    concepts.each do |concept|
      RevisionSessionConcept.create(concept: concept, revision_session: revision_session)
    end
  end

  def self.generate_from_document(document, scheduled_at = Date.now)
    concepts = Concept.where(document: document)
    revision_session = RevisionSession.create(user: current_user, scheduled_at: scheduled_at)
    concepts.each do |concept|
      RevisionSessionConcept.create(concept: concept, revision_session: revision_session)
    end
  end
end

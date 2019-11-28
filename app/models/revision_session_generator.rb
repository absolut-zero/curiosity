class RevisionSessionGenerator
  def self.generate_from_tags(tag_array, user, scheduled_at = nil)
    concepts = []
    tag_array.each do |tag|
      concepts << tag.concepts
    end
    concepts = concepts.flatten.uniq
    revision_session = RevisionSession.create(user: user, scheduled_at: scheduled_at)
    concepts.each do |concept|
      RevisionSessionConcept.create(concept: concept, revision_session: revision_session)
    end
  end

  def self.generate_from_document(document, user, scheduled_at = nil)
    concepts = document.concepts
    revision_session = RevisionSession.create(user: user, scheduled_at: scheduled_at)
    concepts.each do |concept|
      RevisionSessionConcept.create(concept: concept, revision_session: revision_session)
    end
  end
end

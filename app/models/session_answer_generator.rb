class SessionAnswerGenerator
  def self.generate(revision_session)
    @revision_session_concepts = revision_session.revision_session_concepts
    @session_answers = []
    @revision_session_concepts.each do |session_concept|
      @session_answers << SessionAnswer.new(revision_session_concept_id: session_concept.id)
    end
    @session_answers
  end
end

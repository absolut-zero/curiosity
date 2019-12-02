RATIO = 1.62

class RevisionSessionGenerator
  def self.generate_from_tags(tag_array, user, scheduled_at = nil)
    concepts = []
    tag_array.each do |tag|
      concepts << tag.concepts
    end
    concepts = concepts.flatten.uniq
    revision_session = RevisionSession.create!(user: user, scheduled_at: scheduled_at)
    concepts.each do |concept|
      RevisionSessionConcept.create!(concept: concept, revision_session: revision_session)
    end
    revision_session
  end

  def self.generate_from_document(document, user, scheduled_at = nil)
    concepts = document.concepts
    revision_session = RevisionSession.create!(user: user, scheduled_at: scheduled_at)
    concepts.each do |concept|
      RevisionSessionConcept.create!(concept: concept, revision_session: revision_session)
    end
    revision_session
  end

  def self.create_spaced_repitition(document, user)
    duration = 60
    day_secs = 86_400
    submit_date = document.submitted_at.at_beginning_of_day
    end_date = document.end_at.at_beginning_of_day
    unless document.end_at.nil?
      duration = ((end_date - submit_date) / day_secs).round
    end
    days = generate_fibonacci_rounded(duration)
    dates = []
    days.each { |day| dates << (submit_date + (day_secs * day)) }
    dates.each do |date|
      RevisionSessionGenerator.generate_from_document(document, user, date)
    end
  end

  def self.generate_fibonacci_rounded(limit)
    fib = []
    base = 1
    until base >= limit
      rounded = base.round
      fib << rounded
      base = RATIO * rounded
    end
    fib << limit if (base - limit) <= (limit - fib[-1])
    fib
  end
end

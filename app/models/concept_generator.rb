class ConceptGenerator
  def self.generate(document)
    @notes = document.notes
    # split based on triple new lines
    @notes = @notes.split(/\n\n\n/)
    # strip extra whitespace
    @notes.map(&:strip)
    # remove empty strings
    @notes.select! { |note| note.length.positive? }

    @concepts = []

    @notes.each do |note|
      @concepts << Concept.new(content: note)
    end

    @concepts
  end
end

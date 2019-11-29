# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

p "Clearing all sesion answers..."
SessionAnswer.destroy_all

p "Clearing all revision session concepts..."
RevisionSessionConcept.destroy_all

p "Clearing all revision sessions..."
RevisionSession.destroy_all

p "Clearing all tags..."
Tag.destroy_all

p "Clearing all concepts..."
Concept.destroy_all

p "Clearing all documents..."
Document.destroy_all

p "Clearing all folders..."
Folder.destroy_all

p "Clearing all users..."
User.destroy_all

p "Creating new users..."

user = User.create!(
  first_name: "User",
  last_name: "User",
  email: "user@user.com",
  password: "password",
  password_confirmation: "password"
)

llama = User.create!(
  first_name: "Larry",
  last_name: "da Llama",
  email: "larry@llama.com",
  password: "password",
  password_confirmation: "password"
)

student = User.create!(
  first_name: "Student",
  last_name: "Student",
  email: "student@student.com",
  password: "password",
  password_confirmation: "password"
)

p "Creating new folders..."

fol_llama_101 = Folder.create!(
  name: "Llama 101",
  user: llama
)

fol_llama_does_startups = Folder.create!(
  name: "Llama Does Startups",
  user: llama
)

fol_llama_does_love = Folder.create!(
  name: "Llama Does Love",
  user: llama
)

fol_llama_does_health = Folder.create!(
  name: "Llama Does Health",
  user: llama
)

fol_llama_does_friends = Folder.create!(
  name: "Llama Does Friends",
  user: llama
)

fol_biology = Folder.create!(
  name: "Biology",
  user: user
)

fol_business = Folder.create!(
  name: "Business",
  user: user
)

fol_financial_maths = Folder.create!(
  name: "Financial Mathematics",
  user: user
)

p "Creating new documents..."

doc_human_language = Document.create!(
  name: "How to speak to Hoomans",
  notes: "1",
  folder: fol_llama_101,
  user: llama
)

doc_grass = Document.create!(
  name: "Weed(s)",
  notes: "1",
  folder: fol_llama_101,
  user: llama
)

doc_driving = Document.create!(
  name: "How to drive",
  notes: "1",
  folder: fol_llama_101,
  user: llama
)

doc_vc = Document.create!(
  name: "Asking VCs 4 Moneyz",
  notes: "1",
  folder: fol_llama_does_startups,
  user: llama
)

doc_bc_ai = Document.create!(
  name: "Blockchain AI 101",
  notes: "1",
  folder: fol_llama_does_startups,
  user: llama
)

doc_good_grass = Document.create!(
  name: "Finding good grass",
  notes: "1",
  folder: fol_llama_does_love,
  user: llama
)

doc_girls = Document.create!(
  name: "Finding good Girl(s)",
  notes: "1",
  folder: fol_llama_does_love,
  user: llama
)

doc_friends = Document.create!(
  name: "Central Perk Ted Talk",
  notes: "1",
  folder: fol_llama_does_friends,
  user: llama
)

doc_how_you = Document.create!(
  name: "How you doin'?",
  notes: "1",
  folder: fol_llama_does_friends,
  user: llama
)

doc_spitting = Document.create!(
  name: "Spitting 101",
  notes: "Defensive measure:

  When a girl llama spits on you, it means she's not interested. Stay away Larry.


  Spitting on Hoomans:

  Only spit on hoomans if you feel threatened Larry. They are meant to be your friends.


  Training:

  A chad llama can spit accurately over 15 feet. This is your goal Larry. Train hard mate.


  How to spit:

  1. Pull ears back flat against head.
  2. Stare at your target.
  3. Raise your chin.
  4. Begin to gurgle.
  5. It's go time!",
  folder: fol_llama_101,
  user: llama
)

doc_evolution = Document.create!(
  name: "Evolution",
  notes: "Evolution is change in the heritable characteristics of biological populations over successive generations.[1][2] These characteristics are the expressions of genes that are passed on from parent to offspring during reproduction. Different characteristics tend to exist within any given population as a result of mutation, genetic recombination and other sources of genetic variation.[3] Evolution occurs when evolutionary processes such as natural selection (including sexual selection) and genetic drift act on this variation, resulting in certain characteristics becoming more common or rare within a population.[4] It is this process of evolution that has given rise to biodiversity at every level of biological organisation, including the levels of species, individual organisms and molecules.[5][6]


    The scientific theory of evolution by natural selection was conceived independently by Charles Darwin and Alfred Russel Wallace in the mid-19th century and was set out in detail in Darwin's book On the Origin of Species (1859).[7] Evolution by natural selection was first demonstrated by the observation that more offspring are often produced than can possibly survive. This is followed by three observable facts about living organisms: (1) traits vary among individuals with respect to their morphology, physiology and behaviour (phenotypic variation), (2) different traits confer different rates of survival and reproduction (differential fitness) and (3) traits can be passed from generation to generation (heritability of fitness).[8] Thus, in successive generations members of a population are more likely to be replaced by the progenies of parents with favourable characteristics that have enabled them to survive and reproduce in their respective environments. In the early 20th century, other competing ideas of evolution such as mutationism and orthogenesis were refuted as the modern synthesis reconciled Darwinian evolution with classical genetics, which established adaptive evolution as being caused by natural selection acting on Mendelian genetic variation.[9]


    All life on Earth shares a last universal common ancestor (LUCA)[10][11][12] that lived approximately 3.5–3.8 billion years ago.[13] The fossil record includes a progression from early biogenic graphite,[14] to microbial mat fossils,[15][16][17] to fossilised multicellular organisms. Existing patterns of biodiversity have been shaped by repeated formations of new species (speciation), changes within species (anagenesis) and loss of species (extinction) throughout the evolutionary history of life on Earth.[18] Morphological and biochemical traits are more similar among species that share a more recent common ancestor, and can be used to reconstruct phylogenetic trees.[19][20]


    Evolutionary biologists have continued to study various aspects of evolution by forming and testing hypotheses as well as constructing theories based on evidence from the field or laboratory and on data generated by the methods of mathematical and theoretical biology. Their discoveries have influenced not just the development of biology but numerous other scientific and industrial fields, including agriculture, medicine and computer science.[21]",
  folder: fol_biology,
  user: user
)

doc_alleles = Document.create!(
  name: "Alleles",
  notes: "An allele (/əˈliːl/, from German Allel and Greek ἄλλος állos “other”)[1][2] is a variant form of a given gene,[3] meaning it is one of two or more versions of a known mutation at the same place on a chromosome. It can also refer to different sequence variations for a several-hundred base-pair or more region of the genome that codes for a protein. Alleles can come in different extremes of size. At the lowest possible end one can be the single base choice of an SNP.[4] At the higher end, it can be the sequence variations for the regions of the genome that code for the same protein which can be up to several thousand base-pairs long.[5][6]


    Sometimes, different alleles can result in different observable phenotypic traits, such as different pigmentation. A notable example of this trait of color variation is Gregor Mendel's discovery that the white and purple flower colors in pea plants were the result of 'pure line' traits which could be used as a control for future experiments. However, most alleles result in little or no observable phenotypic variation.


    Most multicellular organisms have two sets of chromosomes; that is, they are diploid. In this case, the chromosomes can be paired: each pair is made up of two homologous chromosomes. If both alleles of a gene at the locus on the homologous chromosomes are the same, they and the organism are homozygous with respect to that gene. If the alleles are different, they and the organism are heterozygous with respect to that gene.",
  folder: fol_biology,
  user: user
)

doc_business_ethics = Document.create!(
  name: "Business Ethics",
  notes: "What the law says managers and directors should do?
    Corporations act – section(181)
    o Directors have duty to act in the best interest of the company
    o Prohibited from using their position to gain a personal advantage o Interpretation – must act in the best interest in the shareholders



    Reforming capitalism
    • Creating shared value à the competitiveness of a company and the hdependent
    o By recognizing and capitalizing on these connections betweeredefine capitalism
    o Value of sustainability – vital aspect of strategic planning



    Why should firms operate ethically
    o The firm relies on healthy systems
    o The firm will perform better;
    o And it's the right thing to do",
  folder: fol_business,
  user: user
)

doc_characteristics_of_major_asset_types = Document.create!(
  name: "Chapter 4 - Characteristics of Major Asset Types",
  notes: "4.1 Property
  → Not a liquid asset
  → Indivisible (can’t sell just a part of it)
  → Large unit of investment
  → Low flexibility
  → High transaction costs
  → Unoccupied buildings have expenses
  → Uniqueness
  Rent and expenses usually fixed for the
  length of the lease agreements
  Cap. app. = Capital appreciation
  Cap. dep. = Capital depreciation
  REIT (Listed property unit trusts)
  Provide liquidity, at an expenses of volatility,
  loss of control, and extra expenses



  4.2 Ordinary shares
  → Divisible
  → Liquid (for longer com→ Price is volatile
  → Flexible (can be bough→ Sources of return:
  Dividends, usually divide 50~70% of total profits



  4.3 Discount securities – short term
  → Short term = less than 6 months
  → No interest
  → Fixed maturity date
  → Known face value
  → Traded in the basis of ‘simple interest’
  → i.e. Treasury notes and BAB (Bank
  accepted bills)
  → Sources of return:
  Payment on maturity date – price they paid
  for the notes/bills



  4.4 Fixed coupon securities
  → Known face value
  → Fixed rate of interest
  → Traded in nominal rate of interest
  convertible m-thly
  → High liquidity
  → Volatile, but not as volatile as shares
  → Sources of return
  Pays the present value of the debt now, and
  receive an equal periodic payment or the
  interest payment until the maturity date,
  where also receives the face value amount



  4.5 Floating rate securities
  → Floating rate notes (FRN)
  → Known face value
  → Fixed maturity date
  → Interest varies with market rates
  → More liquid than property but not as liquid
  as fixed coupon securities
  → Sources of return:
  Same as fixed coupon securities, however
  now the coupon payment or the interest
  payment depends on the current interest
  rates traded that particular period. It then
  also paid out the face value at the maturity
  date",
  folder: fol_financial_maths,
  user: user
  )

doc_interest_rates = Document.create!(
  name: "Chapter 1 - Fundamental Concepts",
  notes: "1.1 Simple and compound interest
  Interest is a percentage of the principal
  deposit that is paid to the people who deposits
  their money in a bank.
  → It is an incentive for people to deposit their
  money in the bank
  → Encourage people to save money rather
  than spending it



  3 things affecting the amount interest paid
  - Interest rates offered by the bank
  (denoted as !). Usually as an annual
  percentage.
  i.e. 6% per annum
  - Times left on deposits (denoted as \")
  - The amount initially invested.
  Known as Principal (denoted as #)
  Principal ≠ Capital. Capital
  usually have a broader meaning
  than principal.



  1.2 Present value and discounted value
  We know that ) An= C(1+i)^n, with
  assumptions:
  1. Rate of interests does not depend on
  the amount invested
  2. Rate of interest does not vary over the
  period
  3. Dealing with integer number of units
  Present value
  The amount of money needed to have another
  amount of money at a future date.
  Supposedly we wanted to get B amount of
  money after n time units, with interest rates
  of i/timeperiods. Then the amount invested
  (C) or the present value (PV) is
",
  folder: fol_financial_maths,
  user: user
  )

p "Creating new tags..."

tag_grass = Tag.create!(
  name: "Grass"
  )

tag_girls = Tag.create!(
  name: "Girls"
  )

tag_fur = Tag.create!(
  name: "Fur"
  )

tag_hooman = Tag.create!(
  name: "Hooman"
  )

tag_blockchain = Tag.create!(
  name: "Blockchain"
  )

tag_biology = Tag.create!(
  name: "Biology"
  )

tag_capitalism = Tag.create!(
  name: "Capitalism"
  )

tag_genetics = Tag.create!(
  name: "Genetics"
  )

tag_law = Tag.create!(
  name: "Law"
  )

tag_ethics = Tag.create!(
  name: "Ethics"
  )

tag_finance = Tag.create!(
  name: "Finance"
  )

tag_genome = Tag.create!(
  name: "Genome"
  )

p "Creating new concepts..."

con_business_ethics1 = Concept.create!(
  prompt: "What the law says managers and directors should do?",
  content: "Corporations act – section(181)
    o Directors have duty to act in the best interest of the company
    o Prohibited from using their position to gain a personal advantage o Interpretation – must act in the best interest in the shareholders",
    document: doc_business_ethics
  )

con_business_ethics2 = Concept.create!(
  prompt: "Why should firms operate ethically?",
  content: "o The firm relies on healthy systems;
            o The firm will perform better;
            o And it's the right thing to do",
  document: doc_business_ethics
  )

con_alleles1 = Concept.create!(
  prompt: "What would a relatively good description of an Allele",
  content: "An allele (/əˈliːl/, from German Allel and Greek ἄλλος állos “other”)[1][2] is a variant form of a given gene,[3] meaning it is one of two or more versions of a known mutation at the same place on a chromosome. It can also refer to different sequence variations for a several-hundred base-pair or more region of the genome that codes for a protein. Alleles can come in different extremes of size. At the lowest possible end one can be the single base choice of an SNP.[4] At the higher end, it can be the sequence variations for the regions of the genome that code for the same protein which can be up to several thousand base-pairs long.[5][6]",
  document: doc_alleles
  )

con_alleles2 = Concept.create!(
  prompt: "How do you call multicellular organisms that have two sets of chromosomes",
  content: "They are diploid.",
  document: doc_alleles
  )

con_evolution1 = Concept.create!(
  prompt: "Who created the theory of Evolution? When did it start?",
  content: "The scientific theory of evolution by natural selection was conceived independently by Charles Darwin and Alfred Russel Wallace in the mid-19th century.",
  document: doc_evolution
  )

con_evolution2 = Concept.create!(
  prompt: "Which fields have been influenced by the theories on Evolution",
  content: "Their discoveries have influenced not just the development of biology but numerous other scientific and industrial fields, including agriculture, medicine and computer science.",
  document: doc_evolution
  )

con_llama1 = Concept.create!(
  prompt: "What to remember about girls?",
  content: "Defensive measure:

  When a girl llama spits on you, it means she's not interested. Stay away Larry.",
  document: doc_spitting
  )

con_llama2 = Concept.create!(
  prompt: "Do you spit on hoomans?",
  content: "Spitting on Hoomans:

  Only spit on hoomans if you feel threatened Larry. They are meant to be your friends.",
  document: doc_spitting
  )

con_llama3 = Concept.create!(
  prompt: "Guinness record for spitting (llama category)?",
  content: "Training:

  A chad llama can spit accurately over 15 feet. This is your goal Larry. Train hard mate.",
  document: doc_spitting
  )

con_llama4 = Concept.create!(
  prompt: "Steps for initiating and executing a good spit?",
  content: "How to spit:

  1. Pull ears back flat against head.
  2. Stare at your target.
  3. Raise your chin.
  4. Begin to gurgle.
  5. It's go time!",
  document: doc_spitting
  )

con_llama5 = Concept.create!(
  prompt: "Steps for initiating and executing a good spit?",
  content: "How to spit:

  1. Pull ears back flat against head.
  2. Stare at your target.
  3. Raise your chin.
  4. Begin to gurgle.
  5. It's go time!",
  document: doc_girls
  )

con_llama6 = Concept.create!(
  prompt: "Steps for initiating and executing a good spit?",
  content: "How to spit:

  1. Pull ears back flat against head.
  2. Stare at your target.
  3. Raise your chin.
  4. Begin to gurgle.
  5. It's go time!",
  document: doc_vc
  )

p "Tagging concepts..."

con_llama6.tags << [tag_capitalism, tag_hooman, tag_blockchain]

con_llama5.tags << [tag_girls, tag_hooman]

con_llama4.tags << [tag_girls, tag_hooman]

con_llama3.tags << [tag_girls, tag_grass]

con_business_ethics1.tags << [tag_law, tag_ethics, tag_capitalism]

con_business_ethics2.tags << [tag_law, tag_ethics, tag_capitalism]

con_alleles1.tags << [tag_genome, tag_genetics, tag_biology]

con_alleles2.tags << [tag_genome, tag_genetics, tag_biology]

con_evolution1.tags << [tag_genome, tag_genetics, tag_biology]

con_evolution2.tags << [tag_genome, tag_genetics, tag_biology]

p "Creating new revision sessions from documents..."

RevisionSessionGenerator.generate_from_document(doc_spitting, llama, Date.parse("29-11-2019"))

RevisionSessionGenerator.generate_from_document(doc_girls, llama, Date.parse("30-11-2019"))

RevisionSessionGenerator.generate_from_document(doc_vc, llama, Date.parse("02-12-2019"))

RevisionSessionGenerator.generate_from_document(doc_alleles, user, Date.parse("29-11-2019"))

RevisionSessionGenerator.generate_from_document(doc_evolution, user, Date.parse("30-11-2019"))

RevisionSessionGenerator.generate_from_document(doc_business_ethics, user, Date.parse("29-11-2019"))

p "Creating new revision sessions from tags..."

RevisionSessionGenerator.generate_from_tags([tag_biology, tag_genetics], user)

RevisionSessionGenerator.generate_from_tags([tag_capitalism, tag_finance], user)

p "** // ALL DONE :D // **"

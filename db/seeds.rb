Knowledge::Concept.destroy_all

knowledge_concepts = Knowledge::Concept.create!([
  { title: "rational numbers" },
  { title: "irrational numbers" },
  { title: "integers" },
  { title: "natural numbers" },
  { title: "whole numbers" },
  { title: "division" },
  { title: "HCF" },
  { title: "prime numbers" },
  { title: "composite numbers" },
  { title: "prime factorization" },
  { title: "factorization" },
  { title: "LCM" },
  { title: "exponents" },
  { title: "fundamental theorem of arithmetic" },
  { title: "proof by contradiction" },
  { title: "decimal place value system" },
  { title: "fractions" }
])

Learning::SkillsKnowledgeConcept.destroy_all
Learning::Skill.destroy_all

skill_concepts_data = [
  { skill: "identify rational and irrational numbers as real numbers",
    concepts: ["rational numbers", "irrational numbers"] },

  { skill: "locate different real numbers on the number line",
    concepts: ["rational numbers", "irrational numbers", "integers", "natural numbers", "whole numbers"] },

  { skill: "find the kind of a decimal form a given number has, by examining its denominator",
    concepts: ["decimal place value system", "exponents", "integers", "fractions"] },

  { skill: "convert the given rational numbers into their decimal forms",
    concepts: ["decimal place value system", "exponents", "integers", "fractions"] },

  { skill: "convert the given decimal numbers to their rational form",
    concepts: ["decimal place value system", "exponents", "integers", "fractions"] }
]

skill_concepts_data.each do |data|
  skill = Learning::Skill.create!(body: data[:skill])
  data[:concepts].each do |concept|
    skill.knowledge_concepts << Knowledge::Concept.find_by_title(concept)
  end
end

Curriculum::Topic.destroy_all
Curriculum::Board.destroy_all

curriculum_boards_data = [
  { name: 'CBSE' },
  { name: 'ICSE' },
  { name: 'IGCSE' }
]

cbse, icse, igcse = Curriculum::Board.create!(curriculum_boards_data)

science, english, maths = Curriculum::Topics::Subject.create!([
  { title: 'Science' },
  { title: 'English' },
  { title: 'Mathematics' }
])

science.build_board_subject(board: cbse).save!
english.build_board_subject(board: cbse).save!
maths.build_board_subject(board: icse).save!

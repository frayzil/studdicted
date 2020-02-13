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

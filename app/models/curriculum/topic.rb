class Curriculum::Topic < ApplicationRecord
  
  ################
  # For Custom STI
  self.store_full_sti_class = false
  self.inheritance_column = :ancestry_level
  
  def self.find_sti_class(type_name)
    super "Curriculum::#{type_name.classify}"
  end

  def self.sti_name
    name.demodulize.underscore
  end
  ################

  ################
  # For Ancestry
  module AncestryLevels
    SUBJECT = 'subject'.freeze
    BRANCH = 'branch'.freeze
    CHAPTER = 'chapter'.freeze
    SECTION = 'section'.freeze

    ALL = [BRANCH, CHAPTER, SECTION]
  end

  # enum ancestry_level: AncestryLevels::ALL.to_h { |t| [t, t] }, _suffix: true

  has_ancestry
  ################
  
  ################
  def subject
    ancestors.find_by ancestry_level: AncestryLevels::SUBJECT
  end
  ################

  ################
  def branch
    ancestors.find_by ancestry_level: AncestryLevels::BRANCH
  end

  def branches
    descendants.where ancestry_level: AncestryLevels::BRANCH
  end
  #################


  #################
  def chapter
    ancestors.find_by ancestry_level: AncestryLevels::CHAPTER
  end

  def chapters
    descendants.where ancestry_level: AncestryLevels::CHAPTER
  end
  #################

  #################
  def section
    ancestors.find_by ancestry_level: AncestryLevels::SECTION
  end

  def sections
    descendants.where ancestry_level: AncestryLevels::SECTION
  end
  #################


  #################
  def learning_skills
    sections.collect(&:learning_skills).flatten
  end
  #################

  #################
  def knowledge_concepts
    learning_skills.collect(&:knowledge_concepts).flatten
  end
  #################
end

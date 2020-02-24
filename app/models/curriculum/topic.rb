class Curriculum::Topic < ApplicationRecord
  
  ################
  # For Custom STI
  self.store_full_sti_class = false
  self.inheritance_column = :ancestry_level
  
  def self.find_sti_class(type_name)
    super "Curriculum::Topics::#{type_name.classify}"
  end

  def self.sti_name
    name.demodulize.underscore
  end
  ################

  ################
  # For Ancestry
  module AncestryLevels
    SUBJECT = 'subject'.freeze
    TOPIC_CHUNK = 'topic_chunk'.freeze
    TOPIC = 'topic'.freeze
    SECTION = 'section'.freeze

    ALL = [TOPIC_CHUNK, TOPIC, SECTION]
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
  def topic_chunk
    ancestors.find_by ancestry_level: AncestryLevels::TOPIC_CHUNK
  end

  def topic_chunks
    descendants.where ancestry_level: AncestryLevels::TOPIC_CHUNK
  end
  #################


  #################
  def topic
    ancestors.find_by ancestry_level: AncestryLevels::TOPIC
  end

  def topics
    descendants.where ancestry_level: AncestryLevels::TOPIC
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

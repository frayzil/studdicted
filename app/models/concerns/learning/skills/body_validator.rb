# frozen_string_literal: true

module Learning
  module Skills
    class BodyValidator < ActiveModel::Validator
      module ValidStartingPhrases
        IDENTIFY = 'identify'
        STATE = 'state'
        FIND = 'find'
        APPLY = 'apply'
        USE = 'use'
        REPRESENT = 'represent'
        VERIFY = 'verify'
        PROVE = 'prove'
        CONVERT = 'convert'
        CLASSIFY = 'classify'
        DRAW = 'draw'
        WRITE = 'write'

        include AllConstantsAsAll
      end

      def validate(skill)
        return if skill.body.start_with? *ValidStartingPhrases::ALL

        skill.errors[:body] <<
          'can only start with '\
          'any of the following phrases: '\
          "#{ValidStartingPhrases::ALL.join(', ')}"
      end
    end
  end
end

class ProblemExam < ApplicationRecord
  belongs_to :encounter
  enum appearance = [:healthy, :ill]
  enum psychiatric_state = [:calm, :depressed, :anxious, :agitated, :disoriented]
  enum bowel_sounds = [:normal, :hyperactive, :hypocative]
  enum pelvic_external = [:normal, :painful, :inflamed, :bleeding]
  enum pelvic_vaginal = [:normal, :painful, :inflamed, :bleeding]
  enum pelvic_uteris = [:normal, :painful, :inflamed, :bleeding]
  enum pelvic_ovaries = [:normal, :painful, :inflamed, :bleeding]
  enum pelvic_details = [:normal, :painful, :inflamed, :bleeding]
end

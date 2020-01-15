class ProblemExam < ApplicationRecord
  belongs_to :encounter
  enum appearance: [:healthy, :ill]
  enum psychiatric_state: [:calm, :depressed, :anxious, :agitated, :disoriented]
  enum bowel_sounds: [:normal_bowel, :hyperactive_bowel, :hypocative_bowel]
  enum pelvic_external: [:normal_external, :painful_external, :inflamed_external, :bleeding_external]
  enum pelvic_vaginal: [:normal_vaginal, :painful_vaginal, :inflamed_vaginal, :bleeding_vaginal]
  enum pelvic_uteris: [:normal_uteris, :painful_uteris, :inflamed_uteris, :bleeding_uteris]
  enum pelvic_ovaries: [:normal_ovaries, :painful_ovaries, :inflamed_ovaries, :bleeding_ovaries]
end

module Domain
  class Language < TypeIsEnum::ValueEnum
    add :English, 'English'
    add :Russian, 'Russian'
    add :German, 'German'
  end
end

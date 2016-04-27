module Infrastructure
  class EntityPresenter < SimpleDelegator
    include Infrastructure::PresentsEntity
  end
end

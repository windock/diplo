class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

protected

  def wrap_entity(entity)
    Infrastructure::EntityPresenter.new(entity)
  end

  def wrap_entity_collection(entities)
    entities.map { |entity| wrap_entity(entity) }
  end
end

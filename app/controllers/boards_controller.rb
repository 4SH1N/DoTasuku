class BoardsController < ApplicationController
  before_action :authenticate_user!

  def main
  @tasks = current_user.tasks
  end
end

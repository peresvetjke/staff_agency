class CandidatesController < ApplicationController
  before_action :find_candidate, only: %i[show edit update destroy]

  def index
    respond_with @candidates = Candidate.all
  end

  def show
    respond_with @candidate
  end

  def new
  end

  def create
    respond_with(@candidate = Candidate.create(candidate_params))
  end

  def edit
  end

  def update
    @candidate.update(candidate_params)
    respond_with(@candidate)
  end

  def destroy
    respond_with(@candidate.destroy)
  end

  private

  def find_candidate
    @candidate = Candidate.find(params[:id])
  end

  def candidate_params
    params.require(:candidate).permit(:name, :middle_name, :surname, :desired_salary, :phone_number, :email, :skill_list)
  end
end
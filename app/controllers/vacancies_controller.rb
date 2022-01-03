class VacanciesController < ApplicationController
  before_action :find_vacancy, only: %i[show edit update destroy candidates]

  def index
    respond_with @vacancies = Vacancy.all
  end

  def show
    respond_with @vacancy
  end

  def new
  end

  def create
    respond_with(@vacancy = Vacancy.create(vacancy_params))
  end

  def edit
  end

  def update
    @vacancy.update(vacancy_params)
    respond_with(@vacancy)
  end

  def destroy
    respond_with(@vacancy.destroy)
  end

  def candidates
    full_match = Candidate.tagged_with(@vacancy.skill_list, :match_all => true)
    partial_match = Candidate.tagged_with(@vacancy.skill_list, :any => true) - full_match
    
    @candidates = { full_match: full_match, partial_match: partial_match }
  end

  private

  def find_vacancy
    @vacancy = Vacancy.find(params[:id])
  end

  def vacancy_params
    params.require(:vacancy).permit(:title, :salary, :phone_number, :email, :expiration_date, :skill_list)
  end
end
class VacanciesController < ApplicationController
  before_action :find_vacancy, only: %i[show]

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

  private

  def find_vacancy
    @vacancy = Vacancy.find(params[:id])
  end

  def vacancy_params
    params.require(:vacancy).permit(:title, :salary, :phone_number, :email, :expiration_date, :skill_list)
  end
end
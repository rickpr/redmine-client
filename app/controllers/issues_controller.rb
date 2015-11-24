class IssuesController < ApplicationController

  # GET /issues/new
  def new
    @issue = Issue.new(subject: nil, description: nil, custom_field_values: nil, due_date: nil)
  end

  # POST /issues
  # POST /issues.json
  def create
    @issue = Issue.new(issue_params)

    respond_to do |format|
      if @issue.save
        format.html { redirect_to :success, notice: 'Issue was successfully created.' }
        format.json { render json: @issue }
      else
        format.html { render :new }
        format.json { render json: @issue.errors, status: :unprocessable_entity }
      end
    end
  end

  def success
  end

  private

    # Never trust parameters from the scary internet, only allow the white list through.
    def issue_params
      params.require(:issue).permit(:subject, :description, :due_date, custom_field_values: (1..6).map(&:to_s)).merge(project_id: REDMINE_PROJECT, tracker: "Data Request", status: "New")
    end
end

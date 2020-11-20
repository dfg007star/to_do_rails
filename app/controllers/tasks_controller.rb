class TasksController < ApplicationController
    before_action :set_project, only: [:show, :edit, :update, :destroy]

    def create 
        @task = Task.create(task_params)

        if @task.save
            redirect_to root_path, notice: 'Task was successfully created.' 
        else 
            redirect_to root_path
        end
    end

    def edit
    end
  
    def update 
        @task = Task.find(params[:id])

        if @task.update(task_params)
            redirect_to root_path, notice: 'Task was successfully updated.' 
        else 
            redirect_to root_path
        end
    end

    def destroy
        @task.destroy
        respond_to do |format|
          format.html { redirect_to root_path, notice: 'Task was successfully destroyed.' }
          format.json { head :no_content }
        end
      end

    private

    def set_project
        @task = Task.find(params[:id])
    end

    def task_params
        params.require(:task).permit(:name, :status, :project_id)
    end
end

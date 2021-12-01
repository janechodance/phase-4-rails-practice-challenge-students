class StudentsController < ApplicationController
    def index
        students = Student.all 
        render json: students
    end
    def show
        student = Student.find(params[:id])
        if student 
            render json: student
        else
            render json: {error: "Student not found"}, status: :not_found
        end
    end
    def update
        student = Student.find(params[:id])
        if student 
            student.update(student_params)
            render json: student
        else
            render json: {error: "Student not found"}, status: :not_found
        end
    end
    def create
        student = Student.create(student_params)
        if student.valid?
            render json: student, status: :created
        else
            render json: { error: student.errors.full_messages }, status: :unprocessable_entity
        end
    end
    def destroy
        student = Student.find(params[:id])
        if student 
            student.destroy
            head :no_content
        else
            render json: {error: "Student not found"}, status: :not_found
        end
    end

private
def student_params
    params.permit(:name,:major,:age,:instructor_id)
end

end
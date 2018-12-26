class ClassesController < ApplicationController
  def index
    @class_list = fetch_classes_by_prof_id('P-0050')

    class_ids = @class_list.map { |data| data['classId']}
    @student_ids = {}
    class_ids.each do |class_id|
      @student_ids[class_id] = fetch_classes_by_class_id(class_id)
    end
  end

  def export
    file_name = 'attendance_cprograming.csv'
    filepath = Rails.root.join('public', file_name)
    stat = File::stat(filepath)
    send_file(filepath, :filename => file_name, :length => stat.size)
  end

  private

  def fetch_classes_by_prof_id(prof_id)
    response = send_request(ENV['REQ_CLASS_BY_PROF_ID'], { professor_id: prof_id })
    response['classData']
  end

  def fetch_classes_by_class_id(class_id)
    send_request(ENV['REQ_CLASS_BY_CLASS_ID'], { class_id: class_id })
  end
end

class ClassesController < ApplicationController
  def index
    @class_list = send_request(ENV['REQ_CLASS_BY_PROFID'], {professor_id: "P-0050"})
  end
end

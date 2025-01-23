class ErrorsController < ApplicationController
    skip_before_action :check_db_connection

    def db_connection_error

    end
end
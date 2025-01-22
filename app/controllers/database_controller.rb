class DatabaseController < ApplicationController
  before_action :set_database_status, only: [:connect, :disconnect]

  def connect
    if @database_disabled
      begin
        ActiveRecord::Base.establish_connection(
          adapter:  "postgresql",
          host:     "localhost",
          username: "Vovs",
          password: "123",
          database: "Gym"
        )
        session[:database_disabled] = false # Сохраняем состояние в сессии
        flash[:success] = "Успешно подключено к базе данных."
      rescue => e
        flash[:error] = "Ошибка подключения: #{e.message}"
      end
    else
      flash[:warning] = "База данных уже подключена."
    end
    redirect_to root_path
  end

  def disconnect
    unless @database_disabled
      begin
        ActiveRecord::Base.connection.disconnect!
        session[:database_disabled] = true # Сохраняем состояние в сессии
        flash[:success] = "Успешно отключено от базы данных."
      rescue => e
        flash[:error] = "Ошибка отключения: #{e.message}"
      end
    else
      flash[:warning] = "База данных уже отключена."
    end
    redirect_to root_path
  end

  private

  def set_database_status
    # Используем сессию для хранения состояния подключения
    @database_disabled = session[:database_disabled] || false
  end
end
class ApplicationController < ActionController::Base
    def transl
        {"Бассейн" => "pool", "Тренажёрный зал" => "gym", "Игры" => "games",
             "Групповые тренировки" => "group"}
    end
end

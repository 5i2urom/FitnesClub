module JoinHelper
    def transl
        {"Бассейн" => "pool", "Тренажёрный зал" => "gym", "Игры" => "games", "Групповые тренировки" => "group",
        "Плавание" => 'swim', "Аквааэробика" => 'aquaerobics', "Детские занятия" => 'kid', "Водное поло" => "polo",
        "Самостоятельные занятия" => 'own', "Занятия с тренером" => 'with_coach', 
        "Самостоятельные занятия в большом зале" => 'own_big', "Занятия с тренером в большом зале" => 'with_coach_big',
        "Волейбол" => "volleyball", "Баскетбол" => "basketball", "Футбол" => "football", "Теннис" => "tennis",
        "Аэробика" => "aerobics", "Танцы" => "dance", "Боевые искусства" => "fight", "Силовые тренировки" => "power" }
    end

    def show_cond
        $record = nil
    end

    def before_service
        return unless service_params[:service].nil?
        redirect_to join_path
    end

    def act_cond
        return unless act_params[:activity].nil?
        redirect_to join_path
    end
end

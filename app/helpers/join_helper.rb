module JoinHelper
    def transl
        {"Бассейн" => "pool", "Тренажёрный зал" => "gym", "Игры" => "games", "Групповые тренировки" => "group",
        "Плавание" => 'swim', "Аквааэробика" => 'aquaerobics', "Детские занятия" => 'kid', "Водное поло" => "polo",
        "Самостоятельные занятия" => 'own', "Занятия с тренером" => 'with_coach', 
        "Самостоятельные занятия в большом зале" => 'own_big', "Занятия с тренером в большом зале" => 'with_coach_big',
        "Волейбол" => "volleyball", "Баскетбол" => "basketball", "Футбол" => "football", "Теннис" => "tennis",
        "Аэробика" => "aerobics", "Танцы" => "dance", "Боевые искусства" => "fight", "Силовые тренировки" => "power" }
    end

    def before_show
        $record = nil
    end

    def before_service
        # p $record
        # p $record.has_key?(:service)
        # p '----------'
        return unless service_params[:service].nil? 
        # p 'xxxx'
        # p $record
        redirect_to join_path
    end

    def before_act
        return unless act_params[:activity].nil? && $record.has_key?(:service) # имеет предыдущий ключ
        redirect_to join_path
    end

    def redirect_if_empty #если "голый" запрос
        return unless $record.empty?
        redirect_to join_path
    end
end

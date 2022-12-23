module JoinHelper
    def transl
        {"Бассейн" => "pool", "Тренажёрный зал" => "gym", "Игры" => "games", "Групповые тренировки" => "group",
        "Плавание" => 'swim', "Аквааэробика" => 'aquaerobics', "Детские занятия" => 'kid', "Водное поло" => "polo",
        "Самостоятельные занятия" => 'own', "Занятия с тренером" => 'with_coach', 
        "Самостоятельные занятия в большом зале" => 'own_big', "Занятия с тренером в большом зале" => 'with_coach_big',
        "Волейбол" => "volleyball", "Баскетбол" => "basketball", "Футбол" => "football", "Теннис" => "tennis",
        "Аэробика" => "aerobics", "Танцы" => "dance", "Боевые искусства" => "fight", "Силовые тренировки" => "power",
        
        "Фитнес Бауманская" => "baumanskaya", "Фитнес Измайлово" => "izmaylovo", "Фитнес Раменки" => "ramenki",
        "Фитнес Романов" => "romanov"}
    end

    def set_empty
        #[:service, :activity, :club, :coach].each { |key| $record.delete(key) if $record&.has_key?(key) }
        $record = nil
    end

    def before_service
        [:activity, :club, :coach].each { |key| $record.delete(key) if $record&.has_key?(key) }
        # p $record
        # p $record.has_key?(:service)
        # p '----------'
        return unless service_params[:service].nil? && !$record&.has_key?(:service) #нет параметров и записи в хэш - редирект
        p 'aaaaaaaaaa'
        p $record
        redirect_to join_path
    end

    def before_act
        [:club, :coach].each { |key| $record.delete(key) if $record&.has_key?(key) }
        return unless act_params[:activity].nil? && !$record&.has_key?(:activity) &&
            !$record&.has_key?(:service) # #нет параметров и записи в хэш и предыдущего- редирект
        # p 'bbbbbbb'
        redirect_to join_path
    end

    def before_calendar
        [:coach].each { |key| $record.delete(key) if $record&.has_key?(key) }
        return unless act_params[:club].nil? && !$record&.has_key?(:activity) &&
            !$record&.has_key?(:service) && !$record&.has_key?(:club) # #нет параметров и записи в хэш и предыдущего- редирект
        # p 'bbbbbbb'
        redirect_to join_path
    end

    def redirect_if_empty #если "голый" запрос
        return unless $record&.empty?
        # p 'ccccccccc'
        redirect_to join_path        
    end
end

# frozen_string_literal: true

module JoinHelper
  def transl
    { 'Бассейн' => 'pool', 'Тренажёрный зал' => 'gym', 'Игры' => 'games', 'Групповые тренировки' => 'group',
      'Плавание' => 'swim', 'Аквааэробика' => 'aquaerobics', 'Детские занятия' => 'kid', 'Водное поло' => 'polo',
      'Самостоятельные занятия' => 'own', 'Занятия с тренером' => 'with_coach',
      'Самостоятельные занятия в большом зале' => 'own_big', 'Занятия с тренером в большом зале' => 'with_coach_big',
      'Волейбол' => 'volleyball', 'Баскетбол' => 'basketball', 'Футбол' => 'football', 'Теннис' => 'tennis',
      'Аэробика' => 'aerobics', 'Танцы' => 'dance', 'Боевые искусства' => 'fight', 'Силовые тренировки' => 'power',

      'Фитнес Бауманская' => 'baumanskaya', 'Фитнес Измайлово' => 'izmaylovo', 'Фитнес Раменки' => 'ramenki',
      'Фитнес Романов' => 'romanov' }
  end

  private

  def set_empty
    $record = Hash.new(3)
  end

  def before_service
    %i[activity club].each { |key| $record.delete(key) if $record&.key?(key) }
    return unless service_params[:service].nil? && !$record&.key?(:service)

    redirect_to join_path
  end

  def before_act
    @act = Act.find_by(activity: act_params[:activity]) # activity, которое пришло из параметров

    [:club].each { |key| $record.delete(key) if $record&.key?(key) }

    return unless (act_params[:activity].nil? && !$record&.key?(:activity) &&
        !$record&.key?(:service)) || @act.service.name != $record[:service] # если несоотвествие service и activity

    redirect_to join_path
  end

  def before_club
    [:club].each { |key| $record.delete(key) if $record&.key?(key) }
    p !Coach.find_by(user_id: current_user&.id)
    p act_params[:activity].nil? && !$record&.key?(:activity) && !Coach.find_by(user_id: current_user&.id)
    return unless act_params[:activity].nil? && !$record&.key?(:activity) || Coach.find_by(user_id: current_user&.id)
    redirect_to join_path
  end

  def before_calendar
    return unless act_params[:club].nil? && (!$record&.key?(:activity) ||
        !$record&.key?(:service)) && !redir || Coach.find_by(user_id: current_user&.id) # #нет параметров и записи в хэш и предыдущего- редирект

    redirect_to join_path
  end

  def redirect_if_empty
    return unless $record&.empty?

    redirect_to join_path
  end

  def redirect_if_nil
    return unless $record.nil?

    redirect_to start_show_path
  end
end

class FileActions

  def create_file(filename)
    time = Time.now
    file = File.new(filename, 'a')
    emit_action(file, 'create', time)
  end

  def modify_file(filename, append_text)
    time = Time.now
    file = File.new(filename, 'a+')
    file.syswrite(append_text)
    emit_action(file, 'modified', time)
  end

  def rename_file(filename, new_name)
    time = Time.now
    File.rename(filename, new_name)
    file = File.new(new_name, 'r')
    emit_action(file, 'rename', time)
  end

  def delete_file(filename)
    time = Time.now
    File.open(filename, 'r') do |f|
      if !f.nil? && File.exist?(f)
        emit_action(f, 'deletion', time)
        File.delete(f)
      end
    end
  end

  private

  def emit_action(file, action, time)
    file_action = {}
    file_action[:info] = file
    file_action[:time] = time
    file_action[:user] = ENV['USERNAME'] ? ENV['USERNAME'] : ENV['USER']
    file_action[:full_path] = file.path
    file_action[:activity] = action
    file_action[:process_id] = Process.pid

    file.close

    transmit_action_data(file_action)
    log_action(file_action)
  end

  def transmit_action_data(data)
    transmission = data_transmit_service.transmit(data)
  end

  def log_action(file_info)
    my_logger ||= Logger.new("#{Rails.root}/log/my.log")
    my_logger.info(file_info)
    puts file_info
  end

  def data_transmit_service
    DataTransmitService.new
  end
end

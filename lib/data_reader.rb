# encoding: utf-8

class DataReader
  def read_data_from_file(file_name)
    return unless File.exist?(file_name)

    data = File.readlines(file_name, encoding: 'UTF-8')
  end
end

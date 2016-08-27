module DSB
  class Config

    # Retrieves whole config as a Hash
    def self.get
      file = File.open('./config.json', File::RDONLY)
      @@config ||= JSON.parse(file.read, symbolize_names: true)
      file.close

      @@config
    end

  end
end
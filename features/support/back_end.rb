require "json"
require "yaml"
require "ostruct"

class BackEnd
    @dados = JSON.parse(YAML.load(File.read("features/support/data/back_end.yml")).to_json,object_class: OpenStruct)

    def self.get(info)
        @dados.send(info)
    end
end
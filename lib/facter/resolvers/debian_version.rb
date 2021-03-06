# frozen_string_literal: true

module Facter
  module Resolvers
    class DebianVersion < BaseResolver
      # :major
      # :minor
      # :full

      init_resolver

      class << self
        private

        def post_resolve(fact_name, _options)
          @fact_list.fetch(fact_name) { read_debian_version(fact_name) }
        end

        def read_debian_version(fact_name)
          file_content = Facter::Util::FileHelper.safe_read('/etc/debian_version')
          @fact_list[:version] = file_content.strip unless file_content.empty?

          @fact_list[fact_name]
        end
      end
    end
  end
end

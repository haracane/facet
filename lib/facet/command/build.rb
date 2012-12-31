module Facet
  module Command
    module Build
      def self.run(argv)
        @user_name = `/usr/bin/env git config --get user.name`
        if @user_name == ""
          STDERR.puts "ERROR: user.name is not set in git config"
          return 1
        end
        
        @user_email = `/usr/bin/env git config --get user.email`
        if @user_email == ""
          STDERR.puts "ERROR: user.email is not set in git config"
          return 1
        end
        
        @github_user = `/usr/bin/env git config --get github.user`
        if @github_user == ""
          STDERR.puts "ERROR: github.user is not set in git config"
          return 1
        end
        
        @project_name = argv.shift
        @module_name = Facet.to_camel_case(@project_name)
        @project_name_upcase = @project_name.upcase
        
        [
          @project_name,
          "#{@project_name}/lib",
          "#{@project_name}/spec",
          "#{@project_name}/spec/lib"
          ].each do |dirpath|
          Dir.mkdir(dirpath) unless FileTest.exist?(dirpath)
        end
        
        all_flag = false
        
        [
          ".document",
          ".gitignore",
          ".rspec",
          "Gemfile",
          "LICENSE.txt",
          "README.rdoc",
          "Rakefile",
          "lib/project.rb",
          "spec/spec_helper.rb",
          "spec/lib/project_spec.rb",
          ].each do |filepath|
          content = ERB.new(File.read("#{Facet::TEMPLATES_DIR}/#{filepath}.erb")).result(binding)
          dest_path = "#{@project_name}/#{filepath.gsub(/project/, @project_name)}"
          exist_flag = FileTest.exist?(dest_path)
          if !all_flag && exist_flag
            STDOUT.print "overwrite #{dest_path}?(y/n/a): "
            answer = STDIN.gets
            answer.chomp!
            case answer
            when "y"
            when "n"
              next
            when "a"
              all_flag = true
            end
          end
          File.open(dest_path, "w") do |f|
            f.write(content)
          end
          if exist_flag
            STDOUT.puts "overwrited #{dest_path}"
          else
            STDOUT.puts "created #{dest_path}"
          end
        end
        return 0
      end
    end
  end
end

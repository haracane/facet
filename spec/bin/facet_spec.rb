require "spec_helper"

describe "bin/facet" do
  before :all do
    @stdout_redirect = Facet::REDIRECT[:stdout]
    @stderr_redirect = Facet::REDIRECT[:stderr]
  end
  
  it "should create valid gem template" do
    work_dir = "/tmp/#{ENV["USER"]}"
    if ! FileTest.exists?(work_dir)
      Dir.mkdir(work_dir)
    end
    Dir.chdir(work_dir){
      if FileTest.exists?("facet_test")
        result = system("rm -rf facet_test")
        result.should be_true
      end
      system("#{Facet::RUBY_CMD} #{Facet::BIN_DIR}/facet --test facet_test #{@stdout_redirect} #{@stderr_redirect}").should be_true
      Dir.chdir("facet_test"){
        result = system("rake spec spec:rcov #{@stdout_redirect} #{@stderr_redirect}")
        result.should be_true
        
        FileTest.exists?("coverage").should be_true

        File::Stat.new("./bin/facet_test").mode.should == 0100755
        
        system("ruby -I ./lib ./bin/facet_test").should be_true
      }
      
      
      # Dir.chdir("facet_test"){
        # result = system("rake ci:setup:rspec spec #{@stdout_redirect} #{@stderr_redirect}")
        # result.should be_true
# 
        # FileTest.exists?("spec/reports").should be_true
      # }
    }
  end
end

require "spec_helper"

describe "bin/facet" do
  before :all do
    @stdout_redirect = Facet::REDIRECT[:stdout]
    @stderr_redirect = Facet::REDIRECT[:stderr]
  end
  
  it "should create valid gem template" do
    Dir.chdir("/tmp"){
      if FileTest.exists?("facet_test")
        result = system("rm -rf facet_test")
        result.should be_true
      end
      result = system("#{Facet::RUBY_CMD} -I #{Facet::LIB_DIR} #{Facet::BIN_DIR}/facet facet_test #{@stdout_redirect} #{@stderr_redirect}")
      result.should be_true
      Dir.chdir("/tmp/facet_test"){
        result = system("rake spec spec:rcov #{@stdout_redirect} #{@stderr_redirect}")
        result.should be_true
        
        result = FileTest.exists?("/tmp/facet_test/coverage/rcov")
        result.should be_true
        
        result = system("rake ci:setup:rspec spec #{@stdout_redirect} #{@stderr_redirect}")
        result.should be_true

        result = FileTest.exists?("/tmp/facet_test/spec/reports")
        result.should be_true
      }
    }
  end
end

require 'colorize'
require_relative '../boot'

namespace :monkeyking do
  desc 'output Myob employee payslip'
  task :output_payslip_csv do
    PayslipProcessor.new("#{Monkeyking.project_root}/employees_salary.csv").run

    puts successful_message.yellow
  rescue ValidateInputCSVException => e
    puts "#{e.message}, Please check employees_salary.csv file and run again".red
  end

  def successful_message
    <<-HEARDOC
==================================================================================
======                                                                    ========
====== Done!! Please get payslips CSV file from output/payslips.csv       ========
======                                                                    ========
====== contact Edward_mjz@hotmail.com if you have any questions on result ========
======                                                                    ========
======                         HAVE A GOOD DAY!!!!!                       ========
======                                                                    ========
======                                                      Edward Chow   ========
==================================================================================
    HEARDOC
  end
end

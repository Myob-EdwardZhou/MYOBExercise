namespace :monkeyking do
  desc 'output Myob employee pay slip'
  task :output_pay_slip_csv do
    require_relative '../boot'

    PayslipProcessor.new("#{Monkeyking.project_root}/employee_pay_slip.csv").run
  end
end

# frozen_string_literal: true
# RSpec.describe PayslipProcessor, "#run" do
#   let(:input_csv) { double(:input_csv) }
#
#   subject { described_class.new(input_csv).run }
#
#   describe 'validate input csv and generate result csv' do
#     let(:csv_data)             { double(:csv_data, map_to_employees: []) }
#     let(:csv_validator)        { double(:csv_validator) }
#     let(:payslip_builder)      { double(:payslip_builder) }
#     let(:payslips)             { double(:payslips) }
#     let(:payslip_csv_exporter) { double(:payslip_csv_exporter) }
#
#     before do
#       allow(CSVParser).to receive(:new).with(input_csv).and_return(csv_data)
#       allow(CSVValidator).to receive(:new).with(csv_data).and_return(csv_validator)
#       allow(csv_validator).to receive(:validate)
#       allow(csv_data).to receive(:map_to_employees).and_return(payslips)
#       allow(PayslipCSVExporter).to receive(:new).with(payslips).and_return(payslip_csv_exporter)
#     end
#
#     it 'call generate method on csv generator' do
#       expect(payslip_csv_exporter).to receive(:export)
#
#       subject
#     end
#   end
# end

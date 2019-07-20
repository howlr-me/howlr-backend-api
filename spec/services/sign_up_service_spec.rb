# frozen_string_literal: true

require 'rails_helper'

RSpec.describe SignUpService, type: :service do
#   let(:sign_up_params) do
#     {
#       full_name: Faker::Name.name,
#       email: Faker::Internet.email,
#       client: {
#         name: Faker::Company.name,
#         webpage: Faker::Internet.url,
#         number_of_employees: Faker::Number.within(1..1000)
#       }
#     }
#   end

#   subject { SignUpService.new(sign_up_params) }

#   describe '#perform' do
#     it 'sign ups client' do
#       user = subject.perform
#       expect(user.has_role?(:admin)).to be_truthy
#       expect(user.client.name).to eq(sign_up_params[:client][:name])
#     end

#     it 'rollback with error' do
#       subject.perform
#       user_count = User.count
#       expect { subject.perform }.to raise_error(ActiveRecord::RecordInvalid)
#       expect(user_count).to eq(User.count)
#     end
#   end
end

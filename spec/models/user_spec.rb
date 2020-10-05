require 'rails_helper'

RSpec.describe User, type: :model do
  let(:user){ FactoryBot.build(:user)}

  #verifica os campos orbigatorios a ser preenchidos
  it{ is_expected.to validate_presence_of :name}
  it{ is_expected.to validate_presence_of :email}
  it{ is_expected.to validate_presence_of :document}

  #verifica se os campo ainda existe no banco
  it{ is_expected.to respond_to(:role)}
  it{ is_expected.to respond_to(:name)} 
  it{ is_expected.to respond_to(:email)}
  it{ is_expected.to respond_to(:avatar)}
  it{ is_expected.to respond_to(:document)}
  it{ is_expected.to respond_to(:status)}
end

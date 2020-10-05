require 'rails_helper'

RSpec.describe ReservedCar, type: :model do
  let(:adiantamento_funcionario){ FactoryBot.build(:adiantamento_funcionario)}

  #verifica os relacionamentos
  it{ is_expected.to belong_to(:car)}
  it{ is_expected.to belong_to(:user)}

  #verifica os campos orbigatorios a ser preenchidos
  it{ is_expected.to validate_presence_of :document}
  it{ is_expected.to validate_presence_of :start_at}
  it{ is_expected.to validate_presence_of :and_at}

  #verifica se os campo ainda existe no banco
  it{ is_expected.to respond_to(:car_id)}
  it{ is_expected.to respond_to(:document)} 
  it{ is_expected.to respond_to(:start_at)}
  it{ is_expected.to respond_to(:and_at)} 
  it{ is_expected.to respond_to(:user_id)} 

end

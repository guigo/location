require 'rails_helper'

RSpec.describe Car, type: :model do
  let(:car){ FactoryBot.build(:car)}

  #verifica os campos orbigatorios a ser preenchidos
  it{ is_expected.to validate_presence_of :model}
  it{ is_expected.to validate_presence_of :brand}
  it{ is_expected.to validate_presence_of :board}
  it{ is_expected.to validate_presence_of :model_year}
  it{ is_expected.to validate_presence_of :year_manufacture}

  #verifica se os campo ainda existe no banco
  it{ is_expected.to respond_to(:model)}
  it{ is_expected.to respond_to(:brand)} 
  it{ is_expected.to respond_to(:board)}
  it{ is_expected.to respond_to(:model_year)}
  it{ is_expected.to respond_to(:year_manufacture)}
  it{ is_expected.to respond_to(:image)}
  it{ is_expected.to respond_to(:descriptrion)}
  it{ is_expected.to respond_to(:status)}

end

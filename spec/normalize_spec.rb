require 'spec_helper'

describe Mongoid::NormalizeStrings do
  class City
    include Mongoid::Document
    include Mongoid::NormalizeStrings

    field :name
    normalize :name
  end

  it 'normalize fields after create' do
    city = City.create(name: 'Córdoba')
    expect(city.name_normalized).to eq('cordoba')
  end

  it 'normalize fields after save' do
    city = City.create(name: 'Córdoba')
    city.name = 'Ávila'
    city.save
    expect(city.reload.name_normalized).to eq('avila')
  end
end

require 'spec_helper'

describe Mongoid::NormalizeStrings do
  class City
    include Mongoid::Document
    include Mongoid::NormalizeStrings

    field :name
    normalize :name
  end

  describe 'hooks' do
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

  describe 'inheritance' do
    context 'when superclass has normalized_fields' do
      it 'return superclass + class normalized fields' do
        class MyCity < City
          field :state
          normalize :state
        end

        expect(City.normalized_fields).to match_array([:name])
        expect(MyCity.normalized_fields).to match_array([:name, :state])
      end
    end

    context 'when superclass has not normalized_fields' do
      it 'return class normalized_fields' do
        class A
          include Mongoid::Document
        end

        class B < A
          include Mongoid::NormalizeStrings

          field :name
          normalize :name
        end

        expect(B.normalized_fields).to match_array([:name])
      end
    end
  end
end

require 'spec_helper'

describe 'Usual example' do
  subject { 2 + 2 }

  context 'success' do
    specify { expect(subject).to eq(4) }
  end

  context 'failed' do
    specify { expect(subject).to eq(5) }
  end

  context 'pending' do
    it 'should be pending'
  end
end

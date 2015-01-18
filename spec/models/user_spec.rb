require 'rails_helper'

describe User do
  before {@user = FactoryGirl.build(:user)}
  subject {@user}
  it {should validate_presence_of(:email)}
  it {should validate_uniqeness_of(:email)}
  it {should validate_confirmation_of(:password)}
  it {should allow_value('ecample@domain.com').for(:email)}
end

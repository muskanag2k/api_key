class KeysController < ApplicationController
  before_action :set_key, only: [:unblock, :delete]

  def get_all_available_keys
    keys = Key.where(status: 'active').pluck(:value)
    render json: { available_keys: keys }
  end

  def get_all_blocked_keys
    keys = Key.where(status: 'blocked').pluck(:value)
    render json: { blocked_keys: keys }
  end

  # E1: Generate a new key
  def generate
    key = Key.create(value: rand(100).to_s, status: 'active', last_used_at: Time.now)
    render json: { key: key.value }
  end

  # E2: Get an available key
  def get_available
    key = Key.where(status: 'active').order('RANDOM()').first
    if key
      key.update(status: 'blocked')
      render json: { key: key.value}
    else
      head :not_found
    end
  end

  # E3: Unblock a key
  def unblock
    @key.update(status: 'active')
    render json: { key: @key.value }
  end

  # E4: Delete a key
  def delete
    @key.destroy
    head :no_content
  end

  private

  def set_key
    @key = Key.find_by(value: params[:key_value])
    unless @key
      head :not_found
    end
  end
end

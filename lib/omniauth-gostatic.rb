require 'omniauth'
require "omniauth/gostatic/version"
require 'omniauth/strategies/gostatic'

OmniAuth.config.add_camelization('gostatic', 'GoStatic')

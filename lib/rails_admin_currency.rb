require 'rails_admin_currency/engine'

module RailsAdminCurrency
end

require 'rails_admin/config/fields/types/decimal'
require 'json'

module RailsAdmin
  module Config
    module Fields
      module Types
        class Currency < RailsAdmin::Config::Fields::Types::Decimal
          # Register field type for the type loader
          RailsAdmin::Config::Fields::Types.register(:currency, self)

          register_instance_option :formatted_value do
            ActionController::Base.helpers.number_to_currency value
          end

          register_instance_option :prefix do
            I18n.t('number.currency.format.unit')
          end

          register_instance_option :suffix do
          end

          register_instance_option :delimiter do
            I18n.t('number.currency.format.delimiter')
          end

          register_instance_option :separator do
            I18n.t('number.currency.format.separator')
          end

          register_instance_option :precision do
            2
          end

          register_instance_option :html_attributes do
            {
              'data-prefix' => prefix,
              'data-suffix' => suffix,
              'data-thousands' => delimiter,
              'data-decimal' => separator,
              'data-precision' => precision,
              'onfocus' => '$(this).maskMoney("destroy");$(this).maskMoney();'
            }
          end

          def parse_input(params)
            if params.has_key?(:value) && !params[:value].nil?
              p = params[:value].gsub(unit, '').split(separator)
              params[:value]= "#{p[0].gsub(delimiter, '')}.#{p[1]}".to_f
            end
          end
        end
      end
    end
  end
end

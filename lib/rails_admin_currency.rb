require "rails_admin_currency/engine"

module RailsAdminCurrency
end

require 'rails_admin/config/fields/types/decimal'

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

          register_instance_option :html_attributes do
            options = "{thousands: '#{delimiter}', decimal: '#{separator}', allowZero: true, prefix: '#{unit}'}".squish
            {
              onfocus: "$(this).maskMoney(#{options});"
            }
          end

          def parse_input(params)
            p= params[:value].gsub(unit, '').split(separator)
            params[:value]= "#{p[0].gsub(delimiter, '')}.#{p[1]}".to_f
          end

          private
          def unit
            I18n.t('number.currency.format.unit')
          end

          def delimiter
            I18n.t('number.currency.format.delimiter')
          end

          def separator
            I18n.t('number.currency.format.separator')
          end
        end
      end
    end
  end
end
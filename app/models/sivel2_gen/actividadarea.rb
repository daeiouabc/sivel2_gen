# encoding: UTF-8
module Sivel2Gen
  class Actividadarea < ActiveRecord::Base
    include Basica

    has_many :actividadareas_actividad, :dependent => :delete_all,
      class_name: 'Sivel2Gen::ActividadareasActividad'
    has_many :actividades, class_name: 'Sivel2Gen::Actividad',
      through: :actividadareas_actividad

    validates :nombre, presence: true, allow_blank: false
    validates :fechacreacion, presence: true, allow_blank: false
  end
end
# encoding: UTF-8

Sivel2Gen::Engine.routes.draw do

  patch "/actos/agregar" => 'actos#agregar'
  get "/actos/eliminar" => 'actos#eliminar'
  patch "/actoscolectivos/agregar" => 'actoscolectivos#agregar'
  get "/actoscolectivos/eliminar" => 'actoscolectivos#eliminar'
  get '/acercade' => 'hogar#acercade'
  get "/casofotras/nuevo", 'casofotras#nuevo'
  get "/casos/busca" => 'casos#busca'
  get '/casos/lista' => 'casos#lista'
  get '/casos/nuevaubicacion' => 'casos#nueva_ubicacion'
  get '/casos/nuevavictima' => 'casos#nueva_victima'
  get '/casos/nuevopresponsable' => 'casos#nuevo_presponsable'
  get '/combatientes/nuevo' => 'combatientes#nuevo'
  get "/conteos/personas" => 'conteos#personas', as: :conteos_personas
  get "/conteos/genvic" => 'conteos#genvic', as: :conteos_genvic
  get "/fichacasovertical" => 'hogar#fichacasovertical'
  get "/fuentesprensa/nuevo", 'fuentesprensa#nuevo'
  get "/grupoper/remplazar" => 'grupoper#remplazar'
  get "/hogar" => 'hogar#index'
  get "/personas" => 'personas#index'
  get "/personas/remplazar" => 'personas#remplazar'
  get '/presponsables/nuevo' => 'presponsables#nuevo'
  get "/tablasbasicas" => 'hogar#tablasbasicas'
  get '/ubicaciones/nuevo' => 'ubicaciones#nuevo'
  get "/validarcasos" => 'validarcasos#validar', as: :validarcasos
  post "/validarcasos" => 'validarcasos#validar', as: :envia_validarcasos
  get '/victimas/nuevo' => 'victimas#nuevo'
  get '/victimascolectivas/nuevo' => 'victimascolectivas#nuevo'


  resources :casos, path_names: { new: 'nuevo', edit: 'edita' }

  namespace :admin do
    ab=::Ability.new
    ab.tablasbasicas.each do |t|
      if (t[0] == "Sivel2Gen") 
        c = t[1].pluralize
        resources c.to_sym, 
          path_names: { new: 'nueva', edit: 'edita' }
      end
    end
  end
end

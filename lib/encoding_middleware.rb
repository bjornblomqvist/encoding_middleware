class EncodingMiddleware
  
  def initialize(app)
    @app = app
  end
  
  def set_encoding(form_hash)
    return unless form_hash
    
    form_hash.each do |key,value|
      
      key = key.dup.force_encoding(ActionController::Base.default_charset) if key.instance_of? String
      value = value.dup.force_encoding(ActionController::Base.default_charset) if value.instance_of? String
      
      form_hash[key] = value
      
      set_encoding value if value.instance_of? Hash
      
    end
  end
  
  def call(env)
    set_encoding(env["rack.request.form_hash"])
    
    @app.call env
  end
  
end
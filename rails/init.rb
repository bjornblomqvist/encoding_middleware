
require 'encoding_middleware'

Rails.logger.info "\n"
Rails.logger.info "Adding middleware: config.middleware.use EncodingMiddleware"
config.middleware.use EncodingMiddleware
Rails.logger.info "EncodingMiddleware, Sets the encoding of params to the ActionController::Base.default_charset"
Rails.logger.info "\n"

  
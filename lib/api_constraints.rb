class ApiConstraints
  def initalize(options)
    @version = options[:version]
    @default = options[:default]
  end

  def matches?(req)
    @default || req.headers['Accept'].include?("application/vnd.market_palce_api.v#{@version}")
  end
end

require_relative 'config/environment'

class App < Sinatra::Base
  # Write your code here!
  get '/reversename/:name' do
    params[:name].reverse
  end

  get '/square/:number' do
    @num = params[:number]
    (@num.to_i*@num.to_i).to_s
  end

  get '/say/:number/:phrase' do
    @out = ""
    params[:number].to_i.times do
      @out += "<p>#{params[:phrase]}</p>"
    end
    @out
  end

  get '/say/:word1/:word2/:word3/:word4/:word5' do
    "#{params[:word1]} #{params[:word2]} #{params[:word3]} #{params[:word4]} #{params[:word5]}."
  end

  get '/:operation/:number1/:number2' do
      @value = "";
    if ["add", "subtract", "multiply", "divide"].include?(@operation = params[:operation].downcase)
      case (@operation)
        when "add"
          @value = "#{params[:number1].to_i+params[:number2].to_i}"
        when "subtract"
          @value = "#{params[:number1].to_i-params[:number2].to_i}"
        when "multiply"
          @value = "#{params[:number1].to_i*params[:number2].to_i}"
        when "divide"
          @value = "#{params[:number1].to_i / params[:number2].to_i}"
        end
    end
    @value
  end

end

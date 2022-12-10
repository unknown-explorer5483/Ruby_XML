# frozen_string_literal: true

# class for calculating result and returning it in xml and rss format
class CalcController < ApplicationController
  def calc
    @result = solve(params[:less_than_number].to_i)

    respond_to do |format|
      format.xml { render xml: @result.to_xml }
      format.rss { render xml: @result.to_xml }
    end
  end

  def solve(input)
    [*1..input].select { |num| (num**2).to_s.reverse == (num**2).to_s && num <= input }
               .map { |elem| { number: elem, palindrom: elem**2 } }
  end
end

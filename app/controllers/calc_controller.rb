# frozen_string_literal: true

# class for calculating result and returning it in xml and rss format
class CalcController < ApplicationController
  def find(number, pow)
    summa = 0
    pow.times do
      tri = number % 10
      number /= 10
      summa += tri**pow
    end
    summa
  end

  def calc
    @result = solve(params[:power].to_i)

    respond_to do |format|
      format.xml { render xml: @result.to_xml }
      format.rss { render xml: @result.to_xml }
    end
  end

  def solve(pow)
    @result = []
    ((10**(pow - 1))...(10**pow)).step(1) do |num|
      @result.push(index: (num - 1), number: num)
    end
    index = 0
    @result = @result.select { |num| num[:number] == find(num[:number], pow) }
    @result.each do |elem|
      elem[:index] = index
      index += 1
    end
  end
end

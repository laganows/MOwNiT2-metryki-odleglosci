<<<<<<< HEAD
#!/usr/bin/env ruby
require 'csv'
require 'matrix'


=======
require 'csv'
require 'matrix'

>>>>>>> 557d3929c09674236e6e484489983ff239617c44
def randomString
  o = [('a'..'z'), ('A'..'Z')].map { |i| i.to_a }.flatten
  return (0...(rand(10)+10)).map { o[rand(o.length)] }.join

end


def randomInteger
  return rand(90000) + 10000
end


def randomDouble
  return randomInteger / 100000.0
end


<<<<<<< HEAD
#Use only for generated csv by generateCSV method
=======
#nie dziala
def concatenateString (typeOfParameter, stringToConcanenate)
  if typeOfParameter == 0
    stringToConcanenate  = stringToConcanenate + randomInteger.to_s + ","
  elsif typeOfParameter == 1
    stringToConcanenate  = stringToConcanenate + randomDouble.to_s +  ","
  else
    stringToConcanenate  = stringToConcanenate + randomString + ","
  end
  return stringToConcanenate
end



>>>>>>> 557d3929c09674236e6e484489983ff239617c44
def generateCSV(numberOfColumnsInInput, numberOfColumnsInOutput, numberOfLines)

  parametersTypesForInput = []

  # 0 - int, 1 - double, 2 - String
  (0..numberOfColumnsInInput+numberOfColumnsInOutput).each { |_|
    parametersTypesForInput << rand(3)
  }

  open('generated.csv', 'w') { |f|

    (1..numberOfLines).each do |i|
      myString = ""
      (0..numberOfColumnsInInput+numberOfColumnsInOutput).each do |j|
        if j < numberOfColumnsInInput - 1
<<<<<<< HEAD
=======
          #myString = concatenateString (parametersTypesForInput[j], myString) nie wiem czemu nie dziala, bez tego copy pasta murowana
>>>>>>> 557d3929c09674236e6e484489983ff239617c44
          if parametersTypesForInput[j] == 0
            myString  = myString + randomInteger.to_s + ","
          elsif parametersTypesForInput[j] == 1
            myString  = myString + randomDouble.to_s +  ","
          else
            myString  = myString + randomString + ","
          end

        elsif j == numberOfColumnsInInput - 1
          if parametersTypesForInput[j] == 0
            myString  = myString + randomInteger.to_s
          elsif parametersTypesForInput[j] == 1
            myString  = myString + randomDouble.to_s
          else
            myString  = myString + randomString
          end

        elsif j ==  numberOfColumnsInInput
          myString = myString + ";"

        elsif j == numberOfColumnsInInput + numberOfColumnsInOutput
          if parametersTypesForInput[j] == 0
            myString  = myString + randomInteger.to_s
          elsif parametersTypesForInput[j] == 1
            myString  = myString + randomDouble.to_s
          else
            myString  = myString + randomString
          end

        else
          if parametersTypesForInput[j] == 0
            myString  = myString + randomInteger.to_s + ","
          elsif parametersTypesForInput[j] == 1
            myString  = myString + randomDouble.to_s + ","
          else
            myString  = myString + randomString + ","
          end
        end
      end
      f.puts myString
    end
  }
end

<<<<<<< HEAD
#Use only for generated csv by generateCSV method
def readCsvToMatrix(numberOfColumnsInInput, numberOfColumnsInOutput, numberOfLines)

=======

class Matrix
  def put(i, j, x)
    @rows[i][j] = x
  end
end

def readCsvToMatrix(numberOfColumnsInInput, numberOfColumnsInOutput, numberOfLines)


>>>>>>> 557d3929c09674236e6e484489983ff239617c44
  matrixForInput = Matrix[]#.build(numberOfColumnsInInput, numberOfLines)
  matrixForOutput = Matrix[]#.build(numberOfColumnsInOutput, numberOfLines)

  File.open("input.txt", "r").each_line do |line|
    data = line.split(/,/)

    j = 0
    arrayForInput = Array.new
    arrayForOutput = Array.new

    (0..numberOfColumnsInInput+numberOfColumnsInOutput-2).each do |i|
      if i < numberOfColumnsInInput - 1
        arrayForInput.push(data[i])
      elsif i == numberOfColumnsInInput - 1
        arrayForInput.push(data[i].to_s.split(/;/).first)
        matrixForInput = Matrix.rows(matrixForInput.to_a << arrayForInput)

        arrayForOutput.push(data[i].to_s.split(/;/).last)
        arrayForInput.clear

      elsif i < numberOfColumnsInInput + numberOfColumnsInOutput - 2
        arrayForOutput.push(data[i])
      else
        arrayForOutput.push(data[i].to_s[0, data[i].to_s.size-1])
        matrixForOutput = Matrix.rows(matrixForOutput.to_a << arrayForOutput)
        arrayForOutput.clear
        j = j + 1

      end

    end


  end

    arrayForReturn = Array.new
    arrayForReturn.push(matrixForInput)
    arrayForReturn.push(matrixForOutput)
    return arrayForReturn
end



<<<<<<< HEAD
#readFromEnd of csv file
=======

>>>>>>> 557d3929c09674236e6e484489983ff239617c44
def readCsvToSingleMatrix(nameOfFile, numberOfOutputColumns)
  i = 0
  prevNumberOfColumns = 0
  currentNumberOfColumns = 0

  #Sprawdzamy czy liczba kolumn jest taka sama w calym pliku
  CSV.foreach(File.path(nameOfFile)) do |row|
    if i == 0
      prevNumberOfColumns = row.size
      i = 1
    else
      currentNumberOfColumns = row.size
      if currentNumberOfColumns != prevNumberOfColumns
        puts 'Niezgodna liczba kolumn w pliku'
        return
      else
        prevNumberOfColumns = currentNumberOfColumns
      end
    end
<<<<<<< HEAD
=======

>>>>>>> 557d3929c09674236e6e484489983ff239617c44
  end

  #Sprawdzamy czy nie zadamy za duzej liczby kolumn
  if currentNumberOfColumns < numberOfOutputColumns
    puts 'Podana liczba kolumn danych wejsciowych jest za duza, brakuje: ' + (numberOfOutputColumns - currentNumberOfColumns).to_s + ' kolumn/y'
    return
  end


  m = Matrix[]

  CSV.foreach(nameOfFile, quote_char: '"', col_sep: ',', row_sep: :auto, headers: true) do |row|
    arrayForRow = Array.new
    (currentNumberOfColumns - numberOfOutputColumns..currentNumberOfColumns - 1).each do |i|
      arrayForRow.push(row[i].to_s)
    end
    m = Matrix.rows(m.to_a << arrayForRow)

  end

  return m

end

<<<<<<< HEAD
#We know that we've got csv with 13 columns, need to change to work with any csv
def readCsvForPlot(nameOfFile, indexOfInputColumn) 
  currentNumberOfColumns = 13
  m = Matrix[]

  CSV.foreach(nameOfFile, quote_char: '"', col_sep: ',', row_sep: :auto, headers: true) do |row|
    arrayForRow = Array.new
    (0..currentNumberOfColumns - 1).each do |i|
      if i == indexOfInputColumn || i == 10 || i == 11 || i == 12
        arrayForRow.push(row[i].to_s)
      end
    end
    m = Matrix.rows(m.to_a << arrayForRow)
  end
  return m
end

#puts readCsvForPlot('data.csv', 0).rows.size
#puts readCsvToSingleMatrix('data.csv', 4)
#generateCSV(5,5,100)
=======
def standard_deviation(nameOfFile, numberOfOutputColumns)
  m = readCsvToSingleMatrix(nameOfFile, numberOfOutputColumns)

    (0..numberOfOutputColumns - 1).each do |i|
      sumForColumn = 0
      avgForColumn = 0
      (0...m.column_size).each do |j|
        sumForColumn += m[i,j].to_s.to_f
      end
      puts sumForColumn  / m.column_size
  end
end

#standard_deviation('data.csv', 13)
generateCSV(5,5,100)
>>>>>>> 557d3929c09674236e6e484489983ff239617c44

require "csv"

student = CSV.read(ARGV[0])

student.each do |row|
        
        unless row[2].nil? && row[3].nil? && row[4].nil?
                
                sum = `curl –form "file=@ /home/Desktop/Test.csv" #{row[5]}/sums 2>/dev/null`.to_s  
                filter = `curl –form "file=@/home/Desktop/Test.csv" #{row[5]}/filters 2>/dev/null`.to_s 
                interval = `curl –form "file=@/home/Desktop/Test.csv" #{row[5]}/intervals 2>/dev/null`.to_s 
                regresion = `curl –form "file=@/home/Desktop/Test.csv" #{row[5]}/lin_regresions 2>/dev/null` .to_s 
                
                if(sum == "528.00" && filter == "272.00" && interval == "525.00" && regresion == "1.000000,0.000000")
                        p "#{row[3]} #{row[4]} 1";
                else
                        p "#{row[3]} #{row[4]} 0";
                end
        end
end 

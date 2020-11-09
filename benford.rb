require 'amazing_print'

BENFORD = [0.1197, 0.1139, 0.1088, 0.1043, 0.1003, 0.0967, 0.0934, 0.0904, 0.0876, 0.0850].freeze

def benford precinct_data
  benford_data = {}
  precinct_data.each do |precinct, candidate_data|
    candidate_data.each do |candidate, vote_data|
      vote_data.each do |vote_type, count|
        digit = count[1]
        next if digit.nil?
        benford_data[candidate] ||= {}
        benford_data[candidate][vote_type] ||= {
          '0' => 0,
          '1' => 0,
          '2' => 0,
          '3' => 0,
          '4' => 0,
          '5' => 0,
          '6' => 0,
          '7' => 0,
          '8' => 0,
          '9' => 0
        }
        benford_data[candidate][vote_type][digit] += 1
      end
    end
  end

  ap benford_data
  chi_square_test(benford_data)
end

def chi_square_test(benford_data)
  benford_data.each do |candidate, c_data|
    c_data.each do |vote_type, v_data|
      total_count = v_data.map { |_, count| count }.sum
      chi_square_stat = 0

      v_data.each_with_index do |(digit, count), i|
        expected_count = total_count * BENFORD[i]
        chi_square = (count - expected_count) ** 2
        chi_square_stat += chi_square / expected_count
      end

      puts ""
      puts "Candidate: #{candidate}"
      puts "Vote Type: #{vote_type}"
      puts "Chi-squared Test Stat (over 15.51 is red flag): #{chi_square_stat}"
    end
  end
end

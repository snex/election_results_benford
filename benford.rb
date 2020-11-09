require 'amazing_print'

def benford precinct_data
  benford_data = {}
  precinct_data.each do |precinct, candidate_data|
    candidate_data.each do |candidate, vote_data|
      vote_data.each do |vote_type, count|
        digit = count[0]
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
end

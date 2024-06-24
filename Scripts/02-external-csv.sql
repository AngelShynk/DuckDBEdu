SELECT * 
        FROM read_csv_auto('https://raw.githubusercontent.com/JeffSackmann/tennis_atp/master/atp_matches_2023.csv')
        LIMIT 100;
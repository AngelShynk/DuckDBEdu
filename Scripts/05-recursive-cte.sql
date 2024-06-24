WITH RECURSIVE FibonacciNumbers (RecursionDepth, FibonacciNumber, NextNumber) AS (
        -- Base case
        SELECT
            0 AS RecursionDepth,
            0 AS FibonacciNumber,
            1 AS NextNumber
        UNION ALL
        -- Recursive step
        SELECT
            fib.RecursionDepth + 1 AS RecursionDepth,
            fib.NextNumber AS FibonacciNumber,
            fib.FibonacciNumber + fib.NextNumber AS NextNumber
        FROM
            FibonacciNumbers fib
        WHERE
            fib.RecursionDepth + 1 < 10
    )
SELECT
    fn.RecursionDepth AS FibonacciNumberIndex,
    fn.FibonacciNumber
FROM
    FibonacciNumbers fn;
    
   
 -- Define the starting and ending dates
WITH RECURSIVE calendar AS (
    -- Base case: starting date
    SELECT DATE '2023-01-01' AS date
    UNION ALL
    -- Recursive case: add one day to the previous date
    SELECT date + INTERVAL 1 DAY
    FROM calendar
    WHERE date < DATE '2023-12-31'
)
-- Select the generated dates
SELECT date
FROM calendar
ORDER BY date;


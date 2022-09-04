Challenge: https://www.topcoder.com/challenges/3523079f-8df9-4731-9dbc-d8ded0660992

## Original approach

1. Start from 1 and build a number of up to 100 digits
2. At each step, from `x` you can either get `2x` or `(x-1)/3`
3. If you reach the limit, stop

Randomly do this many times and keep track of the best score.

Best score: `5711`

Number:
`6166961695475466314294839310067244846627705295883436596531943769559092792344077815510826741594587134`

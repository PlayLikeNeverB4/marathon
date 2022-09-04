Challenge: https://www.topcoder.com/challenges/3523079f-8df9-4731-9dbc-d8ded0660992

## Original approach

1. Start from 1 and build a number of up to 100 digits
2. At each step, from `x` you can either get `2x` or `(x-1)/3`
3. If you reach the limit, stop

Randomly do this many times and keep track of the best score.

Best score: `5711`

Number:
`6166961695475466314294839310067244846627705295883436596531943769559092792344077815510826741594587134`

## Upsolving

I implemented sullyper's approach in the [Post Your Approach](https://discussions.topcoder.com/discussion/21601/post-your-approach) post.

A beam width of 1k results in a score of `9431`.

I ran the algorithm with a beam width of 20k.

Best score: `10883`

Number:
`6745835840088198262176829137082222259259008937854064021929340866557703956537397380557044755892896041622065`

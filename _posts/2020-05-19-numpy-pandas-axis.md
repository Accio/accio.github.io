---
layout: post
title: Axis in Python and MARGIN in R explained
category: programming
tags: python R pandas numpy
---

I tried to understand the concept of `axis` in python libraries `numpy` and
`pandas` better, because I often mix them up with similar concepts in R. After
trying a few things out and reading around, I think I understand both worlds
better now.

During this process, [a post on
StackOverflow](https://stackoverflow.com/questions/22149584/what-does-axis-in-pandas-mean)
was particularly helpful.

* TOC
{:toc}

## Axis in Python

Consider the following code snippet

```python
import numpy as np
import pandas as pd

ar = np.array([[3,4,5], [4,5,6]])
df = pd.DataFrame({'A':[3,4,5], 'B':[4,5,6]})

## in numpy, if axis is `None`, the mean of the flattened array is reported
ar.mean() # 4.5
## axis=0 means that the operation acts on all *rows* in each column
ar.mean(axis=0) ## array([3.5, 4.5, 5.5])
## axis=1 means that the operation acts on the all *columns* in each row
ar.mean(axis=1) ## array([4., 5.])

## in pandas, if axis is not given, the mean of the columns (axis=0) is reported
## output
##> A    4.0
##> B    5.0
##> dtype: float64
df.mean()
## axis=0 means that the operation acts on all *rows* in each column
## equivalently, one can use `df.mean(axis='rows')` or `df.mean(axis='index')`.
df.mean(axis=0)
## axis=1 means that the operation acts on all *columns* in each row
## output
##> 0    3.5
##> 1    4.5
##> 2    5.5
## dtype: float64
df.mean(axis=1)
```

In the [documentation of
`numpy`](https://stackoverflow.com/questions/22149584/what-does-axis-in-pandas-mean),
it is stated that the axis parameter specifies *Axis or axes along which the
means are computed*. Unfortunately, I find the concept of 'along which'
particularly confusing.

### The Python behaviour can be better understood with a three-dimensional array

It turns out that the concept of `axis` is easier to understand if we use
an example of a three-dimensional array.

```python
>>> ar2 = np.array([[[3,4],[5,6]],[[7,8],[9,10]]])
>>> ar2
array([[[ 3,  4],
        [ 5,  6]],

       [[ 7,  8],
        [ 9, 10]]])
>>> ar2.mean()
6.5
>>> ar2.mean(axis=0) # mean of 3 and 7, 4 and 8, 5 and 9, and 6 and 10
array([[5., 6.],
       [7., 8.]])
>>> ar2.mean(axis=1) # mean of 3 and 5, 4 and 6, 7 and 9, and 8 and 10
array([[4., 5.],
       [8., 9.]])
>>> ar2.mean(axis=2) # mean of 3 and 4, 5 and 6, 7 and 8, and 9 and 10
array([[3.5, 5.5],
       [7.5, 9.5]])
```

In essence, when we run `ar2.mean(axis=0)`, we ask numpy to go through `ar2[i,
0, 0]` where `i` can take values between 0 and the first element of `ar2.shape`,
and calculate the mean value of the values that numpy sees during the iteration.
Next, numpy goes through `ar2[i, 0, 1]` and does the same calculation. Next, it
goes through `ar2[i, 1, 0]`. And finally, it goes though `ar2[i, 1, 1]`.

The same logic applies to other values of the parameter `axis`. The only change
we shall make then is to change the position of `i`: it will be put in the
`axis`th position in the index list used to fetch an element in the
n-dimensional array. If you have doubt about that, you can verify the results
above with the logic that we have just described. Sure enough, the logic also
applies to arrays of higher (or lower) dimensions.

In summary, in `numpy` and `pandas`, the `axis` parameter in `sum` actually
specifies `numpy` to calculate the mean of all values that can be fetched in the
form of `array[0, 0, ..., i, ..., 0]` where `i` iterates through all possible
values. The process is repeated with the position of `i` fixed and the indices
of other dimensions vary one after the other (from the most far-right element).
The result is a n-1-dimensional array.

## MARGINS in R

My confusion at the beginning may come from similar operations in R with
`apply`, where the parameter `MARGIN` is a vector *giving the subscripts which
the function will be applied over*. Compare the results below with the ones
above.

```r
mymat <- matrix(c(3,4,5,4,5,6), byrow=TRUE, nrow=2)
apply(mymat, 1, mean) ## identical to `rowMeans(myMat)`, reporting c(4, 5)
apply(mymat, 2, mean) ## identical to `colMeans(myMat)`, c(3.5, 4.5, 5.5)
```

As you see, the behaviour of setting `MARGINS` to `1` and `2` is actually the
opposite of that in Python.

### Apply `apply` to a 3-dimensional array in R

Let us give it a try.

```r
> (d3array <- array(3:10, c(2,2,2)))
, , 1

     [,1] [,2]
[1,]    3    5
[2,]    4    6

, , 2

     [,1] [,2]
[1,]    7    9
[2,]    8   10
> d3array[1,,,] # this may help us understand the first result better
     [,1] [,2]
[1,]    3    7
[2,]    5    9
> mean(d3array[1,,])
6
> apply(d3array, 1, mean)
[1] 6 7
> apply(d3array, 2, mean)
[1] 5.5 7.5
> apply(d3array, 3, mean)
[1] 4.5 8.5
```

It turns out the logic can be understood easily. `apply(d3array, 1, mean)` will
calculate the mean values of `d3array[i,,]` where `i` takes all possible values,
and return the results in a vector. Similarly, `apply(d3array, 2, mean)` will
calculate the mean values of `d3array[,i,]`, *etc.*

In summary, in R, the `MARGINS` parameter let the `apply` function calculate the
mean of all values that can be fetched in the form of `array[, ... , i, ... ,]`
where `i` iterates through all possible values. The process is not repeated when
all `i` values have been iterated. The result is therefore a simple vector.

## Conclusions

While I can understand the logic of either convention, I found it is easy to mix
the two. I am not sure whether I am the only one who easily mixes up `axis` in
Python and `MARGIN` in R. Therefore, I document the differences here, with the
hope that at least I can remind myself when I am confused again.

In `panda`, one can use `axis="rows"` or `axis="index"` to calculate mean values
of each column, equal to `colMeans` in R. We say that we get `mean along rows` or
`mean along index` in Python, and `mean of columns` in R.

Alternately, one uses `axis="columns"` to calculate mean values of each row,
equal to `rowMeans` in R. We say that we get `mean along columns` in Python, and
`mean of rows` in R. I thank Iakov Davydov to point out these possibilities.

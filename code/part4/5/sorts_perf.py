import random
import sys


def test_sorted(fn, iters=1000):
    for i in range(iters):
        l = [random.randint(0, 100) for i in range(0, random.randint(0, 50))]
        assert fn(l) == sorted(l)
        # print(fn.__name__, fn(l))


def insertionsort(array):

    for i in range(len(array)):
        j = i-1
        v = array[i]
        while j >= 0 and v < array[j]:
            array[j+1] = array[j]
            j -= 1
        array[j+1] = v
    return array


def quicksort(array):
    if len(array) <= 1:
        return array
    pivot = array[0]
    left = [i for i in array[1:] if i < pivot]
    right = [i for i in array[1:] if i >= pivot]
    return quicksort(left) + [pivot] + quicksort(right)


def quicksort_inplace(array, low=0, high=None):
    if len(array) <= 1:
        return array
    if high is None:
        high = len(array)-1
    if low >= high:
        return array

    pivot = array[high]
    j = low-1
    for i in range(low, high):
        if array[i] <= pivot:
            j += 1
            array[i], array[j] = array[j], array[i]
    array[high], array[j+1] = array[j+1], array[high]
    quicksort_inplace(array, low, j)
    quicksort_inplace(array, j+2, high)
    return array


_FUNCTIONS = {fn.__name__: fn for fn in [quicksort, quicksort_inplace, insertionsort]} 


if __name__ == '__main__':
    if len(sys.argv) != 2:
        print("USAGE: python sorts_perf.py [ALGORITHM]")
        sys.exit(1)
    algo = _FUNCTIONS.get(sys.argv[1], None)
    if algo is None:
        print(f"Unknown algorithm {sys.argv[1]}. Possible options: {list(_FUNCTIONS.keys())}")
        sys.exit(1)
    test_sorted(algo)

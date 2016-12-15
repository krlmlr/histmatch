## histmatch 0.0-3 (2016-12-15)

- Improve tests.


## histmatch 0.0-2 (2016-10-31)

- New `open_left` argument to control if the `x_target` range should start at 0 (if `open_left` is `TRUE`) or 1 (default).
- Add `overlay` argument to `plot()` to allow comparing implementations.
- Continuous integration with Travis CI.


## histmatch 0.0-1 (2016-10-31)

Initial release.

- `histmatch_data()` implements weighted histogram matching, returns detailed data about source and target distributions.
- `histmatch()` returns only the target distribution in the right order.
- `plot()` implemented for return values of `histmatch_data()`, for illustration and troubleshooting.

pragma experimental SMTChecker;

contract C {
	function f(bytes calldata b) external pure {
		require(b[0] == 0xff);
		assert(bytes(b[:20]).length == 20);
		assert(bytes(b[:20])[0] == 0xff);
		assert(bytes(b[:20])[5] == 0xff);
	}
}
// ----
// Warning 1218: (157-189): Error trying to invoke SMT solver.
// Warning 6328: (193-225): Assertion violation happens here.
// Warning 4661: (157-189): Assertion violation happens here.

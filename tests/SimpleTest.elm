module SimpleTest exposing (..)

import Expect exposing (Expectation)
import Fuzz exposing (Fuzzer, int, list, string)
import Test exposing (..)


suite : Test
suite =
    test "example test"
        (\_ ->
            let
                foo =
                    "foo"
            in
            Expect.equal foo "foo"
        )

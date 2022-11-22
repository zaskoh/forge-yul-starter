object "YulExampleContract" {
    code {
        // deploy contract
        datacopy(0, dataoffset("Runtime"), datasize("Runtime"))

        // define immutable vars
		setimmutable(0, "foo", 0x000000000000000000000000000000000000dEaD)
		setimmutable(0, "wethAddress", 0xc02aaa39b223fe8d0a0e5c4f27ead9083c756cc2)

        return(0, datasize("Runtime"))
    }

    object "Runtime" {
        code {
            // code here....

            // first byte of calldata [ff]xxxx
            switch shr(0xf8, calldataload(0))
            case 0x00 {
                let p := mload(0x40)
                mstore(p, loadimmutable("foo"))
                return(p, 32)
            }
            case 0x01 {
                let p := mload(0x40)
                mstore(p, loadimmutable("wethAddress"))
                return(p, 32)
            }
            revert(0,0)
        }
    }
}
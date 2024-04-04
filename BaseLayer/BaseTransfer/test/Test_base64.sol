pragma solidity 0.8.13;
import { Base64 } from "../Library/base64.sol";
contract Apply_Base64{
    function encode(bytes memory data)public  pure returns (string memory) {
        return Base64.encode(data);
    }
}
//input:ox18281
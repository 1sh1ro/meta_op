pragma solidity 0.8.13;

library Base64 {
    bytes internal constant TABLE = "ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz0123456789+/";

    /// @notice Encodes some bytes to the base64 representation
    function encode(bytes memory data) internal pure returns (string memory) {
        uint len = data.length;
        if (len == 0) return "";

        //将数据划分为 3 个字节一组（24位）
        uint encodedLen = 4 * ((len + 2) / 3);

        // 在末尾添加一些额外的缓冲区
        bytes memory result = new bytes(encodedLen + 32);

        bytes memory table = TABLE;

        assembly {
            let tablePtr := add(table, 1)
            let resultPtr := add(result, 32)

            for {
                let i := 0
            } lt(i, len) {

            } {
                //将每个字节转换为 8 位二进制形式
                i := add(i, 3)
                let input := and(mload(add(data, i)), 0xffffff)

                let out := mload(add(tablePtr, and(shr(18, input), 0x3F)))
                //将 24 位数据按照 6 位一组进行划分，得到 4 个 6 位的组。
                //将每个 6 位的组转换为对应的 Base64 字符

                out := shl(8, out)
                out := add(out, and(mload(add(tablePtr, and(shr(12, input), 0x3F))), 0xFF))
                out := shl(8, out)
                out := add(out, and(mload(add(tablePtr, and(shr(6, input), 0x3F))), 0xFF))
                out := shl(8, out)
                out := add(out, and(mload(add(tablePtr, and(input, 0x3F))), 0xFF))
                out := shl(224, out)
                //将所有转换后的 Base64 字符连接起来，形成最终的编码结果
                mstore(resultPtr, out)

                resultPtr := add(resultPtr, 4)
            }

            switch mod(len, 3)
            case 1 {
                mstore(sub(resultPtr, 2), shl(240, 0x3d3d))
            }
            case 2 {
                mstore(sub(resultPtr, 1), shl(248, 0x3d))
            }

            mstore(result, encodedLen)
        }

        return string(result);
    }



     function decode(string memory base64str) internal pure returns (bytes memory) {
    bytes memory table = TABLE;
    uint256 len = bytes(base64str).length;
    if (len == 0) return new bytes(0);
    uint256 decodedLen = len * 3 / 4;//计算解码后的字节数组长度
    
    bytes memory result = new bytes(decodedLen);//创建存储解码结果的字节数组

    assembly {
        let tablePtr := add(table, 1)
        let resultPtr := add(result, 32)

        for {
            let i := 0
        } lt(i, len) {
            i := add(i, 4)
        } {
            // 获取每4个Base64字符并解码为3个字节数据
            let input := mload(add(base64str, i))

            let out := mload(add(tablePtr, and(shr(24, input), 0x3F)))
            out := shl(8, out)
            out := add(out, and(mload(add(tablePtr, and(shr(16, input), 0x3F)), 0xFF)))
            out := shl(8, out)

            switch and(shr(8, input), 0xFF)
            case 0x3d {
                mstore(sub(resultPtr, 1), shr(240, out))
            }
            case 0x3d3d {
                mstore(sub(resultPtr, 2), shr(248, out))
            }
            default {
                let out := add(out, and(mload(add(tablePtr, and(shr(8, input), 0x3F)), 0xFF)))
                out := shl(8, out)
                out := add(out, and(mload(add(tablePtr, and(input, 0x3F)), 0xFF)))
                mstore(resultPtr, out)
                resultPtr := add(resultPtr, 3)
            }
        }

        mstore(result, decodedLen)
    }

    return result;
}

}
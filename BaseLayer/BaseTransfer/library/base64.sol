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

     function decode(string memory data) internal pure returns(string memory) {
        require((bytes(data).length % 4) == 0, "Length not multiple of 4");
        bytes memory _bs = bytes(data);

        uint i = 0;
        uint j = 0;
        uint dec_length = (_bs.length / 4) * 3;
        bytes memory dec = new bytes(dec_length);

        for (; i< _bs.length; i+=4) {
            (dec[j], dec[j+1], dec[j+2]) = dencode4(
                bytes1(_bs[i]),
                bytes1(_bs[i+1]),
                bytes1(_bs[i+2]),
                bytes1(_bs[i+3])
            );
            j += 3;
        }
        while (dec[--j]==0) {}

        bytes memory res = new bytes(j+1);
        for (i=0; i<=j; i++)
            res[i] = dec[i];

        return string(res);
    }

    // 将4个base64编码字符解码为原3个字符
    function decode4 (
        bytes1 b0, 
        bytes1 b1, 
        bytes1 b2, 
        bytes1 b3
    ) 
        private 
        pure
        returns (bytes1 a0, bytes1 a1, bytes1 a2)
    {
        uint pos0 = charpos(b0);
        uint pos1 = charpos(b1);
        uint pos2 = charpos(b2) % 64;
        uint pos3 = charpos(b3) % 64;

        // 取 b0 + b1 的前2位组成 8 比特位即 1 字节
        a0 = bytes1(uint8((pos0 << 2 | pos1 >> 4)));
        // 取 b1 后 4 位 + b2 的前 4 位组成 8 比特位即 1 字节
        a1 = bytes1(uint8(((pos1 & 15) << 4 | pos2 >> 2)));
        // 取 b2 前 2 位 + b3 组成 8 比特位即 1 字节
        a2 = bytes1(uint8(((pos2 & 3) << 6 | pos3)));
    }
}
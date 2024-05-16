// SPDX-License-Identifier: ISC
pragma solidity ^0.8.24;

/**
 * @title SM3 Cryptographic Hash Function
 * @dev Implementation of the SM3 cryptographic hash function as per Chinese standard GM/T 0004-2012
 */
library SM3 {
    // Constants for the SM3 hash function
    uint32 constant T1 = 0x79CC4519;
    uint32 constant T2 = 0x7A879D8A;
    function sm3Padding(bytes memory message) public  pure returns (bytes memory) {
        uint256 len = message.length * 8;
        uint256 k = 448 - ((len + 1) % 512);
        if (k < 0) {
            k += 512;
        }
        bytes memory padding = new bytes((k + 64) / 8);
        padding[0] = 0x80;
        for (uint256 i = 0; i != 8; i++) {

            padding[padding.length - 8 + i] = bytes1(uint8(len >> (8 * (7 - i))) & 0xFF);
        }
        return abi.encodePacked(message, padding);
    }

    // Call sm3Transform to compute the final hash output
    function sm3FinalHash(bytes memory mes) public pure returns (uint32[8] memory) {
        uint32[16] memory block;
        bytes memory message=sm3Padding(mes);
        uint32[8] memory hash = [
            0x7380166F, 0x4914B2B9, 0x172442D7, 0xDA8A0600,
            0xA96F30BC, 0x163138AA, 0xE38DEE4D, 0xB0FB0E4E
        ];
        require(message.length > 0, "Message length must be greater than 0");
        require(message.length % 64 == 0, "Message length must be a multiple of 64 bytes");
        for (uint256 i = 0; i < message.length / 64; i++) {
            for (uint256 j = 0; j < 16; j++) {
                block[j] = uint32(uint8(message[i * 64 + j * 4])) << 24 |
                            uint32(uint8(message[i * 64 + j * 4 + 1])) << 16 |
                            uint32(uint8(message[i * 64 + j * 4 + 2])) << 8 |
                            uint32(uint8(message[i * 64 + j * 4 + 3]));
            }
            hash = sm3Transform(block,hash);
        }

        return hash;
    }
    /**
     * @dev Internal function to perform the SM3 transformation on a 512-bit block
     * @param block The 512-bit block to transform
     * @return The transformed block as a 256-bit hash
     */
    function sm3Transform(uint32[16] memory block,uint32[8] memory hash) public pure returns (uint32[8] memory) {

        uint32[68] memory W;
        uint32[64] memory W1;

        for (uint i = 0; i != 16; i++) {
            W[i] = block[i];
        }

        for (uint i = 16; i != 68; i++) {
            W[i] = P1(W[i-16] ^ W[i-9] ^ leftRotate(W[i-3], 15)) ^ leftRotate(W[i-13], 7) ^ W[i-6];
        }

        for (uint i = 0; i != 64; i++) {
            W1[i] = W[i] ^ W[i+4];
        }

        uint32 A = hash[0];
        uint32 B = hash[1];
        uint32 C = hash[2];
        uint32 D = hash[3];
        uint32 E = hash[4];
        uint32 F = hash[5];
        uint32 G = hash[6];
        uint32 H = hash[7];

        for (uint j = 0; j != 64; j++) {
            uint32 SS1;
            if(j<16){
                SS1 = leftRotate((leftRotate(A, 12) + E + leftRotate(T1, j % 32)) & 0xFFFFFFFF, 7);
            }
            else{
                SS1 = leftRotate((leftRotate(A, 12) + E + leftRotate(T2, j % 32)) & 0xFFFFFFFF, 7);
            }
            //uint32 SS1 = leftRotate((leftRotate(A, 12) + E + leftRotate(constants[j], j % 32)) & 0xFFFFFFFF, 7);
            uint32 SS2 = SS1 ^ leftRotate(A, 12);
            uint32 TT1 = (FF(A, B, C, j) + D + SS2 + W1[j]) & 0xFFFFFFFF;
            uint32 TT2 = (GG(E, F, G, j) + H + SS1 + W[j]) & 0xFFFFFFFF;
            D = C;
            C = leftRotate(B, 9);
            B = A;
            A = TT1;
            H = G;
            G = leftRotate(F, 19);
            F = E;
            E = P0(TT2);
        }

        return [A ^ hash[0], B ^ hash[1], C ^ hash[2], D ^ hash[3], E ^ hash[4], F ^ hash[5], G ^ hash[6], H ^ hash[7]];
    }

    /**
     * @dev Helper function to perform left rotation
     * @param x Value to rotate
     * @param n Number of bits to rotate
     * @return The rotated value
     */
    function leftRotate(uint32 x, uint n) private pure returns (uint32) {
        return (x << n) | (x >> (32 - n));
    }

    /**
     * @dev Boolean function FF used in the SM3 algorithm
     */
    function FF(uint32 X, uint32 Y, uint32 Z, uint j) private pure returns (uint32) {
        if (j < 16) {
            return X ^ Y ^ Z;
        } else {
            return (X & Y) | (X & Z) | (Y & Z);
        }
    }

    /**
     * @dev Boolean function GG used in the SM3 algorithm
     */
    function GG(uint32 X, uint32 Y, uint32 Z, uint j) private pure returns (uint32) {
        if (j < 16) {
            return X ^ Y ^ Z;
        } else {
            return (X & Y) | (~X & Z);
        }
    }

    /**
     * @dev Permutation function P0 used in the SM3 algorithm
     */
    function P0(uint32 X) private pure returns (uint32) {
        return X ^ leftRotate(X, 9) ^ leftRotate(X, 17);
    }

    /**
     * @dev Permutation function P1 used in the SM3 algorithm
     */
    function P1(uint32 X) private pure returns (uint32) {
        return X ^ leftRotate(X, 15) ^ leftRotate(X, 23);
    }
}

// SPDX-License-Identifier: AGPL-3.0
pragma solidity ^0.7.5;
//整型安全运算
// TODO(zx): Replace all instances of SafeMath with OZ implementation
library SafeMath {
    function add(uint256 a, uint256 b) internal pure returns (uint256) {
        uint256 c = a + b;
        require(c >= a, "SafeMath: addition overflow");

        return c;
    }

    function sub(uint256 a, uint256 b) internal pure returns (uint256) {
        return sub(a, b, "SafeMath: subtraction overflow");
    }

    function sub(
        uint256 a,
        uint256 b,
        string memory errorMessage
    ) internal pure returns (uint256) {
        require(b <= a, errorMessage);
        uint256 c = a - b;

        return c;
    }

    function mul(uint256 a, uint256 b) internal pure returns (uint256) {
        if (a == 0) {
            return 0;
        }

        uint256 c = a * b;
        require(c / a == b, "SafeMath: multiplication overflow");

        return c;
    }

    function div(uint256 a, uint256 b) internal pure returns (uint256) {
        return div(a, b, "SafeMath: division by zero");
    }

    function div(
        uint256 a,
        uint256 b,
        string memory errorMessage
    ) internal pure returns (uint256) {
        require(b > 0, errorMessage);
        uint256 c = a / b;
        assert(a == b * c + (a % b)); // There is no case in which this doesn't hold

        return c;
    }

    function mod(uint256 a, uint256 b) internal pure returns (uint256) {
        return mod(a, b, "SafeMath: modulo by zero");
    }

    function mod(uint256 a, uint256 b, string memory errorMessage) internal pure returns (uint256) {
        require(b != 0, errorMessage);
        return a % b;
    }


    // Only used in the  BondingCalculator.sol
    function sqrrt(uint256 a) internal pure returns (uint256 c) {
        if (a > 3) {
            c = a;
            uint256 b = add(div(a, 2), 1);
            while (b < c) {
                c = b;
                b = div(add(div(a, b), b), 2);
            }
        } else if (a != 0) {
            c = 1;
        }
    }
    function min(uint x, uint y) internal pure returns (uint) {
    return (x < y) ? x : y;
    }

    function max(uint x, uint y) internal pure returns (uint) {
    return (x > y) ? x : y;
    }

    function abs(int val) internal pure returns (uint) {
    return uint(val < 0 ? -val : val);
    }
    
    function ceil(uint a, uint m) internal pure returns (uint) {
    return ((a + m - 1) / m) * m;
  }

  function average(uint a, uint m) internal pure returns (uint) {
    return ( a & b ) + ( a ^ b ) / 2;
  }

  function power(uint256 a, uint256 b) internal pure returns (uint256){

        if(a == 0) return 0;
        if(b == 0) return 1;

        uint256 c = 1;
        for(uint256 i = 0; i < b; i++){
            c = mul(c, a);
        }
    }
    
    //以2为底的对数运算
    function log2(uint x) public pure returns(uint) {
        for(int i = 0; ;i++) {
            if(exp2(i) <= x && exp2(i+1) > x){
                return uint(i);
            }
        }
        return 0;
    }

    //以任意数为底的对数运算
    function log(uint m, uint n) public pure returns(uint) {
        for(int i = 0; ;i++) {
            if(uint(exp(int(m),i)) <= n && uint(exp(int(m), i+1)) > n){
                return uint(i);
            }
        }
        return 0;
    }

    //2的N次幂运算
    function exp2(int n) public pure returns(uint) {
        if (n >= 0){
            return uint((1 << n));
        }
        return 0;
    }

    //m的n次幂运算
    function exp(int m, int n) public pure returns(int) {
        if(n < 0){
            return 0;
        }

        if(m > 0){
            return int(uint(m) ** uint(n));
        }

        if(n % 2 == 0){
            return int(uint(-m) ** uint(n));
        }
        return int(-uint(-m) ** uint(n));
    }
    
}
pragma solidity ^0.7.5;
import { SafeMath } from "../Library/UintMath.sol";
import { FloatSafeMath } from "../Library/FloatMath.sol";

contract Apply {
    //测试元操作：加法
    function get_add_result(uint256 a, uint256 b) public pure returns (uint256) {
        return SafeMath.add(a,b);
    }
    //测试元操作：减法
    function get_sub_result(uint256 a, uint256 b) public pure returns (uint256) {
        return SafeMath.sub(a,b);
    }
    //测试元操作：乘法
    function get_mul_result(uint256 a, uint256 b) public pure returns (uint256) {
        return SafeMath.mul(a,b);
    }
    //测试元操作：除法
    function get_div_result(uint256 a, uint256 b) public pure returns (uint256) {
        return SafeMath.div(a,b);
    }
    //测试元操作：取模
    function get_mod_result(uint256 a, uint256 b) public pure returns (uint256) {
        return SafeMath.mod(a,b);
    }
    //测试元操作：取最小数
    function get_min_result(uint256 a, uint256 b) public pure returns (uint256) {
        return SafeMath.min(a,b);
    }
    //测试元操作：取最大数
    function get_max_result(uint256 a, uint256 b) public pure returns (uint256) {
        return SafeMath.max(a,b);
    }
    //测试元操作：取绝对值
    function get_abs_result(int a) public pure returns (uint256) {
        return SafeMath.abs(a);
    }
    //测试元操作：取数字a到m的最高精度
    function get_ceil_result(uint256 a,uint256 m) public pure returns (uint256) {
        return SafeMath.ceil(a,m);
    }
    //测试元操作：开平方
    function get_sqrt_result(uint256 a) public pure returns (uint256) {
        return SafeMath.sqrrt(a);
    }
    //测试元操作：取平均
    function get_averge_result(uint256 a) public pure returns (uint256) {
        return SafeMath.averge(a);
    }
    //测试元操作：乘方
    function get_power_result(uint256 a) public pure returns (uint256) {
        return SafeMath.power(a);
    }

    //测试advance
    function get_log2_result(uint x) public pure returns(uint) {
        return SafeMath.log2(x); //x = 2, return 1
    }

    function get_log_result(uint m, uint n) public pure returns(uint) {
        return SafeMath.log(m, n); //m = 10, n = 100, return 2
    }

    function get_exp2_result(int n) public pure returns(uint) {
        return SafeMath.exp2(n); //n = 2, return 4
    }

    function get_exp_result(int m, int n) public pure returns(int) {
        return SafeMath.exp(m, n); //m = +-2, n =2, return 4; m=-2, n=1, return -2
    }

    //测试Float
    function get_fmul_result(uint256 a, uint8 dA, uint256 b, uint8 dB) public pure returns(uint256 c, uint8 decimals) {
        return FloatSafeMath.fmul(a,dA,b,dB);
    }

    function get_fdiv_result(uint256 a, uint8 dA, uint256 b, uint8 dB) public pure returns(uint256 c, uint8 decimals) {
        return FloatSafeMath.fdiv(a,dA,b,dB);
    }

    function get_fadd_result(uint256 a, uint8 dA, uint256 b, uint8 dB) public pure returns(uint256 c, uint8 decimals) {
        return FloatSafeMath.fadd(a,dA,b,dB);
    }

    function get_fsub_result(uint256 a, uint8 dA, uint256 b, uint8 dB) public pure returns(uint256 c, uint8 decimals) {
        return FloatSafeMath.fsub(a,dA,b,dB);
    }

}
pragma solidity ^0.5.16;

import {Bytes32SetLib} from "./Bytes32SetLib.sol";

contract Test{
    Bytes32SetLib.Bytes32Set private  data;
    
    //测试是否包含某一元素
    function containsTest(bytes32 element) public view returns (bool){
        return Bytes32SetLib.contains(data,element);
    }
    //测试读取数据
    function getPageTest(uint index,uint pageSize) public view returns (bytes32[] memory){
        return Bytes32SetLib.getPage(data,index,pageSize);
    }
    //测试增加数据
    function addTest(bytes32 element) public {
        Bytes32SetLib.add(data,element);
    }
    //测试删除数据
    function removeTest(bytes32 element) public {
        Bytes32SetLib.remove(data,element);
    }
}

//input 0x7465737400000000000000000000000000000000000000000000000000000000
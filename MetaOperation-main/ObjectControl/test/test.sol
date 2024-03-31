pragma solidity >=0.4.22 <0.6.0;
import { Objects } from "./obj.sol";
contract Test {
    using Objects for Objects.Data;

    Objects.Data private data;
    function addObject(string memory objectId, uint256 price) public returns(string memory result){
        return data.addObject(objectId, price);
    }
    function buyObject(string memory objectId) public payable returns(string memory result){
        return data.buyObject(objectId);
    }
    function transferOwnershipToAnother(address receiver, string memory objectId) public returns(string memory result){
        return data.transferOwnershipToAnother(receiver, objectId);
    }
    function query(string memory objectId) public view  returns (string memory result){
        return data.query(objectId);
    }
    function modify(string memory objectId, string memory a, string memory b) public returns(string memory result){
        return data.modifyData(objectId, a, b);
    }
}
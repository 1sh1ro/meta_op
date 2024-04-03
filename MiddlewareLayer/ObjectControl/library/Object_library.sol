pragma solidity >=0.4.22 <0.6.0;

library Objects {

    struct ObjectDetail {
       string   objectId;
       uint256  price;
       address  belong;
       string   somethingA;
       string   somethingB;
    }

    struct UserDetail {
        string[]  ownObjects;
        uint256    balance;
    }

    struct ModifyDetail {
        uint256 time;
        address modifiedBy;
        string  modifyContentA;
        string  modifyContentB;
    }

    struct Data {
        mapping (string => ObjectDetail) object;
        mapping (address => UserDetail) user;
        mapping (uint256 => ModifyDetail) modify;
    }

    function addObject(Data storage data, string memory _objectId, uint256 _price) internal returns(string memory result){
        if(!(bytes(data.object[_objectId].objectId).length > 0)) { //判断物品是否已经存在
            data.object[_objectId].objectId   = _objectId;
            data.object[_objectId].price      = _price;
            data.object[_objectId].belong     = msg.sender;
            data.object[_objectId].somethingA = "A";
            data.object[_objectId].somethingB = "B";
            data.user[msg.sender].ownObjects.push(_objectId);
            return "Success";    //成功发布物品
        }
        else
            return "False";      //物品已存在，发布失败
    }

    function buyObject(Data storage data, string memory _objectId) internal returns(string memory result){
        if(bytes(data.object[_objectId].objectId).length > 0) {
            if(data.user[msg.sender].balance < data.object[_objectId].price){
                return "False";
            }
            else {
                data.user[msg.sender].balance -= data.object[_objectId].price;
                data.user[data.object[_objectId].belong].balance += data.object[_objectId].price;
                data.user[msg.sender].ownObjects.push(_objectId);
                return "Success";
            }
        }
        else {
            return "False";
        }
    }

    function transferOwnershipToAnother(Data storage data, address _receiver, string memory _objectId) internal returns(string memory result){
        // if(!isUserAlreadyRegister(msg.sender) && !isUserAlreadyRegister(_receiver)) {
        //     //判断双方账户是否存在
        //     return "False";
        // }

        if (data.object[_objectId].belong == msg.sender){
            data.object[_objectId].belong = _receiver;
            return "Success";
        }
        else {
            return "False";
        }
    }

    function query(Data storage data, string memory _objectId) internal view  returns (string memory result){
        // if(!userAllowedModify(msg.sender)) 
        //     return False;    //用户没有相关权限

        if(bytes(data.object[_objectId].objectId).length == 0)
            return "False";
        
        result = string(abi.encodePacked(
            "objectId:",
            _objectId,
            "    price:",
            toString(data.object[_objectId].price),
            "    belong:",
            toString(data.object[_objectId].belong),
            "    somethingA:",
            data.object[_objectId].somethingA,
            "    somethingB:",
            data.object[_objectId].somethingB
        ));
        return result;
    }

    function modifyData(Data storage data, string memory _objectId, string memory _a, string memory _b) internal returns(string memory result){
        // if(!userAllowedModify(msg.sender)) 
        //     return False;    //用户没有相关权限
        if(bytes(data.object[_objectId].objectId).length == 0)
            return "False";
        data.object[_objectId].somethingA = _a;
        data.object[_objectId].somethingB = _b;

        data.modify[now] = ModifyDetail(
            now,
            msg.sender,
            _a,
            _b
        );
        return "Success";
    }

    function toString(address account) internal pure returns(string memory) {
        return toString(abi.encodePacked(account));
    }

    function toString(uint256 value) internal pure returns(string memory) {
        return toString(abi.encodePacked(value));
    }

    function toString(bytes32 value) internal pure returns(string memory) {
        return toString(abi.encodePacked(value));
    }

    function toString(bytes memory data) internal pure returns(string memory) {
        bytes memory alphabet = "0123456789abcdef";

        bytes memory str = new bytes(2 + data.length * 2);
        str[0] = "0";
        str[1] = "x";
        for (uint i = 0; i < data.length; i++) {
            str[2+i*2] = alphabet[uint(uint8(data[i] >> 4))];
            str[3+i*2] = alphabet[uint(uint8(data[i] & 0x0f))];
        }
        return string(str);
    }
}
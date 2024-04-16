pragma solidity 0.4.25;

contract CombinedCounter {
    uint256 counter = 0;
    uint256 MAXVAL = 1 << 256 - 1;
    address[] public voterset;
    mapping(address => uint) votersidx;
    uint limit;

    struct Operation {
        uint8 opr_status; // 0: no opr, 1: voting, 2: voted, 3: voted and executed
        uint8 opr_type; // 0: inc, 1: dec
        uint opr_x; // inc/dec counter by x;
        uint timestamp; // timeout when 10 blocks
        mapping(address => bool) voters;

    }
    Operation[] public operations;

    constructor(address[] memory _voters, uint _limit) public {
        counter = 0;
        voterset = _voters;
        limit = _limit;
        for (uint i = 0; i < voterset.length; i++) {
            votersidx[voterset[i]] = i;
        }
    }

    function _valid_opr_type(uint8 _type) internal pure returns(bool) {
        return _type == 1 || _type == 2;
    }

    function new_event(uint8 _opr_type, uint _opr_x) public returns(uint) {
        require(_valid_opr_type(_opr_type), "oprration type invalid!");
        operations.push(Operation(
            1,
            _opr_type,
            _opr_x,
            block.number
        ));
        operations[operations.length - 1].voters[msg.sender] = true;
        return operations.length - 1;
    }

    function view_event(uint event_id) public view returns(bool, uint) {
        if (event_id >= operations.length) {
            return (false, 0);
        }
        Operation storage opr = operations[event_id];
        uint cnt = 0;
        for (uint i = 0; i < voterset.length; i++) {
            if (opr.voters[voterset[i]]) {
                cnt += 1;
            }
        }
        return (true, cnt);
    }

    function can_exec(uint event_id) internal view returns(uint8) {
        require(event_id < operations.length, "event id invalid");
        Operation storage opr = operations[event_id];
        if (block.number - opr.timestamp > 100) {
            return 0;
        }
        uint cnt = 0;
        for (uint i = 0; i < voterset.length; i++) {
            if (opr.voters[voterset[i]]) {
                cnt += 1;
            }
        }
        if (cnt < limit) {
            return 1; // voting
        }
        if (cnt == limit) {
            return 2; // voted and can execute
        }
        if (cnt > limit) {
            return 3; // voted and executed
        }
    }

    function vote(uint event_id) public returns(uint8, uint) {
        require(event_id < operations.length, "event id invalid");
        operations[event_id].voters[msg.sender] = true;
        uint8 status = can_exec(event_id);
        if (status == 2) {
            Operation memory opr = operations[event_id];
            return exec(opr.opr_type, opr.opr_x);
        }
        return (status, get());
    }

    function exec(uint8 _type, uint arg) internal returns(uint8, uint) {
        bool flag = false;
        uint val = get();
        if (_type == 0) {
            (flag, val) = inc_val(arg);
        } else if (_type == 1) {
            (flag, val) = dec_val(arg);
        }
        if (!flag) {
            return (4, val);
        } else {
            return (5, val);
        }
    }

    function inc_val(uint x) internal returns(bool, uint) {
        if (MAXVAL - counter >= x) {
            counter += x;
            return (true, counter);
        }
        return (false, counter);
    }

    function dec_val(uint x) internal returns(bool, uint) {
        if (counter - x >= 0) {
            counter -= x;
            return (true, counter);
        }
        return (false, counter);
    }

    function get() public view returns(uint) {
        return counter;
    }
}

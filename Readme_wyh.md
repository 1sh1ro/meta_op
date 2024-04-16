    ! 增加InterfaceLayer/Manage&Verify内部分内容
        Manage中
            ERC1967 接口提供了代理合约存储槽的标准，用于跟踪代理合约的升级和管理操作,
                    是实现代理升级和管理过程中的重要组成部分。
            IERC1822 为通用可升级代理标准(UUPS),规范了通过一个简化的代理实现升级功能,
                    旨在通过代理实现合约的升级操作，并规定了一些安全性要求以避免潜在的风险。
            IERC5313 标准规定了标识控制合约的账户所需的最小接口，提供了一个简单而标准化的方式来检索合约的所有者地址。
                    有助于智能合约中实现所有权和访问控制机制。
        Verify中
            IERC1271 为标准签名验证方法的接口，用于在智能合约中验证签名的有效性。
            IERC5267 接口可以获取用于 EIP-712 签名的域分隔符的相关信息。

    ! 新增InterfaceLayer/BillQuery/bill.sol
        bill接口包括了查询持有者账单、根据账单编号查询账单、以及查询待背书账单的功能。

    ! 新增BaseLayer/Introspection
        Introspection中
            ERC165 标准定义了一种通用的方法来检查智能合约是否支持特定接口。
            IERC165 接口是ERC165 标准的具体实现。
            ERC165Checker 合约是一个工具，可用于检查其他合约是否支持特定接口。  

    ! 增加MiddlewareLayer/FuncControl&Upgrade内部分内容
        FuncControl中
            FuncCallContract 实现对函数调用及其参数的记录和跟踪。
            InternalFunction 包含一些用于处理合约地址和合约代码的内部函数(使用汇编提性能)。
            Ownable 提供了基本的访问控制机制，其中有一个所有者可以被授予对特定函数的独占访问权限，
                    可以限制某些函数只能被合约的所有者调用
        Upgrade中
            ProxyAdmin 是辅助合约，允许合约的所有者执行代理合约的升级，并调用新实现上的函数。
            TransparentUpgradeableProxy 合约实现了一个使用 ProxyAdmin 实例进行管理的可升级代理。

    ! 新增MiddlewareLayer/Proxy(from OpenZeppelin),同时加入ERC1967所需要的Address.sol和StorageSlot.sol.
    
    ! 修改BaseLayer/SafeMathOperation/library&test中部分内容,将原来的Math拆分为FloatMath与IntMath
        library中
            IntMath 专注整型计算，在原来基础上增加了取平均、对数、乘方等进阶运算
            FloatMath 专注浮点数计算,加减乘除，平均平方开方
        test中
            Test_Math 增加了对于新增运算的测试

    ! 修改BaseLayer,将原来SetOperation合并至DataStructure

    ! 新增MiddlewareLayer/BasicControl/Proxy/Sing.sol&SingProxy.sol与InterfaceLayer/Manage/ISing.sol
        其中ISing为接口,三个文件协同完成代理模式的实现

    ! 修改BaseLayer/BaseTransfer/library/base64.sol
        重写decode解码操作,将Base64编码的字符串解码为原始的字节数组，删去decode4
    
    ！增加BaseLayer/SafeMathOperation/library&test中部分内容
        增加浮点数运算的取平均平方开方操作与对应的test
        
    ！修改MiddlewareLayer/BasicControl/Counter中部分内容
        将原MultipleCounter修改为整合了MultipleCounter与SimpleCounter核心函数的CombinedCounter,在最小化性能开销的同时保证功能

    ！增加MiddlewareLayer/BasicControl/FuncControl/FuncCallContract.sol中部分内容    
        在Test合约中添加了newFunction新函数，，记录函数调用信息并将其触发FuncCall事件。

    ！增加MiddlewareLayer/BasicControl/FuncControl/InternalFunction.sol中部分内容
        增加公共函数calculateCodeHash以获得给定合约地址的代码节码的哈希值

    ！增加BaseLayer/Crypto/LibDocode.sol中部分内容
        增加函数encode以对签名数据进行编码
    
    ！新增BusinessLayer/RedPacket/RedPacket.sol
        实现发红包功能，合约创建者可以向多个地址发送红包，并指定总金额和红包个数。每个接收者可以领取自己的红包金额。

    ！新增MiddlewareLayer/BasicControl/Proxy/beacon&Address.sol&Clones.sol&Proxy.sol&StorageSlot.sol
        主要辅助ERC1967

    ！MiddlewareLayer/BasicControl/Upgrade移入Proxy中

    

    



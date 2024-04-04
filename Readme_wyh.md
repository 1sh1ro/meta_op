4.03
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

    ! 增加MiddlewareLayer/FuncControl&Upgrade内部分内容
        FuncControl中
            FuncCallContract 实现对函数调用及其参数的记录和跟踪。
            InternalFunction 包含一些用于处理合约地址和合约代码的内部函数(使用汇编提性能)。
            Ownable 提供了基本的访问控制机制，其中有一个所有者可以被授予对特定函数的独占访问权限，
                    可以限制某些函数只能被合约的所有者调用
        Upgrade中
            ProxyAdmin 是辅助合约，允许合约的所有者执行代理合约的升级，并调用新实现上的函数。
            TransparentUpgradeableProxy 合约实现了一个使用 ProxyAdmin 实例进行管理的可升级代理。
    
    ! 修改BaseLayer/SafeMathOperation/library&test中部分内容,将原来的Math拆分为FloatMath与IntMath
        library中
            IntMath 专注整型计算，在原来基础上增加了取平均、对数、乘方等进阶运算
            FloatMath 专注浮点数计算
        test中
            Test_Math 增加了对于新增运算的测试

    ! 修改BaseLayer,将原来SetOperation合并至DataStructure


4.04
    ! 新增MiddlewareLayer/BasicControl/Proxy/Sing.sol&SingProxy.sol与InterfaceLayer/Manage/ISing.sol
        其中ISing为接口,三个文件协同完成代理模式的实现



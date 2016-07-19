# ScanningIdentificationCardNumber
扫描银行卡识别卡号

需要在TARGETS---Build Phases---Link Binary With Libraries 里边分别加入下面这几个框架 
        Accelerate.framework 
        MobileCoreServices.framework 
        CoreMedia.framework 
        AudioToolbox.framework 
        AVFoundation.framework 
再在TARGETS---Build Settings---Other Linker Flags中添加-
        ObjC和-lc++


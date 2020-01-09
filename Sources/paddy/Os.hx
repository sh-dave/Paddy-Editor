package paddy;

import haxe.io.BytesData;

#if kha_debug_html5
class Os {
    public static function fileSaveBytes( a: String, b: BytesData ) {
    }

    public static function sysCommand( cmd: String ) {
    }

    public static function getFilesLocation()
        return '';

    public static function loadBlob( path: String ) : BytesData {
        return null;
    }
}
#elseif kha_krom
typedef Os = Krom;
#else
class Os {
    public static inline function fileSaveBytes( a: String, b: BytesData ) {
        throw 'Os.fileSaveBytes() not implemented';
    }

    public static function sysCommand( cmd: String ) {
        throw 'Os.sysCommand() not implemented';
    }

    public static function getFilesLocation() {
        throw 'Os.getFilesLocation() not implemented';
    }

    public static function loadBlob( path: String ) : BytesData {
        throw 'Os.loadBlob() not implemented';
    }
}
#end

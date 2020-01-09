package paddy;

import haxe.io.BytesData;

#if kha_debug_html5
import haxe.io.Bytes;
import sys.io.File;

class Os {
    public static function fileSaveBytes( a: String, b: BytesData ) {
        final out = File.write(a, true);
        out.write(Bytes.ofData(b));
        out.close();
    }

    public static function sysCommand( cmd: String ) {
        Sys.command(cmd);
    }

    public static function getFilesLocation()
        return '';

    public static function loadBlob( path: String ) : BytesData {
        final content = File.getBytes(path);
        return content.getData();
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

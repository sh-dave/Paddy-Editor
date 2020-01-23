package paddy.files;

// Editor
import paddy.ui.UINodes;
import paddy.data.Data.AssetData;
import paddy.data.Data.ScriptData;

class Export{

	#if kha_windows
	static var copycmd = "copy";
	#else
	static var copycmd = "cp";
	#end

	public static function exportPaddy(path:String = "") {
		Os.sysCommand('mkdir $path/Assets');
		copyAssets('$path/Assets/');
		adjustObjectSpritePath(path);
		adjustAssetsPath(path);
		adjustScriptsPath(path, App.scene.scripts);
		for(obj in App.scene.objects) adjustScriptsPath(path, obj.scripts);
		if(App.paddydata.name =="") App.paddydata.name = "PaddyProject";
		if(App.paddydata.scene =="") App.paddydata.scene = "scene.json";
		if(App.paddydata.window =="") App.paddydata.window = "window.json";
		var newPath = path;
		if(path!="") newPath = path+"/";
		Os.fileSaveBytes(newPath+"paddy.json", haxe.io.Bytes.ofString(haxe.Json.stringify(App.paddydata)).getData());
		exportWindow(path);
		App.scene.assets = Assets.assets;
		exportScene(path);
		exportNodes('$path/Assets');
		App.projectPath = path;
		paddy.Paddy.reloadUI();
	}
	
	public static function exportConfig() {
		App.configData.plugins = Plugin.getNames();
		Krom.fileSaveBytes(Krom.getFilesLocation()+"/_config.json", haxe.io.Bytes.ofString(haxe.Json.stringify(App.configData)).getData());
	}

	public static function copyAssets(path:String) {
		for(asset in Assets.assets){
			Os.sysCommand('$copycmd ' + asset.path + ' $path');
		}
	}

	public static function exportScene(path:String = "") {
		var newPath = path;
		if(path!="") newPath = path+"/";
		Os.fileSaveBytes(newPath+App.scene.name+".json", haxe.io.Bytes.ofString(haxe.Json.stringify(App.scene)).getData());
	}

	public static function exportWindow(path:String = "") {
		var newPath = path;
		if(path!="") newPath = path+"/";
		Os.fileSaveBytes(newPath+"window.json", haxe.io.Bytes.ofString(haxe.Json.stringify(App.window)).getData());
	}

	public static function exportNodes(path:String = "") {
		var newPath = path;
		if(path!="") newPath = path+"/";
		for(nodes in UINodes.nodesArray){
			var name = nodes.name;
			Os.fileSaveBytes(newPath+'$name.json', haxe.io.Bytes.ofString(haxe.Json.stringify(nodes.nodeCanvas)).getData());
		}
	}

	public static function exportJsonFile(name:String, data:Dynamic) {
		Os.fileSaveBytes(name, haxe.io.Bytes.ofString(haxe.Json.stringify(data)).getData());
	}

	public static function exportFile(name:String, data:String) {
		Os.fileSaveBytes(name, haxe.io.Bytes.ofString(data).getData());
	}

	static function adjustAssetsPath(newPath:String){
		for(asset in Assets.assets) asset.path = 'Assets/' + asset.name;
	}

	static function adjustObjectSpritePath(newPath:String) {
		for (object in App.scene.objects){
			if(object.spriteRef!= null){
				var ref = object.spriteRef;
				var name = ref.split("/");
				var newName = name[name.length-1];
				object.spriteRef = newName;
			}
		}
	}

	static function adjustScriptsPath(newPath:String, scripts:Array<ScriptData>) {
		if(scripts!=null && scripts.length != 0){
			for(script in scripts){
				var ref = script.scriptRef;
				var name = ref.split("/");
				var newName = name[name.length-1];
				script.scriptRef = 'Assets/$newName';
			}
		}
	}
}

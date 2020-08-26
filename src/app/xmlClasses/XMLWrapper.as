import flash.html.script.Package;
import flash.xml.XMLTag;

package app.xmlClasses{

    public class XMLWrapper {

        private var xml:XML;

        public function XMLWrapper(xml:XML) {
            this.xml = xml;
        }

        /**
         * 指定したタグを取得します。
         * @param tag タグを文字列で指定します。
         * @return XMLTag を詰めたベクターで返却されます。
         * 指定のタグが見つからない場合、空のベクターを返します。
         */
        public function getTags(tag:String):Vector.<XMLTag>{
            var tags:Vector.<XMLTag> = new Vector.<XMLTag>();
            var xmlList:XMLList = xml[tag];

            for each(var x:XML in xmlList){
                var xt:XMLTag = new XMLTag(x);
                tags.push(xt);
            }

            return tags;
        }
    }
}

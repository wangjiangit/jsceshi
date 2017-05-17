/**
 * Created by wj on 2017/5/17.
 */

var temp=document.URL;
var index=temp.indexOf('content=')+8;
var uri=temp.substring(index);

document.write(decodeURI(uri));

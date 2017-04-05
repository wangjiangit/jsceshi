
function calc(n){
    var val=n;
    val=val-1;
    self.postMessage(val);
    self.close();
}

onmessage=function(e){
    calc(e.data.n);
};

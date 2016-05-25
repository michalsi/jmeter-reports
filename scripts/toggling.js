function toggleMe(a){
    var e=document.getElementById(a);
    var i=document.getElementById(a+'_img');
    if(!e)return true;
    if(e.style.display=="none"){
        i.src="collapse.png"
        e.style.display="block"
    }
    else{
        i.src="expand.png"
        e.style.display="none"
    }
    return true;
}
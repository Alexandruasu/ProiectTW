window.addEventListener("load",function(){
    document.getElementById("inp-pret").onchange=function(){
        document.getElementById("infoRange").innerHTML=`(${this.value})`
    }
    
    document.getElementById("filtrare").addEventListener("click", function(){
        
        let inpNume= document.getElementById("inp-nume").value.toLowerCase().trim()

        let vRadioDecibeli = document.getElementsByName("gr_rad");
        let inpDecibeli;
        for(let r of vRadioDecibeli){
            if(r.checked){
                inpDecibeli = r.value;
                break;
            }
        }

        let minDecibeli, maxDecibeli;
        if(inpDecibeli != "toate"){
            let aux = inpDecibeli.split(":");
            minDecibeli = parseInt(aux[0]);
            maxDecibeli = parseInt(aux[1]);
        }


        let inpPret= parseInt(document.getElementById("inp-pret").value)

        let inpCateg= document.getElementById("inp-tip_produs").value.toLowerCase().trim()
        produse = document.getElementsByClassName("produs")
        for(let produs of produse ){
            let valNume = produs.getElementsByClassName("val-nume")[0].innerHTML.toLowerCase().trim()
            let cond1= valNume.startsWith(inpNume)

            let valDecibeli = parseInt(produs.getElementsByClassName("val-numar_decibeli")[0].innerHTML);
            let cond2 = (inpDecibeli == "toate" || (minDecibeli <= valDecibeli && valDecibeli < maxDecibeli));

            let valPret=parseFloat(produs.getElementsByClassName("val-pret")[0].innerHTML)
            let cond3=(valPret>=inpPret)
            let valCateg=produs.getElementsByClassName("val-tip_produs")[0].innerHTML
            let cond4=(inpCateg=="toate" || inpCateg==valCateg)


            if(cond1 && cond2 && cond3 &&cond4){
                produs.style.display="block";
            }
            else{
                produs.style.display="none";
            }
        }
    })
    document.getElementById("resetare").onclick = function() {
        if (confirm("Ești sigur că vrei să resetezi toate filtrele?")) {
            document.getElementById("inp-nume").value = "";
            document.getElementById("inp-pret").value = document.getElementById("inp-pret").min;
            document.getElementById("inp-tip_produs").value = "toate";
            document.getElementById("i_rad4").checked = true;
            var produse = document.getElementsByClassName("produs");
            document.getElementById("infoRange").innerHTML = "(0)";
            for (let prod of produse) {
                prod.style.display = "block";
            }
        }
    }
    function sorteaza(semn){
        var produse=document.getElementsByClassName("produs");
        let v_produse= Array.from(produse);
        v_produse.sort(function(a,b){
            let pret_a= parseInt(a.getElementsByClassName("val-pret")[0].innerHTML)
            let pret_b= parseInt(b.getElementsByClassName("val-pret")[0].innerHTML)
            if(pret_a=pret_b){
                let nume_a= a.getElementsByClassName("val-nume")[0].innerHTML
                let nume_b= b.getElementsByClassName("val-nume")[0].innerHTML
                return semn*nume_a.localeCompare(nume_b);
            }
            return semn*(pret_a-pret_b);
        });
        console.log(v_produse)
            for(let prod of v_produse){
                prod.parentNode.appendChild(prod);
            }

    }
    document.getElementById("sortCrescNume").onclick= function(){
        sorteaza(1);
    }
    document.getElementById("sortDescrescNume").onclick= function(){
        sorteaza(-1);
    }
    window.onkeydown=function(e){
        if(e.key == "c" && e.altKey){
            var suma=0;
            var produse=document.getElementsByClassName("produs");
            for (let produs of produse){
                var stil=getComputedStyle(produs);
                if(stil.display!="none"){
                    suma+=parseFloat(produs.getElementsByClassName("val-pret")[0].innerHTML);
                }

            }
            if(!document.getElementById("par_suma")){
                let p= document.createElement("p");
                p.innerHTML=suma;
                p.id="par_suma";
                container=document.getElementById("produse");
                container.insertBefore(p,container.children[0])
                setTimeout(function(){
                    var pgf=document.getElementById("par_suma");   
                    if(pgf)
                        pgf.remove();   
                },2000)
        }
        }
    }
})
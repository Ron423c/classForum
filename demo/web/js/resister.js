/* 
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
let sem , sec;
    sem = document.getElementById("semid"); 
    sec = document.getElementById("secid");
document.getElementById("TorSid").addEventListener("change", function(){
    if(this.value === "teacher"){
        sem.disabled = true;
        sec.disabled = true;
    }
    else{
        sem.disabled = false;
        sec.disabled = false;
    }
});

document.getElementById('profilePic').onclick = function() {
    document.getElementById('my_file').click();
};
/* 
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
$(".container .bg").addClass("full");
var sub = $("#submit"),pop = $('.pop');
const setSubmit = (dis) => {
    sub.get(0).disabled = dis;
};
const foEffect = (succ) => {
    succ === true ? pop.addClass('fade-out fo-animate success'): pop.addClass('fade-out fo-animate fail');
    setTimeout(function () {
        pop.removeClass('fo-animate fade-out success fail');
    }, 7000);
};
if($('.pop.fade-out').length){
    foEffect();
}
pop.on('classChange', function () {
    foEffect();
});

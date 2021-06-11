var logos = {}
var currentRanks = {}
var currentBossMenuJob = "";

//COFIG START

//CHANGE USING FONTAWSOME (https://fontawesome.com/)
var defaultLogo = 'fas fa-briefcase';
logos['fakepolice'] = 'fas fa-balance-scale-right';
logos['ambulance'] = 'fas fa-briefcase-medical';
logos['fakemechanic'] = 'fas fa-wrench';


//CONFIG END

var job = 'unemployed';
var grade = 3;
var offduty = false;




$(document).keyup(function(e) {
    if (e.keyCode === 27) {

        $.post('https://core_multijob/close', JSON.stringify({}));
        $("#main_container").fadeOut("slow", function() {

            $("#main_container").html("").fadeIn();
        });

    }


});

function playClickSound() {
    var audio = document.getElementById("audio");
    audio.volume = 0.1;
    audio.play();
}

function openBossMenu(job, label, employees, fund, canwithdraw, candeposit, canhire, canrank, canfire, ranks) {

currentRanks = ranks;
currentBossMenuJob = job;
    
var base = '<div class="clearfix" id="page"><!-- group -->'+

'   <div class="clearfix grpelem slide-top" id="pu657"><!-- column -->';
if (canhire) {
base = base +'<div id="addemployee" onclick="openHire()" class="ripple"><i class="fas fa-plus" style="margin-top: 12px;"></i></div>';
} else {
    base = base +'<div id="addemployee" style="opacity: 0.5;" class="ripple"><i class="fas fa-plus" style="margin-top: 12px;"></i></div>';
}

base = base +'   <div class="gradient rounded-corners grpelem" id="u654"><!-- simple frame --></div>'+
'    <div class="colelem" id="u657"><!-- simple frame --></div>'+
'    <div class="clearfix colelem" id="u660-4"><!-- content -->'+
'     <p>'+label.toUpperCase()+'</p>'+
'    </div>'+
'    <div class="clearfix colelem" id="u667-4"><!-- content -->'+
'     <p>FUNDS</p>'+
'    </div>'+
'    <div class="clearfix colelem" id="u663-4"><!-- content -->'+
'     $' +fund+
'    </div>'+
'    <div class="clearfix colelem" id="pu670-4"><!-- group -->';
if(canwithdraw) {
base = base +'     <button class="rounded-corners  grpelem ripple" onclick="openWithdraw()" id="u670-4"><!-- content -->'+
'      <p id="u670-2">WITHDRAW</p>'+
'     </button>';
} else {
    base = base +'     <button class="rounded-corners  grpelem ripple" style="opacity: 0.5;" id="u670-4"><!-- content -->'+
'      <p id="u670-2">WITHDRAW</p>'+
'     </button>';
}
if(candeposit) {
base = base +'     <button class="rounded-corners  grpelem ripple" onclick="openDeposit()" id="u673-4"><!-- content -->'+
'      <p id="u673-2">DEPOSIT</p>'+
'     </button>';
} else {
    base = base +'     <button class="rounded-corners  grpelem ripple" style="opacity: 0.5;" id="u673-4"><!-- content -->'+
'      <p id="u673-2">DEPOSIT</p>'+
'     </button>';
}
base = base +'    </div>'+
'    <div class="clearfix colelem" id="u688-4"><!-- content -->'+
'     <p>EMPLOYEES</p>'+
'    </div>'+
'    <div class="clearfix colelem" id="u682"><!-- column -->';

for (i = 0; i < employees.length; i++) {

base = base + '     <div class="rounded-corners clearfix colelem" id="u745"><!-- group -->'+
'      <div class="clearfix grpelem" id="pu746-4"><!-- column -->'+
'       <div class="clearfix colelem" id="u746-4"><!-- content -->'+
'        <p><span id="u746">'+employees[i].fullname+'</span></p>'+
'       </div>'+
'       <div class="clearfix colelem" id="u747-4"><!-- content -->'+
'        <p>'+employees[i].grade_label+'</p>'+
'       </div>'+
'      </div>';
if (canrank) {
    base = base + '      <div class="grpelem ripple" data-identifier="'+employees[i].identifier+'" onclick="openRanks(this)" id="u749"><i class="fas fa-layer-group " ></i></div>';
}

if (canfire) {
    base = base + '      <div class="grpelem ripple" data-identifier="'+employees[i].identifier+'" onclick="sureWindow(this)" id="u748"><i class="fas fa-times fa-lg " ></i></div>';
}

 base = base + '      <div class="grpelem ripple" data-identifier="'+employees[i].identifier+'" onclick="openBonus(this)" id="u747"><i class="fas fa-hand-holding-usd " ></i></div>';


base = base +'     </div>';


}

base = base + '    </div>'+
'   </div>'+
'   <div class="verticalspacer" data-offset-top="0" data-content-above-spacer="712" data-content-below-spacer="18"></div>'+

'  </div>';
    



    $("#main_container").html(base);

        

}


function openHire() {

    playClickSound();


        var base = '<div id="input">' +


        '<div id="darken"><div>' +
        '<div id="inputfield" class="slide-top">' +

'        <p id="inputtext">HIRE</p>'+
'<i class="fas fa-id-badge fa-lg" id="inputdollar"></i>' +
'<input type="text" id="inputin" placeholder="0"></input>' +
'     <button class="rounded-corners  grpelem ripple" onclick="hireperson(this)" id="u673-5"><!-- content -->'+
'      <p id="u673-2">HIRE</p>'+
'     </button>'+
        
        '</div>' +
        '</div>';

        $("#pu657").append(base);


}

function openBonus(t) {

playClickSound();

        var base = '<div id="input">' +


        '<div id="darken"><div>' +
        '<div id="inputfield" class="slide-top">' +

'        <p id="inputtext">ENTER BONUS</p>'+
'<i class="fas fa-dollar-sign fa-lg" id="inputdollar"></i>' +
'<input type="text" id="inputin" placeholder="0"></input>' +
'     <button class="rounded-corners  grpelem ripple" data-identifier="'+t.dataset.identifier+'" onclick="givebonus(this)" id="u673-5"><!-- content -->'+
'      <p id="u673-2">GIVE</p>'+
'     </button>'+
        
        '</div>' +
        '</div>';

        $("#pu657").append(base);


}

function openWithdraw() {

playClickSound();

        var base = '<div id="input">' +


        '<div id="darken"><div>' +
        '<div id="inputfield" class="slide-top">' +

'        <p id="inputtext">WITHDRAW</p>'+
'<i class="fas fa-dollar-sign fa-lg" id="inputdollar"></i>' +
'<input type="text" id="inputin" placeholder="0"></input>' +
'     <button class="rounded-corners  grpelem ripple" onclick="withdrawAmount(this)" id="u673-5"><!-- content -->'+
'      <p id="u673-2">WITHDRAW</p>'+
'     </button>'+
        
        '</div>' +
        '</div>';

        $("#pu657").append(base);


}

function openDeposit() {

    playClickSound();


        var base = '<div id="input">' +


        '<div id="darken"><div>' +
        '<div id="inputfield" class="slide-top">' +

'        <p id="inputtext">DEPOSIT</p>'+
'<i class="fas fa-dollar-sign fa-lg" id="inputdollar"></i>' +
'<input type="text" id="inputin" placeholder="0"></input>' +
'     <button class="rounded-corners  grpelem ripple" onclick="depositAmount(this)" id="u673-5"><!-- content -->'+
'      <p id="u673-2">DEPOSIT</p>'+
'     </button>'+
        
        '</div>' +
        '</div>';

        $("#pu657").append(base);


}

function sureWindow(t) {

    playClickSound();


        var base = '<div id="input">' +


        '<div id="darken"><div>' +
        '<div id="inputfield" class="slide-top">' +

'        <p id="inputtext">ARE YOU SURE?</p>'+
'        <p id="inputothertext">You want to fire ' +$(t).parent().find("#u746").text()+'</p>'+

'     <button class="rounded-corners" data-identifier="'+t.dataset.identifier+'"  grpelem ripple" onclick="fire(this)" id="u673-5"><!-- content -->'+
'      <p id="u673-2">YES</p>'+
'     </button>'+
        
        '</div>' +
        '</div>';

        $("#pu657").append(base);


}

function openRanks(t) {

    playClickSound();


        var base = '<div id="input">' +


        '<div id="darken"><div>' +
        '<div id="inputfield" class="slide-top">' +

'        <p id="inputtext">RANKS</p>'+
'      <div id="ranklist">';

for (i = 0; i < currentRanks.length; i++) {

base = base + '<div id="rankentry" data-identifier="'+t.dataset.identifier+'" data-grade="'+currentRanks[i].grade+'" onclick="promote(this)" class="ripple">'+currentRanks[i].grade_label.toUpperCase()+'</div>';
}

base = base +'</div>' +

        
        '</div>' +
        '</div>';

        $("#pu657").append(base);


}

function hireperson(t) {

    playClickSound();

        var id = $(t).parent().find('#inputin').val();
  
         $.post('https://core_multijob/close', JSON.stringify({}));
        $("#main_container").fadeOut("slow", function() {

            $("#main_container").html("").fadeIn();
        });

          $.post('https://core_multijob/hire', JSON.stringify({job: currentBossMenuJob, id: id}));
}

function withdrawAmount(t) {

    playClickSound();

        var amount = $(t).parent().find('#inputin').val();

        $.post('https://core_multijob/close', JSON.stringify({}));
        $("#main_container").fadeOut("slow", function() {

            $("#main_container").html("").fadeIn();
        });

          $.post('https://core_multijob/withdraw', JSON.stringify({job: currentBossMenuJob, amount: amount}));
}


function givebonus(t) {

    playClickSound();

        var amount = $(t).parent().find('#inputin').val();
        var identifier = t.dataset.identifier;

        $.post('https://core_multijob/close', JSON.stringify({}));
        $("#main_container").fadeOut("slow", function() {

            $("#main_container").html("").fadeIn();
        });

          $.post('https://core_multijob/givebonus', JSON.stringify({identifier: identifier, amount: amount, job: currentBossMenuJob}));
}


function depositAmount(t) {

    playClickSound();

        var amount = $(t).parent().find('#inputin').val();

          $.post('https://core_multijob/close', JSON.stringify({}));
        $("#main_container").fadeOut("slow", function() {

            $("#main_container").html("").fadeIn();
        });

          $.post('https://core_multijob/deposit', JSON.stringify({job: currentBossMenuJob, amount: amount}));
}

function fire(t) {

    playClickSound();

        var identifier = t.dataset.identifier;

       
         $.post('https://core_multijob/close', JSON.stringify({}));
        $("#main_container").fadeOut("slow", function() {

            $("#main_container").html("").fadeIn();
        });

          $.post('https://core_multijob/fire', JSON.stringify({identifier: identifier, job: currentBossMenuJob}));


}

function promote(t) {

    playClickSound();

        var rank = t.dataset.grade;
        var identifier = t.dataset.identifier;
       
        $.post('https://core_multijob/close', JSON.stringify({}));
        $("#main_container").fadeOut("slow", function() {

            $("#main_container").html("").fadeIn();
        });

          $.post('https://core_multijob/setrank', JSON.stringify({identifier: identifier, rank: rank, job: currentBossMenuJob}));


}

function openJobCenter(defaultJobs, myjobs) {


    var base = '<div id="jobcenter">';



    for (i = 0; i < defaultJobs.length; i++) {

        var text = 'ADD';

        for (g = 0; g < myjobs.length; g++) {
            if (defaultJobs[i].job == myjobs[g].name) {
                text = 'ADDED';
            }
        }

        base = base + '<div class="shadow gradient rounded-corners colelem animated fadeInUp" id="u712">' +
            '    <div class="clearfix grpelem" id="u465-4"><!-- content -->' +
            '      <p>' + defaultJobs[i].label + '</p>' +
            '     </div>' +
            '     <button class="rounded-corners grpelem ripple addjob" data-job="' + defaultJobs[i].job + '" id="u468-4"><!-- content -->' +
            text +
            '     </button>' +
            '     <div class="grpelem" id="u474"><i class="' + defaultJobs[i].icon + ' fa-3x"></i><!-- simple frame --></div>' +
            '     <div class="clearfix grpelem" id="u477-4"><!-- content -->' +
            '      <p>' + defaultJobs[i].description + '</p>' +
            '     </div>' +
            '     </div>';

    }




    base = base + '   </div>';


    $("#main_container").html(base);
}

function openJobManagement() {

    var status = 'SELECT';

    if (job == 'offduty') {
        status = 'SELECTED';
    }




    var base = '<div class="clearfix animated fadeInUp" id="page"><!-- group -->' +
        '   <div class="clearfix grpelem " id="pu308"><!-- group -->' +
        '    <div class="gradient " id="u308"><!-- simple frame --> <div class="clearfix grpelem" id="pu951" ><!-- column --><div></div>' +
        '    <div id="u311"><!-- simple frame --></div>' +
        '    <div class="clearfix" id="u315-4"><!-- content -->' +
        '     <p>MY JOBS</p>' +
        '    </div>' +
        '    <div class="rgba-background rounded-corners" id="u450"><i class="fas fa-coffee fa-lg" style="margin: 7px; margin-top: 12px;"></i><!-- simple frame --></div>' +
        '    <div class="clearfix" id="u453-4"><!-- content -->' +
        '     <p>OFFDUTY</p>' +
        '    </div>' +
        '    <div id="u459"><!-- simple frame --></div>' +
        '    <button class="rounded-corners ripple select offduty" data-job="offduty" data-grade="0" id="u768-4"><!-- content -->' +
        status +
        '    </button>' +
        '   </div>' +



        '  </div>';




    $("#main_container").html(base);
    $("#page").fadeOut(0);
    $("#page").fadeIn();

}

function addJob(info) {



    var status = 'SELECT';
    var removebutton = '';
    var removable = 'hidden';



    if (info.name == job && grade == info.grade) {

        status = 'SELECTED';
    } else {
        if (info.removable) {
            removable = '';
        }
    }

    if (info.removable) {
        removebutton = '<button class="rounded-corners grpelem ripple removebutton ' + removable + '" data-job="' + info.name + '" data-grade="' + info.grade + '" id="u989"><i class="fas fa-trash-alt fas fa-camera "></i> <!-- simple frame --></button>';
    }

    if (logos[info.name] == null) {
        logos[info.name] = defaultLogo;
    }

    var jobPanel = '    <div class="rgba-background rounded-corners clearfix colelem" id="u981"><!-- column -->' +
        '     <div class="clearfix colelem" id="pu984"><!-- group -->' +
        '      <div class="grpelem" id="u984"><i class=" ' + logos[info.name] + '  fa-lg"></i><!-- simple frame --></div>' +
        '      <div class="clearfix grpelem" id="pu982-4"><!-- column -->' +
        '       <div class="clearfix colelem" id="u982-4"><!-- content -->' +
        '        <p>' + info.label + '</p>' +
        '       </div>' +
        '       <div class="clearfix colelem" id="u983-4"><!-- content -->' +
        '        <p>' + info.grade_label + '</p>' +
        '       </div>' +
        '      </div>' +
        '     </div>' +
        '     <div class="clearfix colelem" id="pu986"><!-- group -->' +
        '      <div class="grpelem" id="u986"><i class="fas fa-money-bill-wave fa-xs"></i><!-- simple frame --></div>' +
        '      <div class="clearfix grpelem" id="u985-4"><!-- content -->' +
        '       <p>$ ' + info.salary + '</p>' +
        '      </div>' +
        removebutton +
        '      <button class="rounded-corners  grpelem ripple select" data-job="' + info.name + '" data-grade="' + info.grade + '" id="u990-4"><!-- content -->' +
        status +
        '      </button>' +
        '     </div>' +
        '     <div class="clearfix colelem" id="pu988"><!-- group -->' +
        '      <div class="grpelem" id="u988"><i class="fas fa-user-friends fa-xs"></i><!-- simple frame --></div>' +
        '      <div class="clearfix grpelem" id="u987-4"><!-- content -->' +
        '       <p>' + info.online + '</p>' +
        '      </div>' +
        '     </div>' +
        '    </div>';



    $("#pu951").append(jobPanel);

}

window.addEventListener('message', function(event) {

    var edata = event.data;

    if (edata.type == "open") {

        job = edata.job.job;
        grade = edata.job.grade;
        offduty = edata.offduty;

        openJobManagement();
        const yourjobs = JSON.parse(edata.jobs);


        for (i = 0; i < yourjobs.length; i++) {
            addJob(yourjobs[i]);
        }


    }


    if (edata.type == "openBoss") {

        job = edata.job.job;
        grade = edata.job.grade;
       


           
       openBossMenu(edata.bossJob, edata.bossLabel, edata.employees, edata.fund, edata.perms.canWithdraw, edata.perms.canDeposit, edata.perms.canHire, edata.perms.canRank, edata.perms.canFire, edata.grades);


    }

    if (edata.type == "openCenter") {

        job = edata.job.job;
        grade = edata.job.grade;
        offduty = edata.offduty;

        const centerJobs = JSON.parse(edata.center);
        const yourjobs = JSON.parse(edata.jobs);


        openJobCenter(centerJobs, yourjobs);




    }


    $(".addjob").click(function() {
        playClickSound();

        if ($(this).text().replace(/ /g, '') != 'ADDED') {
            $(this).text('ADDED');
            $.post('https://core_multijob/addjob', JSON.stringify({
                job: this.dataset.job

            }));
        }

    });

    $(".select").click(function() {

        playClickSound();


        if ($(this).hasClass('offduty')) {

            if (offduty) {
                $(document).find(".select").text('SELECT');
                $(this).text('SELECTED');
                $(document).find(".removebutton").removeClass('hidden')
                $.post('https://core_multijob/changejob', JSON.stringify({
                    job: this.dataset.job,
                    grade: this.dataset.grade
                }));
            } else {
                $.post('https://core_multijob/cantoffduty', JSON.stringify({}));
            }
        } else {
            $(document).find(".select").text('SELECT');
            $(this).text('SELECTED');

            $(document).find(".removebutton").removeClass('hidden')
            $(this).parent().find(".removebutton").addClass('hidden');
            $.post('https://core_multijob/changejob', JSON.stringify({
                job: this.dataset.job,
                grade: this.dataset.grade
            }));
        }


    });


    $(".removebutton").click(function() {
        playClickSound();
        $(this).parent().parent().fadeOut();
        $.post('https://core_multijob/removejob', JSON.stringify({
            job: this.dataset.job,
            grade: this.dataset.grade
        }));
    });


});
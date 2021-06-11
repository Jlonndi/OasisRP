$(() => {
    var revert = true
    var recipes = {}
    var inventory = {}
    var CraftingTable = {
        field1: '',
        field2: '',
        field3: '',
        field4: '',
        field5: '',
        field6: '',
        field7: '',
        field8: '',
        field9: ''
    }

    $('#background').hide()
    $('#CraftItem').hide()

    window.addEventListener('message', (event) => {
        if (event.data.type == "open") {
            $('#background').show()
            
            inventory = event.data.inventory
            var newHTML = ''
            event.data.inventory.forEach((d) => {
				newHTML += `
                <div class="item" data-name="${d.name}" data-amount="${d.count}">
                    <p class="amount">x${d.count}</p>
                    <img src="./img/${d.name}.png" alt="${d.label}" draggable="false">
                </div>
                `;
			});
			$('#inventarList').html(newHTML);
            $('.item').draggable({
                helper: 'clone',
                appendTo: 'body',
                revert: 'invalid',
                start: function (event, ui) {
                    revert = true
                    $(this).css('opacity', '0.5');
                    var newamount = $(this).data('amount')-1
                    $(this).data('amount', newamount)
                    $(this).find('p').html('x' + newamount)
                },
                stop: function () {
                    $(this).css('opacity', '1');
                    if (revert) {
                        var newamount = $(this).data('amount')+1
                        $(this).data('amount', newamount)
                        $(this).find('p').html('x' + newamount)
                    }
                }
            });
        } else if (event.data.type == 'sendRecipes') {
            var newHTML = ''
            
            recipes = event.data.recipes
            event.data.recipes.forEach((d) => {
                if (d.invisible != true && d.added == false) {
                    var items = {
                        field1: '',
                        field2: '',
                        field3: '',
                        field4: '',
                        field5: '',
                        field6: '',
                        field7: '',
                        field8: '',
                        field9: '',
                    }
                    if (d.field1.label != '') items.field1 = '1x ' + d.field1.label + '<br>'
                    if (d.field2.label != '') items.field2 = '1x ' + d.field2.label + '<br>'
                    if (d.field3.label != '') items.field3 = '1x ' + d.field3.label + '<br>'
                    if (d.field4.label != '') items.field4 = '1x ' + d.field4.label + '<br>'
                    if (d.field5.label != '') items.field5 = '1x ' + d.field5.label + '<br>'
                    if (d.field6.label != '') items.field6 = '1x ' + d.field6.label + '<br>'
                    if (d.field7.label != '') items.field7 = '1x ' + d.field7.label + '<br>'
                    if (d.field8.label != '') items.field8 = '1x ' + d.field8.label + '<br>'
                    if (d.field9.label != '') items.field9 = '1x ' + d.field9.label + '<br>'
                    d.added = true
                    newHTML += `
                    <div class="Recipe" data-field1="${d.field1.name}" data-field2="${d.field2.name}" data-field3="${d.field3.name}" data-field4="${d.field4.name}" data-field5="${d.field5.name}" data-field6="${d.field6.name}" data-field7="${d.field7.name}" data-field8="${d.field8.name}" data-field9="${d.field9.name}">
                        <h1>${d.label}</h1>
                        <p>
                            ${items.field1}
                            ${items.field2}
                            ${items.field3}
                            ${items.field4}
                            ${items.field5}
                            ${items.field6}
                            ${items.field7}
                            ${items.field8}
                            ${items.field9}
                        </p>
                    </div>
                    `;
                }
                
                if (d.job == event.data.job && d.added == false) {
                    var items = {
                        field1: '',
                        field2: '',
                        field3: '',
                        field4: '',
                        field5: '',
                        field6: '',
                        field7: '',
                        field8: '',
                        field9: '',
                    }
                    if (d.field1.label != '') items.field1 = '1x ' + d.field1.label + '<br>'
                    if (d.field2.label != '') items.field2 = '1x ' + d.field2.label + '<br>'
                    if (d.field3.label != '') items.field3 = '1x ' + d.field3.label + '<br>'
                    if (d.field4.label != '') items.field4 = '1x ' + d.field4.label + '<br>'
                    if (d.field5.label != '') items.field5 = '1x ' + d.field5.label + '<br>'
                    if (d.field6.label != '') items.field6 = '1x ' + d.field6.label + '<br>'
                    if (d.field7.label != '') items.field7 = '1x ' + d.field7.label + '<br>'
                    if (d.field8.label != '') items.field8 = '1x ' + d.field8.label + '<br>'
                    if (d.field9.label != '') items.field9 = '1x ' + d.field9.label + '<br>'
                    d.added = true
                    newHTML += `
                    <div class="Recipe" data-field1="${d.field1.name}" data-field2="${d.field2.name}" data-field3="${d.field3.name}" data-field4="${d.field4.name}" data-field5="${d.field5.name}" data-field6="${d.field6.name}" data-field7="${d.field7.name}" data-field8="${d.field8.name}" data-field9="${d.field9.name}">
                        <h1>${d.label}</h1>
                        <p>
                            ${items.field1}
                            ${items.field2}
                            ${items.field3}
                            ${items.field4}
                            ${items.field5}
                            ${items.field6}
                            ${items.field7}
                            ${items.field8}
                            ${items.field9}
                        </p>
                    </div>
                    `;
                }


                if (d.requiredItem.name != '' && d.added == false) {
                    var found = false
                    // console.log(inventory.name)
                    inventory.forEach((v) =>{
                        if (d.requiredItem.name == v.name) {
                            found = true
                        }
                    })
                    if (found) {
                        var items = {
                            field1: '',
                            field2: '',
                            field3: '',
                            field4: '',
                            field5: '',
                            field6: '',
                            field7: '',
                            field8: '',
                            field9: '',
                        }
                        if (d.field1.label != '') items.field1 = '1x ' + d.field1.label + '<br>'
                        if (d.field2.label != '') items.field2 = '1x ' + d.field2.label + '<br>'
                        if (d.field3.label != '') items.field3 = '1x ' + d.field3.label + '<br>'
                        if (d.field4.label != '') items.field4 = '1x ' + d.field4.label + '<br>'
                        if (d.field5.label != '') items.field5 = '1x ' + d.field5.label + '<br>'
                        if (d.field6.label != '') items.field6 = '1x ' + d.field6.label + '<br>'
                        if (d.field7.label != '') items.field7 = '1x ' + d.field7.label + '<br>'
                        if (d.field8.label != '') items.field8 = '1x ' + d.field8.label + '<br>'
                        if (d.field9.label != '') items.field9 = '1x ' + d.field9.label + '<br>'
                        d.added = true
                        newHTML += `
                        <div class="Recipe" data-field1="${d.field1.name}" data-field2="${d.field2.name}" data-field3="${d.field3.name}" data-field4="${d.field4.name}" data-field5="${d.field5.name}" data-field6="${d.field6.name}" data-field7="${d.field7.name}" data-field8="${d.field8.name}" data-field9="${d.field9.name}">
                            <h1>${d.label}</h1>
                            <p>
                                ${items.field1}
                                ${items.field2}
                                ${items.field3}
                                ${items.field4}
                                ${items.field5}
                                ${items.field6}
                                ${items.field7}
                                ${items.field8}
                                ${items.field9}
                            </p>
                        </div>
                        `;
                    }
                }
			});
            
			$('#RecipeList').html(newHTML);
        }
    })

    $(document).on('click', '.Recipe', function() {
        if (CraftingTable.field1 != '') {
            var elem = $(`[data-name='${CraftingTable.field1}']`)
            var newamount = elem.data('amount')+1
            elem.data('amount', newamount)
            elem.find('p').html('x' + newamount)
            CraftingTable.field1 = ''
        }

        if (CraftingTable.field2 != '') {
            var elem = $(`[data-name='${CraftingTable.field2}']`)
            var newamount = elem.data('amount')+1
            elem.data('amount', newamount)
            elem.find('p').html('x' + newamount)
            CraftingTable.field2 = ''
        }
        
        if (CraftingTable.field3 != '') {
            var elem = $(`[data-name='${CraftingTable.field3}']`)
            var newamount = elem.data('amount')+1
            elem.data('amount', newamount)
            elem.find('p').html('x' + newamount)
            CraftingTable.field3 = ''
        }

        if (CraftingTable.field4 != '') {
            var elem = $(`[data-name='${CraftingTable.field4}']`)
            var newamount = elem.data('amount')+1
            elem.data('amount', newamount)
            elem.find('p').html('x' + newamount)
            CraftingTable.field4 = ''
        }

        if (CraftingTable.field5 != '') {
            var elem = $(`[data-name='${CraftingTable.field5}']`)
            var newamount = elem.data('amount')+1
            elem.data('amount', newamount)
            elem.find('p').html('x' + newamount)
            CraftingTable.field5 = ''
        }

        if (CraftingTable.field6 != '') {
            var elem = $(`[data-name='${CraftingTable.field6}']`)
            var newamount = elem.data('amount')+1
            elem.data('amount', newamount)
            elem.find('p').html('x' + newamount)
            CraftingTable.field6 = ''
        }

        if (CraftingTable.field7 != '') {
            var elem = $(`[data-name='${CraftingTable.field7}']`)
            var newamount = elem.data('amount')+1
            elem.data('amount', newamount)
            elem.find('p').html('x' + newamount)
            CraftingTable.field7 = ''
        }

        if (CraftingTable.field8 != '') {
            var elem = $(`[data-name='${CraftingTable.field8}']`)
            var newamount = elem.data('amount')+1
            elem.data('amount', newamount)
            elem.find('p').html('x' + newamount)
            CraftingTable.field8 = ''
        }

        if (CraftingTable.field9 != '') {
            var elem = $(`[data-name='${CraftingTable.field9}']`)
            var newamount = elem.data('amount')+1
            elem.data('amount', newamount)
            elem.find('p').html('x' + newamount)
            CraftingTable.field9 = ''
        }

        $('#field1').find('img').attr('src', '')
        $('#field2').find('img').attr('src', '')
        $('#field3').find('img').attr('src', '')
        $('#field4').find('img').attr('src', '')
        $('#field5').find('img').attr('src', '')
        $('#field6').find('img').attr('src', '')
        $('#field7').find('img').attr('src', '')
        $('#field8').find('img').attr('src', '')
        $('#field9').find('img').attr('src', '')
        $('#field1').find('img').attr('alt', '')
        $('#field2').find('img').attr('alt', '')
        $('#field3').find('img').attr('alt', '')
        $('#field4').find('img').attr('alt', '')
        $('#field5').find('img').attr('alt', '')
        $('#field6').find('img').attr('alt', '')
        $('#field7').find('img').attr('alt', '')
        $('#field8').find('img').attr('alt', '')
        $('#field9').find('img').attr('alt', '')
        if ($(this).data('field1') != '') $('#field1').find('img').attr('src', './img/' + $(this).data('field1') + '.png').css('opacity', '0.5').attr('alt', '')
        if ($(this).data('field2') != '') $('#field2').find('img').attr('src', './img/' + $(this).data('field2') + '.png').css('opacity', '0.5').attr('alt', '')
        if ($(this).data('field3') != '') $('#field3').find('img').attr('src', './img/' + $(this).data('field3') + '.png').css('opacity', '0.5').attr('alt', '')
        if ($(this).data('field4') != '') $('#field4').find('img').attr('src', './img/' + $(this).data('field4') + '.png').css('opacity', '0.5').attr('alt', '')
        if ($(this).data('field5') != '') $('#field5').find('img').attr('src', './img/' + $(this).data('field5') + '.png').css('opacity', '0.5').attr('alt', '')
        if ($(this).data('field6') != '') $('#field6').find('img').attr('src', './img/' + $(this).data('field6') + '.png').css('opacity', '0.5').attr('alt', '')
        if ($(this).data('field7') != '') $('#field7').find('img').attr('src', './img/' + $(this).data('field7') + '.png').css('opacity', '0.5').attr('alt', '')
        if ($(this).data('field8') != '') $('#field8').find('img').attr('src', './img/' + $(this).data('field8') + '.png').css('opacity', '0.5').attr('alt', '')
        if ($(this).data('field9') != '') $('#field9').find('img').attr('src', './img/' + $(this).data('field9') + '.png').css('opacity', '0.5').attr('alt', '')
    });

    $('#CraftButtonInBackGround').click(() => {
        recipes.forEach((v) => {
            // console.log(CraftingTable.field1)
            if (CraftingTable.field1 == v.field1.name && CraftingTable.field2 == v.field2.name && CraftingTable.field3 == v.field3.name && CraftingTable.field4 == v.field4.name && CraftingTable.field5 == v.field5.name && CraftingTable.field6 == v.field6.name && CraftingTable.field7 == v.field7.name && CraftingTable.field8 == v.field8.name && CraftingTable.field9 == v.field9.name) {
                // console.log(v.requiredItem.name != '')
                if (v.requiredItem.name != '') {
                    var found = false
                    inventory.forEach((d) =>{
                        if (v.requiredItem.name == d.name) {
                            found = true
                        }
                    })

                    if (found) {
                        $.post('http://myCrafting/startAnim', JSON.stringify({}));
                        $('#field1').find('img').attr('src', '')
                        $('#field2').find('img').attr('src', '')
                        $('#field3').find('img').attr('src', '')
                        $('#field4').find('img').attr('src', '')
                        $('#field5').find('img').attr('src', '')
                        $('#field6').find('img').attr('src', '')
                        $('#field7').find('img').attr('src', '')
                        $('#field8').find('img').attr('src', '')
                        $('#field9').find('img').attr('src', '')
                        $('#field1').find('img').attr('alt', '')
                        $('#field2').find('img').attr('alt', '')
                        $('#field3').find('img').attr('alt', '')
                        $('#field4').find('img').attr('alt', '')
                        $('#field5').find('img').attr('alt', '')
                        $('#field6').find('img').attr('alt', '')
                        $('#field7').find('img').attr('alt', '')
                        $('#field8').find('img').attr('alt', '')
                        $('#field9').find('img').attr('alt', '')
                        CraftingTable = {
                            field1: '',
                            field2: '',
                            field3: '',
                            field4: '',
                            field5: '',
                            field6: '',
                            field7: '',
                            field8: '',
                            field9: ''
                        }
                        $('#CraftItem').find('img').attr('src', './img/' + v.item + '.png')
                        $('#CraftItem').show()
                        console.log('äää')
                        $.post('http://myCrafting/startAnim', JSON.stringify({}));
                        setTimeout(function(){ 
                            $('#CraftItem').hide()
                            $.post('http://myCrafting/craftItem', JSON.stringify({
                                item: v.item,
                                removeItems: [
                                    v.field1.name,
                                    v.field2.name,
                                    v.field3.name,
                                    v.field4.name,
                                    v.field5.name,
                                    v.field6.name,
                                    v.field7.name,
                                    v.field8.name,
                                    v.field9.name
                                ],
                                isAWeapon: v.isAWeapon,
                                quantity: v.quantity
                            }));
                        }, 4000);
                    } else {
                        $.post('http://myCrafting/showNoti', JSON.stringify({
                            nr: 0,
                            label: v.requiredItem.label
                        }));
                    }
                } else {
                    $('#field1').find('img').attr('src', '')
                    $('#field2').find('img').attr('src', '')
                    $('#field3').find('img').attr('src', '')
                    $('#field4').find('img').attr('src', '')
                    $('#field5').find('img').attr('src', '')
                    $('#field6').find('img').attr('src', '')
                    $('#field7').find('img').attr('src', '')
                    $('#field8').find('img').attr('src', '')
                    $('#field9').find('img').attr('src', '')
                    $('#field1').find('img').attr('alt', '')
                    $('#field2').find('img').attr('alt', '')
                    $('#field3').find('img').attr('alt', '')
                    $('#field4').find('img').attr('alt', '')
                    $('#field5').find('img').attr('alt', '')
                    $('#field6').find('img').attr('alt', '')
                    $('#field7').find('img').attr('alt', '')
                    $('#field8').find('img').attr('alt', '')
                    $('#field9').find('img').attr('alt', '')
                    CraftingTable = {
                        field1: '',
                        field2: '',
                        field3: '',
                        field4: '',
                        field5: '',
                        field6: '',
                        field7: '',
                        field8: '',
                        field9: ''
                    }
                    $('#CraftItem').find('img').attr('src', './img/' + v.item + '.png')
                    $('#CraftItem').show()
                    $.post('http://myCrafting/startAnim', JSON.stringify({}));
                    setTimeout(function(){ 
                        $('#CraftItem').hide()
                        $.post('http://myCrafting/craftItem', JSON.stringify({
                            item: v.item,
                            removeItems: [
                                v.field1.name,
                                v.field2.name,
                                v.field3.name,
                                v.field4.name,
                                v.field5.name,
                                v.field6.name,
                                v.field7.name,
                                v.field8.name,
                                v.field9.name
                            ],
                            isAWeapon: v.isAWeapon,
                            quantity: v.quantity
                        }));
                    }, 4000);
                }
                
            }
        })
    })

    $('#field1').droppable({
        drop: function(e, ui) {
            if (ui.draggable.data('amount') >= 0) {
                revert = false
                $(this).find('img').attr('src', ui.draggable.find("img").attr("src")).css('opacity', '1')
                $(this).find('img').attr('alt', ui.draggable.find("img").attr("alt"))
                CraftingTable.field1 = ui.draggable.data("name");
            }
        }
    });

    $('#field2').droppable({
        drop: function(e, ui) {
            if (ui.draggable.data('amount') >= 0) {
                revert = false
                $(this).find('img').attr('src', ui.draggable.find("img").attr("src")).css('opacity', '1')
                $(this).find('img').attr('alt', ui.draggable.find("img").attr("alt"))
                CraftingTable.field2 = ui.draggable.data("name");
            }
        }
    });

    $('#field3').droppable({
        drop: function(e, ui) {
            if (ui.draggable.data('amount') >= 0) {
                revert = false
                $(this).find('img').attr('src', ui.draggable.find("img").attr("src")).css('opacity', '1')
                $(this).find('img').attr('alt', ui.draggable.find("img").attr("alt"))
                CraftingTable.field3 = ui.draggable.data("name");
            }
        }
    });

    $('#field4').droppable({
        drop: function(e, ui) {
            if (ui.draggable.data('amount') >= 0) {
                revert = false
                $(this).find('img').attr('src', ui.draggable.find("img").attr("src")).css('opacity', '1')
                $(this).find('img').attr('alt', ui.draggable.find("img").attr("alt"))
                CraftingTable.field4 = ui.draggable.data("name");
            }
        }
    });

    $('#field5').droppable({
        drop: function(e, ui) {
            if (ui.draggable.data('amount') >= 0) {
                revert = false
                $(this).find('img').attr('src', ui.draggable.find("img").attr("src")).css('opacity', '1')
                $(this).find('img').attr('alt', ui.draggable.find("img").attr("alt"))
                CraftingTable.field5 = ui.draggable.data("name");
            }
        }
    });

    $('#field6').droppable({
        drop: function(e, ui) {
            if (ui.draggable.data('amount') >= 0) {
                revert = false
                $(this).find('img').attr('src', ui.draggable.find("img").attr("src")).css('opacity', '1')
                $(this).find('img').attr('alt', ui.draggable.find("img").attr("alt"))
                CraftingTable.field6 = ui.draggable.data("name");
            }
        }
    });

    $('#field7').droppable({
        drop: function(e, ui) {
            if (ui.draggable.data('amount') >= 0) {
                revert = false
                $(this).find('img').attr('src', ui.draggable.find("img").attr("src")).css('opacity', '1')
                $(this).find('img').attr('alt', ui.draggable.find("img").attr("alt"))
                CraftingTable.field7 = ui.draggable.data("name");
            }
        }
    });

    $('#field8').droppable({
        drop: function(e, ui) {
            if (ui.draggable.data('amount') >= 0) {
                revert = false
                $(this).find('img').attr('src', ui.draggable.find("img").attr("src")).css('opacity', '1')
                $(this).find('img').attr('alt', ui.draggable.find("img").attr("alt"))
                CraftingTable.field8 = ui.draggable.data("name");
        }
        }
    });

    $('#field9').droppable({
        drop: function(e, ui) {
            if (ui.draggable.data('amount') >= 0) {
                revert = false
                $(this).find('img').attr('src', ui.draggable.find("img").attr("src")).css('opacity', '1')
                $(this).find('img').attr('alt', ui.draggable.find("img").attr("alt"))
                CraftingTable.field9 = ui.draggable.data("name");
            }
        }
    });

    document.addEventListener("keydown", Close);

    function Close(event) {
        if (event.keyCode === 27) {
            $.post('http://myCrafting/closeUI', JSON.stringify({}));
        }
    }
    window.addEventListener('message', function (event) {
        if (event.data.type == "close") {
            $('#background').hide()
            $('#CraftItem').hide()
            $('#field1').find('img').attr('src', '')
            $('#field2').find('img').attr('src', '')
            $('#field3').find('img').attr('src', '')
            $('#field4').find('img').attr('src', '')
            $('#field5').find('img').attr('src', '')
            $('#field6').find('img').attr('src', '')
            $('#field7').find('img').attr('src', '')
            $('#field8').find('img').attr('src', '')
            $('#field9').find('img').attr('src', '')
            $('#field1').find('img').attr('alt', '')
            $('#field2').find('img').attr('alt', '')
            $('#field3').find('img').attr('alt', '')
            $('#field4').find('img').attr('alt', '')
            $('#field5').find('img').attr('alt', '')
            $('#field6').find('img').attr('alt', '')
            $('#field7').find('img').attr('alt', '')
            $('#field8').find('img').attr('alt', '')
            $('#field9').find('img').attr('alt', '')
            CraftingTable = {
                field1: '',
                field2: '',
                field3: '',
                field4: '',
                field5: '',
                field6: '',
                field7: '',
                field8: '',
                field9: ''
            }
        }
    });
})

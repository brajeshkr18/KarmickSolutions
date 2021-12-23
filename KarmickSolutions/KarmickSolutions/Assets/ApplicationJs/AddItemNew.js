$(document).ready(function () {
    var cartId = "cart";
    var items= [];
    var Itemcount = 0;
    function  saveCart (object) {

            var stringified = JSON.stringify(object);
            localStorage.setItem(cartId, stringified);
            return true;
        }
    function  getCart() {
            return JSON.parse(localStorage.getItem(cartId));
        }
    function clearCart() {
            localStorage.removeItem(cartId);
        }

    $(".cart").click(function () {
        var Url = '/Home/AddItemCart';
        
        AddItemCart($(this), Url, true);
    });

    $(".removeCart").click(function () {
        var Url = '/Home/RemoveItemCart';
        AddItemCart($(this), Url, false);
    });
    //$("#LoginModel").modal('hide');
    function AddItemCart(Button, Url, status) {
        var haserror = false;
        var UserId = $("#hdnUserId").val();
        var ItemId = Button.attr('attr');
        /// addItemLocalStorage(UserId, ItemId, status);
        if (UserId === "0") {
            addItemLocalStorage(Button, status);
            addRemoveIcon(Button, status)
           
        }
        else {
            if (haserror === false) {
                $('#spanSuccess').addClass('hide');
                $.post(Url, { UserId: UserId, ItemId: ItemId }, function (Result) {
                    if (Result.Status === "Success") {
                        $('#itemCartMessage').text(Result.Message);
                        $(Button).prop("disabled", false);
                        $("#succes-add-to-cart").modal('show');
                        Button.next(".addcart").removeClass('display-none');
                        var htm = Button.next(".addcart");
                        if (Button.context.hasAttribute('full')) {
                            Button.addClass('display-none');
                        }
                        if (status && !Button.context.hasAttribute('full')) {

                            htm.context.previousElementSibling.innerHTML = Result.count
                        }
                        else if (status) {
                            if (!htm.context.previousElementSibling.hasAttribute("attr")) {
                                htm.context.previousElementSibling.innerHTML = Result.count
                            }

                        }
                        else {
                            if (Result.count == "0") {
                                htm.context.parentElement.classList.add("display-none");
                                Button.context.parentElement.parentElement.firstElementChild.
                                    nextElementSibling.nextElementSibling.classList.remove("display-none");
                            }
                            else {
                                htm.context.nextElementSibling.innerHTML = Result.count;
                            }

                        }
                    }
                    else {
                        $('#spanSuccess').removeClass('hide');
                        $('#spanSuccess').removeClass('alert-success');
                        $('#spanSuccess').addClass('alert-danger');
                        $('#spanSuccess').text(Result.Message);
                        $(Button).prop("disabled", false);
                        alert(Result.Message);
                    }
                });
            }
        }

    }
    function addItemLocalStorage(Button, status) {
        var ItemId = Button.attr('attr');
        if (status) {
            cart.addItem(Button);
        }
        else {
            cart.removeItem(Button);
        }
    }
    var $btns = $('.btnCategory').click(function () {
        if (this.id == '0') {
            $('#ct > div').show();
        } else {
            var $el = $('.' + this.id).show();
            $('#ct > div').not($el).hide();
        }
        $btns.removeClass('active');
        $btns.find('.btn-category').removeClass('btn-category-bgcolor');
        $(this).addClass('active');
        $(this).find('.btn-category').addClass('btn-category-bgcolor');
    })

    var cart = {

        count: 0,
        total: 0,
     
        //getItems: function () {

        //    return items;

        //},
        //setItems: function (items) {

        //    items = items;
        //    for (var i = 0; i < items.length; i++) {
        //        var _item = items[i];
        //        this.total += _item.total;
        //    }

        //},
        //clearItems: function () {

        //    items = [];
        //    this.total = 0;
        //    storage.clearCart();
        //    helpers.emptyView();

        //},
        addItem: function (Button) {
            var itemId = Button.attr('attr');
            var itemPrice = Button.attr('itemPrice');
            var itemName = Button.attr('itemName');
            var itemImage = Button.attr('itemImage');
            var itemDesc = Button.attr('itemDesc');
            if (this.containsItem(itemId) === false) {

            items.push({
                id: itemId,
                image: itemImage,
                name: itemName,
                price: itemPrice,
                desc: itemDesc,
                count: 1,
                    //total: item.price * item.count
                });

                saveCart(items);

                Itemcount = 1;
            } else {

                updateItem(itemId);

            }
            
            //this.total += item.price * item.count;
            //this.count += item.count;
           // updateView();

        },
        containsItem: function (id) {

            if (items === undefined) {
                return false;
            }

            for (var i = 0; i <items.length; i++) {

                var _item = items[i];

                if (id == _item.id) {
                    return true;
                }

            }
            return false;

        },
        removeItem: function (Button) {
            var itemId = Button.attr('attr');
            removeCart(itemId);
        }

    };
    function getHtml(id) {

        return document.getElementById(id).innerHTML;

    };
    function setHtml (id, html) {

        document.getElementById(id).innerHTML = html;
        return true;

    };
    function itemData(object) {

        var count = object.querySelector(".count"),
            patt = new RegExp("^[1-9]([0-9]+)?$");
        count.value = (patt.test(count.value) === true) ? parseInt(count.value) : 1;

        var item = {

            name: object.getAttribute('data-name'),
            price: object.getAttribute('data-price'),
            id: object.getAttribute('data-id'),
            count: count.value,
            total: parseInt(object.getAttribute('data-price')) * parseInt(count.value)

        };
        return item;

    };
    function updateView() {

        var items = cart.getItems(),
            template = this.getHtml('cartT'),
            compiled = _.template(template, {
                items: items
            });
        this.setHtml('cartItems', compiled);
        this.updateTotal();

    };
    function emptyView () {

        this.setHtml('cartItems', '<p>Add some items to see</p>');
        this.updateTotal();

    };
    function updateTotal () {

        this.setHtml('totalPrice', cart.total + '₹');

    }
    function updateItem(object) {

        for (var i = 0; i < items.length; i++) {

            var _item = items[i];

            if (object === _item.id) {

                _item.count = parseInt(1) + parseInt(_item.count);
                // _item.total = parseInt(object.total) + parseInt(_item.total);
                items[i] = _item;
                Itemcount = _item.count;
                saveCart(items);

            }
           
        }
        //Itemcount = _item.count;
    }
    function addRemoveIcon(Button, status) {
        if (status) {
            $('#itemCartMessage').text("Added Item in cart");
        }
        else {
            $('#itemCartMessage').text("Removed Item from cart");
        }
        $(Button).prop("disabled", false);
        $("#succes-add-to-cart").modal('show');
        Button.next(".addcart").removeClass('display-none');
        var htm = Button.next(".addcart");
        if (Button.context.hasAttribute('full')) {
            Button.addClass('display-none');
        }
        if (status && !Button.context.hasAttribute('full')) {

            htm.context.previousElementSibling.innerHTML = Itemcount
        }
        else if (status) {
            if (!htm.context.previousElementSibling.hasAttribute("attr")) {
                htm.context.previousElementSibling.innerHTML = Itemcount
            }

        }
        else {
            if (Itemcount == 0) {
                htm.context.parentElement.classList.add("display-none");
                Button.context.parentElement.parentElement.firstElementChild.
                    nextElementSibling.nextElementSibling.classList.remove("display-none");
            }
            else {
                htm.context.nextElementSibling.innerHTML = Itemcount;
            }

        }
    }
    function removeCart(object) {

        for (var i = 0; i < items.length; i++) {

            var _item = items[i];

            if (object === _item.id) {

                _item.count = parseInt(_item.count)-1;
                // _item.total = parseInt(object.total) + parseInt(_item.total);
                items[i] = _item;
                Itemcount = _item.count;
                saveCart(items);

            }

        }
    }
});
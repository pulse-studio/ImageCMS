<div class="drop drop-report">
    <div class="drop-content">
        <div class="title_h2">{lang('Сообщить когда появится', 'webinger')}</div>
        <button type="button" class="icon-times-enter" data-closed="closed-js"></button>
    </div>
    <div class="drop-footer"></div>
</div>
<div class="d_n" data-clone="data-report">
    <form method="post" action="" id="data-report" onsubmit="Notification.formAction('/shop/ajax/getApiNotifyingRequest', 'data-report');
            return false;">
        <div class="standart_form">
            <label>
                <span class="title">{lang('Ваше имя', 'webinger')}</span>
                <span class="frame_form_field">
                    <input type="text" id="" name="UserName"/>
                    <label id="for_UserName" class="for_validations"></label>
                    <span class="must">*</span>
                </span>
            </label>
            <label>
                <span class="title">E-mail</span>
                <span class="frame_form_field">
                    <input type="text" id="" name="UserEmail"/>
                    <label id="for_UserEmail" class="for_validations"></label>
                    <input type="hidden" name="ProductId" value=""/>
                    <input type="hidden" name="notifme" value="true"/>
                    <span class="must">*</span>
                    <span class="help_inline">{lang('На почту придет уведомление о появлении данного товара', 'webinger')}</span>
                </span>
            </label>
            <label>
                <span class="title">{lang('Телефон', 'webinger')}</span>
                <span class="frame_form_field">
                    <input type="text" id="" name="UserPhone"/>
                    <label id="for_UserPhone" class="for_validations"></label>
                </span>
            </label>
        </div>
        <div class="t-a_r">
            <input type="submit" value="{lang('Отправить', 'webinger')}"  class="btn btn_cart"/>
        </div>
    </form>
</div>
{# Variables
# @var model
# @var editProductUrl
# @var jsCode
#}

{$jsCode}

{$forCompareProducts = $CI->session->userdata('shopForCompare')}
{$cart_data= ShopCore::app()->SCart->getData();}

<script type="text/javascript">
    var currentProductId = '{echo $model->getId()}';
</script>
<!-- BEGIN STAR RATING -->
<link rel="stylesheet" type="text/css" href="{$SHOP_THEME}js/rating/jquery.rating-min.css" />
<script src="{$SHOP_THEME}js/rating/jquery.rating-min.js"></script>
<script src="{$SHOP_THEME}js/rating/jquery.MetaData-min.js"></script>
<script src="{$SHOP_THEME}js/product.js"></script>
<script type="text/javascript" src="http://userapi.com/js/api/openapi.js?49"></script>
<script type="text/javascript" src="https://apis.google.com/js/plusone.js">
    {parsetags: 'explicit'}
</script>
<script src="http://static.ak.fbcdn.net/connect.php/js/FB.Share" type="text/javascript"> </script> 


<!-- BEGIN LIGHTBOX -->
<script type="text/javascript" src="{$SHOP_THEME}js/lightbox/scripts/jquery.color.min.js"></script>
<script type="text/javascript" src="{$SHOP_THEME}js/lightbox/scripts/jquery.lightbox.min.js"></script>
<!-- END LIGHTBOX -->


<div class="content">    

    <div class="center">
        <div class="tovar_frame clearfix{if $model->firstvariant->getstock()== 0} not_avail{/if}">
            <div class="thumb_frame f_l">
                {if sizeof($model->getSProductImagess()) > 0}
                    {foreach $model->getSProductImagess() as $image}
                        <span>
                            <a  class="grouped_elements fancybox-thumb" rel="fancybox-thumb" href="{echo $image->getThumbUrl()}" data-title-id="fancyboxAdditionalContent">                         
                                <img src="{echo $image->getThumbUrl()}" width="90"/>
                            </a>                                
                        </span>
                    {/foreach}
                {/if}                
            </div>
            <div class="photo_block">
                <a class="grouped_elements fancybox-thumb" rel="fancybox-thumb" href="{productImageUrl($model->getMainImage())}" data-title-id="fancyboxAdditionalContent" >
<!--                    <img id="mim{echo $model->getId()}" src="{productImageUrl($model->getMainImage())}" alt=""/>-->
                    <img id="mim{echo $model->getId()}" src="{productImageUrl($model->getMainimage())}" alt="{echo ShopCore::encode($model->name)}" />
                    <img id="vim{echo $model->getId()}" class="smallpimagev" src="" alt="" />
                </a>
            </div>

            <!-- Fancybox additional blocks -->


            <link rel="stylesheet" href="{$SHOP_THEME}/js/fancybox/source/helpers/jquery.fancybox-thumbs.css?v=1.0.6" type="text/css" media="screen" />
            <script type="text/javascript" src="{$SHOP_THEME}/js/fancybox/source/helpers/jquery.fancybox-thumbs.js?v=1.0.6"></script>

            <div id="fancyboxAdditionalContent" style="display: none;">
                <div class="price f-s_26">
                    <span id="pricem76">399</span>
                    <sub>руб</sub>
                    <span id="prices76" class="d_b">159.6$</span>
                </div>
                <div class="in_cart"></div>
                <div id="p76" class="buttons button_big_green">
                    <a id="buy76" class="goBuy" href="#" data-varid="87" data-prodid="76">Купить</a>
                </div>
            </div>

            {literal}
                <script>

                </script>
            {/literal}


            <!-- -->

            <div class="func_description">
                <div class="crumbs">
                    {renderCategoryPath($model->getMainCategory())}
                </div>
                <h1>{echo ShopCore::encode($model->getName())}</h1>
                <div class="f-s_0">
                    <span class="code">Код: {echo $model->firstvariant->getNumber()}</span>
                    {$rating = $model->getRating()}
                {if $rating == 0}{$r = "nostar"}    {/if}
            {if $rating == 1}{$r = "onestar"}   {/if}
        {if $rating == 2}{$r = "twostar"}   {/if}
    {if $rating == 3}{$r = "threestar"} {/if}
{if $rating == 4}{$r = "fourstar"}  {/if}
{if $rating == 5}{$r = "fivestar"}  {/if}
<div class="star_rating">
    <div id="{echo $model->getId()}_star_rating" class="rating {echo $r} star_rait" data-id="{echo $model->getId()}">
        <div id="1" class="rate one">
            <span title="1" class="clickrate">1</a>
        </div>
        <div id="2" class="rate two">
            <span title="2" class="clickrate">2</a>
        </div>
        <div id="3" class="rate three">
            <span title="3" class="clickrate">3</a>
        </div>
        <div id="4" class="rate four">
            <span title="4" class="clickrate">4</a>
        </div>
        <div id="5" class="rate five">
            <span title="5" class="clickrate">5</a>
        </div>
    </div>
    <!--                    <span class="count_people d_b" itemtype="http://schema.org/AggregateRating" itemscope="" itemprop="aggregateRating">
                            <meta itemprop="worstRating" content="1">
                            <span class="ratingValue" itemprop="ratingValue"> 0</span>/
                            <span itemprop="bestRating">5</span> залишило                        
                            <span itemprop="reviewCount" class="reviewCount">0  </span>чоловік.
                        </span>-->
</div>
<span class="response">{echo $model->totalComments()} {echo SStringHelper::Pluralize($model->totalComments(), array('отзыв', 'отзывы', 'отзывов'))}</span>
{if count($model->getProductVariants())>1}
    <select class="m-l_10" name="selectVar">
        {foreach $model->getProductVariants() as $pv}
            {$var_prices = currency_convert($pv->getPrice(), $pv->getCurrency())}
<!--                                 <option class="selectVar" value="{echo $pv->getId()}" data-pp="1" data-st="{echo $pv->getStock()}" data-cs="{$NextCS}" data-spr="{echo ShopCore::app()->SCurrencyHelper->convert($pv->getPrice(), $NextCSId)}" data-pr="{echo $pv->getPrice()}" data-pid="{echo $model->getId()}" data-img="{echo $pv->getmainimage()}" data-vname="{echo $pv->getName()}" data-vnumber="{echo $pv->getNumber()}">{echo $pv->getName()}</option>-->
            <option class="selectVar"
                    value="{echo $pv->getId()}" 
                    data-pp="1" 
                    data-st="{echo $pv->getStock()}" 
                    data-cs="{echo $var_prices.second.symbol}" 
                    data-spr="{echo $var_prices.second.price}" 
                    data-pr="{echo $var_prices.main.price}" 
                    data-pid="{echo $model->getId()}" 
                    data-img="{echo $pv->getmainimage()}" 
                    data-vname="{echo $pv->getName()}" 
                    data-vnumber="{echo $pv->getNumber()}">
                {echo $pv->getName()}
            </option>
        {/foreach}
    </select>
{/if}
</div>
{echo $CI->load->module('share')->_make_share_form()}
<div class="buy clearfix">
    {$style = productInCartI($cart_data, $model->getId(), $model->firstVariant->getId(), $model->firstVariant->getStock())}
    <div class="price f-s_26">
        <span id="pricem{echo $model->getId()}">
            {$prices = currency_convert($model->firstVariant->getPrice(), $model->firstVariant->getCurrency())}
            {echo $prices.main.price}
        </span>
        <sub>{$prices.main.symbol}</sub>
    {if $NextCS != $CS}{/if}
    <span id="prices{echo $model->getId()}" class="d_b">{echo $prices.second.price} {echo $prices.second.symbol}</span>
    {if $model->getOldPrice() > 0}
        {if $model->getOldPrice() > $model->firstVariant->toCurrency()}
            <div>
                <del class="price f-s_12 price-c_9">
                    {echo $model->getOldPrice()}
                    <sub> {$CS}</sub>
                </del>
            </div>
        {/if}
    {/if}
</div>
<div class="in_cart"></div>
<div id="p{echo $model->getId()}" class="{$style.class}">
    <a id="buy{echo $model->getId()}" class="{$style.identif}" href="{$style.link}" data-varid="{echo $model->firstVariant->getId()}" data-prodid="{echo $model->getId()}" >{$style.message}</a>
</div>
<div class="f_l">
    <span class="ajax_refer_marg" style="margin-top: -2px">
        {if $forCompareProducts && in_array($model->getId(), $forCompareProducts)}
            <a href="{shop_url('compare')}">Сравнить</a>
        {else:}
            <a href="{shop_url('compare/add/'. $model->getId())}" data-prodid="{echo $model->getId()}" class="js gray toCompare">Добавить к сравнению</a>
        {/if}
    </span>
    <span class="ajax_refer_marg" style="margin-top: -2px">
        {if !is_in_wish($model->getId())}
            <a data-logged_in="{if ShopCore::$ci->dx_auth->is_logged_in()===true}true{/if}" data-varid="{echo $model->firstVariant->getId()}" data-prodid="{echo $model->getId()}" href="#" class="js gray addToWList">Сохранить в список желаний</a>
        {else:}
            <a href="/shop/wish_list">Уже в списке желаний</a>
        {/if}
    </span>
    {if ShopCore::$ci->dx_auth->is_logged_in()===true}
        <span class="ajax_refer_marg" style="margin-top: -2px">
            {if !is_in_spy(ShopCore::$ci->dx_auth->get_user_id(), $model->getId())}
                <a data-logged_in="{if ShopCore::$ci->dx_auth->is_logged_in()===true}true{/if}" data-price="{echo $model->firstVariant->toCurrency()}" data-user_id="{echo ShopCore::$ci->dx_auth->get_user_id()}" data-varid="{echo $model->firstVariant->getId()}" data-prodid="{echo $model->getId()}" href="#" class="js gray addtoSpy">Следить за этим товаром</a>
            {else:}
                <a href="#">Вы уже следите за этим товаром</a>
            {/if}
        </span>
    {/if}
</div>
</div>
<p class="c_b">{echo $model->getShortDescription()}</p>
<p>{echo ShopCore::app()->SPropertiesRenderer->renderPropertiesInline($model)}</p>
<div>
    {echo $CI->load->module('share')->_make_like_buttons()}
</div>
</div>
</div>
<ul class="info_buy">
    <li>
        <img src="{$SHOP_THEME}images/order_phone.png">
        <div>
            <div class="title">Заказ по телефону:</div>
            <span></span>
            <span></span> 
            <span></span>
        </div>
    </li>
    <li>
        <img src="{$SHOP_THEME}images/buy.png">
        <div>
            <div class="title">Оплата <span><a href="/oplata">(узнать больше)</a></span></div>
            {foreach $payment_methods as $methods}
                <span class="small_marker">{echo $methods.name}</span>
            {/foreach}
        </div>
    </li>
    <li>
        <img src="{$SHOP_THEME}images/deliver.png">
        <div>
            <div class="title">Доставка <span><a href="/dostavka">(узнать больше)</a></span></div>
            {foreach $delivery_methods as $methods}
                <span class="small_marker">{echo $methods.name}</span>
            {/foreach}
        </div>
    </li>
</ul>
</div>



<!-----------------------------------------------------------------------Акционное предложение начало-->

{if $model->getShopKits()->count() > 0}
    <div class="f-s_18 c_6 center">Акционное предложение</div>
    <div class="promotion carusel_frame">
        <div class="carusel">
            <ul class="">
                {foreach $model->getShopKits() as $kid}

                    <li>

                        <div class="f_l smallest_item">

                            <div class="price f-s_16 f_l">{echo $prices.main.price}
                                <sub>{echo $prices.main.symbol}</sub>
                                {if $NextCS != $CS}
                                    <span class="d_b">{echo $prices.second.price} {echo $prices.second.symbol}</span>
                                {/if}
                            </div>
                            <div class="func_description">
                                <a href="{shop_url('product/' . $kid->getMainProduct()->getUrl())}">{echo ShopCore::encode($kid->getMainProduct()->getName())}</a>

                                <div class="buy">

                                    <div class="price f-s_16 f_l">{echo $model->firstVariant->toCurrency()}
                                        <sub>{$CS}</sub>
                                        <span class="d_b">{echo $model->firstVariant->toCurrency('Price', $NextCSId)} {$NextCS}</span>
                                    </div>

                                </div>
                            </div>
                            <!--<span class="icon discount">-5%</span>-->
                            </a>
                        </div>
                        <div class="plus_eval">+</div>
                        {$i = 0}
                        {$sum1_1 = $sum2_1 = $prices.main.price}
                        {$sum1_2 = $sum2_2 = $prices.second.price}
                        {foreach $kits[0]->getShopKitProducts() as $shopKitProduct}
                            {$ap = $shopKitProduct->getSProducts()}
                            {$ap->setLocale(ShopController::getCurrentLocale())}

                            <div class="buy">

                                <div class="price f-s_16 f_l">
                                    {echo number_format($ap->getfirstVariant()->toCurrency()*(1 - $coompl->getdiscount()/100),0, '.', '')} <sub>{$CS}</sub><span class="d_b">{echo $ap->firstVariant->toCurrency('Price', $NextCSId)*(1 - $coompl->getdiscount()/100),'.', ''} {$NextCS}</span>
                                </div>
                            </div>                                        
                            </div> 

                            </div>
                            {if $i == 1}
                                {break}
                            {/if}
                        {/foreach}
                        <div class="plus_eval"><div>=</div></div>
                        {$n_pr = $ap->getfirstVariant()->toCurrency()*(1 - $coompl->getdiscount()/100)}
                        {$grn = $kid->getMainProduct()->getfirstVariant()->toCurrency() + $n_pr}
                        {$old = $kid->getMainProduct()->getfirstVariant()->toCurrency() + $ap->getfirstVariant()->toCurrency()}
                        <div class="button_block ">
                            <div class="buy">

                                <del class="price f-s_12 price-c_9">
                                    <span>{echo number_format($old,0, '.', '')} <span>{$CS}</span>
                                    </span>
                                    <span>{echo number_format($old*$bablo[$secCurr][rate],0, '.', '')} {echo $bablo[$secCurr][symbol]}</span></del>
                                <div class="price f-s_18">
                                    <span>{echo number_format($grn,0, '.', '')} {$CS}</span>

                                    <!--                                        <span class="dol">{echo number_format($grn*$bablo[$secCurr][rate],0, '.', '')} 
                                    {echo number_format($grn*$bablo[$secCurr][rate],0, '.', '')}</span>-->

                                    <span class="d_b">{echo $ap->firstVariant->toCurrency('Price', $NextCSId)*(1 - $coompl->getdiscount()/100)+$model->firstVariant->toCurrency('Price', $NextCSId),'.', ''} {$NextCS}
                                    </span>
                                </div>


                                <div class="func_description">
                                    <a href="{'/shop/product/'.$ap->getId()}">{echo ShopCore::encode($ap->getName())}</a>

                                    <div class="buy">

                                        {$kitFirstVariant = $ap->getKitFirstVariant($shopKitProduct)}
                                        {$kit_prices = currency_convert($kitFirstVariant->getPrice(), $kitFirstVariant->getCurrency())}
                                        {if $shopKitProduct->getDiscount()}

                                            <del class="price f-s_12 price-c_9">{echo $s1_1 = $kit_prices.main.price}<sub> {$kit_prices.main.symbol}</sub>
                                                {if $NextCS != $CS}
                                                    <span>{echo $s1_2 = $kit_prices.second.price} {$kit_prices.second.symbol}</span></del>
                                                {/if}

                                            <div class="price f-s_14 price-c_red">
                                                {echo $s2_1 = $kit_prices.main.price*(100-$shopKitProduct->getDiscount())/100}
                                                <sub> {$kit_prices.main.symbol}</sub>
                                                <span>{echo $s2_2 = $kit_prices.second.price*(100-$shopKitProduct->getDiscount())/100} {$kit_prices.second.symbol}</span>
                                            </div>

                                        {else:}
                                            <div class="price f-s_14">{echo $kit_prices.main.price}
                                                <sub> {$kit_prices.main.symbol}</sub>
                                                {if $NextCS != $CS}}
                                                    <span>{echo $kit_prices.second.price} {$kit_prices.second.symbol}</span>
                                                {/if}
                                            </div>   
                                        {/if}
                                    </div>
                                </div>
                            </div>

                        </div>
                        </div>
                    </li>
                    {if $i == $count}        
                        <div class="plus_eval">=</div>
                        <div class="button_block">
                            <div class="buy">
                                {if $dis}
                                    <del class="price f-s_12 price-c_9">{$sum1_1}<sub> {$kit_prices.main.symbol}</sub>
                                        {if $NextCS != $CS}
                                            <span>{echo $sum1_2} {$kit_prices.second.symbol}</span></del>
                                        {/if}
                                    {/if}
                                <div class="price f-s_18">{echo $sum2_1} <sub> {$kit_prices.main.symbol}</sub>
                                    {if $NextCS != $CS}
                                        <span> {echo $sum2_2}  {$kit_prices.second.symbol}</span></div>
                                    {/if}
                            </div>
                            <div class="buttons button_gs">
                                <div class="buy">
                                    {foreach $kits as $kit}
                                        <a class="goBuy" kitId="{echo $kit->id}" instance="ShopKit" data-varid="86" data-prodid="{echo $kit->productId}" href="">Купить</a>
                                    {/foreach}
                                </div>
                            </div>
                        </div>
                    {else:}
                        <div class="plus_eval">+</div>
                    {/if}
                {/foreach}				
                </li>

            </ul>
        </div>
        <button class="prev"></button>
        <button class="next"></button>
    </div>
</div>
{/if}
<!------------------------------------------------------------------------------------------------------------Finish-->

{if count(getSimilarProduct($model, 20)) > 1}
    <div class="featured carusel_frame">
        <div class="f-s_18 c_6 center">Похожие товары</div>
        <div class="carusel">
            <ul>
                {$simprod = getSimilarProduct($model, 20)}
                {foreach $simprod as $sp}
                    {$sim_prod = currency_convert($sp->firstvariant->getPrice(), $sp->firstvariant->getCurrency())}
                    {$style = productInCart($cart_data, $sp->getId(), $sp->firstVariant->getId(), $sp->firstVariant->getStock())}
                    <li>
                        <div class="f_l smallest_item {if $sp->firstvariant->getstock()==0}not_avail{/if}">
                            <div class="photo_block">
                                <a href="{site_url('shop/product/'.$sp->getId())}">
                                    <img src="{productImageUrl($sp->getSmallModImage())}"/>
                                </a>
                            </div>
                            <div class="func_description">
                                <a href="{site_url('shop/product/'.$sp->getId())}" class="title">{echo ShopCore::encode($sp->getName())}</a>
                                <div class="buy">
                                    <div class="price f-s_14">{echo $sim_prod.main.price}
                                        <sub> {$sim_prod.main.symbol}</sub>
                                        {if $NextCS != $CS}
                                            <span>{echo $sim_prod.second.price} {$sim_prod.second.symbol}</span> 
                                        {/if}
                                    </div>                                                                             
                                    <div class="{$style.class} buttons">                                            
                                        <a class="{$style.identif}" href="{$style.link}" data-varid="{echo $sp->firstVariant->getId()}"  data-prodid="{echo $sp->getId()}" >{$style.message}</a>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </li>
                {/foreach}
            </ul>
        </div>
        <button class="prev"></button>
        <button class="next"></button>
    </div>
{/if} 

<div class="center">
    <div class="tabs f_l w_770 info_tovar">
        <ul class="nav_tabs">
            {if $model->getFullDescription()}
                <li><a href="#first">Информация</a></li>
            {/if}
            {if ShopCore::app()->SPropertiesRenderer->renderPropertiesTable($model)}
                <li><a href="#second">Характеристики</a></li>
            {/if}
            {if $model->getRelatedProductsModels()}
                <li><a href="#third">Аксессуары</a></li>
            {/if}
            <li><a href="#four">{echo SStringHelper::Pluralize($model->totalComments(), array('Отзыв', 'Отзывы', 'Отзывов'))}({echo $model->totalComments()})</a></li>
        </ul>
        {if $model->getFullDescription()}
            <div id="first">
                <div class="info_text">
                    {echo $model->getFullDescription()}
                </div>
            </div>
        {/if}
        {if ShopCore::app()->SPropertiesRenderer->renderPropertiesTable($model)}
            <div id="second">
                {echo ShopCore::app()->SPropertiesRenderer->renderPropertiesTable($model)}
            </div>
        {/if}
        {if $model->getRelatedProductsModels()}
            <div id="third">
                <ul class="accessories f-s_0">
                    {foreach $model->getRelatedProductsModels() as $p}
                        {$rel_prod = currency_convert($p->firstvariant->getPrice(), $p->firstvariant->getCurrency())}
                        {$style = productInCart($cart_data, $p->getId(), $p->firstVariant->getId(), $p->firstVariant->getStock())}
                        <li>
                            <div class="small_item">
                                <a class="img" href="{shop_url('product/' . $p->getUrl())}">
                                    <span><img src="{productImageUrl($p->getSmallModImage())}" /></span>
                                </a>
                                <div class="info">
                                    <a href="{shop_url('product/'.$p->getUrl())}" class="title">{echo ShopCore::encode($p->getName())}</a>
                                    <div class="buy">
                                        <div class="price f-s_16 f_l">{echo $rel_prod.main.price}
                                            <sub> {$rel_prod.main.symbol}</sub>
                                            {if $NextCS != $CS}
                                                <span class="d_b">{echo $rel_prod.second.price} {$rel_prod.second.symbol}</span>
                                            {/if}
                                        </div>
                                        <div class="{$style.class} buttons"><a class="{$style.identif}" href="{$style.link}" data-varid="{echo $p->firstVariant->getId()}" data-prodid="{echo $p->getId()}" >{$style.message}</a></div> 
                                    </div>
                                </div>
                            </div>
                        </li>
                    {/foreach}    
                </ul>
            </div>

        {/if}
        <div id="four">
            {$comments}
        </div>
    </div>
    <div class="nowelty_auction m-t_29">
        <div class="box_title">
            <span>Новинки</span>
        </div>
        <ul>                  
            {foreach getPromoBlock('hot', 3) as $hotProduct}  
                {$hot_prices = currency_convert($hotProduct->firstvariant->getPrice(), $hotProduct->firstvariant->getCurrency())}
                {$style = productInCart($cart_data, $hotProduct->getId(), $hotProduct->firstVariant->getId(), $hotProduct->firstVariant->getStock())}
                <li>
                    <div class="small_item">
                        <a href="{shop_url('product/' . $hotProduct->getUrl())}" class="img">
                            <span>
                                <img src="{productImageUrl($hotProduct->getSmallModimage())}" alt="{echo ShopCore::encode($hotProduct->getName())}" />
                            </span>
                        </a>
                        <div class="info">
                            <a href="{shop_url('product/' . $hotProduct->getUrl())}" class="title">{echo ShopCore::encode($hotProduct->getName())}</a>
                            <div class="buy">
                                <div class="price f-s_16 f_l">{echo $hot_prices.main.price} 
                                    <sub>{$hot_prices.main.symbol}</sub>
                                    {if $NextCS != $CS}
                                        <span class="d_b">{echo $hot_prices.second.price} {$hot_prices.second.symbol}</span>
                                    {/if}
                                </div>                               
                                <div class="{$style.class} buttons"><a class="{$style.identif}" data-varid="{echo $hotProduct->firstVariant->getId()}" data-prodid="{echo $hotProduct->getId()}" href="{shop_url('product/' . $hotProduct->getUrl())}">{$style.message}</a></div>
                            </div>   
                        </div>
                    </div>
                </li>  
            {/foreach}
        </ul>
    </div>
</div>
</div>



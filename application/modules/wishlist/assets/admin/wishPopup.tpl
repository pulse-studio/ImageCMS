<div class="container">
    <section class="mini-layout">
        <div class="frame_title clearfix">
            <div class="pull-left">
                <span class="help-inline"></span>
                <span class="title">{lang(move_item)}: {echo $user[user_name]}</span>
            </div>                          
        </div>
        <div class="row-fluid">
            <table class="table table-striped table-bordered table-hover table-condensed">
                <thead>
                    <tr>
                        <th colspan="6">{lang(lists)}</th>
                    </tr>
                </thead>
                <tbody>
                    <tr>
                        <td colspan="6">
                            <div class="inside_padd">
                                <form method="post" action="{site_url('/admin/components/cp/wishlist/moveItem/'.$varId . '/' . $wish_list_id)}">
                                    <div id="wishCart" class="active" data-effect-off="fadeOut" data-duration="500" data-elrun="#popupCart" style="top: 922px; left: 571.5px; display: block;">
                                        <div class="fancy fancy_cleaner frame_head_content wishTMP">
                                            <div class="header_title">{lang(choose_wish_list)}
                                            </div>
                                            <div class="drop-content">
                                                <div class="inside_padd">
                                                    <div class="addWL">
                                                        {foreach $wish_lists as $wish_list}
                                                            <label>
                                                                <input type="radio" name="wishlist" value="{$wish_list.id}" data-id="{$wish_list.id}">
                                                                {$wish_list.title}
                                                            </label>
                                                        {/foreach}
                                                        <label class="newWishListLable">
                                                            <input type="radio" name="wishlist"  value="sd" class="newWishList" data-listsCount="{count($wish_lists)}" data-maxListsCount={$max_lists_count}>
                                                            {lang(create_list)}
                                                            <input type="text"  name="wishListName"  value="" class="wish_list_name">
                                                        </label>
                                                        <input type="submit" class="{$class}" id="{$varId}"  value="{lang(move_in_list)}"/>
                                                    </div>
                                                    <div id="errors" class="msg">
                                                        <div class="error"></div>
                                                    </div>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                    {form_csrf()}
                                </form>
                            </div>
                        </td>
                    </tr>
                </tbody>
            </table>
        </div>
    </section>
</div>
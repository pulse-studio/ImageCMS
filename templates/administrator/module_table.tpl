<form method="post" action="#">
    <section class="mini-layout">
        <div class="frame_title clearfix">
            <div class="pull-left">
                <span class="help-inline"></span>
                <span class="title">{lang('a_all_modules')}</span>
            </div>
            <div class="pull-right">
                <div class="d-i_b">
                    <button type="button" class="btn btn-small disabled action_on" id="module_delete"><i class="icon-trash"></i>{lang('a_delete')}</button>
                </div>
            </div>    
        </div>
        <div class="btn-group myTab m-t_20" data-toggle="buttons-radio">
            <a href="#modules" class="btn btn-small">{lang('a_modules')}</a>
            <a href="#set_modul" class="btn btn-small active">{lang('a_install_modules')}</a>
        </div>
        <div class="tab-content">
            {if count($installed) != 0}
                <div class="tab-pane active" id="modules">
                    <div class="row-fluid">
                        <table class="table table-striped table-bordered table-hover table-condensed">
                            <thead>
                                <tr>
                                    <th class="span1">
                                        <span class="frame_label">
                                            <span class="niceCheck b_n">
                                                <input type="checkbox" value="On"/>
                                            </span>
                                        </span>
                                    </th>
                                    <th class="span3">{lang('a_module')}</th>
                                    <th class="span3">{lang('a_desc')}</th>
                                    <th class="span2">{lang('a_url')}</th>
                                    <th class="span1">{lang('a_autoload')}</th>
                                    <th class="span1">{lang('a_url_access')}</th>
                                </tr>
                            </thead>
                            <tbody class="sortable" id="mtbl">
                                {foreach $installed as $module}
                                    <tr data-title="{lang('a_drug_module')}" data-id="{$module.id}">
                                        <td>
                                            <span class="frame_label">
                                                <span class="niceCheck b_n">
                                                    <input type="checkbox" name="check{$module.id}" value="{$module.name}"/>
                                                </span>
                                            </span>
                                        </td>
                                        <td>
                                            {if $module['admin_file'] == 1}
                                                {if $module.name == 'shop'}
                                                    <a href="#">{$module.menu_name}</a>
                                                {else:}
                                                    <a href="#">{$module.menu_name}</a>
                                                {/if}
                                            {else:}
                                                {$module.menu_name}
                                            {/if}
                                            <!--                                    <a href="#">Пользователи</a>-->
                                        </td>
                                        <td>
                                            <p>{$module.description}</p>
                                        </td>
                                        <td class="urlholder">
                                            <p>{if $module['enabled'] == "1"}{anchor($module.identif,$module.identif,array('target'=>'_blank'))}{else:}-{/if}</p>
                                        </td>
                                        <td>
                                            <div class="frame_prod-on_off" data-rel="tooltip" data-placement="top" data-original-title="{lang('a_turn_on')}"  data-off="{lang('a_turn_off')}">
                                                <span class="prod-on_off autoload_ch {if !$module.autoload}disable_tovar{/if}" data-mid="{$module.id}"></span>
                                            </div>
                                        </td>
                                        <td>
                                            <div class="frame_prod-on_off" data-rel="tooltip" data-placement="top" data-original-title="{lang('a_turn_on')}"  data-off="{lang('a_turn_off')}">
                                                <span class="prod-on_off urlen_ch {if !$module.enabled}disable_tovar{/if}" data-mid="{$module.id}" data-murl="{$BASE_URL}{$module.identif}" data-mname="{$module.identif}"></span>
                                            </div>
                                        </td>
                                    </tr>
                                {/foreach}
                            </tbody>
                        </table>
                    </div>
                </div>
            {else:}
                <h3>{lang('a_modules_not_installed')}</h3>
            {/if}
            <div class="tab-pane" id="set_modul">
                {if count($not_installed) > 0 }
                    <div class="row-fluid" id="nimc">
                        <table class="table table-striped table-bordered table-hover table-condensed" id="nimt">
                            <thead>
                                <tr>
                                    <th class="span3">{lang('a_module')}</th>
                                    <th class="span3">{lang('a_desc')}</th>
                                    <th class="span2">{lang('a_version')}</th>
                                    <th class="span1">{lang('a_install')}</th>
                                </tr>
                            </thead>
                            <tbody class="nim">
                                {foreach $not_installed as $module}
                                <tr>
                                    <td>
                                        <a href="#">{$module.menu_name}</a>
                                    </td>
                                    <td>
                                        <p>{$module.description}</p>
                                    </td>
                                    <td class="fdel">
                                        <p>{$module.version}</p>
                                    </td>
                                    <td class="fdel2">
                                        <a href="#" class="mod_instal" data-mname="{$module.com_name}" data-mid="{$module.id}">{lang('a_install')}</a>
                                    </td>
                                </tr>
                                {/foreach}
                            </tbody>
                        </table>
                    </div>
                {else:}
                    </br>
                    <div class="alert alert-info">
                        {lang('a_no_modules_for_install')}
                    </div>
                {/if}
            </div>
        </div>
    </section>
</form>

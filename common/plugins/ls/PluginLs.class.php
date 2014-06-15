<?php
/*---------------------------------------------------------------------------
 * @Project: Alto CMS
 * @Project URI: http://altocms.com
 * @Description: Advanced Community Engine
 * @Copyright: Alto CMS Team
 * @License: GNU GPL v2 & MIT
 *----------------------------------------------------------------------------
 */

/**
 * Запрещаем напрямую через браузер обращение к этому файлу.
 */
if (!class_exists('Plugin')) {
    die('Hacking attempt!');
}

class PluginLs extends Plugin {

    protected $aDelegates = array(
    );

    protected $aInherits = array(
        'module' => array(
            'ModuleViewer',
            'ModuleWidget',
            'ModuleSecurity',
            'ModuleImage',
            'ModuleLang',
            'ModuleComment',
        ),
        'action' => array(
            'ActionSettings',
            'ActionContent',
        ),
        'widget' => array(
            'WidgetStream',
        ),
    );

    public function __construct() {

        if (F::File_Exists(Config::Get('path.smarty.template') . 'page_main_menu.tpl')) {
            // считаем, что скин адаптирован и делегаты шаблонов не нужны
            $this->aDelegates = null;
        }
    }

    /**
     * Активация плагина
     */
    public function Activate() {

        return true;
    }

    /**
     * Инициализация плагина
     */
    public function Init() {

        Config::Set('view.tinymce', Config::Get('view.wysiwyg'));
    }
}

// EOF
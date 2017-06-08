package com.hongmeng.ncjw.common.utils;

import java.util.LinkedList;
import java.util.List;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

public class PageUtils {
    
    static Logger log = LoggerFactory.getLogger(PageUtils.class);
    
    public static List<String> jsFiles = new LinkedList<String>();
    
    public static List<String> cssFiles = new LinkedList<String>();
   
    static {
        String dir;
        
        // local
        dir = "vendor/local/";
        jsFiles.add(dir + "js/base.js");
        jsFiles.add(dir + "js/user.js");
        jsFiles.add(dir + "js/utils.js");
        cssFiles.add(dir + "css/main.css");
        cssFiles.add(dir + "css/demo.css");
        cssFiles.add(dir + "css/loading.css");
        
        // jquery
        jsFiles.add("vendor/jquery/1.11.3/jquery.min.js");
        jsFiles.add("vendor/jquery/jquery-doT.js");
        jsFiles.add("vendor/jquery/jquery.session.js");
        
        // doT
        jsFiles.add("vendor/doT/1.0.1/doT.js");
        
        // date
        jsFiles.add("vendor/date/date.format-1.2.3.js");
        jsFiles.add("vendor/date/date.js");
        
        // des 
        jsFiles.add("vendor/CryptoJS/3.1.2/rollups/tripledes.js");
        jsFiles.add("vendor/CryptoJS/3.1.2/components/mode-ecb.js");
        
        // bootstrap
        dir = "vendor/bootstrap/3.3.6/";
        jsFiles.add(dir + "js/bootstrap.js");
        cssFiles.add(dir + "css/bootstrap.css");
        
        // bootstrapValidator
        dir = "vendor/bootstrapValidator/";
        jsFiles.add(dir + "js/bootstrapValidator.min.js");
        cssFiles.add(dir + "css/bootstrapValidator.min.css");
        
        // metisMenu
        dir = "vendor/metisMenu/";
        jsFiles.add(dir + "metisMenu.min.js");
        cssFiles.add(dir + "metisMenu.min.css");
        
        // sb admin
        dir = "vendor/sb-admin/";
        jsFiles.add(dir + "js/sb-admin-2.min.js");
        cssFiles.add(dir + "css/sb-admin-2.min.css");
        
        // bootstrap wysiwyg
        dir = "vendor/bootstrap-wysiwyg/";
        jsFiles.add(dir + "bootstrap-wysiwyg.js");
        cssFiles.add(dir + "index.css");
        cssFiles.add(dir + "bootstrap-combined.no-icons.min.css");
        jsFiles.add(dir + "external/jquery.hotkeys.js");
        jsFiles.add(dir + "external/google-code-prettify/prettify.js");
        cssFiles.add(dir + "external/google-code-prettify/prettify.css");
        
        // dataTables
        dir = "vendor/dataTables/";
        jsFiles.add(dir + "1.10.12/js/jquery.dataTables.min.js");
        jsFiles.add(dir + "datatables-plugins/dataTables.bootstrap.min.js");
        cssFiles.add(dir + "datatables-plugins/dataTables.bootstrap.css");
        jsFiles.add(dir + "datatables-responsive/dataTables.responsive.js");
        cssFiles.add(dir + "datatables-responsive/dataTables.responsive.css");
        
        // webui popover
        dir = "vendor/webui-popover/";
        jsFiles.add(dir + "jquery.webui-popover.min.js");
        cssFiles.add(dir + "jquery.webui-popover.min.css");
        
        // font awesome
        dir = "vendor/font-awesome/";
        cssFiles.add(dir + "css/font-awesome.css");
        
        // ladda loading
//        dir = "vendor/ladda/";
//        jsFiles.add(dir + "spin.min.js");
//        jsFiles.add(dir + "ladda.min.js");
//        cssFiles.add(dir + "ladda-themeless.min.css");
        
        // fileinput
        dir = "vendor/bootstrap-fileinput/";
        jsFiles.add(dir + "fileinput.min.js");
        jsFiles.add(dir + "locales/zh.js");
        cssFiles.add(dir + "fileinput.min.css");
        
        // highcharts
        dir = "vendor/highcharts/4.2.5/";
        jsFiles.add(dir + "highcharts.js");
        
    }

}
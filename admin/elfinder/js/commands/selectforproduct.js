"use strict";

elFinder.prototype.commands.selectforproduct = function() {
    this.title = 'Select Image(s)';
    this.alwaysEnabled = true;
    this.updateOnSelect = false;

    this.getstate = function(sel) {
        var sel = this.files(sel),
			cnt = sel.length;

        return cnt && $.map(sel, function(f) { return f.phash && f.read && !f.locked ? f : null }).length == cnt ? 0 : -1;
    }

    this.exec = function(hashes) {
        var fm = this.fm,
			dfrd = $.Deferred()
				.fail(function(error) {
				    fm.error(error);
				});

        $.each(this.files(hashes), function(i, file) {
            var pp = fm.path(file.hash);
            pp = pp.replaceAll('\\', '\/');

            // Check to see if we're on a single image page, or multi images
            //var key = "field";
            //var defaultValue = "image";
            //var singleImage = false;

            //var regex = new RegExp("[\\?&]" + key + "=([^&#]*)");
            //var qs = regex.exec(window.location.href);
            //if(qs == null) {
            //    singleImage = false;
            //} else {
            //    singleImage = true;
            //    defaultValue = qs;
            // }

            //if(singleImage == true) {
            //    parent.addSingleImage(pp,defaultValue);
            //} else {
            //    parent.addImage(pp);
            // }
            var keyThumb = "thumb";
            var keyField = "field";
            var keyRows = "rows";
            var keyCKEditorFuncNum = "CKEditorFuncNum";
            var keyCKEditor = "CKEditor";

            var valueThumb = getQuerystring(keyThumb, null);
            var valueField = getQuerystring(keyField, null);
            var valueRows = getQuerystring(keyRows, null);
            var valueCKEditorFuncNum = getQuerystring(keyCKEditorFuncNum, null);
            var valueCKEditor = getQuerystring(keyCKEditor, null);

            //var imageDirectory = imageDir;

            if(valueCKEditorFuncNum == "2") {
                window.opener.CKEDITOR.tools.callFunction(valueCKEditorFuncNum, imageDir + pp);
                self.close();
            } else if(valueField == "") {
                parent.addImage(pp);
            } else if(valueField == "imagemanager") {
                // No file needed, only file manager mode
                exit();
            } else if(valueField == "filemanager") {
                exit();
            } else {
                if(valueThumb == "") {
                    parent.addSingleImage(pp, valueField, "thumb", valueRows);
                } else {
                    //alert('pp: ' + pp + ', valueField: ' + valueField + ', valueThumb: ' + valueThumb + ', rows: ' + valueRows);
                    //exit();
                    parent.addSingleImage(pp, valueField, valueThumb, valueRows);
                }
            }

        });


        return dfrd.isRejected() ? dfrd : dfrd.resolve(fm.clipboard(this.hashes(hashes), true));
    }

}

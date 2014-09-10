var JSONEO = {
    app: {},
    run: function () {
        
        this.app.treeEditor = null;
        this.app.codeEditor = null;
        this.app.isEditorSyncChange = false;
        this.app.unsavedChanges = false;
        this.app.lastChanged = undefined;
        this.app.isEditorSyncChange = true;
        var container = document.getElementById("codeEditor");
        this.app.codeEditor = new JSONEditor(container, {
            mode: 'code',
            change: function () {
                if (!JSONEO.app.isEditorSyncChange) {
                    JSONEO.app.lastChanged = JSONEO.app.codeEditor;
                    codeToTree();
                    if (JSONEO.app.unsavedChanges != null) {
                        JSONEO.app.unsavedChanges = true;
                    }
                }
            },
            error: function (err) {
                console.log(err);
            }
        });

// tree editor
        container = document.getElementById("treeEditor");
        this.app.treeEditor = new JSONEditor(container, {
            mode: 'tree',
            change: function () {
                if (!JSONEO.app.isEditorSyncChange) {
                    JSONEO.app.lastChanged = JSONEO.app.treeEditor;
                    treeToCode();
                    if (JSONEO.app.unsavedChanges != null) {
                        JSONEO.app.unsavedChanges = true;
                    }
                }
            },
            error: function (err) {
                console.log(err);
            }
        });
        this.app.isEditorSyncChange = false;

        function isValidJson(jsonString) {
            try {
                jsonlint.parse(jsonString);
                return true;
            } catch (err) {
                return false;
            }
        }

        function codeToTree() {
            setTimeout(
                function () {
                    var jsonString = JSONEO.app.codeEditor.getText();
                    if (jsonString != undefined && JSONEO.app.lastChanged == JSONEO.app.codeEditor && isValidJson(jsonString)) {
                        JSONEO.app.isEditorSyncChange = true;
                        var json = JSONEO.app.codeEditor.get();
                        if (json != undefined) {
                            JSONEO.app.treeEditor.set(json);
                        }
                        JSONEO.app.isEditorSyncChange = false;
                    }
                }
                , 10);
        }

        function treeToCode() {
            setTimeout(
                function () {
                    var jsonString = JSONEO.app.treeEditor.getText();
                    if (jsonString != undefined && JSONEO.app.lastChanged == JSONEO.app.treeEditor && isValidJson(jsonString)) {
                        JSONEO.app.isEditorSyncChange = true;
                        var json = JSONEO.app.treeEditor.get();
                        if (json != undefined) {
                            JSONEO.app.codeEditor.set(json);
                        }
                        JSONEO.app.isEditorSyncChange = false;
                    }
                }
                , 10);
        }
    }
};
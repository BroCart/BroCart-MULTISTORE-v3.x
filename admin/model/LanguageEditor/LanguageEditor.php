<?php

class ModelLanguageEditorLanguageEditor extends Model {

    public function getLanguage($language_id) {

        $query = $this->db->query("SELECT DISTINCT * FROM " . DB_PREFIX . "language WHERE language_id = '" . (int)$language_id . "'");

        return $query->row['filename'];

    }
    
}
?>

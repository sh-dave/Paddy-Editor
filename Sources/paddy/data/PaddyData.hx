package paddy.data;

import zui.Themes;

typedef PData = {
	var name: String;
	var window: String;
	var scene: String;
	var ?theme: zui.Themes.TTheme;
}

class PaddyData {

	public static function changeTheme(ui:zui.Zui, theme:TTheme){
		ui.t.FONT_SIZE = theme.FONT_SIZE;
		ui.t.ELEMENT_W = theme.ELEMENT_W;
		ui.t.ELEMENT_H = theme.ELEMENT_H;
		ui.t.ELEMENT_OFFSET = theme.ELEMENT_OFFSET;
		ui.t.ARROW_SIZE = theme.ARROW_SIZE;
		ui.t.BUTTON_H = theme.BUTTON_H;
		ui.t.CHECK_SIZE = theme.CHECK_SIZE;
		ui.t.CHECK_SELECT_SIZE = theme.CHECK_SELECT_SIZE;
		ui.t.SCROLL_W = theme.SCROLL_W;
		ui.t.TEXT_OFFSET = theme.TEXT_OFFSET;
		ui.t.TAB_W = theme.TAB_W;
		ui.t.FILL_WINDOW_BG = theme.FILL_WINDOW_BG;
		ui.t.FILL_BUTTON_BG = theme.FILL_BUTTON_BG;
		ui.t.FILL_ACCENT_BG = theme.FILL_ACCENT_BG;
		ui.t.WINDOW_BG_COL = theme.WINDOW_BG_COL;
		ui.t.WINDOW_TINT_COL = theme.WINDOW_TINT_COL;
		ui.t.ACCENT_COL = theme.ACCENT_COL;
		ui.t.ACCENT_HOVER_COL = theme.ACCENT_HOVER_COL;
		ui.t.ACCENT_SELECT_COL = theme.ACCENT_SELECT_COL;
		ui.t.BUTTON_COL = theme.BUTTON_COL;
		ui.t.BUTTON_TEXT_COL = theme.BUTTON_TEXT_COL;
		ui.t.BUTTON_HOVER_COL = theme.BUTTON_HOVER_COL;
		ui.t.BUTTON_PRESSED_COL = theme.BUTTON_PRESSED_COL;
		ui.t.TEXT_COL = theme.TEXT_COL;
		ui.t.LABEL_COL = theme.LABEL_COL;
		ui.t.SEPARATOR_COL = theme.SEPARATOR_COL;
		ui.t.HIGHLIGHT_COL = theme.HIGHLIGHT_COL;
		ui.t.CONTEXT_COL = theme.CONTEXT_COL;
	};

}

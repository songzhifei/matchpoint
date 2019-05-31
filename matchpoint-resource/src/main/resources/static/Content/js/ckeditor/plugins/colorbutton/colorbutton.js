  1 ﻿/*
  2 Copyright (c) 2003-2012, CKSource - Frederico Knabben. All rights reserved.
  3 For licensing, see LICENSE.html or http://ckeditor.com/license
  4 */
  5 
  6 /**
  7  * @fileOverview The "colorbutton" plugin that makes it possible to assign
  8  *               text and background colors to editor contents.
  9  *
 10  */
 11 CKEDITOR.plugins.add( 'colorbutton',
 12 {
 13 	requires : [ 'panelbutton', 'floatpanel', 'styles' ],
 14 
 15 	init : function( editor )
 16 	{
 17 		var config = editor.config,
 18 			lang = editor.lang.colorButton;
 19 
 20 		var clickFn;
 21 
 22 		if ( !CKEDITOR.env.hc )
 23 		{
 24 			addButton( 'TextColor', 'fore', lang.textColorTitle );
 25 			addButton( 'BGColor', 'back', lang.bgColorTitle );
 26 		}
 27 
 28 		function addButton( name, type, title )
 29 		{
 30 			var colorBoxId = CKEDITOR.tools.getNextId() + '_colorBox';
 31 			editor.ui.add( name, CKEDITOR.UI_PANELBUTTON,
 32 				{
 33 					label : title,
 34 					title : title,
 35 					className : 'cke_button_' + name.toLowerCase(),
 36 					modes : { wysiwyg : 1 },
 37 
 38 					panel :
 39 					{
 40 						css : editor.skin.editor.css,
 41 						attributes : { role : 'listbox', 'aria-label' : lang.panelTitle }
 42 					},
 43 
 44 					onBlock : function( panel, block )
 45 					{
 46 						block.autoSize = true;
 47 						block.element.addClass( 'cke_colorblock' );
 48 						block.element.setHtml( renderColors( panel, type, colorBoxId ) );
 49 						// The block should not have scrollbars (#5933, #6056)
 50 						block.element.getDocument().getBody().setStyle( 'overflow', 'hidden' );
 51 
 52 						CKEDITOR.ui.fire( 'ready', this );
 53 
 54 						var keys = block.keys;
 55 						var rtl = editor.lang.dir == 'rtl';
 56 						keys[ rtl ? 37 : 39 ]	= 'next';					// ARROW-RIGHT
 57 						keys[ 40 ]	= 'next';					// ARROW-DOWN
 58 						keys[ 9 ]	= 'next';					// TAB
 59 						keys[ rtl ? 39 : 37 ]	= 'prev';					// ARROW-LEFT
 60 						keys[ 38 ]	= 'prev';					// ARROW-UP
 61 						keys[ CKEDITOR.SHIFT + 9 ]	= 'prev';	// SHIFT + TAB
 62 						keys[ 32 ]	= 'click';					// SPACE
 63 					},
 64 
 65 					// The automatic colorbox should represent the real color (#6010)
 66 					onOpen : function()
 67 					{
 68 						var selection = editor.getSelection(),
 69 							block = selection && selection.getStartElement(),
 70 							path = new CKEDITOR.dom.elementPath( block ),
 71 							color;
 72 
 73 						// Find the closest block element.
 74 						block = path.block || path.blockLimit || editor.document.getBody();
 75 
 76 						// The background color might be transparent. In that case, look up the color in the DOM tree.
 77 						do
 78 						{
 79 							color = block && block.getComputedStyle( type == 'back' ? 'background-color' : 'color' ) || 'transparent';
 80 						}
 81 						while ( type == 'back' && color == 'transparent' && block && ( block = block.getParent() ) );
 82 
 83 						// The box should never be transparent.
 84 						if ( !color || color == 'transparent' )
 85 							color = '#ffffff';
 86 
 87 						this._.panel._.iframe.getFrameDocument().getById( colorBoxId ).setStyle( 'background-color', color );
 88 					}
 89 				});
 90 		}
 91 
 92 
 93 		function renderColors( panel, type, colorBoxId )
 94 		{
 95 			var output = [],
 96 				colors = config.colorButton_colors.split( ',' );
 97 
 98 			var clickFn = CKEDITOR.tools.addFunction( function( color, type )
 99 				{
100 					if ( color == '?' )
101 					{
102 						var applyColorStyle = arguments.callee;
103 						function onColorDialogClose( evt )
104 						{
105 							this.removeListener( 'ok', onColorDialogClose );
106 							this.removeListener( 'cancel', onColorDialogClose );
107 
108 							evt.name == 'ok' && applyColorStyle( this.getContentElement( 'picker', 'selectedColor' ).getValue(), type );
109 						}
110 
111 						editor.openDialog( 'colordialog', function()
112 						{
113 							this.on( 'ok', onColorDialogClose );
114 							this.on( 'cancel', onColorDialogClose );
115 						} );
116 
117 						return;
118 					}
119 
120 					editor.focus();
121 
122 					panel.hide( false );
123 
124 					editor.fire( 'saveSnapshot' );
125 
126 					// Clean up any conflicting style within the range.
127 					new CKEDITOR.style( config['colorButton_' + type + 'Style'], { color : 'inherit' } ).remove( editor.document );
128 
129 					if ( color )
130 					{
131 						var colorStyle = config['colorButton_' + type + 'Style'];
132 
133 						colorStyle.childRule = type == 'back' ?
134 							function( element )
135 							{
136 								// It's better to apply background color as the innermost style. (#3599)
137 								// Except for "unstylable elements". (#6103)
138 								return isUnstylable( element );
139 							}
140 							:
141 							function( element )
142 							{
143 								// Fore color style must be applied inside links instead of around it. (#4772,#6908)
144 								return !( element.is( 'a' ) || element.getElementsByTag( 'a' ).count() ) || isUnstylable( element );
145 							};
146 
147 						new CKEDITOR.style( colorStyle, { color : color } ).apply( editor.document );
148 					}
149 
150 					editor.fire( 'saveSnapshot' );
151 				});
152 
153 			// Render the "Automatic" button.
154 			output.push(
155 				'<a class="cke_colorauto" _cke_focus=1 hidefocus=true' +
156 					' title="', lang.auto, '"' +
157 					' onclick="CKEDITOR.tools.callFunction(', clickFn, ',null,\'', type, '\');return false;"' +
158 					' href="javascript:void(\'', lang.auto, '\')"' +
159 					' role="option">' +
160 					'<table role="presentation" cellspacing=0 cellpadding=0 width="100%">' +
161 						'<tr>' +
162 							'<td>' +
163 								'<span class="cke_colorbox" id="', colorBoxId, '"></span>' +
164 							'</td>' +
165 							'<td colspan=7 align=center>',
166 								lang.auto,
167 							'</td>' +
168 						'</tr>' +
169 					'</table>' +
170 				'</a>' +
171 				'<table role="presentation" cellspacing=0 cellpadding=0 width="100%">' );
172 
173 			// Render the color boxes.
174 			for ( var i = 0 ; i < colors.length ; i++ )
175 			{
176 				if ( ( i % 8 ) === 0 )
177 					output.push( '</tr><tr>' );
178 
179 				var parts = colors[ i ].split( '/' ),
180 					colorName = parts[ 0 ],
181 					colorCode = parts[ 1 ] || colorName;
182 
183 				// The data can be only a color code (without #) or colorName + color code
184 				// If only a color code is provided, then the colorName is the color with the hash
185 				// Convert the color from RGB to RRGGBB for better compatibility with IE and <font>. See #5676
186 				if (!parts[1])
187 					colorName = '#' + colorName.replace( /^(.)(.)(.)$/, '$1$1$2$2$3$3' );
188 
189 				var colorLabel = editor.lang.colors[ colorCode ] || colorCode;
190 				output.push(
191 					'<td>' +
192 						'<a class="cke_colorbox" _cke_focus=1 hidefocus=true' +
193 							' title="', colorLabel, '"' +
194 							' onclick="CKEDITOR.tools.callFunction(', clickFn, ',\'', colorName, '\',\'', type, '\'); return false;"' +
195 							' href="javascript:void(\'', colorLabel, '\')"' +
196 							' role="option">' +
197 							'<span class="cke_colorbox" style="background-color:#', colorCode, '"></span>' +
198 						'</a>' +
199 					'</td>' );
200 			}
201 
202 			// Render the "More Colors" button.
203 			if ( config.colorButton_enableMore === undefined || config.colorButton_enableMore )
204 			{
205 				output.push(
206 					'</tr>' +
207 					'<tr>' +
208 						'<td colspan=8 align=center>' +
209 							'<a class="cke_colormore" _cke_focus=1 hidefocus=true' +
210 								' title="', lang.more, '"' +
211 								' onclick="CKEDITOR.tools.callFunction(', clickFn, ',\'?\',\'', type, '\');return false;"' +
212 								' href="javascript:void(\'', lang.more, '\')"',
213 								' role="option">',
214 								lang.more,
215 							'</a>' +
216 						'</td>' );	// tr is later in the code.
217 			}
218 
219 			output.push( '</tr></table>' );
220 
221 			return output.join( '' );
222 		}
223 
224 		function isUnstylable( ele )
225 		{
226 			return ( ele.getAttribute( 'contentEditable' ) == 'false' ) || ele.getAttribute( 'data-nostyle' );
227 		}
228 	}
229 });
230 
231 /**
232  * Whether to enable the <strong>More Colors</strong> button in the color selectors.
233  * @name CKEDITOR.config.colorButton_enableMore
234  * @default <code>true</code>
235  * @type Boolean
236  * @example
237  * config.colorButton_enableMore = false;
238  */
239 
240 /**
241  * Defines the colors to be displayed in the color selectors. This is a string
242  * containing hexadecimal notation for HTML colors, without the "#" prefix.
243  * <br /><br />
244  * Since 3.3: A color name may optionally be defined by prefixing the entries with
245  * a name and the slash character. For example, "FontColor1/FF9900" will be
246  * displayed as the color #FF9900 in the selector, but will be output as "FontColor1".
247  * @name CKEDITOR.config.colorButton_colors
248  * @type String
249  * @default <code>'000,800000,8B4513,2F4F4F,008080,000080,4B0082,696969,B22222,A52A2A,DAA520,006400,40E0D0,0000CD,800080,808080,F00,FF8C00,FFD700,008000,0FF,00F,EE82EE,A9A9A9,FFA07A,FFA500,FFFF00,00FF00,AFEEEE,ADD8E6,DDA0DD,D3D3D3,FFF0F5,FAEBD7,FFFFE0,F0FFF0,F0FFFF,F0F8FF,E6E6FA,FFF'</code>
250  * @example
251  * // Brazil colors only.
252  * config.colorButton_colors = '00923E,F8C100,28166F';
253  * @example
254  * config.colorButton_colors = 'FontColor1/FF9900,FontColor2/0066CC,FontColor3/F00'
255  */
256 CKEDITOR.config.colorButton_colors =
257 	'000,800000,8B4513,2F4F4F,008080,000080,4B0082,696969,' +
258 	'B22222,A52A2A,DAA520,006400,40E0D0,0000CD,800080,808080,' +
259 	'F00,FF8C00,FFD700,008000,0FF,00F,EE82EE,A9A9A9,' +
260 	'FFA07A,FFA500,FFFF00,00FF00,AFEEEE,ADD8E6,DDA0DD,D3D3D3,' +
261 	'FFF0F5,FAEBD7,FFFFE0,F0FFF0,F0FFFF,F0F8FF,E6E6FA,FFF';
262 
263 /**
264  * Stores the style definition that applies the text foreground color.
265  * @name CKEDITOR.config.colorButton_foreStyle
266  * @type Object
267  * @default (see example)
268  * @example
269  * // This is actually the default value.
270  * config.colorButton_foreStyle =
271  *     {
272  *         element : 'span',
273  *         styles : { 'color' : '#(color)' }
274  *     };
275  */
276 CKEDITOR.config.colorButton_foreStyle =
277 	{
278 		element		: 'span',
279 		styles		: { 'color' : '#(color)' },
280 		overrides	: [ { element : 'font', attributes : { 'color' : null } } ]
281 	};
282 
283 /**
284  * Stores the style definition that applies the text background color.
285  * @name CKEDITOR.config.colorButton_backStyle
286  * @type Object
287  * @default (see example)
288  * @example
289  * // This is actually the default value.
290  * config.colorButton_backStyle =
291  *     {
292  *         element : 'span',
293  *         styles : { 'background-color' : '#(color)' }
294  *     };
295  */
296 CKEDITOR.config.colorButton_backStyle =
297 	{
298 		element		: 'span',
299 		styles		: { 'background-color' : '#(color)' }
300 	};
301 
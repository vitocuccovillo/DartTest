/**
 * Classe con membri statici che gestisce il tema dell'applicazione.
 */ 
class Theme{
  /// Colore ["wisteria"](http://flatuicolors.com). Usato per istogramma interno.
  static String _coloreIstogrammaInterno = "#8e44ad";
  /// Colore istogramma interno in formato RGB.
  static String _coloreIstogrammaInternoRGB = "rgb(142, 68, 173)";
  /// Colore ["belize hole"](http://flatuicolors.com). Usato per istogramma esterno.
  static String _coloreIstogrammaEsterno = "#2980b9";
  /// Colore istogramma esterno in formato RGB.
  static String _coloreIstogrammaEsternoRGB = "rgb(41, 128, 185)";
  /// Colore ["sun flower"](http://flatuicolors.com). Usato per Circular Box Plot.
  static String _coloreCircularBoxPlot = "#f1c40f";
  /// Colore Circular Box Plot in formato RGB.
  static String _coloreCircularBoxPlotRGB = "rgb(241, 196, 15)";
  /// Colore sfondo.
  static String _CBBackground = "white";
  /// Colore sfondo utente offline.
  static String _offlineCBBackground = "#D8D8D8";
  /// Colore sfondo utente assente.
  static String _absentCBBackground = "#B8B8B8";
  /// Colore evento.
  static String _eventColor = "#d9d9d9";
  /// Colore evento in formato RGB.
  static String _eventColorRGB  = "rgb(217, 217, 217)";
  /// Colore utente evidenziato.
  static String _highlighted = "#c2ff91";
  /// Colore utente evidenziato.
  static String _CBSelectedBackground = "#b2ef01";
  /// Colore testo orologio.
  static String _coloreClock = "black";
  /// Colore contorno lancetta.
  static String _coloreStrokeLancetta = "black";
  /// Colore fondo lancetta.
  static String _coloreFillLancetta = "black";
  /// Colore disegno BoxPlot.
  static String _coloreStrokeBP = "black";
  /// Colore testo interfaccia.
  static String _CBPTextColor = "Black";
  /// Colore bordo generale.
  static String _coloreBordoGeneric = "thin solid gray";
  /// Colore background menu laterali.
  static String _BackgroundMenu = "white";
  /// Colore background box utenti.
  static String _BackgroundBU = "#F0F0F0";
  /// Colore background interfaccia.
  static String _BackgroundI = "#f5feff";
  /// Colore stroke usato per il disegno.
  static String _stroke = "#000000";
  /// Colore online
  static String _online = "rgb(3, 193, 3)";
  /// Colore offline
  static String _offline = "rgb(172, 172, 172)";
  /// Colore away
  static String _away = "rgb(255, 140, 3)";
  /// Colore busy
  static String _busy = "rgb(232, 30, 38)";
  // Colori usati per la legenda
  /// Colore bordo canvas.
  static String _coloreBordoCanvas = "Black";
  /// Colore fieldset.
  static String _fieldset = "thin solid gray";
  
  static resetTheme(){
    print("resetTheme invocato");
    _coloreIstogrammaInterno = "#8e44ad";
    _coloreIstogrammaInternoRGB = "rgb(142, 68, 173)";
    _coloreIstogrammaEsterno = "#2980b9";
    _coloreIstogrammaEsternoRGB = "rgb(41, 128, 185)";
    _coloreCircularBoxPlot = "#f1c40f";
    _coloreCircularBoxPlotRGB = "rgb(241, 196, 15)";
    _CBBackground = "white";
    _offlineCBBackground = "#D8D8D8";
    _absentCBBackground = "#B8B8B8";
    _eventColor = "#d9d9d9";
    _eventColorRGB  = "rgb(217, 217, 217)";
    _highlighted = "#c2ff91";
    _CBSelectedBackground = "#b2ef01";
    _coloreClock = "black";
    _coloreStrokeLancetta = "black";
    _coloreFillLancetta = "black";
    _coloreStrokeBP = "black";
    _CBPTextColor = "Black";
    _coloreBordoGeneric = "thin solid gray";
    _BackgroundMenu = "white";
    _BackgroundBU = "#F0F0F0";
    _BackgroundI = "#f5feff";
    _stroke = "#000000";
    _online = "rgb(3, 193, 3)";
    _offline = "rgb(172, 172, 172)";
    _away = "rgb(255, 140, 3)";
    _busy = "rgb(232, 30, 38)";
    _coloreBordoCanvas = "Black";
    _fieldset = "thin solid gray";
  }
  
  /// Colore delle e-mail.
  static get email => _coloreIstogrammaInterno;
  static void setEmail(String coloreEmail){_coloreIstogrammaInterno = coloreEmail;}
  /// Colore dei messaggi di chat.
  static get chat  => _coloreIstogrammaEsterno;
  static void setChat(String coloreChat){_coloreIstogrammaEsterno = coloreChat;}
  /// Colore delle attività miste.
  static get mixed => _coloreCircularBoxPlot;
  static void setMixed(String coloreMixed){_coloreCircularBoxPlot = coloreMixed;}
  /// Colore di sfondo.
  static get CBBackground => _CBBackground;
  static void setCBBackground(String coloreSfondo){_CBBackground = coloreSfondo;}
  /// Colore di sfondo selezionato.
  static get CBSelectedBackground => _CBSelectedBackground;
  static void setCBSelectedBackground(String coloreSfondoSel){_CBSelectedBackground = coloreSfondoSel;}
  /// Colore sfondo utente.
  static get userBG => _CBBackground;
  static void setUserBG(String coloreSfondoU){_CBBackground = coloreSfondoU;}
  /// Colore sfondo utente non in linea.
  static get offline_userBG => _offlineCBBackground;
  static void setOffline_userBG(String coloreOffline){_offlineCBBackground = coloreOffline;}
  /// Colore sfondo utente assente.
  static get absent_userBG => _absentCBBackground;
  static void setAbsent_userBG(String coloreAssente){_absentCBBackground = coloreAssente;}
  /// Colore evento.
  static get ec => _eventColor;
  static void setEC(String coloreEP){_eventColor = coloreEP;}
  /// Colore utente evidenziato.
  static get highlighted => _highlighted;
  static void setHighlighted(String coloreEvidenziato){_highlighted = coloreEvidenziato;}
  /// Colore e-email in formato RGB.
  static get emailRGB => _coloreIstogrammaInternoRGB;
  static void setEmailRGB(String coloreEmailRGB){_coloreIstogrammaInternoRGB = coloreEmailRGB;}
  /// Colore messaggi di chat in formato RGB.
  static get chatRGB => _coloreIstogrammaEsternoRGB;
  static void setChatRGB(String coloreChatRGB){_coloreIstogrammaEsternoRGB = coloreChatRGB;}
  /// Colore eventi in formato RGB.
  static get ecRGB => _eventColorRGB;
  static void setEcRGB(String coloreEPRGB){_eventColorRGB = coloreEPRGB;}
  /// Colore varia attività in formato RGB.
  static get mixedRGB => _coloreCircularBoxPlotRGB;
  static void setMixedRGB(String coloreMixedRGB){_coloreCircularBoxPlotRGB = coloreMixedRGB;}
  /// Colore testo orologio.
  static get clock => _coloreClock;
  static void setClock(String coloreClock){_coloreClock = coloreClock;}
  /// Colore contorno lancetta.
  static get strokeHand => _coloreStrokeLancetta;
  static void setStrokeHand(String coloreCHand){_coloreStrokeLancetta = coloreCHand;}
  /// Colore fondo lancetta.
  static get fillHand => _coloreFillLancetta;
  static void setFillHand(String coloreFHand){_coloreFillLancetta = coloreFHand;}
  /// Colore disegno BoxPlot.
  static get strokeBP => _coloreStrokeBP;
  static void setStrokeBP(String coloreStrokeBP){_coloreStrokeBP = coloreStrokeBP;}
  /// Colore testo applicazione.
  static get textRGB => _CBPTextColor;
  static void setTextRGB(String coloreTextRGB){_CBPTextColor = coloreTextRGB;}
  /// Colore bordo generale.
  static get bordoGeneric => _coloreBordoGeneric;
  static void setBordoGeneric(String coloreBordoG){_coloreBordoGeneric = coloreBordoG;}
  /// Colore background menu laterali.
  static get backgroundMenu => _BackgroundMenu;
  static void setBackgroundMenu(String coloreBGmenu){_BackgroundMenu = coloreBGmenu;}
  /// Colore background box utenti.
  static get backgroundBU => _BackgroundBU;
  static void setBackgroundBU(String coloreBGbox){_BackgroundBU = coloreBGbox;}
  /// Colore background interfaccia.
  static get backgroundI => _BackgroundI;
  static void setBackgroundI(String coloreBGint){_BackgroundI = coloreBGint;}
  /// Colore stroke usato per il disegno.
  static get stroke => _stroke;
  static void setStroke(String coloreStroke){_stroke = coloreStroke;}
  /// Colore online
  static get online => _online;
  static void setOnline(String coloreOnline){_online = coloreOnline;}
  /// Colore offline
  static get offline => _offline;
  static void setOffline(String coloreOffline){_offline = coloreOffline;}
  /// Colore away
  static get away => _away;
  static void setAway(String coloreAway){_away = coloreAway;}
  /// Colore busy
  static get busy => _busy;
  static void setBusy(String coloreBusy){_busy = coloreBusy;}
  /// Colore bordo canvas.
  static get bordoCanvas => _coloreBordoCanvas;
  static void setBordoCanvas(String coloreBordoC){_coloreBordoCanvas = coloreBordoC;}
  /// Colore fieldset.
  static get fieldSet => _fieldset;
  static void setFieldSet(String coloreFS){_fieldset = coloreFS;}
    
}
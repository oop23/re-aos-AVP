# ReNova Player – Help / FAQ

🇵🇱 Polska wersja poniżej ([przejdź](#pomoc--faq-po-polsku)).

## Does ReNova ever change my files?
No. Every source (SMB, FTP/FTPS, SFTP, WebDAV, UPnP, USB, internal storage) is **read-only**.
Delete, rename, move, write and "create folder" are refused in the file access layer itself,
not only hidden in the UI. There is no "delete" button anywhere, and playback never removes,
renames or rewrites a file.

## Where are scraped data, my edits and resume points stored?
On the device only, in ReNova's private storage. Nothing is written next to your videos:
no `.nfo`, no `.jpg`, no hidden resume files. Existing `.nfo` files on your shares are **read**
(Kodi compatible).

## A movie or episode was matched wrong. How do I fix it?
- Open the video info, menu **Edit info**: change the title, year, plot, rating, season/episode.
  Your edits survive later rescans. **Forget my edits** returns to scraped data.
- Anime: put episodes in a folder named after the show (`Frieren/05.mkv`,
  `Frieren/Sezon 2/Odcinek 05.mp4`). Folders called `Anime` help: ReNova then prefers animated
  results and checks titles with AniList.
- Release names like `[SubsPlease] Sousou no Frieren - 05 (1080p).mkv` and `Frieren odc. 5.mp4`
  are understood.

## My NAS was asleep and the library vanished?
ReNova keeps the library when a rescan suddenly finds most of a source missing. The entries
are only removed when the next scan confirms the files are really gone.

## The audio track says "English" but it is a Polish voice-over (lektor)
ReNova reads the track title (`Lektor PL`, `Dubbing`, `Polski`…) and the release name
(`PL.LEKTOR`, `PLDUB`) and labels the track Polish, so your preferred language is picked.

## Player gestures
- Double tap left/right: seek -10 s / +10 s, taps add up (3 taps = 30 s).
- Horizontal swipe: seek, with the target time shown.
- Brightness swipe (left edge) is off by default: *Settings → Player → Brightness swipe*.
  It only affects the current video and never changes the system brightness.
- Stop: in the player menu.

## Can I install ReNova next to NOVA?
Yes. ReNova uses its own package (`io.github.oop23.renova`) and its own database.

## Version numbers
`0.1-nova6.5.5` means ReNova 0.1 built on NOVA 6.5.5.

## Where do I report bugs?
In this repository: <https://github.com/oop23/re-aos-AVP/issues>. Please do not report ReNova
issues to the NOVA project.

---

# Pomoc / FAQ po polsku

## Czy ReNova może coś zrobić z moimi plikami?
Nie. Wszystkie źródła (SMB, FTP/FTPS, SFTP, WebDAV, UPnP, USB, pamięć wewnętrzna) są
**tylko do odczytu**. Usuwanie, zmiana nazwy, przenoszenie, zapis i tworzenie folderów są
blokowane w samej warstwie dostępu do plików, nie tylko ukryte w interfejsie. Nie ma żadnego
przycisku „Usuń”, a odtwarzanie nigdy nie kasuje, nie przemianowuje ani nie nadpisuje plików.

## Gdzie są dane ze scrapera, moje poprawki i punkty wznowienia?
Tylko na urządzeniu, w prywatnej pamięci ReNova. Nic nie trafia obok filmów: żadnych `.nfo`,
`.jpg` ani ukrytych plików wznawiania. Istniejące pliki `.nfo` na dyskach są **czytane**
(zgodnie z Kodi).

## Film lub odcinek został źle rozpoznany. Jak to poprawić?
- W informacjach o wideo wybierz **Edytuj informacje**: tytuł, rok, opis, ocena, sezon/odcinek.
  Poprawki przetrwają kolejne skanowania. **Zapomnij moje zmiany** przywraca dane ze scrapera.
- Anime: trzymaj odcinki w folderze z nazwą serii (`Frieren/05.mkv`,
  `Frieren/Sezon 2/Odcinek 05.mp4`). Folder `Anime` pomaga: ReNova wtedy woli animacje
  i sprawdza tytuły w AniList.
- Nazwy w stylu `[SubsPlease] Sousou no Frieren - 05 (1080p).mkv` i `Frieren odc. 5.mp4`
  są rozumiane.

## NAS spał i biblioteka zniknęła?
ReNova nie kasuje biblioteki, gdy skan nagle nie widzi większości źródła. Wpisy znikają dopiero,
gdy kolejny skan potwierdzi, że plików naprawdę nie ma.

## Ścieżka audio mówi „English”, a to polski lektor
ReNova czyta nazwę ścieżki (`Lektor PL`, `Dubbing`, `Polski`…) i nazwę wydania
(`PL.LEKTOR`, `PLDUB`) i oznacza ścieżkę jako polską, więc wybiera się preferowany język.

## Gesty w odtwarzaczu
- Podwójne stuknięcie z lewej/prawej: -10 s / +10 s, stuknięcia się sumują (3 = 30 s).
- Przesunięcie poziome: przewijanie z podglądem czasu docelowego.
- Jasność (lewa krawędź) jest domyślnie wyłączona: *Ustawienia → Odtwarzacz → Gest jasności*.
  Działa tylko dla bieżącego filmu i nigdy nie zmienia jasności systemu.
- Stop: w menu odtwarzacza.

## Czy ReNova działa obok NOVA?
Tak. ReNova ma własny pakiet (`io.github.oop23.renova`) i własną bazę danych.

## Numer wersji
`0.1-nova6.5.5` oznacza ReNova 0.1 zbudowaną na NOVA 6.5.5.

## Gdzie zgłaszać błędy?
Tutaj: <https://github.com/oop23/re-aos-AVP/issues>. Prosimy nie zgłaszać błędów ReNova
do projektu NOVA.

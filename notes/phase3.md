Inspecting the COBOL report logic to explain how WS-LINE-COUNT is used.

What WS-LINE-COUNT is for
WS-LINE-COUNT is a page/line counter used for report pagination in this COBOL codebase.

In SYLRPT.cbl
It tracks how many detail lines have been written to the current report page.
When WS-LINE-COUNT >= WS-RECORDS-PER-PAGE, the program starts a new page (NEW-PAGE).
After writing the report header it is initialized to 5 or 7 to account for the already-written header lines.
In SYLLST.cbl
It is used as the screen line position for LINE WS-LINE-COUNT COLUMN ... in the display layout.
It also helps calculate pagination while displaying a page of syllabus records, so the program knows when to show the next page and where to render lines.
So in short: WS-LINE-COUNT is used to count and position output lines, especially for page breaks and screen/report formatting.
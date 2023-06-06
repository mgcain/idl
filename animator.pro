PRO animator

    ; First, let's select the PNG files using a file dialog
    CD, 'D:\MGC Main Folders\NPL Programmes\MPP\MPP1.1 Proposal\MPP1.1 Thermal Images'
    filenames = DIALOG_PICKFILE (Filter='*.png', /Multiple)
    IF (filenames[0] EQ '') THEN RETURN ; check for cancel
    nFiles = N_ELEMENTS (filenames)

    ; Create the animation tool and set up the colour system
    DEVICE, Decomposed=0
    LOADCT, 3 ; red temperature
    XINTERANIMATE, Set=[320,256,nFiles], /Showload


    ; Now lets loop through the files ....

    FOR i = 0, nFiles - 1 DO BEGIN

        ; ... reading each into memory ...
        image = READ_PNG (filenames[i])

        ; ... processing it to make it look better ...
        ;image = HIST_EQUAL (image)

        ; ... and loading them into the animation tool
       XINTERANIMATE, Frame=i, Image=image

    ENDFOR

    ; Kick off the animation
    XINTERANIMATE

END
From: Florian Tobias Schandinat <FlorianSchandinat@gmx.de>
Subject: Re: [PATCH 1/8] fbdev/amifb: Correct whitespace
Date: Sun, 04 Dec 2011 00:35:14 +0000
Message-ID: <4EDAC042.7000005@gmx.de>
References: <1321908839-11419-1-git-send-email-geert@linux-m68k.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-m68k-owner@vger.kernel.org>
Received: from mailout-de.gmx.net ([213.165.64.22]:35255 "HELO
	mailout-de.gmx.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with SMTP id S1752627Ab1LDAfU (ORCPT
	<rfc822;linux-m68k@vger.kernel.org>); Sat, 3 Dec 2011 19:35:20 -0500
In-Reply-To: <1321908839-11419-1-git-send-email-geert@linux-m68k.org>
Sender: linux-m68k-owner@vger.kernel.org
List-Id: linux-m68k@vger.kernel.org
To: Geert Uytterhoeven <geert@linux-m68k.org>
Cc: linux-fbdev@vger.kernel.org, linux-m68k@vger.kernel.org, linux-kernel@vger.kernel.org

Hi Geert,

I applied all 8 patches of this series.


Thanks,

=46lorian Tobias Schandinat


On 11/21/2011 08:53 PM, Geert Uytterhoeven wrote:
>   - indentation
>   - spacing around binary operators
>=20
> No functional changes
>=20
> Signed-off-by: Geert Uytterhoeven <geert@linux-m68k.org>
> ---
>  drivers/video/amifb.c | 1186 +++++++++++++++++++++++++--------------=
----------
>  1 files changed, 606 insertions(+), 580 deletions(-)
>=20
> diff --git a/drivers/video/amifb.c b/drivers/video/amifb.c
> index 5ea6596..72454c7 100644
> --- a/drivers/video/amifb.c
> +++ b/drivers/video/amifb.c
> @@ -152,10 +152,10 @@
> =20
>        - hsstrt:   Start of horizontal synchronization pulse
>        - hsstop:   End of horizontal synchronization pulse
> -      - htotal:   Last value on the line (i.e. line length =3D htota=
l+1)
> +      - htotal:   Last value on the line (i.e. line length =3D htota=
l + 1)
>        - vsstrt:   Start of vertical synchronization pulse
>        - vsstop:   End of vertical synchronization pulse
> -      - vtotal:   Last line value (i.e. number of lines =3D vtotal+1=
)
> +      - vtotal:   Last line value (i.e. number of lines =3D vtotal +=
 1)
>        - hcenter:  Start of vertical retrace for interlace
> =20
>     You can specify the blanking timings independently. Currently I j=
ust set
> @@ -184,7 +184,7 @@
>     clock):
> =20
>        - diwstrt_h:   Horizontal start of the visible window
> -      - diwstop_h:   Horizontal stop+1(*) of the visible window
> +      - diwstop_h:   Horizontal stop + 1(*) of the visible window
>        - diwstrt_v:   Vertical start of the visible window
>        - diwstop_v:   Vertical stop of the visible window
>        - ddfstrt:     Horizontal start of display DMA
> @@ -193,7 +193,7 @@
> =20
>     Sprite positioning:
> =20
> -      - sprstrt_h:   Horizontal start-4 of sprite
> +      - sprstrt_h:   Horizontal start - 4 of sprite
>        - sprstrt_v:   Vertical start of sprite
> =20
>     (*) Even Commodore did it wrong in the AGA monitor drivers by not=
 adding 1.
> @@ -212,21 +212,21 @@
>     display parameters. Here's what I found out:
> =20
>        - ddfstrt and ddfstop are best aligned to 64 pixels.
> -      - the chipset needs 64+4 horizontal pixels after the DMA start=
 before the
> -        first pixel is output, so diwstrt_h =3D ddfstrt+64+4 if you =
want to
> -        display the first pixel on the line too. Increase diwstrt_h =
for virtual
> -        screen panning.
> +      - the chipset needs 64 + 4 horizontal pixels after the DMA sta=
rt before
> +	the first pixel is output, so diwstrt_h =3D ddfstrt + 64 + 4 if you=
 want
> +	to display the first pixel on the line too. Increase diwstrt_h for
> +	virtual screen panning.
>        - the display DMA always fetches 64 pixels at a time (fmode =3D=
 3).
> -      - ddfstop is ddfstrt+#pixels-64.
> -      - diwstop_h =3D diwstrt_h+xres+1. Because of the additional 1 =
this can be 1
> -        more than htotal.
> +      - ddfstop is ddfstrt+#pixels - 64.
> +      - diwstop_h =3D diwstrt_h + xres + 1. Because of the additiona=
l 1 this can
> +	be 1 more than htotal.
>        - hscroll simply adds a delay to the display output. Smooth ho=
rizontal
> -        panning needs an extra 64 pixels on the left to prefetch the=
 pixels that
> -        `fall off' on the left.
> +	panning needs an extra 64 pixels on the left to prefetch the pixels=
 that
> +	`fall off' on the left.
>        - if ddfstrt < 192, the sprite DMA cycles are all stolen by th=
e bitplane
> -        DMA, so it's best to make the DMA start as late as possible.
> +	DMA, so it's best to make the DMA start as late as possible.
>        - you really don't want to make ddfstrt < 128, since this will=
 steal DMA
> -        cycles from the other DMA channels (audio, floppy and Chip R=
AM refresh).
> +	cycles from the other DMA channels (audio, floppy and Chip RAM refr=
esh).
>        - I make diwstop_h and diwstop_v as large as possible.
> =20
>     General dependencies
> @@ -234,8 +234,8 @@
> =20
>        - all values are SHRES pixel (35ns)
> =20
> -                  table 1:fetchstart  table 2:prefetch    table 3:fe=
tchsize
> -                  ------------------  ----------------    ----------=
-------
> +		  table 1:fetchstart  table 2:prefetch    table 3:fetchsize
> +		  ------------------  ----------------    -----------------
>     Pixclock     # SHRES|HIRES|LORES # SHRES|HIRES|LORES # SHRES|HIRE=
S|LORES
>     -------------#------+-----+------#------+-----+------#------+----=
-+------
>     Bus width 1x #   16 |  32 |  64  #   16 |  32 |  64  #   64 |  64=
 |  64
> @@ -245,21 +245,21 @@
>        - chipset needs 4 pixels before the first pixel is output
>        - ddfstrt must be aligned to fetchstart (table 1)
>        - chipset needs also prefetch (table 2) to get first pixel dat=
a, so
> -        ddfstrt =3D ((diwstrt_h-4) & -fetchstart) - prefetch
> +	ddfstrt =3D ((diwstrt_h - 4) & -fetchstart) - prefetch
>        - for horizontal panning decrease diwstrt_h
>        - the length of a fetchline must be aligned to fetchsize (tabl=
e 3)
>        - if fetchstart is smaller than fetchsize, then ddfstrt can a =
little bit
> -        moved to optimize use of dma (useful for OCS/ECS overscan di=
splays)
> -      - ddfstop is ddfstrt+ddfsize-fetchsize
> +	moved to optimize use of dma (useful for OCS/ECS overscan displays)
> +      - ddfstop is ddfstrt + ddfsize - fetchsize
>        - If C=3D didn't change anything for AGA, then at following po=
sitions the
> -        dma bus is already used:
> -        ddfstrt <  48 -> memory refresh
> -                <  96 -> disk dma
> -                < 160 -> audio dma
> -                < 192 -> sprite 0 dma
> -                < 416 -> sprite dma (32 per sprite)
> +	dma bus is already used:
> +	ddfstrt <  48 -> memory refresh
> +		<  96 -> disk dma
> +		< 160 -> audio dma
> +		< 192 -> sprite 0 dma
> +		< 416 -> sprite dma (32 per sprite)
>        - in accordance with the hardware reference manual a hardware =
stop is at
> -        192, but AGA (ECS?) can go below this.
> +	192, but AGA (ECS?) can go below this.
> =20
>     DMA priorities
>     --------------
> @@ -269,7 +269,7 @@
>     the hardware cursor:
> =20
>        - if you want to start display DMA too early, you lose the abi=
lity to
> -        do smooth horizontal panning (xpanstep 1 -> 64).
> +	do smooth horizontal panning (xpanstep 1 -> 64).
>        - if you want to go even further, you lose the hardware cursor=
 too.
> =20
>     IMHO a hardware cursor is more important for X than horizontal sc=
rolling,
> @@ -286,8 +286,8 @@
>     Standard VGA timings
>     --------------------
> =20
> -               xres  yres    left  right  upper  lower    hsync    v=
sync
> -               ----  ----    ----  -----  -----  -----    -----    -=
----
> +	       xres  yres    left  right  upper  lower    hsync    vsync
> +	       ----  ----    ----  -----  -----  -----    -----    -----
>        80x25     720   400      27     45     35     12      108     =
   2
>        80x30     720   480      27     45     30      9      108     =
   2
> =20
> @@ -297,8 +297,8 @@
> =20
>     As a comparison, graphics/monitor.h suggests the following:
> =20
> -               xres  yres    left  right  upper  lower    hsync    v=
sync
> -               ----  ----    ----  -----  -----  -----    -----    -=
----
> +	       xres  yres    left  right  upper  lower    hsync    vsync
> +	       ----  ----    ----  -----  -----  -----    -----    -----
> =20
>        VGA       640   480      52    112     24     19    112 -     =
 2 +
>        VGA70     640   400      52    112     27     21    112 -     =
 2 -
> @@ -309,10 +309,10 @@
> =20
>        VSYNC    HSYNC    Vertical size    Vertical total
>        -----    -----    -------------    --------------
> -        +        +           Reserved          Reserved
> -        +        -                400               414
> -        -        +                350               362
> -        -        -                480               496
> +	+        +           Reserved          Reserved
> +	+        -                400               414
> +	-        +                350               362
> +	-        -                480               496
> =20
>     Source: CL-GD542X Technical Reference Manual, Cirrus Logic, Oct 1=
992
> =20
> @@ -326,33 +326,34 @@
>     -----------
> =20
>        - a scanline is 64 =C2=B5s long, of which 52.48 =C2=B5s are vi=
sible. This is about
> -        736 visible 70 ns pixels per line.
> +	736 visible 70 ns pixels per line.
>        - we have 625 scanlines, of which 575 are visible (interlaced)=
; after
> -        rounding this becomes 576.
> +	rounding this becomes 576.
> =20
>     RETMA -> NTSC
>     -------------
> =20
>        - a scanline is 63.5 =C2=B5s long, of which 53.5 =C2=B5s are v=
isible.  This is about
> -        736 visible 70 ns pixels per line.
> +	736 visible 70 ns pixels per line.
>        - we have 525 scanlines, of which 485 are visible (interlaced)=
; after
> -        rounding this becomes 484.
> +	rounding this becomes 484.
> =20
>     Thus if you want a PAL compatible display, you have to do the fol=
lowing:
> =20
>        - set the FB_SYNC_BROADCAST flag to indicate that standard bro=
adcast
> -        timings are to be used.
> -      - make sure upper_margin+yres+lower_margin+vsync_len =3D 625 f=
or an
> -        interlaced, 312 for a non-interlaced and 156 for a doublesca=
nned
> -        display.
> -      - make sure left_margin+xres+right_margin+hsync_len =3D 1816 f=
or a SHRES,
> -        908 for a HIRES and 454 for a LORES display.
> +	timings are to be used.
> +      - make sure upper_margin + yres + lower_margin + vsync_len =3D=
 625 for an
> +	interlaced, 312 for a non-interlaced and 156 for a doublescanned
> +	display.
> +      - make sure left_margin + xres + right_margin + hsync_len =3D =
1816 for a
> +	SHRES, 908 for a HIRES and 454 for a LORES display.
>        - the left visible part begins at 360 (SHRES; HIRES:180, LORES=
:90),
> -        left_margin+2*hsync_len must be greater or equal.
> +	left_margin + 2 * hsync_len must be greater or equal.
>        - the upper visible part begins at 48 (interlaced; non-interla=
ced:24,
> -        doublescanned:12), upper_margin+2*vsync_len must be greater =
or equal.
> +	doublescanned:12), upper_margin + 2 * vsync_len must be greater or
> +	equal.
>        - ami_encode_var() calculates margins with a hsync of 5320 ns =
and a vsync
> -        of 4 scanlines
> +	of 4 scanlines
> =20
>     The settings for a NTSC compatible display are straightforward.
> =20
> @@ -361,7 +362,7 @@
>     anything about horizontal/vertical synchronization nor refresh ra=
tes.
> =20
> =20
> -                                                            -- Geert=
 --
> +							    -- Geert --
> =20
>  ********************************************************************=
***********/
> =20
> @@ -540,45 +541,45 @@ static u_short maxfmode, chipset;
>  	 * Various macros
>  	 */
> =20
> -#define up2(v)		(((v)+1) & -2)
> +#define up2(v)		(((v) + 1) & -2)
>  #define down2(v)	((v) & -2)
>  #define div2(v)		((v)>>1)
>  #define mod2(v)		((v) & 1)
> =20
> -#define up4(v)		(((v)+3) & -4)
> +#define up4(v)		(((v) + 3) & -4)
>  #define down4(v)	((v) & -4)
> -#define mul4(v)		((v)<<2)
> +#define mul4(v)		((v) << 2)
>  #define div4(v)		((v)>>2)
>  #define mod4(v)		((v) & 3)
> =20
> -#define up8(v)		(((v)+7) & -8)
> +#define up8(v)		(((v) + 7) & -8)
>  #define down8(v)	((v) & -8)
>  #define div8(v)		((v)>>3)
>  #define mod8(v)		((v) & 7)
> =20
> -#define up16(v)		(((v)+15) & -16)
> +#define up16(v)		(((v) + 15) & -16)
>  #define down16(v)	((v) & -16)
>  #define div16(v)	((v)>>4)
>  #define mod16(v)	((v) & 15)
> =20
> -#define up32(v)		(((v)+31) & -32)
> +#define up32(v)		(((v) + 31) & -32)
>  #define down32(v)	((v) & -32)
>  #define div32(v)	((v)>>5)
>  #define mod32(v)	((v) & 31)
> =20
> -#define up64(v)		(((v)+63) & -64)
> +#define up64(v)		(((v) + 63) & -64)
>  #define down64(v)	((v) & -64)
>  #define div64(v)	((v)>>6)
>  #define mod64(v)	((v) & 63)
> =20
> -#define upx(x,v)	(((v)+(x)-1) & -(x))
> -#define downx(x,v)	((v) & -(x))
> -#define modx(x,v)	((v) & ((x)-1))
> +#define upx(x, v)	(((v) + (x) - 1) & -(x))
> +#define downx(x, v)	((v) & -(x))
> +#define modx(x, v)	((v) & ((x) - 1))
> =20
>  /* if x1 is not a constant, this macro won't make real sense :-) */
>  #ifdef __mc68000__
>  #define DIVUL(x1, x2) ({int res; asm("divul %1,%2,%3": "=3Dd" (res):=
 \
> -	"d" (x2), "d" ((long)((x1)/0x100000000ULL)), "0" ((long)(x1))); res=
;})
> +	"d" (x2), "d" ((long)((x1) / 0x100000000ULL)), "0" ((long)(x1))); r=
es;})
>  #else
>  /* We know a bit about the numbers, so we can do it this way */
>  #define DIVUL(x1, x2) ((((long)((unsigned long long)x1 >> 8) / x2) <=
< 8) + \
> @@ -607,7 +608,7 @@ static u_short maxfmode, chipset;
>  #define VIDEOMEMSIZE_ECS_1M	(393216)  /* ECS (1MB) : max 1024*768*16=
    */
>  #define VIDEOMEMSIZE_OCS	(262144)  /* OCS       : max ca. 800*600*16=
 */
> =20
> -#define SPRITEMEMSIZE		(64*64/4) /* max 64*64*4 */
> +#define SPRITEMEMSIZE		(64 * 64 / 4) /* max 64*64*4 */
>  #define DUMMYSPRITEMEMSIZE	(8)
>  static u_long spritememory;
> =20
> @@ -634,9 +635,9 @@ static u_long min_fstrt =3D 192;
>  	 * Copper Instructions
>  	 */
> =20
> -#define CMOVE(val, reg)		(CUSTOM_OFS(reg)<<16 | (val))
> -#define CMOVE2(val, reg)	((CUSTOM_OFS(reg)+2)<<16 | (val))
> -#define CWAIT(x, y)		(((y) & 0x1fe)<<23 | ((x) & 0x7f0)<<13 | 0x0001=
fffe)
> +#define CMOVE(val, reg)		(CUSTOM_OFS(reg) << 16 | (val))
> +#define CMOVE2(val, reg)	((CUSTOM_OFS(reg) + 2) << 16 | (val))
> +#define CWAIT(x, y)		(((y) & 0x1fe) << 23 | ((x) & 0x7f0) << 13 | 0x=
0001fffe)
>  #define CEND			(0xfffffffe)
> =20
> =20
> @@ -776,11 +777,11 @@ static struct amifb_par {
> =20
> =20
>  static struct fb_info fb_info =3D {
> -    .fix =3D {
> -	.id		=3D "Amiga ",
> -	.visual		=3D FB_VISUAL_PSEUDOCOLOR,
> -	.accel		=3D FB_ACCEL_AMIGABLITT
> -    }
> +	.fix =3D {
> +		.id		=3D "Amiga ",
> +		.visual		=3D FB_VISUAL_PSEUDOCOLOR,
> +		.accel		=3D FB_ACCEL_AMIGABLITT
> +	}
>  };
> =20
> =20
> @@ -820,116 +821,123 @@ static u_short is_lace =3D 0;		/* Screen is l=
aced */
> =20
>  static struct fb_videomode ami_modedb[] __initdata =3D {
> =20
> -    /*
> -     *  AmigaOS Video Modes
> -     *
> -     *  If you change these, make sure to update DEFMODE_* as well!
> -     */
> -
> -    {
> -	/* 640x200, 15 kHz, 60 Hz (NTSC) */
> -	"ntsc", 60, 640, 200, TAG_HIRES, 106, 86, 44, 16, 76, 2,
> -	FB_SYNC_BROADCAST, FB_VMODE_NONINTERLACED | FB_VMODE_YWRAP
> -    }, {
> -	/* 640x400, 15 kHz, 60 Hz interlaced (NTSC) */
> -	"ntsc-lace", 60, 640, 400, TAG_HIRES, 106, 86, 88, 33, 76, 4,
> -	FB_SYNC_BROADCAST, FB_VMODE_INTERLACED | FB_VMODE_YWRAP
> -    }, {
> -	/* 640x256, 15 kHz, 50 Hz (PAL) */
> -	"pal", 50, 640, 256, TAG_HIRES, 106, 86, 40, 14, 76, 2,
> -	FB_SYNC_BROADCAST, FB_VMODE_NONINTERLACED | FB_VMODE_YWRAP
> -    }, {
> -	/* 640x512, 15 kHz, 50 Hz interlaced (PAL) */
> -	"pal-lace", 50, 640, 512, TAG_HIRES, 106, 86, 80, 29, 76, 4,
> -	FB_SYNC_BROADCAST, FB_VMODE_INTERLACED | FB_VMODE_YWRAP
> -    }, {
> -	/* 640x480, 29 kHz, 57 Hz */
> -	"multiscan", 57, 640, 480, TAG_SHRES, 96, 112, 29, 8, 72, 8,
> -	0, FB_VMODE_NONINTERLACED | FB_VMODE_YWRAP
> -    }, {
> -	/* 640x960, 29 kHz, 57 Hz interlaced */
> -	"multiscan-lace", 57, 640, 960, TAG_SHRES, 96, 112, 58, 16, 72, 16,
> -	0, FB_VMODE_INTERLACED | FB_VMODE_YWRAP
> -    }, {
> -	/* 640x200, 15 kHz, 72 Hz */
> -	"euro36", 72, 640, 200, TAG_HIRES, 92, 124, 6, 6, 52, 5,
> -	0, FB_VMODE_NONINTERLACED | FB_VMODE_YWRAP
> -    }, {
> -	/* 640x400, 15 kHz, 72 Hz interlaced */
> -	"euro36-lace", 72, 640, 400, TAG_HIRES, 92, 124, 12, 12, 52, 10,
> -	0, FB_VMODE_INTERLACED | FB_VMODE_YWRAP
> -    }, {
> -	/* 640x400, 29 kHz, 68 Hz */
> -	"euro72", 68, 640, 400, TAG_SHRES, 164, 92, 9, 9, 80, 8,
> -	0, FB_VMODE_NONINTERLACED | FB_VMODE_YWRAP
> -    }, {
> -	/* 640x800, 29 kHz, 68 Hz interlaced */
> -	"euro72-lace", 68, 640, 800, TAG_SHRES, 164, 92, 18, 18, 80, 16,
> -	0, FB_VMODE_INTERLACED | FB_VMODE_YWRAP
> -    }, {
> -	/* 800x300, 23 kHz, 70 Hz */
> -	"super72", 70, 800, 300, TAG_SHRES, 212, 140, 10, 11, 80, 7,
> -	0, FB_VMODE_NONINTERLACED | FB_VMODE_YWRAP
> -    }, {
> -	/* 800x600, 23 kHz, 70 Hz interlaced */
> -	"super72-lace", 70, 800, 600, TAG_SHRES, 212, 140, 20, 22, 80, 14,
> -	0, FB_VMODE_INTERLACED | FB_VMODE_YWRAP
> -    }, {
> -	/* 640x200, 27 kHz, 57 Hz doublescan */
> -	"dblntsc", 57, 640, 200, TAG_SHRES, 196, 124, 18, 17, 80, 4,
> -	0, FB_VMODE_DOUBLE | FB_VMODE_YWRAP
> -    }, {
> -	/* 640x400, 27 kHz, 57 Hz */
> -	"dblntsc-ff", 57, 640, 400, TAG_SHRES, 196, 124, 36, 35, 80, 7,
> -	0, FB_VMODE_NONINTERLACED | FB_VMODE_YWRAP
> -    }, {
> -	/* 640x800, 27 kHz, 57 Hz interlaced */
> -	"dblntsc-lace", 57, 640, 800, TAG_SHRES, 196, 124, 72, 70, 80, 14,
> -	0, FB_VMODE_INTERLACED | FB_VMODE_YWRAP
> -    }, {
> -	/* 640x256, 27 kHz, 47 Hz doublescan */
> -	"dblpal", 47, 640, 256, TAG_SHRES, 196, 124, 14, 13, 80, 4,
> -	0, FB_VMODE_DOUBLE | FB_VMODE_YWRAP
> -    }, {
> -	/* 640x512, 27 kHz, 47 Hz */
> -	"dblpal-ff", 47, 640, 512, TAG_SHRES, 196, 124, 28, 27, 80, 7,
> -	0, FB_VMODE_NONINTERLACED | FB_VMODE_YWRAP
> -    }, {
> -	/* 640x1024, 27 kHz, 47 Hz interlaced */
> -	"dblpal-lace", 47, 640, 1024, TAG_SHRES, 196, 124, 56, 54, 80, 14,
> -	0, FB_VMODE_INTERLACED | FB_VMODE_YWRAP
> -    },
> -
> -    /*
> -     *  VGA Video Modes
> -     */
> -
> -    {
> -	/* 640x480, 31 kHz, 60 Hz (VGA) */
> -	"vga", 60, 640, 480, TAG_SHRES, 64, 96, 30, 9, 112, 2,
> -	0, FB_VMODE_NONINTERLACED | FB_VMODE_YWRAP
> -    }, {
> -	/* 640x400, 31 kHz, 70 Hz (VGA) */
> -	"vga70", 70, 640, 400, TAG_SHRES, 64, 96, 35, 12, 112, 2,
> -	FB_SYNC_VERT_HIGH_ACT | FB_SYNC_COMP_HIGH_ACT, FB_VMODE_NONINTERLAC=
ED | FB_VMODE_YWRAP
> -    },
> +	/*
> +	 *  AmigaOS Video Modes
> +	 *
> +	 *  If you change these, make sure to update DEFMODE_* as well!
> +	 */
> +
> +	{
> +		/* 640x200, 15 kHz, 60 Hz (NTSC) */
> +		"ntsc", 60, 640, 200, TAG_HIRES, 106, 86, 44, 16, 76, 2,
> +		FB_SYNC_BROADCAST, FB_VMODE_NONINTERLACED | FB_VMODE_YWRAP
> +	}, {
> +		/* 640x400, 15 kHz, 60 Hz interlaced (NTSC) */
> +		"ntsc-lace", 60, 640, 400, TAG_HIRES, 106, 86, 88, 33, 76, 4,
> +		FB_SYNC_BROADCAST, FB_VMODE_INTERLACED | FB_VMODE_YWRAP
> +	}, {
> +		/* 640x256, 15 kHz, 50 Hz (PAL) */
> +		"pal", 50, 640, 256, TAG_HIRES, 106, 86, 40, 14, 76, 2,
> +		FB_SYNC_BROADCAST, FB_VMODE_NONINTERLACED | FB_VMODE_YWRAP
> +	}, {
> +		/* 640x512, 15 kHz, 50 Hz interlaced (PAL) */
> +		"pal-lace", 50, 640, 512, TAG_HIRES, 106, 86, 80, 29, 76, 4,
> +		FB_SYNC_BROADCAST, FB_VMODE_INTERLACED | FB_VMODE_YWRAP
> +	}, {
> +		/* 640x480, 29 kHz, 57 Hz */
> +		"multiscan", 57, 640, 480, TAG_SHRES, 96, 112, 29, 8, 72, 8,
> +		0, FB_VMODE_NONINTERLACED | FB_VMODE_YWRAP
> +	}, {
> +		/* 640x960, 29 kHz, 57 Hz interlaced */
> +		"multiscan-lace", 57, 640, 960, TAG_SHRES, 96, 112, 58, 16, 72,
> +		16,
> +		0, FB_VMODE_INTERLACED | FB_VMODE_YWRAP
> +	}, {
> +		/* 640x200, 15 kHz, 72 Hz */
> +		"euro36", 72, 640, 200, TAG_HIRES, 92, 124, 6, 6, 52, 5,
> +		0, FB_VMODE_NONINTERLACED | FB_VMODE_YWRAP
> +	}, {
> +		/* 640x400, 15 kHz, 72 Hz interlaced */
> +		"euro36-lace", 72, 640, 400, TAG_HIRES, 92, 124, 12, 12, 52,
> +		10,
> +		0, FB_VMODE_INTERLACED | FB_VMODE_YWRAP
> +	}, {
> +		/* 640x400, 29 kHz, 68 Hz */
> +		"euro72", 68, 640, 400, TAG_SHRES, 164, 92, 9, 9, 80, 8,
> +		0, FB_VMODE_NONINTERLACED | FB_VMODE_YWRAP
> +	}, {
> +		/* 640x800, 29 kHz, 68 Hz interlaced */
> +		"euro72-lace", 68, 640, 800, TAG_SHRES, 164, 92, 18, 18, 80,
> +		16,
> +		0, FB_VMODE_INTERLACED | FB_VMODE_YWRAP
> +	}, {
> +		/* 800x300, 23 kHz, 70 Hz */
> +		"super72", 70, 800, 300, TAG_SHRES, 212, 140, 10, 11, 80, 7,
> +		0, FB_VMODE_NONINTERLACED | FB_VMODE_YWRAP
> +	}, {
> +		/* 800x600, 23 kHz, 70 Hz interlaced */
> +		"super72-lace", 70, 800, 600, TAG_SHRES, 212, 140, 20, 22, 80,
> +		14,
> +		0, FB_VMODE_INTERLACED | FB_VMODE_YWRAP
> +	}, {
> +		/* 640x200, 27 kHz, 57 Hz doublescan */
> +		"dblntsc", 57, 640, 200, TAG_SHRES, 196, 124, 18, 17, 80, 4,
> +		0, FB_VMODE_DOUBLE | FB_VMODE_YWRAP
> +	}, {
> +		/* 640x400, 27 kHz, 57 Hz */
> +		"dblntsc-ff", 57, 640, 400, TAG_SHRES, 196, 124, 36, 35, 80, 7,
> +		0, FB_VMODE_NONINTERLACED | FB_VMODE_YWRAP
> +	}, {
> +		/* 640x800, 27 kHz, 57 Hz interlaced */
> +		"dblntsc-lace", 57, 640, 800, TAG_SHRES, 196, 124, 72, 70, 80,
> +		14,
> +		0, FB_VMODE_INTERLACED | FB_VMODE_YWRAP
> +	}, {
> +		/* 640x256, 27 kHz, 47 Hz doublescan */
> +		"dblpal", 47, 640, 256, TAG_SHRES, 196, 124, 14, 13, 80, 4,
> +		0, FB_VMODE_DOUBLE | FB_VMODE_YWRAP
> +	}, {
> +		/* 640x512, 27 kHz, 47 Hz */
> +		"dblpal-ff", 47, 640, 512, TAG_SHRES, 196, 124, 28, 27, 80, 7,
> +		0, FB_VMODE_NONINTERLACED | FB_VMODE_YWRAP
> +	}, {
> +		/* 640x1024, 27 kHz, 47 Hz interlaced */
> +		"dblpal-lace", 47, 640, 1024, TAG_SHRES, 196, 124, 56, 54, 80,
> +		14,
> +		0, FB_VMODE_INTERLACED | FB_VMODE_YWRAP
> +	},
> +
> +	/*
> +	 *  VGA Video Modes
> +	 */
> +
> +	{
> +		/* 640x480, 31 kHz, 60 Hz (VGA) */
> +		"vga", 60, 640, 480, TAG_SHRES, 64, 96, 30, 9, 112, 2,
> +		0, FB_VMODE_NONINTERLACED | FB_VMODE_YWRAP
> +	}, {
> +		/* 640x400, 31 kHz, 70 Hz (VGA) */
> +		"vga70", 70, 640, 400, TAG_SHRES, 64, 96, 35, 12, 112, 2,
> +		FB_SYNC_VERT_HIGH_ACT | FB_SYNC_COMP_HIGH_ACT,
> +		FB_VMODE_NONINTERLACED | FB_VMODE_YWRAP
> +	},
> =20
>  #if 0
> =20
> -    /*
> -     *  A2024 video modes
> -     *  These modes don't work yet because there's no A2024 driver.
> -     */
> -
> -    {
> -	/* 1024x800, 10 Hz */
> -	"a2024-10", 10, 1024, 800, TAG_HIRES, 0, 0, 0, 0, 0, 0,
> -	0, FB_VMODE_NONINTERLACED | FB_VMODE_YWRAP
> -    }, {
> -	/* 1024x800, 15 Hz */
> -	"a2024-15", 15, 1024, 800, TAG_HIRES, 0, 0, 0, 0, 0, 0,
> -	0, FB_VMODE_NONINTERLACED | FB_VMODE_YWRAP
> -    }
> +	/*
> +	 *  A2024 video modes
> +	 *  These modes don't work yet because there's no A2024 driver.
> +	 */
> +
> +	{
> +		/* 1024x800, 10 Hz */
> +		"a2024-10", 10, 1024, 800, TAG_HIRES, 0, 0, 0, 0, 0, 0,
> +		0, FB_VMODE_NONINTERLACED | FB_VMODE_YWRAP
> +	}, {
> +		/* 1024x800, 15 Hz */
> +		"a2024-15", 15, 1024, 800, TAG_HIRES, 0, 0, 0, 0, 0, 0,
> +		0, FB_VMODE_NONINTERLACED | FB_VMODE_YWRAP
> +	}
>  #endif
>  };
> =20
> @@ -992,19 +1000,20 @@ static int amifb_inverse =3D 0;
>  /* bplcon1 (smooth scrolling) */
> =20
>  #define hscroll2hw(hscroll) \
> -	(((hscroll)<<12 & 0x3000) | ((hscroll)<<8 & 0xc300) | \
> -	 ((hscroll)<<4 & 0x0c00) | ((hscroll)<<2 & 0x00f0) | ((hscroll)>>2 =
& 0x000f))
> +	(((hscroll) << 12 & 0x3000) | ((hscroll) << 8 & 0xc300) | \
> +	 ((hscroll) << 4 & 0x0c00) | ((hscroll) << 2 & 0x00f0) | \
> +	 ((hscroll)>>2 & 0x000f))
> =20
>  /* diwstrt/diwstop/diwhigh (visible display window) */
> =20
>  #define diwstrt2hw(diwstrt_h, diwstrt_v) \
> -	(((diwstrt_v)<<7 & 0xff00) | ((diwstrt_h)>>2 & 0x00ff))
> +	(((diwstrt_v) << 7 & 0xff00) | ((diwstrt_h)>>2 & 0x00ff))
>  #define diwstop2hw(diwstop_h, diwstop_v) \
> -	(((diwstop_v)<<7 & 0xff00) | ((diwstop_h)>>2 & 0x00ff))
> +	(((diwstop_v) << 7 & 0xff00) | ((diwstop_h)>>2 & 0x00ff))
>  #define diwhigh2hw(diwstrt_h, diwstrt_v, diwstop_h, diwstop_v) \
> -	(((diwstop_h)<<3 & 0x2000) | ((diwstop_h)<<11 & 0x1800) | \
> +	(((diwstop_h) << 3 & 0x2000) | ((diwstop_h) << 11 & 0x1800) | \
>  	 ((diwstop_v)>>1 & 0x0700) | ((diwstrt_h)>>5 & 0x0020) | \
> -	 ((diwstrt_h)<<3 & 0x0018) | ((diwstrt_v)>>9 & 0x0007))
> +	 ((diwstrt_h) << 3 & 0x0018) | ((diwstrt_v)>>9 & 0x0007))
> =20
>  /* ddfstrt/ddfstop (display DMA) */
> =20
> @@ -1015,38 +1024,39 @@ static int amifb_inverse =3D 0;
> =20
>  #define hsstrt2hw(hsstrt)	(div8(hsstrt))
>  #define hsstop2hw(hsstop)	(div8(hsstop))
> -#define htotal2hw(htotal)	(div8(htotal)-1)
> +#define htotal2hw(htotal)	(div8(htotal) - 1)
>  #define vsstrt2hw(vsstrt)	(div2(vsstrt))
>  #define vsstop2hw(vsstop)	(div2(vsstop))
> -#define vtotal2hw(vtotal)	(div2(vtotal)-1)
> +#define vtotal2hw(vtotal)	(div2(vtotal) - 1)
>  #define hcenter2hw(htotal)	(div8(htotal))
> =20
>  /* hbstrt/hbstop/vbstrt/vbstop (blanking timings) */
> =20
> -#define hbstrt2hw(hbstrt)	(((hbstrt)<<8 & 0x0700) | ((hbstrt)>>3 & 0=
x00ff))
> -#define hbstop2hw(hbstop)	(((hbstop)<<8 & 0x0700) | ((hbstop)>>3 & 0=
x00ff))
> +#define hbstrt2hw(hbstrt)	(((hbstrt) << 8 & 0x0700) | ((hbstrt)>>3 &=
 0x00ff))
> +#define hbstop2hw(hbstop)	(((hbstop) << 8 & 0x0700) | ((hbstop)>>3 &=
 0x00ff))
>  #define vbstrt2hw(vbstrt)	(div2(vbstrt))
>  #define vbstop2hw(vbstop)	(div2(vbstop))
> =20
>  /* colour */
> =20
>  #define rgb2hw8_high(red, green, blue) \
> -	(((red & 0xf0)<<4) | (green & 0xf0) | ((blue & 0xf0)>>4))
> +	(((red & 0xf0) << 4) | (green & 0xf0) | ((blue & 0xf0)>>4))
>  #define rgb2hw8_low(red, green, blue) \
> -	(((red & 0x0f)<<8) | ((green & 0x0f)<<4) | (blue & 0x0f))
> +	(((red & 0x0f) << 8) | ((green & 0x0f) << 4) | (blue & 0x0f))
>  #define rgb2hw4(red, green, blue) \
> -	(((red & 0xf0)<<4) | (green & 0xf0) | ((blue & 0xf0)>>4))
> +	(((red & 0xf0) << 4) | (green & 0xf0) | ((blue & 0xf0)>>4))
>  #define rgb2hw2(red, green, blue) \
> -	(((red & 0xc0)<<4) | (green & 0xc0) | ((blue & 0xc0)>>4))
> +	(((red & 0xc0) << 4) | (green & 0xc0) | ((blue & 0xc0)>>4))
> =20
>  /* sprpos/sprctl (sprite positioning) */
> =20
>  #define spr2hw_pos(start_v, start_h) \
> -	(((start_v)<<7&0xff00) | ((start_h)>>3&0x00ff))
> +	(((start_v) << 7 & 0xff00) | ((start_h)>>3 & 0x00ff))
>  #define spr2hw_ctl(start_v, start_h, stop_v) \
> -	(((stop_v)<<7&0xff00) | ((start_v)>>4&0x0040) | ((stop_v)>>5&0x0020=
) | \
> -	 ((start_h)<<3&0x0018) | ((start_v)>>7&0x0004) | ((stop_v)>>8&0x000=
2) | \
> -	 ((start_h)>>2&0x0001))
> +	(((stop_v) << 7 & 0xff00) | ((start_v)>>4 & 0x0040) | \
> +	 ((stop_v)>>5 & 0x0020) | ((start_h) << 3 & 0x0018) | \
> +	 ((start_v)>>7 & 0x0004) | ((stop_v)>>8 & 0x0002) | \
> +	 ((start_h)>>2 & 0x0001))
> =20
>  /* get current vertical position of beam */
>  #define get_vbpos()	((u_short)((*(u_long volatile *)&custom.vposr >>=
 7) & 0xffe))
> @@ -1055,7 +1065,7 @@ static int amifb_inverse =3D 0;
>  	 * Copper Initialisation List
>  	 */
> =20
> -#define COPINITSIZE (sizeof(copins)*40)
> +#define COPINITSIZE (sizeof(copins) * 40)
> =20
>  enum {
>  	cip_bplcon0
> @@ -1066,7 +1076,7 @@ enum {
>  	 * Don't change the order, build_copper()/rebuild_copper() rely on =
this
>  	 */
> =20
> -#define COPLISTSIZE (sizeof(copins)*64)
> +#define COPLISTSIZE (sizeof(copins) * 64)
> =20
>  enum {
>  	cop_wait, cop_bplcon0,
> @@ -1152,9 +1162,9 @@ static void chipfree(void);
>  	 */
> =20
>  static int ami_decode_var(struct fb_var_screeninfo *var,
> -                          struct amifb_par *par);
> +			  struct amifb_par *par);
>  static int ami_encode_var(struct fb_var_screeninfo *var,
> -                          struct amifb_par *par);
> +			  struct amifb_par *par);
>  static void ami_pan_var(struct fb_var_screeninfo *var);
>  static int ami_update_par(void);
>  static void ami_update_display(void);
> @@ -1238,9 +1248,9 @@ int __init amifb_setup(char *options)
>  		} else if (!strcmp(this_opt, "ilbm"))
>  			amifb_ilbm =3D 1;
>  		else if (!strncmp(this_opt, "monitorcap:", 11))
> -			amifb_setup_mcap(this_opt+11);
> +			amifb_setup_mcap(this_opt + 11);
>  		else if (!strncmp(this_opt, "fstart:", 7))
> -			min_fstrt =3D simple_strtoul(this_opt+7, NULL, 0);
> +			min_fstrt =3D simple_strtoul(this_opt + 7, NULL, 0);
>  		else
>  			mode_option =3D this_opt;
>  	}
> @@ -1295,20 +1305,20 @@ static int amifb_set_par(struct fb_info *info=
)
>  		info->fix.type =3D FB_TYPE_PLANES;
>  		info->fix.type_aux =3D 0;
>  	}
> -	info->fix.line_length =3D div8(upx(16<<maxfmode, par->vxres));
> +	info->fix.line_length =3D div8(upx(16 << maxfmode, par->vxres));
> =20
>  	if (par->vmode & FB_VMODE_YWRAP) {
>  		info->fix.ywrapstep =3D 1;
>  		info->fix.xpanstep =3D 0;
>  		info->fix.ypanstep =3D 0;
>  		info->flags =3D FBINFO_DEFAULT | FBINFO_HWACCEL_YWRAP |
> -		    FBINFO_READS_FAST; /* override SCROLL_REDRAW */
> +			FBINFO_READS_FAST; /* override SCROLL_REDRAW */
>  	} else {
>  		info->fix.ywrapstep =3D 0;
>  		if (par->vmode & FB_VMODE_SMOOTH_XPAN)
>  			info->fix.xpanstep =3D 1;
>  		else
> -			info->fix.xpanstep =3D 16<<maxfmode;
> +			info->fix.xpanstep =3D 16 << maxfmode;
>  		info->fix.ypanstep =3D 1;
>  		info->flags =3D FBINFO_DEFAULT | FBINFO_HWACCEL_YPAN;
>  	}
> @@ -1327,15 +1337,16 @@ static int amifb_pan_display(struct fb_var_sc=
reeninfo *var,
>  {
>  	if (var->vmode & FB_VMODE_YWRAP) {
>  		if (var->yoffset < 0 ||
> -		    var->yoffset >=3D info->var.yres_virtual || var->xoffset)
> -			return -EINVAL;
> +			var->yoffset >=3D info->var.yres_virtual || var->xoffset)
> +				return -EINVAL;
>  	} else {
>  		/*
>  		 * TODO: There will be problems when xpan!=3D1, so some columns
>  		 * on the right side will never be seen
>  		 */
> -		if (var->xoffset+info->var.xres > upx(16<<maxfmode, info->var.xres=
_virtual) ||
> -		    var->yoffset+info->var.yres > info->var.yres_virtual)
> +		if (var->xoffset + info->var.xres >
> +		    upx(16 << maxfmode, info->var.xres_virtual) ||
> +		    var->yoffset + info->var.yres > info->var.yres_virtual)
>  			return -EINVAL;
>  	}
>  	ami_pan_var(var);
> @@ -1360,10 +1371,10 @@ static int amifb_pan_display(struct fb_var_sc=
reeninfo *var,
>  #endif
> =20
> =20
> -    /*
> -     *  Compose two values, using a bitmask as decision value
> -     *  This is equivalent to (a & mask) | (b & ~mask)
> -     */
> +	/*
> +	 *  Compose two values, using a bitmask as decision value
> +	 *  This is equivalent to (a & mask) | (b & ~mask)
> +	 */
> =20
>  static inline unsigned long comp(unsigned long a, unsigned long b,
>  				 unsigned long mask)
> @@ -1379,29 +1390,29 @@ static inline unsigned long xor(unsigned long=
 a, unsigned long b,
>  }
> =20
> =20
> -    /*
> -     *  Unaligned forward bit copy using 32-bit or 64-bit memory acc=
esses
> -     */
> +	/*
> +	 *  Unaligned forward bit copy using 32-bit or 64-bit memory access=
es
> +	 */
> =20
>  static void bitcpy(unsigned long *dst, int dst_idx, const unsigned l=
ong *src,
>  		   int src_idx, u32 n)
>  {
>  	unsigned long first, last;
> -	int shift =3D dst_idx-src_idx, left, right;
> +	int shift =3D dst_idx - src_idx, left, right;
>  	unsigned long d0, d1;
>  	int m;
> =20
>  	if (!n)
>  		return;
> =20
> -	shift =3D dst_idx-src_idx;
> +	shift =3D dst_idx - src_idx;
>  	first =3D ~0UL >> dst_idx;
> -	last =3D ~(~0UL >> ((dst_idx+n) % BITS_PER_LONG));
> +	last =3D ~(~0UL >> ((dst_idx + n) % BITS_PER_LONG));
> =20
>  	if (!shift) {
>  		// Same alignment for source and dest
> =20
> -		if (dst_idx+n <=3D BITS_PER_LONG) {
> +		if (dst_idx + n <=3D BITS_PER_LONG) {
>  			// Single word
>  			if (last)
>  				first &=3D last;
> @@ -1413,7 +1424,7 @@ static void bitcpy(unsigned long *dst, int dst_=
idx, const unsigned long *src,
>  				*dst =3D comp(*src, *dst, first);
>  				dst++;
>  				src++;
> -				n -=3D BITS_PER_LONG-dst_idx;
> +				n -=3D BITS_PER_LONG - dst_idx;
>  			}
> =20
>  			// Main chunk
> @@ -1439,17 +1450,17 @@ static void bitcpy(unsigned long *dst, int ds=
t_idx, const unsigned long *src,
>  	} else {
>  		// Different alignment for source and dest
> =20
> -		right =3D shift & (BITS_PER_LONG-1);
> -		left =3D -shift & (BITS_PER_LONG-1);
> +		right =3D shift & (BITS_PER_LONG - 1);
> +		left =3D -shift & (BITS_PER_LONG - 1);
> =20
> -		if (dst_idx+n <=3D BITS_PER_LONG) {
> +		if (dst_idx + n <=3D BITS_PER_LONG) {
>  			// Single destination word
>  			if (last)
>  				first &=3D last;
>  			if (shift > 0) {
>  				// Single source word
>  				*dst =3D comp(*src >> right, *dst, first);
> -			} else if (src_idx+n <=3D BITS_PER_LONG) {
> +			} else if (src_idx + n <=3D BITS_PER_LONG) {
>  				// Single source word
>  				*dst =3D comp(*src << left, *dst, first);
>  			} else {
> @@ -1467,7 +1478,7 @@ static void bitcpy(unsigned long *dst, int dst_=
idx, const unsigned long *src,
>  				// Single source word
>  				*dst =3D comp(d0 >> right, *dst, first);
>  				dst++;
> -				n -=3D BITS_PER_LONG-dst_idx;
> +				n -=3D BITS_PER_LONG - dst_idx;
>  			} else {
>  				// 2 source words
>  				d1 =3D *src++;
> @@ -1475,7 +1486,7 @@ static void bitcpy(unsigned long *dst, int dst_=
idx, const unsigned long *src,
>  					    first);
>  				d0 =3D d1;
>  				dst++;
> -				n -=3D BITS_PER_LONG-dst_idx;
> +				n -=3D BITS_PER_LONG - dst_idx;
>  			}
> =20
>  			// Main chunk
> @@ -1519,40 +1530,40 @@ static void bitcpy(unsigned long *dst, int ds=
t_idx, const unsigned long *src,
>  }
> =20
> =20
> -    /*
> -     *  Unaligned reverse bit copy using 32-bit or 64-bit memory acc=
esses
> -     */
> +	/*
> +	 *  Unaligned reverse bit copy using 32-bit or 64-bit memory access=
es
> +	 */
> =20
>  static void bitcpy_rev(unsigned long *dst, int dst_idx,
>  		       const unsigned long *src, int src_idx, u32 n)
>  {
>  	unsigned long first, last;
> -	int shift =3D dst_idx-src_idx, left, right;
> +	int shift =3D dst_idx - src_idx, left, right;
>  	unsigned long d0, d1;
>  	int m;
> =20
>  	if (!n)
>  		return;
> =20
> -	dst +=3D (n-1)/BITS_PER_LONG;
> -	src +=3D (n-1)/BITS_PER_LONG;
> -	if ((n-1) % BITS_PER_LONG) {
> -		dst_idx +=3D (n-1) % BITS_PER_LONG;
> +	dst +=3D (n - 1) / BITS_PER_LONG;
> +	src +=3D (n - 1) / BITS_PER_LONG;
> +	if ((n - 1) % BITS_PER_LONG) {
> +		dst_idx +=3D (n - 1) % BITS_PER_LONG;
>  		dst +=3D dst_idx >> SHIFT_PER_LONG;
> -		dst_idx &=3D BITS_PER_LONG-1;
> -		src_idx +=3D (n-1) % BITS_PER_LONG;
> +		dst_idx &=3D BITS_PER_LONG - 1;
> +		src_idx +=3D (n - 1) % BITS_PER_LONG;
>  		src +=3D src_idx >> SHIFT_PER_LONG;
> -		src_idx &=3D BITS_PER_LONG-1;
> +		src_idx &=3D BITS_PER_LONG - 1;
>  	}
> =20
> -	shift =3D dst_idx-src_idx;
> -	first =3D ~0UL << (BITS_PER_LONG-1-dst_idx);
> -	last =3D ~(~0UL << (BITS_PER_LONG-1-((dst_idx-n) % BITS_PER_LONG)))=
;
> +	shift =3D dst_idx - src_idx;
> +	first =3D ~0UL << (BITS_PER_LONG - 1 - dst_idx);
> +	last =3D ~(~0UL << (BITS_PER_LONG - 1 - ((dst_idx - n) % BITS_PER_L=
ONG)));
> =20
>  	if (!shift) {
>  		// Same alignment for source and dest
> =20
> -		if ((unsigned long)dst_idx+1 >=3D n) {
> +		if ((unsigned long)dst_idx + 1 >=3D n) {
>  			// Single word
>  			if (last)
>  				first &=3D last;
> @@ -1564,7 +1575,7 @@ static void bitcpy_rev(unsigned long *dst, int =
dst_idx,
>  				*dst =3D comp(*src, *dst, first);
>  				dst--;
>  				src--;
> -				n -=3D dst_idx+1;
> +				n -=3D dst_idx + 1;
>  			}
> =20
>  			// Main chunk
> @@ -1590,17 +1601,17 @@ static void bitcpy_rev(unsigned long *dst, in=
t dst_idx,
>  	} else {
>  		// Different alignment for source and dest
> =20
> -		right =3D shift & (BITS_PER_LONG-1);
> -		left =3D -shift & (BITS_PER_LONG-1);
> +		right =3D shift & (BITS_PER_LONG - 1);
> +		left =3D -shift & (BITS_PER_LONG - 1);
> =20
> -		if ((unsigned long)dst_idx+1 >=3D n) {
> +		if ((unsigned long)dst_idx + 1 >=3D n) {
>  			// Single destination word
>  			if (last)
>  				first &=3D last;
>  			if (shift < 0) {
>  				// Single source word
>  				*dst =3D comp(*src << left, *dst, first);
> -			} else if (1+(unsigned long)src_idx >=3D n) {
> +			} else if (1 + (unsigned long)src_idx >=3D n) {
>  				// Single source word
>  				*dst =3D comp(*src >> right, *dst, first);
>  			} else {
> @@ -1618,7 +1629,7 @@ static void bitcpy_rev(unsigned long *dst, int =
dst_idx,
>  				// Single source word
>  				*dst =3D comp(d0 << left, *dst, first);
>  				dst--;
> -				n -=3D dst_idx+1;
> +				n -=3D dst_idx + 1;
>  			} else {
>  				// 2 source words
>  				d1 =3D *src--;
> @@ -1626,7 +1637,7 @@ static void bitcpy_rev(unsigned long *dst, int =
dst_idx,
>  					    first);
>  				d0 =3D d1;
>  				dst--;
> -				n -=3D dst_idx+1;
> +				n -=3D dst_idx + 1;
>  			}
> =20
>  			// Main chunk
> @@ -1670,30 +1681,30 @@ static void bitcpy_rev(unsigned long *dst, in=
t dst_idx,
>  }
> =20
> =20
> -    /*
> -     *  Unaligned forward inverting bit copy using 32-bit or 64-bit =
memory
> -     *  accesses
> -     */
> +	/*
> +	 *  Unaligned forward inverting bit copy using 32-bit or 64-bit mem=
ory
> +	 *  accesses
> +	 */
> =20
>  static void bitcpy_not(unsigned long *dst, int dst_idx,
>  		       const unsigned long *src, int src_idx, u32 n)
>  {
>  	unsigned long first, last;
> -	int shift =3D dst_idx-src_idx, left, right;
> +	int shift =3D dst_idx - src_idx, left, right;
>  	unsigned long d0, d1;
>  	int m;
> =20
>  	if (!n)
>  		return;
> =20
> -	shift =3D dst_idx-src_idx;
> +	shift =3D dst_idx - src_idx;
>  	first =3D ~0UL >> dst_idx;
> -	last =3D ~(~0UL >> ((dst_idx+n) % BITS_PER_LONG));
> +	last =3D ~(~0UL >> ((dst_idx + n) % BITS_PER_LONG));
> =20
>  	if (!shift) {
>  		// Same alignment for source and dest
> =20
> -		if (dst_idx+n <=3D BITS_PER_LONG) {
> +		if (dst_idx + n <=3D BITS_PER_LONG) {
>  			// Single word
>  			if (last)
>  				first &=3D last;
> @@ -1705,7 +1716,7 @@ static void bitcpy_not(unsigned long *dst, int =
dst_idx,
>  				*dst =3D comp(~*src, *dst, first);
>  				dst++;
>  				src++;
> -				n -=3D BITS_PER_LONG-dst_idx;
> +				n -=3D BITS_PER_LONG - dst_idx;
>  			}
> =20
>  			// Main chunk
> @@ -1731,17 +1742,17 @@ static void bitcpy_not(unsigned long *dst, in=
t dst_idx,
>  	} else {
>  		// Different alignment for source and dest
> =20
> -		right =3D shift & (BITS_PER_LONG-1);
> -		left =3D -shift & (BITS_PER_LONG-1);
> +		right =3D shift & (BITS_PER_LONG - 1);
> +		left =3D -shift & (BITS_PER_LONG - 1);
> =20
> -		if (dst_idx+n <=3D BITS_PER_LONG) {
> +		if (dst_idx + n <=3D BITS_PER_LONG) {
>  			// Single destination word
>  			if (last)
>  				first &=3D last;
>  			if (shift > 0) {
>  				// Single source word
>  				*dst =3D comp(~*src >> right, *dst, first);
> -			} else if (src_idx+n <=3D BITS_PER_LONG) {
> +			} else if (src_idx + n <=3D BITS_PER_LONG) {
>  				// Single source word
>  				*dst =3D comp(~*src << left, *dst, first);
>  			} else {
> @@ -1759,7 +1770,7 @@ static void bitcpy_not(unsigned long *dst, int =
dst_idx,
>  				// Single source word
>  				*dst =3D comp(d0 >> right, *dst, first);
>  				dst++;
> -				n -=3D BITS_PER_LONG-dst_idx;
> +				n -=3D BITS_PER_LONG - dst_idx;
>  			} else {
>  				// 2 source words
>  				d1 =3D ~*src++;
> @@ -1767,7 +1778,7 @@ static void bitcpy_not(unsigned long *dst, int =
dst_idx,
>  					    first);
>  				d0 =3D d1;
>  				dst++;
> -				n -=3D BITS_PER_LONG-dst_idx;
> +				n -=3D BITS_PER_LONG - dst_idx;
>  			}
> =20
>  			// Main chunk
> @@ -1811,9 +1822,9 @@ static void bitcpy_not(unsigned long *dst, int =
dst_idx,
>  }
> =20
> =20
> -    /*
> -     *  Unaligned 32-bit pattern fill using 32/64-bit memory accesse=
s
> -     */
> +	/*
> +	 *  Unaligned 32-bit pattern fill using 32/64-bit memory accesses
> +	 */
> =20
>  static void bitfill32(unsigned long *dst, int dst_idx, u32 pat, u32 =
n)
>  {
> @@ -1828,9 +1839,9 @@ static void bitfill32(unsigned long *dst, int d=
st_idx, u32 pat, u32 n)
>  #endif
> =20
>  	first =3D ~0UL >> dst_idx;
> -	last =3D ~(~0UL >> ((dst_idx+n) % BITS_PER_LONG));
> +	last =3D ~(~0UL >> ((dst_idx + n) % BITS_PER_LONG));
> =20
> -	if (dst_idx+n <=3D BITS_PER_LONG) {
> +	if (dst_idx + n <=3D BITS_PER_LONG) {
>  		// Single word
>  		if (last)
>  			first &=3D last;
> @@ -1841,7 +1852,7 @@ static void bitfill32(unsigned long *dst, int d=
st_idx, u32 pat, u32 n)
>  		if (first) {
>  			*dst =3D comp(val, *dst, first);
>  			dst++;
> -			n -=3D BITS_PER_LONG-dst_idx;
> +			n -=3D BITS_PER_LONG - dst_idx;
>  		}
> =20
>  		// Main chunk
> @@ -1867,9 +1878,9 @@ static void bitfill32(unsigned long *dst, int d=
st_idx, u32 pat, u32 n)
>  }
> =20
> =20
> -    /*
> -     *  Unaligned 32-bit pattern xor using 32/64-bit memory accesses
> -     */
> +	/*
> +	 *  Unaligned 32-bit pattern xor using 32/64-bit memory accesses
> +	 */
> =20
>  static void bitxor32(unsigned long *dst, int dst_idx, u32 pat, u32 n=
)
>  {
> @@ -1884,9 +1895,9 @@ static void bitxor32(unsigned long *dst, int ds=
t_idx, u32 pat, u32 n)
>  #endif
> =20
>  	first =3D ~0UL >> dst_idx;
> -	last =3D ~(~0UL >> ((dst_idx+n) % BITS_PER_LONG));
> +	last =3D ~(~0UL >> ((dst_idx + n) % BITS_PER_LONG));
> =20
> -	if (dst_idx+n <=3D BITS_PER_LONG) {
> +	if (dst_idx + n <=3D BITS_PER_LONG) {
>  		// Single word
>  		if (last)
>  			first &=3D last;
> @@ -1897,7 +1908,7 @@ static void bitxor32(unsigned long *dst, int ds=
t_idx, u32 pat, u32 n)
>  		if (first) {
>  			*dst =3D xor(val, *dst, first);
>  			dst++;
> -			n -=3D BITS_PER_LONG-dst_idx;
> +			n -=3D BITS_PER_LONG - dst_idx;
>  		}
> =20
>  		// Main chunk
> @@ -1924,12 +1935,12 @@ static inline void fill_one_line(int bpp, uns=
igned long next_plane,
>  {
>  	while (1) {
>  		dst +=3D dst_idx >> SHIFT_PER_LONG;
> -		dst_idx &=3D (BITS_PER_LONG-1);
> +		dst_idx &=3D (BITS_PER_LONG - 1);
>  		bitfill32(dst, dst_idx, color & 1 ? ~0 : 0, n);
>  		if (!--bpp)
>  			break;
>  		color >>=3D 1;
> -		dst_idx +=3D next_plane*8;
> +		dst_idx +=3D next_plane * 8;
>  	}
>  }
> =20
> @@ -1939,12 +1950,12 @@ static inline void xor_one_line(int bpp, unsi=
gned long next_plane,
>  {
>  	while (color) {
>  		dst +=3D dst_idx >> SHIFT_PER_LONG;
> -		dst_idx &=3D (BITS_PER_LONG-1);
> +		dst_idx &=3D (BITS_PER_LONG - 1);
>  		bitxor32(dst, dst_idx, color & 1 ? ~0 : 0, n);
>  		if (!--bpp)
>  			break;
>  		color >>=3D 1;
> -		dst_idx +=3D next_plane*8;
> +		dst_idx +=3D next_plane * 8;
>  	}
>  }
> =20
> @@ -1972,23 +1983,23 @@ static void amifb_fillrect(struct fb_info *in=
fo,
>  	height =3D y2 - rect->dy;
> =20
>  	dst =3D (unsigned long *)
> -		((unsigned long)info->screen_base & ~(BYTES_PER_LONG-1));
> -	dst_idx =3D ((unsigned long)info->screen_base & (BYTES_PER_LONG-1))=
*8;
> -	dst_idx +=3D rect->dy*par->next_line*8+rect->dx;
> +		((unsigned long)info->screen_base & ~(BYTES_PER_LONG - 1));
> +	dst_idx =3D ((unsigned long)info->screen_base & (BYTES_PER_LONG - 1=
)) * 8;
> +	dst_idx +=3D rect->dy * par->next_line * 8 + rect->dx;
>  	while (height--) {
>  		switch (rect->rop) {
> -		    case ROP_COPY:
> +		case ROP_COPY:
>  			fill_one_line(info->var.bits_per_pixel,
>  				      par->next_plane, dst, dst_idx, width,
>  				      rect->color);
>  			break;
> =20
> -		    case ROP_XOR:
> +		case ROP_XOR:
>  			xor_one_line(info->var.bits_per_pixel, par->next_plane,
>  				     dst, dst_idx, width, rect->color);
>  			break;
>  		}
> -		dst_idx +=3D par->next_line*8;
> +		dst_idx +=3D par->next_line * 8;
>  	}
>  }
> =20
> @@ -1998,14 +2009,14 @@ static inline void copy_one_line(int bpp, uns=
igned long next_plane,
>  {
>  	while (1) {
>  		dst +=3D dst_idx >> SHIFT_PER_LONG;
> -		dst_idx &=3D (BITS_PER_LONG-1);
> +		dst_idx &=3D (BITS_PER_LONG - 1);
>  		src +=3D src_idx >> SHIFT_PER_LONG;
> -		src_idx &=3D (BITS_PER_LONG-1);
> +		src_idx &=3D (BITS_PER_LONG - 1);
>  		bitcpy(dst, dst_idx, src, src_idx, n);
>  		if (!--bpp)
>  			break;
> -		dst_idx +=3D next_plane*8;
> -		src_idx +=3D next_plane*8;
> +		dst_idx +=3D next_plane * 8;
> +		src_idx +=3D next_plane * 8;
>  	}
>  }
> =20
> @@ -2015,14 +2026,14 @@ static inline void copy_one_line_rev(int bpp,=
 unsigned long next_plane,
>  {
>  	while (1) {
>  		dst +=3D dst_idx >> SHIFT_PER_LONG;
> -		dst_idx &=3D (BITS_PER_LONG-1);
> +		dst_idx &=3D (BITS_PER_LONG - 1);
>  		src +=3D src_idx >> SHIFT_PER_LONG;
> -		src_idx &=3D (BITS_PER_LONG-1);
> +		src_idx &=3D (BITS_PER_LONG - 1);
>  		bitcpy_rev(dst, dst_idx, src, src_idx, n);
>  		if (!--bpp)
>  			break;
> -		dst_idx +=3D next_plane*8;
> -		src_idx +=3D next_plane*8;
> +		dst_idx +=3D next_plane * 8;
> +		src_idx +=3D next_plane * 8;
>  	}
>  }
> =20
> @@ -2065,16 +2076,16 @@ static void amifb_copyarea(struct fb_info *in=
fo,
>  		rev_copy =3D 1;
>  	}
>  	dst =3D (unsigned long *)
> -		((unsigned long)info->screen_base & ~(BYTES_PER_LONG-1));
> +		((unsigned long)info->screen_base & ~(BYTES_PER_LONG - 1));
>  	src =3D dst;
> -	dst_idx =3D ((unsigned long)info->screen_base & (BYTES_PER_LONG-1))=
*8;
> +	dst_idx =3D ((unsigned long)info->screen_base & (BYTES_PER_LONG - 1=
)) * 8;
>  	src_idx =3D dst_idx;
> -	dst_idx +=3D dy*par->next_line*8+dx;
> -	src_idx +=3D sy*par->next_line*8+sx;
> +	dst_idx +=3D dy * par->next_line * 8 + dx;
> +	src_idx +=3D sy * par->next_line * 8 + sx;
>  	if (rev_copy) {
>  		while (height--) {
> -			dst_idx -=3D par->next_line*8;
> -			src_idx -=3D par->next_line*8;
> +			dst_idx -=3D par->next_line * 8;
> +			src_idx -=3D par->next_line * 8;
>  			copy_one_line_rev(info->var.bits_per_pixel,
>  					  par->next_plane, dst, dst_idx, src,
>  					  src_idx, width);
> @@ -2084,8 +2095,8 @@ static void amifb_copyarea(struct fb_info *info=
,
>  			copy_one_line(info->var.bits_per_pixel,
>  				      par->next_plane, dst, dst_idx, src,
>  				      src_idx, width);
> -			dst_idx +=3D par->next_line*8;
> -			src_idx +=3D par->next_line*8;
> +			dst_idx +=3D par->next_line * 8;
> +			src_idx +=3D par->next_line * 8;
>  		}
>  	}
>  }
> @@ -2095,28 +2106,29 @@ static inline void expand_one_line(int bpp, u=
nsigned long next_plane,
>  				   unsigned long *dst, int dst_idx, u32 n,
>  				   const u8 *data, u32 bgcolor, u32 fgcolor)
>  {
> -    const unsigned long *src;
> -    int src_idx;
> -
> -    while (1) {
> -	dst +=3D dst_idx >> SHIFT_PER_LONG;
> -	dst_idx &=3D (BITS_PER_LONG-1);
> -	if ((bgcolor ^ fgcolor) & 1) {
> -	    src =3D (unsigned long *)((unsigned long)data & ~(BYTES_PER_LON=
G-1));
> -	    src_idx =3D ((unsigned long)data & (BYTES_PER_LONG-1))*8;
> -	    if (fgcolor & 1)
> -		bitcpy(dst, dst_idx, src, src_idx, n);
> -	    else
> -		bitcpy_not(dst, dst_idx, src, src_idx, n);
> -	    /* set or clear */
> -	} else
> -	    bitfill32(dst, dst_idx, fgcolor & 1 ? ~0 : 0, n);
> -	if (!--bpp)
> -	    break;
> -	bgcolor >>=3D 1;
> -	fgcolor >>=3D 1;
> -	dst_idx +=3D next_plane*8;
> -    }
> +	const unsigned long *src;
> +	int src_idx;
> +
> +	while (1) {
> +		dst +=3D dst_idx >> SHIFT_PER_LONG;
> +		dst_idx &=3D (BITS_PER_LONG - 1);
> +		if ((bgcolor ^ fgcolor) & 1) {
> +			src =3D (unsigned long *)
> +				((unsigned long)data & ~(BYTES_PER_LONG - 1));
> +			src_idx =3D ((unsigned long)data & (BYTES_PER_LONG - 1)) * 8;
> +			if (fgcolor & 1)
> +				bitcpy(dst, dst_idx, src, src_idx, n);
> +			else
> +				bitcpy_not(dst, dst_idx, src, src_idx, n);
> +			/* set or clear */
> +		} else
> +			bitfill32(dst, dst_idx, fgcolor & 1 ? ~0 : 0, n);
> +		if (!--bpp)
> +			break;
> +		bgcolor >>=3D 1;
> +		fgcolor >>=3D 1;
> +		dst_idx +=3D next_plane * 8;
> +	}
>  }
> =20
> =20
> @@ -2145,17 +2157,17 @@ static void amifb_imageblit(struct fb_info *i=
nfo, const struct fb_image *image)
> =20
>  	if (image->depth =3D=3D 1) {
>  		dst =3D (unsigned long *)
> -			((unsigned long)info->screen_base & ~(BYTES_PER_LONG-1));
> -		dst_idx =3D ((unsigned long)info->screen_base & (BYTES_PER_LONG-1)=
)*8;
> -		dst_idx +=3D dy*par->next_line*8+dx;
> +			((unsigned long)info->screen_base & ~(BYTES_PER_LONG - 1));
> +		dst_idx =3D ((unsigned long)info->screen_base & (BYTES_PER_LONG - =
1)) * 8;
> +		dst_idx +=3D dy * par->next_line * 8 + dx;
>  		src =3D image->data;
> -		pitch =3D (image->width+7)/8;
> +		pitch =3D (image->width + 7) / 8;
>  		while (height--) {
>  			expand_one_line(info->var.bits_per_pixel,
>  					par->next_plane, dst, dst_idx, width,
>  					src, image->bg_color,
>  					image->fg_color);
> -			dst_idx +=3D par->next_line*8;
> +			dst_idx +=3D par->next_line * 8;
>  			src +=3D pitch;
>  		}
>  	} else {
> @@ -2182,39 +2194,38 @@ static int amifb_ioctl(struct fb_info *info,
>  	int i;
> =20
>  	switch (cmd) {
> -		case FBIOGET_FCURSORINFO:
> -			i =3D ami_get_fix_cursorinfo(&crsr.fix);
> -			if (i)
> -				return i;
> -			return copy_to_user(argp, &crsr.fix,
> -					    sizeof(crsr.fix)) ? -EFAULT : 0;
> -
> -		case FBIOGET_VCURSORINFO:
> -			i =3D ami_get_var_cursorinfo(&crsr.var,
> -				((struct fb_var_cursorinfo __user *)arg)->data);
> -			if (i)
> -				return i;
> -			return copy_to_user(argp, &crsr.var,
> -					    sizeof(crsr.var)) ? -EFAULT : 0;
> -
> -		case FBIOPUT_VCURSORINFO:
> -			if (copy_from_user(&crsr.var, argp, sizeof(crsr.var)))
> -				return -EFAULT;
> -			return ami_set_var_cursorinfo(&crsr.var,
> -				((struct fb_var_cursorinfo __user *)arg)->data);
> -
> -		case FBIOGET_CURSORSTATE:
> -			i =3D ami_get_cursorstate(&crsr.state);
> -			if (i)
> -				return i;
> -			return copy_to_user(argp, &crsr.state,
> -					    sizeof(crsr.state)) ? -EFAULT : 0;
> -
> -		case FBIOPUT_CURSORSTATE:
> -			if (copy_from_user(&crsr.state, argp,
> -					   sizeof(crsr.state)))
> -				return -EFAULT;
> -			return ami_set_cursorstate(&crsr.state);
> +	case FBIOGET_FCURSORINFO:
> +		i =3D ami_get_fix_cursorinfo(&crsr.fix);
> +		if (i)
> +			return i;
> +		return copy_to_user(argp, &crsr.fix,
> +				    sizeof(crsr.fix)) ? -EFAULT : 0;
> +
> +	case FBIOGET_VCURSORINFO:
> +		i =3D ami_get_var_cursorinfo(&crsr.var,
> +			((struct fb_var_cursorinfo __user *)arg)->data);
> +		if (i)
> +			return i;
> +		return copy_to_user(argp, &crsr.var,
> +				    sizeof(crsr.var)) ? -EFAULT : 0;
> +
> +	case FBIOPUT_VCURSORINFO:
> +		if (copy_from_user(&crsr.var, argp, sizeof(crsr.var)))
> +			return -EFAULT;
> +		return ami_set_var_cursorinfo(&crsr.var,
> +			((struct fb_var_cursorinfo __user *)arg)->data);
> +
> +	case FBIOGET_CURSORSTATE:
> +		i =3D ami_get_cursorstate(&crsr.state);
> +		if (i)
> +			return i;
> +		return copy_to_user(argp, &crsr.state,
> +				    sizeof(crsr.state)) ? -EFAULT : 0;
> +
> +	case FBIOPUT_CURSORSTATE:
> +		if (copy_from_user(&crsr.state, argp, sizeof(crsr.state)))
> +			return -EFAULT;
> +		return ami_set_cursorstate(&crsr.state);
>  	}
>  	return -EINVAL;
>  }
> @@ -2267,69 +2278,68 @@ static int __init amifb_probe(struct platform=
_device *pdev)
> =20
>  	switch (amiga_chipset) {
>  #ifdef CONFIG_FB_AMIGA_OCS
> -		case CS_OCS:
> -			strcat(fb_info.fix.id, "OCS");
> +	case CS_OCS:
> +		strcat(fb_info.fix.id, "OCS");
>  default_chipset:
> -			chipset =3D TAG_OCS;
> -			maxdepth[TAG_SHRES] =3D 0;	/* OCS means no SHRES */
> -			maxdepth[TAG_HIRES] =3D 4;
> -			maxdepth[TAG_LORES] =3D 6;
> -			maxfmode =3D TAG_FMODE_1;
> -			defmode =3D amiga_vblank =3D=3D 50 ? DEFMODE_PAL
> -						     : DEFMODE_NTSC;
> -			fb_info.fix.smem_len =3D VIDEOMEMSIZE_OCS;
> -			break;
> +		chipset =3D TAG_OCS;
> +		maxdepth[TAG_SHRES] =3D 0;	/* OCS means no SHRES */
> +		maxdepth[TAG_HIRES] =3D 4;
> +		maxdepth[TAG_LORES] =3D 6;
> +		maxfmode =3D TAG_FMODE_1;
> +		defmode =3D amiga_vblank =3D=3D 50 ? DEFMODE_PAL : DEFMODE_NTSC;
> +		fb_info.fix.smem_len =3D VIDEOMEMSIZE_OCS;
> +		break;
>  #endif /* CONFIG_FB_AMIGA_OCS */
> =20
>  #ifdef CONFIG_FB_AMIGA_ECS
> -		case CS_ECS:
> -			strcat(fb_info.fix.id, "ECS");
> -			chipset =3D TAG_ECS;
> -			maxdepth[TAG_SHRES] =3D 2;
> -			maxdepth[TAG_HIRES] =3D 4;
> -			maxdepth[TAG_LORES] =3D 6;
> -			maxfmode =3D TAG_FMODE_1;
> -			if (AMIGAHW_PRESENT(AMBER_FF))
> -			    defmode =3D amiga_vblank =3D=3D 50 ? DEFMODE_AMBER_PAL
> -							 : DEFMODE_AMBER_NTSC;
> -			else
> -			    defmode =3D amiga_vblank =3D=3D 50 ? DEFMODE_PAL
> -							 : DEFMODE_NTSC;
> -			if (amiga_chip_avail()-CHIPRAM_SAFETY_LIMIT >
> -			    VIDEOMEMSIZE_ECS_2M)
> -				fb_info.fix.smem_len =3D VIDEOMEMSIZE_ECS_2M;
> -			else
> -				fb_info.fix.smem_len =3D VIDEOMEMSIZE_ECS_1M;
> -			break;
> +	case CS_ECS:
> +		strcat(fb_info.fix.id, "ECS");
> +		chipset =3D TAG_ECS;
> +		maxdepth[TAG_SHRES] =3D 2;
> +		maxdepth[TAG_HIRES] =3D 4;
> +		maxdepth[TAG_LORES] =3D 6;
> +		maxfmode =3D TAG_FMODE_1;
> +		if (AMIGAHW_PRESENT(AMBER_FF))
> +			defmode =3D amiga_vblank =3D=3D 50 ? DEFMODE_AMBER_PAL
> +						     : DEFMODE_AMBER_NTSC;
> +		else
> +			defmode =3D amiga_vblank =3D=3D 50 ? DEFMODE_PAL
> +						     : DEFMODE_NTSC;
> +		if (amiga_chip_avail() - CHIPRAM_SAFETY_LIMIT >
> +		    VIDEOMEMSIZE_ECS_2M)
> +			fb_info.fix.smem_len =3D VIDEOMEMSIZE_ECS_2M;
> +		else
> +			fb_info.fix.smem_len =3D VIDEOMEMSIZE_ECS_1M;
> +		break;
>  #endif /* CONFIG_FB_AMIGA_ECS */
> =20
>  #ifdef CONFIG_FB_AMIGA_AGA
> -		case CS_AGA:
> -			strcat(fb_info.fix.id, "AGA");
> -			chipset =3D TAG_AGA;
> -			maxdepth[TAG_SHRES] =3D 8;
> -			maxdepth[TAG_HIRES] =3D 8;
> -			maxdepth[TAG_LORES] =3D 8;
> -			maxfmode =3D TAG_FMODE_4;
> -			defmode =3D DEFMODE_AGA;
> -			if (amiga_chip_avail()-CHIPRAM_SAFETY_LIMIT >
> -			    VIDEOMEMSIZE_AGA_2M)
> -				fb_info.fix.smem_len =3D VIDEOMEMSIZE_AGA_2M;
> -			else
> -				fb_info.fix.smem_len =3D VIDEOMEMSIZE_AGA_1M;
> -			break;
> +	case CS_AGA:
> +		strcat(fb_info.fix.id, "AGA");
> +		chipset =3D TAG_AGA;
> +		maxdepth[TAG_SHRES] =3D 8;
> +		maxdepth[TAG_HIRES] =3D 8;
> +		maxdepth[TAG_LORES] =3D 8;
> +		maxfmode =3D TAG_FMODE_4;
> +		defmode =3D DEFMODE_AGA;
> +		if (amiga_chip_avail() - CHIPRAM_SAFETY_LIMIT >
> +		    VIDEOMEMSIZE_AGA_2M)
> +			fb_info.fix.smem_len =3D VIDEOMEMSIZE_AGA_2M;
> +		else
> +			fb_info.fix.smem_len =3D VIDEOMEMSIZE_AGA_1M;
> +		break;
>  #endif /* CONFIG_FB_AMIGA_AGA */
> =20
> -		default:
> +	default:
>  #ifdef CONFIG_FB_AMIGA_OCS
> -			printk("Unknown graphics chipset, defaulting to OCS\n");
> -			strcat(fb_info.fix.id, "Unknown");
> -			goto default_chipset;
> +		printk("Unknown graphics chipset, defaulting to OCS\n");
> +		strcat(fb_info.fix.id, "Unknown");
> +		goto default_chipset;
>  #else /* CONFIG_FB_AMIGA_OCS */
> -			err =3D -ENODEV;
> -			goto amifb_error;
> +		err =3D -ENODEV;
> +		goto amifb_error;
>  #endif /* CONFIG_FB_AMIGA_OCS */
> -			break;
> +		break;
>  	}
> =20
>  	/*
> @@ -2360,10 +2370,10 @@ default_chipset:
>  	 *  These monitor specs are for a typical Amiga monitor (e.g. A1960=
)
>  	 */
>  	if (fb_info.monspecs.hfmin =3D=3D 0) {
> -	    fb_info.monspecs.hfmin =3D 15000;
> -	    fb_info.monspecs.hfmax =3D 38000;
> -	    fb_info.monspecs.vfmin =3D 49;
> -	    fb_info.monspecs.vfmax =3D 90;
> +		fb_info.monspecs.hfmin =3D 15000;
> +		fb_info.monspecs.hfmax =3D 38000;
> +		fb_info.monspecs.vfmin =3D 49;
> +		fb_info.monspecs.vfmax =3D 90;
>  	}
> =20
>  	fb_info.fbops =3D &amifb_ops;
> @@ -2381,11 +2391,9 @@ default_chipset:
>  				 &fb_info.modelist);
> =20
>  	round_down_bpp =3D 0;
> -	chipptr =3D chipalloc(fb_info.fix.smem_len+
> -	                    SPRITEMEMSIZE+
> -	                    DUMMYSPRITEMEMSIZE+
> -	                    COPINITSIZE+
> -	                    4*COPLISTSIZE);
> +	chipptr =3D chipalloc(fb_info.fix.smem_len + SPRITEMEMSIZE +
> +			    DUMMYSPRITEMEMSIZE + COPINITSIZE +
> +			    4 * COPLISTSIZE);
>  	if (!chipptr) {
>  		err =3D -ENOMEM;
>  		goto amifb_error;
> @@ -2419,7 +2427,7 @@ default_chipset:
>  	 */
> =20
>  	custom.dmacon =3D DMAF_SETCLR | DMAF_MASTER | DMAF_RASTER | DMAF_CO=
PPER |
> -	                DMAF_BLITTER | DMAF_SPRITE;
> +			DMAF_BLITTER | DMAF_SPRITE;
> =20
>  	/*
>  	 * Make sure the Copper has something to do
> @@ -2428,12 +2436,12 @@ default_chipset:
>  	ami_init_copper();
> =20
>  	if (request_irq(IRQ_AMIGA_COPPER, amifb_interrupt, 0,
> -	                "fb vertb handler", &currentpar)) {
> +			"fb vertb handler", &currentpar)) {
>  		err =3D -EBUSY;
>  		goto amifb_error;
>  	}
> =20
> -	err =3D fb_alloc_cmap(&fb_info.cmap, 1<<fb_info.var.bits_per_pixel,=
 0);
> +	err =3D fb_alloc_cmap(&fb_info.cmap, 1 << fb_info.var.bits_per_pixe=
l, 0);
>  	if (err)
>  		goto amifb_error;
> =20
> @@ -2459,7 +2467,7 @@ static void amifb_deinit(struct platform_device=
 *pdev)
>  	fb_dealloc_cmap(&fb_info.cmap);
>  	chipfree();
>  	if (videomemory)
> -		iounmap((void*)videomemory);
> +		iounmap((void *)videomemory);
>  	custom.dmacon =3D DMAF_ALL | DMAF_MASTER;
>  }
> =20
> @@ -2539,7 +2547,7 @@ static irqreturn_t amifb_interrupt(int irq, voi=
d *dev_id)
>  	 */
> =20
>  static int ami_decode_var(struct fb_var_screeninfo *var,
> -                          struct amifb_par *par)
> +			  struct amifb_par *par)
>  {
>  	u_short clk_shift, line_shift;
>  	u_long maxfetchstop, fstrt, fsize, fconst, xres_n, yres_n;
> @@ -2606,23 +2614,23 @@ static int ami_decode_var(struct fb_var_scree=
ninfo *var,
> =20
>  	par->vmode =3D var->vmode | FB_VMODE_SMOOTH_XPAN;
>  	switch (par->vmode & FB_VMODE_MASK) {
> -		case FB_VMODE_INTERLACED:
> -			line_shift =3D 0;
> -			break;
> -		case FB_VMODE_NONINTERLACED:
> -			line_shift =3D 1;
> -			break;
> -		case FB_VMODE_DOUBLE:
> -			if (!IS_AGA) {
> -				DPRINTK("double mode only possible with aga\n");
> -				return -EINVAL;
> -			}
> -			line_shift =3D 2;
> -			break;
> -		default:
> -			DPRINTK("unknown video mode\n");
> +	case FB_VMODE_INTERLACED:
> +		line_shift =3D 0;
> +		break;
> +	case FB_VMODE_NONINTERLACED:
> +		line_shift =3D 1;
> +		break;
> +	case FB_VMODE_DOUBLE:
> +		if (!IS_AGA) {
> +			DPRINTK("double mode only possible with aga\n");
>  			return -EINVAL;
> -			break;
> +		}
> +		line_shift =3D 2;
> +		break;
> +	default:
> +		DPRINTK("unknown video mode\n");
> +		return -EINVAL;
> +		break;
>  	}
>  	par->line_shift =3D line_shift;
> =20
> @@ -2630,26 +2638,31 @@ static int ami_decode_var(struct fb_var_scree=
ninfo *var,
>  	 * Vertical and Horizontal Timings
>  	 */
> =20
> -	xres_n =3D par->xres<<clk_shift;
> -	yres_n =3D par->yres<<line_shift;
> -	par->htotal =3D down8((var->left_margin+par->xres+var->right_margin=
+var->hsync_len)<<clk_shift);
> -	par->vtotal =3D down2(((var->upper_margin+par->yres+var->lower_marg=
in+var->vsync_len)<<line_shift)+1);
> +	xres_n =3D par->xres << clk_shift;
> +	yres_n =3D par->yres << line_shift;
> +	par->htotal =3D down8((var->left_margin + par->xres + var->right_ma=
rgin +
> +			     var->hsync_len) << clk_shift);
> +	par->vtotal =3D
> +		down2(((var->upper_margin + par->yres + var->lower_margin +
> +			var->vsync_len) << line_shift) + 1);
> =20
>  	if (IS_AGA)
>  		par->bplcon3 =3D sprpixmode[clk_shift];
>  	else
>  		par->bplcon3 =3D 0;
>  	if (var->sync & FB_SYNC_BROADCAST) {
> -		par->diwstop_h =3D par->htotal-((var->right_margin-var->hsync_len)=
<<clk_shift);
> +		par->diwstop_h =3D par->htotal -
> +			((var->right_margin - var->hsync_len) << clk_shift);
>  		if (IS_AGA)
>  			par->diwstop_h +=3D mod4(var->hsync_len);
>  		else
>  			par->diwstop_h =3D down4(par->diwstop_h);
> =20
>  		par->diwstrt_h =3D par->diwstop_h - xres_n;
> -		par->diwstop_v =3D par->vtotal-((var->lower_margin-var->vsync_len)=
<<line_shift);
> +		par->diwstop_v =3D par->vtotal -
> +			((var->lower_margin - var->vsync_len) << line_shift);
>  		par->diwstrt_v =3D par->diwstop_v - yres_n;
> -		if (par->diwstop_h >=3D par->htotal+8) {
> +		if (par->diwstop_h >=3D par->htotal + 8) {
>  			DPRINTK("invalid diwstop_h\n");
>  			return -EINVAL;
>  		}
> @@ -2670,7 +2683,7 @@ static int ami_decode_var(struct fb_var_screeni=
nfo *var,
>  			par->vsstrt =3D 0;
>  			par->vsstop =3D 0;
>  		}
> -		if (par->vtotal > (PAL_VTOTAL+NTSC_VTOTAL)/2) {
> +		if (par->vtotal > (PAL_VTOTAL + NTSC_VTOTAL) / 2) {
>  			/* PAL video mode */
>  			if (par->htotal !=3D PAL_HTOTAL) {
>  				DPRINTK("htotal invalid for pal\n");
> @@ -2690,7 +2703,7 @@ static int ami_decode_var(struct fb_var_screeni=
nfo *var,
>  				par->beamcon0 =3D BMC0_PAL;
>  				par->bplcon3 |=3D BPC3_BRDRBLNK;
>  			} else if (AMIGAHW_PRESENT(AGNUS_HR_PAL) ||
> -			           AMIGAHW_PRESENT(AGNUS_HR_NTSC)) {
> +				   AMIGAHW_PRESENT(AGNUS_HR_NTSC)) {
>  				par->beamcon0 =3D BMC0_PAL;
>  				par->hsstop =3D 1;
>  			} else if (amiga_vblank !=3D 50) {
> @@ -2720,7 +2733,7 @@ static int ami_decode_var(struct fb_var_screeni=
nfo *var,
>  				par->beamcon0 =3D 0;
>  				par->bplcon3 |=3D BPC3_BRDRBLNK;
>  			} else if (AMIGAHW_PRESENT(AGNUS_HR_PAL) ||
> -			           AMIGAHW_PRESENT(AGNUS_HR_NTSC)) {
> +				   AMIGAHW_PRESENT(AGNUS_HR_NTSC)) {
>  				par->beamcon0 =3D 0;
>  				par->hsstop =3D 1;
>  			} else if (amiga_vblank !=3D 60) {
> @@ -2737,8 +2750,8 @@ static int ami_decode_var(struct fb_var_screeni=
nfo *var,
>  		}
>  	} else if (!IS_OCS) {
>  		/* Programmable video mode */
> -		par->hsstrt =3D var->right_margin<<clk_shift;
> -		par->hsstop =3D (var->right_margin+var->hsync_len)<<clk_shift;
> +		par->hsstrt =3D var->right_margin << clk_shift;
> +		par->hsstop =3D (var->right_margin + var->hsync_len) << clk_shift;
>  		par->diwstop_h =3D par->htotal - mod8(par->hsstrt) + 8 - (1 << clk=
_shift);
>  		if (!IS_AGA)
>  			par->diwstop_h =3D down4(par->diwstop_h) - 16;
> @@ -2748,8 +2761,8 @@ static int ami_decode_var(struct fb_var_screeni=
nfo *var,
>  		if (par->hbstrt >=3D par->htotal + 8)
>  			par->hbstrt -=3D par->htotal;
>  		par->hcenter =3D par->hsstrt + (par->htotal >> 1);
> -		par->vsstrt =3D var->lower_margin<<line_shift;
> -		par->vsstop =3D (var->lower_margin+var->vsync_len)<<line_shift;
> +		par->vsstrt =3D var->lower_margin << line_shift;
> +		par->vsstop =3D (var->lower_margin + var->vsync_len) << line_shift=
;
>  		par->diwstop_v =3D par->vtotal;
>  		if ((par->vmode & FB_VMODE_MASK) =3D=3D FB_VMODE_INTERLACED)
>  			par->diwstop_v -=3D 2;
> @@ -2766,8 +2779,8 @@ static int ami_decode_var(struct fb_var_screeni=
nfo *var,
>  		}
>  		par->bplcon3 |=3D BPC3_EXTBLKEN;
>  		par->beamcon0 =3D BMC0_HARDDIS | BMC0_VARVBEN | BMC0_LOLDIS |
> -		                BMC0_VARVSYEN | BMC0_VARHSYEN | BMC0_VARBEAMEN |
> -		                BMC0_PAL | BMC0_VARCSYEN;
> +				BMC0_VARVSYEN | BMC0_VARHSYEN | BMC0_VARBEAMEN |
> +				BMC0_PAL | BMC0_VARCSYEN;
>  		if (var->sync & FB_SYNC_HOR_HIGH_ACT)
>  			par->beamcon0 |=3D BMC0_HSYTRUE;
>  		if (var->sync & FB_SYNC_VERT_HIGH_ACT)
> @@ -2785,7 +2798,7 @@ static int ami_decode_var(struct fb_var_screeni=
nfo *var,
>  	 * Checking the DMA timing
>  	 */
> =20
> -	fconst =3D 16<<maxfmode<<clk_shift;
> +	fconst =3D 16 << maxfmode << clk_shift;
> =20
>  	/*
>  	 * smallest window start value without turn off other dma cycles
> @@ -2793,8 +2806,8 @@ static int ami_decode_var(struct fb_var_screeni=
nfo *var,
>  	 */
> =20
> =20
> -	fsize =3D ((maxfmode+clk_shift <=3D 1) ? fconst : 64);
> -	fstrt =3D downx(fconst, par->diwstrt_h-4) - fsize;
> +	fsize =3D ((maxfmode + clk_shift <=3D 1) ? fconst : 64);
> +	fstrt =3D downx(fconst, par->diwstrt_h - 4) - fsize;
>  	if (fstrt < min_fstrt) {
>  		DPRINTK("fetch start too low\n");
>  		return -EINVAL;
> @@ -2804,14 +2817,16 @@ static int ami_decode_var(struct fb_var_scree=
ninfo *var,
>  	 * smallest window start value where smooth scrolling is possible
>  	 */
> =20
> -	fstrt =3D downx(fconst, par->diwstrt_h-fconst+(1<<clk_shift)-4) - f=
size;
> +	fstrt =3D downx(fconst, par->diwstrt_h - fconst + (1 << clk_shift) =
- 4) -
> +		fsize;
>  	if (fstrt < min_fstrt)
>  		par->vmode &=3D ~FB_VMODE_SMOOTH_XPAN;
> =20
>  	maxfetchstop =3D down16(par->htotal - 80);
> =20
> -	fstrt =3D downx(fconst, par->diwstrt_h-4) - 64 - fconst;
> -	fsize =3D upx(fconst, xres_n + modx(fconst, downx(1<<clk_shift, par=
->diwstrt_h-4)));
> +	fstrt =3D downx(fconst, par->diwstrt_h - 4) - 64 - fconst;
> +	fsize =3D upx(fconst, xres_n +
> +		    modx(fconst, downx(1 << clk_shift, par->diwstrt_h - 4)));
>  	if (fstrt + fsize > maxfetchstop)
>  		par->vmode &=3D ~FB_VMODE_SMOOTH_XPAN;
> =20
> @@ -2840,7 +2855,7 @@ static int ami_decode_var(struct fb_var_screeni=
nfo *var,
>  	 * Check if there is enough time to update the bitplane pointers fo=
r ywrap
>  	 */
> =20
> -	if (par->htotal-fsize-64 < par->bpp*64)
> +	if (par->htotal - fsize - 64 < par->bpp * 64)
>  		par->vmode &=3D ~FB_VMODE_YWRAP;
> =20
>  	/*
> @@ -2848,15 +2863,15 @@ static int ami_decode_var(struct fb_var_scree=
ninfo *var,
>  	 */
> =20
>  	if (amifb_ilbm) {
> -		par->next_plane =3D div8(upx(16<<maxfmode, par->vxres));
> -		par->next_line =3D par->bpp*par->next_plane;
> +		par->next_plane =3D div8(upx(16 << maxfmode, par->vxres));
> +		par->next_line =3D par->bpp * par->next_plane;
>  		if (par->next_line * par->vyres > fb_info.fix.smem_len) {
>  			DPRINTK("too few video mem\n");
>  			return -EINVAL;
>  		}
>  	} else {
> -		par->next_line =3D div8(upx(16<<maxfmode, par->vxres));
> -		par->next_plane =3D par->vyres*par->next_line;
> +		par->next_line =3D div8(upx(16 << maxfmode, par->vxres));
> +		par->next_plane =3D par->vyres * par->next_line;
>  		if (par->next_plane * par->bpp > fb_info.fix.smem_len) {
>  			DPRINTK("too few video mem\n");
>  			return -EINVAL;
> @@ -2873,7 +2888,7 @@ static int ami_decode_var(struct fb_var_screeni=
nfo *var,
>  	if (par->bpp =3D=3D 8)
>  		par->bplcon0 |=3D BPC0_BPU3;
>  	else
> -		par->bplcon0 |=3D par->bpp<<12;
> +		par->bplcon0 |=3D par->bpp << 12;
>  	if (var->nonstd =3D=3D FB_NONSTD_HAM)
>  		par->bplcon0 |=3D BPC0_HAM;
>  	if (var->sync & FB_SYNC_EXT)
> @@ -2883,24 +2898,26 @@ static int ami_decode_var(struct fb_var_scree=
ninfo *var,
>  		par->fmode =3D bplfetchmode[maxfmode];
> =20
>  	switch (par->vmode & FB_VMODE_MASK) {
> -		case FB_VMODE_INTERLACED:
> -			par->bplcon0 |=3D BPC0_LACE;
> -			break;
> -		case FB_VMODE_DOUBLE:
> -			if (IS_AGA)
> -				par->fmode |=3D FMODE_SSCAN2 | FMODE_BSCAN2;
> -			break;
> +	case FB_VMODE_INTERLACED:
> +		par->bplcon0 |=3D BPC0_LACE;
> +		break;
> +	case FB_VMODE_DOUBLE:
> +		if (IS_AGA)
> +			par->fmode |=3D FMODE_SSCAN2 | FMODE_BSCAN2;
> +		break;
>  	}
> =20
>  	if (!((par->vmode ^ var->vmode) & FB_VMODE_YWRAP)) {
>  		par->xoffset =3D var->xoffset;
>  		par->yoffset =3D var->yoffset;
>  		if (par->vmode & FB_VMODE_YWRAP) {
> -			if (par->xoffset || par->yoffset < 0 || par->yoffset >=3D par->vy=
res)
> +			if (par->xoffset || par->yoffset < 0 ||
> +			    par->yoffset >=3D par->vyres)
>  				par->xoffset =3D par->yoffset =3D 0;
>  		} else {
> -			if (par->xoffset < 0 || par->xoffset > upx(16<<maxfmode, par->vxr=
es-par->xres) ||
> -			    par->yoffset < 0 || par->yoffset > par->vyres-par->yres)
> +			if (par->xoffset < 0 ||
> +			    par->xoffset > upx(16 << maxfmode, par->vxres - par->xres) ||
> +			    par->yoffset < 0 || par->yoffset > par->vyres - par->yres)
>  				par->xoffset =3D par->yoffset =3D 0;
>  		}
>  	} else
> @@ -2919,7 +2936,7 @@ static int ami_decode_var(struct fb_var_screeni=
nfo *var,
>  	 */
> =20
>  static int ami_encode_var(struct fb_var_screeninfo *var,
> -                          struct amifb_par *par)
> +			  struct amifb_par *par)
>  {
>  	u_short clk_shift, line_shift;
> =20
> @@ -2942,7 +2959,7 @@ static int ami_encode_var(struct fb_var_screeni=
nfo *var,
>  	var->red.msb_right =3D 0;
>  	var->red.length =3D par->bpp;
>  	if (par->bplcon0 & BPC0_HAM)
> -	    var->red.length -=3D 2;
> +		var->red.length -=3D 2;
>  	var->blue =3D var->green =3D var->red;
>  	var->transp.offset =3D 0;
>  	var->transp.length =3D 0;
> @@ -2967,10 +2984,10 @@ static int ami_encode_var(struct fb_var_scree=
ninfo *var,
>  		var->vmode =3D FB_VMODE_NONINTERLACED;
> =20
>  	if (!IS_OCS && par->beamcon0 & BMC0_VARBEAMEN) {
> -		var->hsync_len =3D (par->hsstop-par->hsstrt)>>clk_shift;
> +		var->hsync_len =3D (par->hsstop - par->hsstrt)>>clk_shift;
>  		var->right_margin =3D par->hsstrt>>clk_shift;
>  		var->left_margin =3D (par->htotal>>clk_shift) - var->xres - var->r=
ight_margin - var->hsync_len;
> -		var->vsync_len =3D (par->vsstop-par->vsstrt)>>line_shift;
> +		var->vsync_len =3D (par->vsstop - par->vsstrt)>>line_shift;
>  		var->lower_margin =3D par->vsstrt>>line_shift;
>  		var->upper_margin =3D (par->vtotal>>line_shift) - var->yres - var-=
>lower_margin - var->vsync_len;
>  		var->sync =3D 0;
> @@ -2988,7 +3005,7 @@ static int ami_encode_var(struct fb_var_screeni=
nfo *var,
>  		var->vsync_len =3D 4>>line_shift;
>  		var->lower_margin =3D ((par->vtotal - par->diwstop_v)>>line_shift)=
 + var->vsync_len;
>  		var->upper_margin =3D (((par->vtotal - 2)>>line_shift) + 1) - var-=
>yres -
> -		                    var->lower_margin - var->vsync_len;
> +				    var->lower_margin - var->vsync_len;
>  	}
> =20
>  	if (par->bplcon0 & BPC0_ERSY)
> @@ -3035,14 +3052,14 @@ static int ami_update_par(void)
>  	clk_shift =3D par->clk_shift;
> =20
>  	if (!(par->vmode & FB_VMODE_SMOOTH_XPAN))
> -		par->xoffset =3D upx(16<<maxfmode, par->xoffset);
> +		par->xoffset =3D upx(16 << maxfmode, par->xoffset);
> =20
> -	fconst =3D 16<<maxfmode<<clk_shift;
> -	vshift =3D modx(16<<maxfmode, par->xoffset);
> -	fstrt =3D par->diwstrt_h - (vshift<<clk_shift) - 4;
> -	fsize =3D (par->xres+vshift)<<clk_shift;
> +	fconst =3D 16 << maxfmode << clk_shift;
> +	vshift =3D modx(16 << maxfmode, par->xoffset);
> +	fstrt =3D par->diwstrt_h - (vshift << clk_shift) - 4;
> +	fsize =3D (par->xres + vshift) << clk_shift;
>  	shift =3D modx(fconst, fstrt);
> -	move =3D downx(2<<maxfmode, div8(par->xoffset));
> +	move =3D downx(2 << maxfmode, div8(par->xoffset));
>  	if (maxfmode + clk_shift > 1) {
>  		fstrt =3D downx(fconst, fstrt) - 64;
>  		fsize =3D upx(fconst, fsize);
> @@ -3056,7 +3073,7 @@ static int ami_update_par(void)
>  			fstop +=3D min_fstrt - fstrt;
>  			fstrt =3D min_fstrt;
>  		}
> -		move =3D move - div8((mod-fstrt)>>clk_shift);
> +		move =3D move - div8((mod - fstrt)>>clk_shift);
>  	}
>  	mod =3D par->next_line - div8(fsize>>clk_shift);
>  	par->ddfstrt =3D fstrt;
> @@ -3071,11 +3088,14 @@ static int ami_update_par(void)
>  		par->bpl1mod =3D par->bpl2mod;
> =20
>  	if (par->yoffset) {
> -		par->bplpt0 =3D fb_info.fix.smem_start + par->next_line*par->yoffs=
et + move;
> +		par->bplpt0 =3D fb_info.fix.smem_start +
> +			      par->next_line * par->yoffset + move;
>  		if (par->vmode & FB_VMODE_YWRAP) {
> -			if (par->yoffset > par->vyres-par->yres) {
> +			if (par->yoffset > par->vyres - par->yres) {
>  				par->bplpt0wrap =3D fb_info.fix.smem_start + move;
> -				if (par->bplcon0 & BPC0_LACE && mod2(par->diwstrt_v+par->vyres-p=
ar->yoffset))
> +				if (par->bplcon0 & BPC0_LACE &&
> +				    mod2(par->diwstrt_v + par->vyres -
> +					 par->yoffset))
>  					par->bplpt0wrap +=3D par->next_line;
>  			}
>  		}
> @@ -3096,7 +3116,7 @@ static int ami_update_par(void)
>  	 */
> =20
>  static int amifb_setcolreg(u_int regno, u_int red, u_int green, u_in=
t blue,
> -                           u_int transp, struct fb_info *info)
> +			   u_int transp, struct fb_info *info)
>  {
>  	if (IS_AGA) {
>  		if (regno > 255)
> @@ -3130,10 +3150,13 @@ static int amifb_setcolreg(u_int regno, u_int=
 red, u_int green, u_int blue,
>  		if (IS_AGA) {
>  			u_short bplcon3 =3D currentpar.bplcon3;
>  			VBlankOff();
> -			custom.bplcon3 =3D bplcon3 | (regno<<8 & 0xe000);
> -			custom.color[regno&31] =3D rgb2hw8_high(red, green, blue);
> -			custom.bplcon3 =3D bplcon3 | (regno<<8 & 0xe000) | BPC3_LOCT;
> -			custom.color[regno&31] =3D rgb2hw8_low(red, green, blue);
> +			custom.bplcon3 =3D bplcon3 | (regno << 8 & 0xe000);
> +			custom.color[regno & 31] =3D rgb2hw8_high(red, green,
> +								blue);
> +			custom.bplcon3 =3D bplcon3 | (regno << 8 & 0xe000) |
> +					 BPC3_LOCT;
> +			custom.color[regno & 31] =3D rgb2hw8_low(red, green,
> +							       blue);
>  			custom.bplcon3 =3D bplcon3;
>  			VBlankOn();
>  		} else
> @@ -3146,11 +3169,11 @@ static int amifb_setcolreg(u_int regno, u_int=
 red, u_int green, u_int blue,
>  			mask =3D 0x3333;
>  			color =3D rgb2hw2(red, green, blue);
>  			VBlankOff();
> -			for (i =3D regno+12; i >=3D (int)regno; i -=3D 4)
> +			for (i =3D regno + 12; i >=3D (int)regno; i -=3D 4)
>  				custom.color[i] =3D ecs_palette[i] =3D (ecs_palette[i] & mask) |=
 color;
> -			mask <<=3D2; color >>=3D 2;
> -			regno =3D down16(regno)+mul4(mod4(regno));
> -			for (i =3D regno+3; i >=3D (int)regno; i--)
> +			mask <<=3D 2; color >>=3D 2;
> +			regno =3D down16(regno) + mul4(mod4(regno));
> +			for (i =3D regno + 3; i >=3D (int)regno; i--)
>  				custom.color[i] =3D ecs_palette[i] =3D (ecs_palette[i] & mask) |=
 color;
>  			VBlankOn();
>  		} else
> @@ -3243,30 +3266,30 @@ static void ami_do_blank(void)
>  		red =3D green =3D blue =3D 0;
>  		if (!IS_OCS && do_blank > 1) {
>  			switch (do_blank) {
> -				case FB_BLANK_VSYNC_SUSPEND:
> -					custom.hsstrt =3D hsstrt2hw(par->hsstrt);
> -					custom.hsstop =3D hsstop2hw(par->hsstop);
> -					custom.vsstrt =3D vsstrt2hw(par->vtotal+4);
> -					custom.vsstop =3D vsstop2hw(par->vtotal+4);
> -					break;
> -				case FB_BLANK_HSYNC_SUSPEND:
> -					custom.hsstrt =3D hsstrt2hw(par->htotal+16);
> -					custom.hsstop =3D hsstop2hw(par->htotal+16);
> -					custom.vsstrt =3D vsstrt2hw(par->vsstrt);
> -					custom.vsstop =3D vsstrt2hw(par->vsstop);
> -					break;
> -				case FB_BLANK_POWERDOWN:
> -					custom.hsstrt =3D hsstrt2hw(par->htotal+16);
> -					custom.hsstop =3D hsstop2hw(par->htotal+16);
> -					custom.vsstrt =3D vsstrt2hw(par->vtotal+4);
> -					custom.vsstop =3D vsstop2hw(par->vtotal+4);
> -					break;
> +			case FB_BLANK_VSYNC_SUSPEND:
> +				custom.hsstrt =3D hsstrt2hw(par->hsstrt);
> +				custom.hsstop =3D hsstop2hw(par->hsstop);
> +				custom.vsstrt =3D vsstrt2hw(par->vtotal + 4);
> +				custom.vsstop =3D vsstop2hw(par->vtotal + 4);
> +				break;
> +			case FB_BLANK_HSYNC_SUSPEND:
> +				custom.hsstrt =3D hsstrt2hw(par->htotal + 16);
> +				custom.hsstop =3D hsstop2hw(par->htotal + 16);
> +				custom.vsstrt =3D vsstrt2hw(par->vsstrt);
> +				custom.vsstop =3D vsstrt2hw(par->vsstop);
> +				break;
> +			case FB_BLANK_POWERDOWN:
> +				custom.hsstrt =3D hsstrt2hw(par->htotal + 16);
> +				custom.hsstop =3D hsstop2hw(par->htotal + 16);
> +				custom.vsstrt =3D vsstrt2hw(par->vtotal + 4);
> +				custom.vsstop =3D vsstop2hw(par->vtotal + 4);
> +				break;
>  			}
>  			if (!(par->beamcon0 & BMC0_VARBEAMEN)) {
>  				custom.htotal =3D htotal2hw(par->htotal);
>  				custom.vtotal =3D vtotal2hw(par->vtotal);
>  				custom.beamcon0 =3D BMC0_HARDDIS | BMC0_VARBEAMEN |
> -				                  BMC0_VARVSYEN | BMC0_VARHSYEN | BMC0_VARCSYEN;
> +						  BMC0_VARVSYEN | BMC0_VARHSYEN | BMC0_VARCSYEN;
>  			}
>  		}
>  	} else {
> @@ -3300,7 +3323,7 @@ static void ami_do_blank(void)
>  		color =3D rgb2hw2(red, green, blue);
>  		for (i =3D 12; i >=3D 0; i -=3D 4)
>  			custom.color[i] =3D ecs_palette[i] =3D (ecs_palette[i] & mask) | =
color;
> -		mask <<=3D2; color >>=3D 2;
> +		mask <<=3D 2; color >>=3D 2;
>  		for (i =3D 3; i >=3D 0; i--)
>  			custom.color[i] =3D ecs_palette[i] =3D (ecs_palette[i] & mask) | =
color;
>  	} else
> @@ -3334,32 +3357,32 @@ static int ami_get_var_cursorinfo(struct fb_v=
ar_cursorinfo *var, u_char __user *
>  	short height, width, bits, words;
>  	int size, alloc;
> =20
> -	size =3D par->crsr.height*par->crsr.width;
> -	alloc =3D var->height*var->width;
> +	size =3D par->crsr.height * par->crsr.width;
> +	alloc =3D var->height * var->width;
>  	var->height =3D par->crsr.height;
>  	var->width =3D par->crsr.width;
>  	var->xspot =3D par->crsr.spot_x;
>  	var->yspot =3D par->crsr.spot_y;
> -	if (size > var->height*var->width)
> +	if (size > var->height * var->width)
>  		return -ENAMETOOLONG;
>  	if (!access_ok(VERIFY_WRITE, data, size))
>  		return -EFAULT;
> -	delta =3D 1<<par->crsr.fmode;
> -	lspr =3D lofsprite + (delta<<1);
> +	delta =3D 1 << par->crsr.fmode;
> +	lspr =3D lofsprite + (delta << 1);
>  	if (par->bplcon0 & BPC0_LACE)
> -		sspr =3D shfsprite + (delta<<1);
> +		sspr =3D shfsprite + (delta << 1);
>  	else
>  		sspr =3D NULL;
> -	for (height =3D (short)var->height-1; height >=3D 0; height--) {
> +	for (height =3D (short)var->height - 1; height >=3D 0; height--) {
>  		bits =3D 0; words =3D delta; datawords =3D 0;
> -		for (width =3D (short)var->width-1; width >=3D 0; width--) {
> +		for (width =3D (short)var->width - 1; width >=3D 0; width--) {
>  			if (bits =3D=3D 0) {
>  				bits =3D 16; --words;
>  #ifdef __mc68000__
>  				asm volatile ("movew %1@(%3:w:2),%0 ; swap %0 ; movew %1@+,%0"
>  					: "=3Dd" (datawords), "=3Da" (lspr) : "1" (lspr), "d" (delta));
>  #else
> -				datawords =3D (*(lspr+delta) << 16) | (*lspr++);
> +				datawords =3D (*(lspr + delta) << 16) | (*lspr++);
>  #endif
>  			}
>  			--bits;
> @@ -3422,26 +3445,26 @@ static int ami_set_var_cursorinfo(struct fb_v=
ar_cursorinfo *var, u_char __user *
>  		return -EINVAL;
>  	if (!var->height)
>  		return -EINVAL;
> -	if (!access_ok(VERIFY_READ, data, var->width*var->height))
> +	if (!access_ok(VERIFY_READ, data, var->width * var->height))
>  		return -EFAULT;
> -	delta =3D 1<<fmode;
> +	delta =3D 1 << fmode;
>  	lofsprite =3D shfsprite =3D (u_short *)spritememory;
> -	lspr =3D lofsprite + (delta<<1);
> +	lspr =3D lofsprite + (delta << 1);
>  	if (par->bplcon0 & BPC0_LACE) {
> -		if (((var->height+4)<<fmode<<2) > SPRITEMEMSIZE)
> +		if (((var->height + 4) << fmode << 2) > SPRITEMEMSIZE)
>  			return -EINVAL;
> -		memset(lspr, 0, (var->height+4)<<fmode<<2);
> -		shfsprite +=3D ((var->height+5)&-2)<<fmode;
> -		sspr =3D shfsprite + (delta<<1);
> +		memset(lspr, 0, (var->height + 4) << fmode << 2);
> +		shfsprite +=3D ((var->height + 5)&-2) << fmode;
> +		sspr =3D shfsprite + (delta << 1);
>  	} else {
> -		if (((var->height+2)<<fmode<<2) > SPRITEMEMSIZE)
> +		if (((var->height + 2) << fmode << 2) > SPRITEMEMSIZE)
>  			return -EINVAL;
> -		memset(lspr, 0, (var->height+2)<<fmode<<2);
> +		memset(lspr, 0, (var->height + 2) << fmode << 2);
>  		sspr =3D NULL;
>  	}
> -	for (height =3D (short)var->height-1; height >=3D 0; height--) {
> +	for (height =3D (short)var->height - 1; height >=3D 0; height--) {
>  		bits =3D 16; words =3D delta; datawords =3D 0;
> -		for (width =3D (short)var->width-1; width >=3D 0; width--) {
> +		for (width =3D (short)var->width - 1; width >=3D 0; width--) {
>  			unsigned long tdata =3D 0;
>  			get_user(tdata, data);
>  			data++;
> @@ -3454,7 +3477,7 @@ static int ami_set_var_cursorinfo(struct fb_var=
_cursorinfo *var, u_char __user *
>  #else
>  			datawords =3D ((datawords << 1) & 0xfffefffe);
>  			datawords |=3D tdata & 1;
> -			datawords |=3D (tdata & 2) << (16-1);
> +			datawords |=3D (tdata & 2) << (16 - 1);
>  #endif
>  			if (--bits =3D=3D 0) {
>  				bits =3D 16; --words;
> @@ -3462,7 +3485,7 @@ static int ami_set_var_cursorinfo(struct fb_var=
_cursorinfo *var, u_char __user *
>  				asm volatile ("swap %2 ; movew %2,%0@(%3:w:2) ; swap %2 ; movew =
%2,%0@+"
>  					: "=3Da" (lspr) : "0" (lspr), "d" (datawords), "d" (delta));
>  #else
> -				*(lspr+delta) =3D (u_short) (datawords >> 16);
> +				*(lspr + delta) =3D (u_short) (datawords >> 16);
>  				*lspr++ =3D (u_short) (datawords & 0xffff);
>  #endif
>  			}
> @@ -3475,7 +3498,7 @@ static int ami_set_var_cursorinfo(struct fb_var=
_cursorinfo *var, u_char __user *
>  				"swap %2 ; lslw %4,%2 ; movew %2,%0@+"
>  				: "=3Da" (lspr) : "0" (lspr), "d" (datawords), "d" (delta), "d" =
(bits));
>  #else
> -			*(lspr+delta) =3D (u_short) (datawords >> (16+bits));
> +			*(lspr + delta) =3D (u_short) (datawords >> (16 + bits));
>  			*lspr++ =3D (u_short) ((datawords & 0x0000ffff) >> bits);
>  #endif
>  		}
> @@ -3484,7 +3507,7 @@ static int ami_set_var_cursorinfo(struct fb_var=
_cursorinfo *var, u_char __user *
>  			asm volatile ("moveql #0,%%d0 ; movew %%d0,%0@(%2:w:2) ; movew %%=
d0,%0@+"
>  				: "=3Da" (lspr) : "0" (lspr), "d" (delta) : "d0");
>  #else
> -			*(lspr+delta) =3D 0;
> +			*(lspr + delta) =3D 0;
>  			*lspr++ =3D 0;
>  #endif
>  		}
> @@ -3546,8 +3569,8 @@ static void ami_set_sprite(void)
>  	cops =3D copdisplay.list[currentcop][0];
>  	copl =3D copdisplay.list[currentcop][1];
>  	ps =3D pl =3D ZTWO_PADDR(dummysprite);
> -	mx =3D par->crsr.crsr_x-par->crsr.spot_x;
> -	my =3D par->crsr.crsr_y-par->crsr.spot_y;
> +	mx =3D par->crsr.crsr_x - par->crsr.spot_x;
> +	my =3D par->crsr.crsr_y - par->crsr.spot_y;
>  	if (!(par->vmode & FB_VMODE_YWRAP)) {
>  		mx -=3D par->xoffset;
>  		my -=3D par->yoffset;
> @@ -3556,24 +3579,24 @@ static void ami_set_sprite(void)
>  	    mx > -(short)par->crsr.width && mx < par->xres &&
>  	    my > -(short)par->crsr.height && my < par->yres) {
>  		pl =3D ZTWO_PADDR(lofsprite);
> -		hs =3D par->diwstrt_h + (mx<<par->clk_shift) - 4;
> -		vs =3D par->diwstrt_v + (my<<par->line_shift);
> -		ve =3D vs + (par->crsr.height<<par->line_shift);
> +		hs =3D par->diwstrt_h + (mx << par->clk_shift) - 4;
> +		vs =3D par->diwstrt_v + (my << par->line_shift);
> +		ve =3D vs + (par->crsr.height << par->line_shift);
>  		if (par->bplcon0 & BPC0_LACE) {
>  			ps =3D ZTWO_PADDR(shfsprite);
>  			lofsprite[0] =3D spr2hw_pos(vs, hs);
> -			shfsprite[0] =3D spr2hw_pos(vs+1, hs);
> +			shfsprite[0] =3D spr2hw_pos(vs + 1, hs);
>  			if (mod2(vs)) {
> -				lofsprite[1<<par->crsr.fmode] =3D spr2hw_ctl(vs, hs, ve);
> -				shfsprite[1<<par->crsr.fmode] =3D spr2hw_ctl(vs+1, hs, ve+1);
> +				lofsprite[1 << par->crsr.fmode] =3D spr2hw_ctl(vs, hs, ve);
> +				shfsprite[1 << par->crsr.fmode] =3D spr2hw_ctl(vs + 1, hs, ve + =
1);
>  				pt =3D pl; pl =3D ps; ps =3D pt;
>  			} else {
> -				lofsprite[1<<par->crsr.fmode] =3D spr2hw_ctl(vs, hs, ve+1);
> -				shfsprite[1<<par->crsr.fmode] =3D spr2hw_ctl(vs+1, hs, ve);
> +				lofsprite[1 << par->crsr.fmode] =3D spr2hw_ctl(vs, hs, ve + 1);
> +				shfsprite[1 << par->crsr.fmode] =3D spr2hw_ctl(vs + 1, hs, ve);
>  			}
>  		} else {
>  			lofsprite[0] =3D spr2hw_pos(vs, hs) | (IS_AGA && (par->fmode & FM=
ODE_BSCAN2) ? 0x80 : 0);
> -			lofsprite[1<<par->crsr.fmode] =3D spr2hw_ctl(vs, hs, ve);
> +			lofsprite[1 << par->crsr.fmode] =3D spr2hw_ctl(vs, hs, ve);
>  		}
>  	}
>  	copl[cop_spr0ptrh].w[1] =3D highw(pl);
> @@ -3624,7 +3647,7 @@ static void ami_reinit_copper(void)
>  	struct amifb_par *par =3D &currentpar;
> =20
>  	copdisplay.init[cip_bplcon0].w[1] =3D ~(BPC0_BPU3 | BPC0_BPU2 | BPC=
0_BPU1 | BPC0_BPU0) & par->bplcon0;
> -	copdisplay.wait->l =3D CWAIT(32, par->diwstrt_v-4);
> +	copdisplay.wait->l =3D CWAIT(32, par->diwstrt_v - 4);
>  }
> =20
>  	/*
> @@ -3654,20 +3677,20 @@ static void ami_build_copper(void)
>  		(cops++)->l =3D CMOVE(0, sprpt[0]);
>  		(cops++)->l =3D CMOVE2(0, sprpt[0]);
> =20
> -		(copl++)->l =3D CMOVE(diwstrt2hw(par->diwstrt_h, par->diwstrt_v+1)=
, diwstrt);
> -		(copl++)->l =3D CMOVE(diwstop2hw(par->diwstop_h, par->diwstop_v+1)=
, diwstop);
> +		(copl++)->l =3D CMOVE(diwstrt2hw(par->diwstrt_h, par->diwstrt_v + =
1), diwstrt);
> +		(copl++)->l =3D CMOVE(diwstop2hw(par->diwstop_h, par->diwstop_v + =
1), diwstop);
>  		(cops++)->l =3D CMOVE(diwstrt2hw(par->diwstrt_h, par->diwstrt_v), =
diwstrt);
>  		(cops++)->l =3D CMOVE(diwstop2hw(par->diwstop_h, par->diwstop_v), =
diwstop);
>  		if (!IS_OCS) {
> -			(copl++)->l =3D CMOVE(diwhigh2hw(par->diwstrt_h, par->diwstrt_v+1=
,
> -			                    par->diwstop_h, par->diwstop_v+1), diwhigh);
> +			(copl++)->l =3D CMOVE(diwhigh2hw(par->diwstrt_h, par->diwstrt_v +=
 1,
> +					    par->diwstop_h, par->diwstop_v + 1), diwhigh);
>  			(cops++)->l =3D CMOVE(diwhigh2hw(par->diwstrt_h, par->diwstrt_v,
> -			                    par->diwstop_h, par->diwstop_v), diwhigh);
> +					    par->diwstop_h, par->diwstop_v), diwhigh);
>  #if 0
>  			if (par->beamcon0 & BMC0_VARBEAMEN) {
>  				(copl++)->l =3D CMOVE(vtotal2hw(par->vtotal), vtotal);
> -				(copl++)->l =3D CMOVE(vbstrt2hw(par->vbstrt+1), vbstrt);
> -				(copl++)->l =3D CMOVE(vbstop2hw(par->vbstop+1), vbstop);
> +				(copl++)->l =3D CMOVE(vbstrt2hw(par->vbstrt + 1), vbstrt);
> +				(copl++)->l =3D CMOVE(vbstop2hw(par->vbstop + 1), vbstop);
>  				(cops++)->l =3D CMOVE(vtotal2hw(par->vtotal), vtotal);
>  				(cops++)->l =3D CMOVE(vbstrt2hw(par->vbstrt), vbstrt);
>  				(cops++)->l =3D CMOVE(vbstop2hw(par->vbstop), vbstop);
> @@ -3686,7 +3709,7 @@ static void ami_build_copper(void)
>  		(copl++)->l =3D CMOVE(diwstop2hw(par->diwstop_h, par->diwstop_v), =
diwstop);
>  		if (!IS_OCS) {
>  			(copl++)->l =3D CMOVE(diwhigh2hw(par->diwstrt_h, par->diwstrt_v,
> -			                    par->diwstop_h, par->diwstop_v), diwhigh);
> +					    par->diwstop_h, par->diwstop_v), diwhigh);
>  #if 0
>  			if (par->beamcon0 & BMC0_VARBEAMEN) {
>  				(copl++)->l =3D CMOVE(vtotal2hw(par->vtotal), vtotal);
> @@ -3717,23 +3740,23 @@ static void ami_rebuild_copper(void)
>  	u_long p;
> =20
>  	if (IS_AGA && maxfmode + par->clk_shift =3D=3D 0)
> -		h_end1 =3D par->diwstrt_h-64;
> +		h_end1 =3D par->diwstrt_h - 64;
>  	else
> -		h_end1 =3D par->htotal-32;
> -	h_end2 =3D par->ddfstop+64;
> +		h_end1 =3D par->htotal - 32;
> +	h_end2 =3D par->ddfstop + 64;
> =20
>  	ami_set_sprite();
> =20
>  	copl =3D copdisplay.rebuild[1];
>  	p =3D par->bplpt0;
>  	if (par->vmode & FB_VMODE_YWRAP) {
> -		if ((par->vyres-par->yoffset) !=3D 1 || !mod2(par->diwstrt_v)) {
> -			if (par->yoffset > par->vyres-par->yres) {
> +		if ((par->vyres - par->yoffset) !=3D 1 || !mod2(par->diwstrt_v)) {
> +			if (par->yoffset > par->vyres - par->yres) {
>  				for (i =3D 0; i < (short)par->bpp; i++, p +=3D par->next_plane) =
{
>  					(copl++)->l =3D CMOVE(highw(p), bplpt[i]);
>  					(copl++)->l =3D CMOVE2(loww(p), bplpt[i]);
>  				}
> -				line =3D par->diwstrt_v + ((par->vyres-par->yoffset)<<par->line_=
shift) - 1;
> +				line =3D par->diwstrt_v + ((par->vyres - par->yoffset) << par->l=
ine_shift) - 1;
>  				while (line >=3D 512) {
>  					(copl++)->l =3D CWAIT(h_end1, 510);
>  					line -=3D 512;
> @@ -3744,7 +3767,8 @@ static void ami_rebuild_copper(void)
>  					(copl++)->l =3D CWAIT(h_end2, line);
>  				p =3D par->bplpt0wrap;
>  			}
> -		} else p =3D par->bplpt0wrap;
> +		} else
> +			p =3D par->bplpt0wrap;
>  	}
>  	for (i =3D 0; i < (short)par->bpp; i++, p +=3D par->next_plane) {
>  		(copl++)->l =3D CMOVE(highw(p), bplpt[i]);
> @@ -3760,13 +3784,13 @@ static void ami_rebuild_copper(void)
>  		else
>  			p +=3D par->next_line;
>  		if (par->vmode & FB_VMODE_YWRAP) {
> -			if ((par->vyres-par->yoffset) !=3D 1 || mod2(par->diwstrt_v)) {
> -				if (par->yoffset > par->vyres-par->yres+1) {
> +			if ((par->vyres - par->yoffset) !=3D 1 || mod2(par->diwstrt_v)) {
> +				if (par->yoffset > par->vyres - par->yres + 1) {
>  					for (i =3D 0; i < (short)par->bpp; i++, p +=3D par->next_plane)=
 {
>  						(cops++)->l =3D CMOVE(highw(p), bplpt[i]);
>  						(cops++)->l =3D CMOVE2(loww(p), bplpt[i]);
>  					}
> -					line =3D par->diwstrt_v + ((par->vyres-par->yoffset)<<par->line=
_shift) - 2;
> +					line =3D par->diwstrt_v + ((par->vyres - par->yoffset) << par->=
line_shift) - 2;
>  					while (line >=3D 512) {
>  						(cops++)->l =3D CWAIT(h_end1, 510);
>  						line -=3D 512;
> @@ -3776,12 +3800,14 @@ static void ami_rebuild_copper(void)
>  					else
>  						(cops++)->l =3D CWAIT(h_end2, line);
>  					p =3D par->bplpt0wrap;
> -					if (mod2(par->diwstrt_v+par->vyres-par->yoffset))
> +					if (mod2(par->diwstrt_v + par->vyres -
> +					    par->yoffset))
>  						p -=3D par->next_line;
>  					else
>  						p +=3D par->next_line;
>  				}
> -			} else p =3D par->bplpt0wrap - par->next_line;
> +			} else
> +				p =3D par->bplpt0wrap - par->next_line;
>  		}
>  		for (i =3D 0; i < (short)par->bpp; i++, p +=3D par->next_plane) {
>  			(cops++)->l =3D CMOVE(highw(p), bplpt[i]);
